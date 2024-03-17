/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.project;

import dao.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Feedback;
import model.Users;

/**
 *
 * @author quang
 */
public class EditFeedbackProject extends HttpServlet {

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
            out.println("<title>Servlet EditFeedbackProject</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditFeedbackProject at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        int u = user.getUserId();
        System.out.println(u);
        int userIdFromQuery = Integer.parseInt(request.getParameter("id"));

        if (userIdFromQuery != u) {
            String alertMessage = "That's isn't your feedback.";
            request.setAttribute("alertMessage", alertMessage);
            request.getRequestDispatcher("projectdetails.jsp").forward(request, response);
            return;

        } else {
            request.setAttribute("userId", userIdFromQuery);
            request.getRequestDispatcher("editfeedback.jsp").forward(request, response);
        }
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
            int userId = user.getUserId(); // Rename variable to userId
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            
            // Get current time
            java.util.Date realTime = new java.util.Date();
            
            FeedbackDAO fb = new FeedbackDAO();
            Feedback feedback = new Feedback(rating, comment, realTime, projectId, userId);
            System.out.println(feedback);// Pass userId instead of us
            fb.updateFeedback(feedback);
            request.setAttribute("projectId", projectId);         
            request.getRequestDispatcher("projectdetails.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditFeedbackProject.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EditFeedbackProject.class.getName()).log(Level.SEVERE, null, ex);
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
