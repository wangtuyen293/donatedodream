package controller.home;

import dao.ProjectDAO;
import dao.UserDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Project;
import model.Users;

/**
 *
 * @author OS
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class Profile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
//        try {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            UserDAO userDAO = new UserDAO();

            String action = request.getParameter("action");
            if (action == null || action.equalsIgnoreCase("")) {
                System.out.println(user.getUserId());
                ProjectDAO projectDAO = new ProjectDAO();
                List<Project> projects = projectDAO.getProjectsByUserIdApproved(user.getUserId());
                System.out.println(projects);
                request.setAttribute("projectList", projects);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else if (action.equalsIgnoreCase("changepass")) {
                try {
                    String pw = user.getPassword();
                    String name = user.getUserName();
                    String curPassword = request.getParameter("oldpass");
                    String newPassword = request.getParameter("newpass");
                    System.out.println(newPassword);
                    String confirmPassword = request.getParameter("confirmpass");
                    boolean isPasswordValid = newPassword.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=\\S+$).{8,}$");
                    boolean check = pw.equals(curPassword);
                    UserDAO dao = new UserDAO();
                    if (!check) {
                        String alertMessage = "Current password doesn't match with your account. Please try again";
                        request.setAttribute("alertMessage", alertMessage);
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                        return;
                    } else if (curPassword.equals(newPassword)) {
                        String alertMessage = "Current password is similar as new password. Please try again";
                        request.setAttribute("alertMessage", alertMessage);
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                        return;
                    } else if (isPasswordValid == false) {
                        String alertMessage = "Password is invalid. Please try again.Password must at least one number, one lowercase letter, "
                                + "one uppercase letter, one special character and must not contain spaces, and at least 8 character.";
                        request.setAttribute("alertMessage", alertMessage);
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                        return;
                    } else if (!newPassword.equals(confirmPassword)) {
                        String alertMessage = "New password and Confirm password doesn't match. Please try again";
                        request.setAttribute("alertMessage", alertMessage);
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                        return;
                    } else {
                        dao.updatePasswordwithUserName(name, newPassword);
                        String alertMessage = "Change password successfully.";
                        request.setAttribute("alertMessage", alertMessage);
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(UpdatePassword.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else if (action.equalsIgnoreCase("updateprofile")) {
                response.setContentType("text/html");
                response.setCharacterEncoding("UTF-8");
                request.setCharacterEncoding("UTF-8");
                try {
                    String us = user.getUserName();
                    String fullName = new String(request.getParameter("fullName").getBytes("ISO-8859-1"), "UTF-8");
                    System.out.println(fullName);
                    String email = request.getParameter("email");
                    String phoneNumber = request.getParameter("phoneNumber");
                    int gender = Integer.parseInt(request.getParameter("gender"));
                    String dateOfBirthString = request.getParameter("dateOfBirth");
                    java.sql.Date dateOfBirth = null;
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                    try {
                        if (dateOfBirthString != null && !dateOfBirthString.isEmpty()) {
                            java.util.Date utilDate = dateFormat.parse(dateOfBirthString);
                            dateOfBirth = new java.sql.Date(utilDate.getTime());
                        }
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    String folderName = "ava";
                    String uploadPath = "D:\\Semester 5-FPT\\SWP\\donatedodream\\web\\" + File.separator + folderName;
                    File dir = new File(uploadPath);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }
                    Part filePart = request.getPart("avatar");
                    String fileName = filePart.getSubmittedFileName();
                    String path = folderName + File.separator + fileName;
                    InputStream is = filePart.getInputStream();
                    Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

                    Users editedUser = new Users(fullName, us, (byte) gender, dateOfBirth, path, email, phoneNumber);
                    System.out.println(editedUser);
                    // Thực hiện cập nhật thông tin người dùng
                    UserDAO dao = new UserDAO();
                    boolean success = dao.updateUserProfile(editedUser);

                    if (success) {
                        // Nếu cập nhật thành công, cập nhật lại thông tin người dùng trong session
                        session.setAttribute("user", editedUser);
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    } else {
                        String alertMessage = "Fail to update profile.Please try again";
                        String redirectUrl = "profile.jsp";
                        String script = "<script>alert('" + alertMessage + "');";
                        script += "window.location.href='" + redirectUrl + "';</script>";
                        response.getWriter().println(script);
                    }
                } catch (Exception ex) {
                    Logger.getLogger(Profile.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else {
                response.sendRedirect("login.jsp");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
