/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.EmailService;
import model.IJavamail;

/**
 *
 * @author quang
 */
public class SendEmailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendEmailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendEmailServlet at " + request.getContextPath() + "</h1>");
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
    String randomCode = generateRandomNumber();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String to = request.getParameter("email");
        UserDAO dao = new UserDAO();
        boolean check = dao.checkExistedUserByEmail(to);
        if (check != true) {
            String alertMessage = "Email is invalid. Please try again.";
            String redirectUrl = "forgotpassword.jsp";
            String script = "<script>alert('" + alertMessage + "');";
            script += "window.location.href='" + redirectUrl + "';</script>";
            response.getWriter().println(script);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("email", to);
            IJavamail emailService = new EmailService();
            emailService.send(to, "Your verify code is:", randomCode);
            response.sendRedirect("fillcode.jsp");
        }
    }

    public static String generateRandomNumber() {
        Random random = new Random();
        int randomNumber = random.nextInt(10000); // Sinh số ngẫu nhiên từ 0 đến 9999

        // Định dạng số để có 4 chữ số (0012, 0123, 1234, ...)
        return String.format("%04d", randomNumber);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code.equalsIgnoreCase(randomCode)) {
            response.sendRedirect("changepassword.jsp");
        } else {
            String alertMessage = "Code is invalid. Please try again.";
            String redirectUrl = "fillcode.jsp";
            String script = "<script>alert('" + alertMessage + "');";
            script += "window.location.href='" + redirectUrl + "';</script>";
            response.getWriter().println(script);
        }
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
