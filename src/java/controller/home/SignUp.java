/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.home;

import dao.UserDAO;
import model.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.EmailService;
import model.IJavamail;

/**
 *
 * @author quang
 */
@MultipartConfig(maxFileSize = 16177215)
public class SignUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String EMAIL_REGEX
            = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

    private static final Pattern pattern = Pattern.compile(EMAIL_REGEX);

    public static boolean isValidEmail(String email) {
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            UserDAO dao = new UserDAO();
            String userName = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String rwpw = request.getParameter("confirmPassword");
            boolean checkUser = dao.checkExistUserName(userName);
            boolean checkEmail = dao.checkExistedUserByEmail(email);
            boolean isPasswordValid = password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=\\S+$).{8,}$");
            if (checkUser == true) {
                String alertMessage = "Username has taken. Please try again.";
                String redirectUrl = "signup.jsp";
                String script = "<script>alert('" + alertMessage + "');";
                script += "window.location.href='" + redirectUrl + "';</script>";
                response.getWriter().println(script);
            } else if (!checkEmail) {
                String alertMessage = "Email has taken or. Please try again.";
                String redirectUrl = "signup.jsp";
                String script = "<script>alert('" + alertMessage + "');";
                script += "window.location.href='" + redirectUrl + "';</script>";
                response.getWriter().println(script);
            } else if (!isValidEmail(email)) {
                String alertMessage = "Email is invalid. Please try again.";
                String redirectUrl = "signup.jsp";
                String script = "<script>alert('" + alertMessage + "');";
                script += "window.location.href='" + redirectUrl + "';</script>";
                response.getWriter().println(script);
            } else if (!isPasswordValid) {
                String alertMessage = "Password is invalid. Please try again.Password must at least one number, one lowercase letter, "
                        + "one uppercase letter, one special character and must not contain spaces, and at least 8 character.";
                String redirectUrl = "signup.jsp";
                String script = "<script>alert('" + alertMessage + "');";
                script += "window.location.href='" + redirectUrl + "';</script>";
                response.getWriter().println(script);
            } else if (!password.equalsIgnoreCase(rwpw)) {
                String alertMessage = "Password and Confirm Password do not match. Please try again.";
                String redirectUrl = "signup.jsp";
                String script = "<script>alert('" + alertMessage + "');";
                script += "window.location.href='" + redirectUrl + "';</script>";
                response.getWriter().println(script);
            } else {

                IJavamail emailService = new EmailService();
                String randomCode = generateRandomNumber();
                emailService.send(email, "Your verify code is:", randomCode);
                request.setAttribute("userName", userName);
                request.setAttribute("password", password);
                request.setAttribute("email", email);
                request.setAttribute("randomCode", randomCode);
                request.getRequestDispatcher("verifySignUpEmail.jsp").forward(request, response);

            }
        } catch (Exception ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String generateRandomNumber() {
        Random random = new Random();
        int randomNumber = random.nextInt(10000); // Sinh số ngẫu nhiên từ 0 đến 9999

        // Định dạng số để có 4 chữ số (0012, 0123, 1234, ...)
        return String.format("%04d", randomNumber);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
