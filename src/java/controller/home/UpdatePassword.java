/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author quang
 */
public class UpdatePassword extends HttpServlet {

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
            out.println("<title>Servlet UpdatePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePassword at " + request.getContextPath() + "</h1>");
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
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            String pw = user.getPassword();
            String name = user.getUserName();
            String curPassword = request.getParameter("curPassword");
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
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
