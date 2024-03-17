/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dao.UserDAO;
import java.io.File;
import model.Users;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class EditProfileServlet extends HttpServlet {

    PrintWriter out;
    ServletOutputStream os;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            // Nếu đã đăng nhập, chuyển hướng đến trang chỉnh sửa
            response.sendRedirect("editprofile.jsp");
        } else {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            String us = user.getUserName();
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            int gender = Integer.parseInt(request.getParameter("gender"));
            Date dateOfBirth = null;

            try {
                java.util.Date utilDateOfBirth = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dateOfBirth"));
                dateOfBirth = new java.sql.Date(utilDateOfBirth.getTime());
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
            File file = new File(uploadPath + File.separator + fileName);
            if (!file.exists()) {
                InputStream is = filePart.getInputStream();
                Files.copy(is, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            Users editedUser = new Users(fullName, us, (byte) gender, dateOfBirth, path, email, phoneNumber);

            // Thực hiện cập nhật thông tin người dùng
            UserDAO dao = new UserDAO();
            boolean success = dao.updateUserProfile(editedUser);

            if (success) {
                // Nếu cập nhật thành công, cập nhật lại thông tin người dùng trong session
                session.setAttribute("user", editedUser);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                String alertMessage = "Fail to update profile.Please try again";
                String redirectUrl = "editprofile.jsp";
                String script = "<script>alert('" + alertMessage + "');";
                script += "window.location.href='" + redirectUrl + "';</script>";
                response.getWriter().println(script);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            // Xử lý lỗi nếu cần thiết
        }
    }
}
