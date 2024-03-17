/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.transaction;

import dao.DonationDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Donation;
import model.Users;

/**
 *
 * @author quang
 */
public class DonationServlet extends HttpServlet {

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
            out.println("<title>Servlet DonationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DonationServlet at " + request.getContextPath() + "</h1>");
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

        if (user != null) {
            // Nếu đã đăng nhập, chuyển hướng đến trang chỉnh sửa
            int projectId = Integer.parseInt(request.getParameter("id"));
            int pmid = Integer.parseInt(request.getParameter("milestoneId"));
            System.out.println(pmid);
            System.out.println(projectId);
            request.setAttribute("projectId", projectId);
            request.setAttribute("pmid", pmid);
            request.getRequestDispatcher("donate.jsp").forward(request, response);
        } else {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login.jsp");
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
            String us = user.getUserName();
            UserDAO da = new UserDAO();
            int i = da.getIdByUserName(us);
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            int pmid = Integer.parseInt(request.getParameter("pmid"));
            System.out.println(projectId);
            String addressDetail = request.getParameter("addressDetail");
            String amount = request.getParameter("amount");
            BigDecimal bigDecimalValue = new BigDecimal(amount);
            String paymentMethod = request.getParameter("paymentMethod");
            Date dada = null;
            try {
                java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
                dada = new java.sql.Date(utilDate.getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }

            Donation donation = new Donation(bigDecimalValue, dada, i, projectId, paymentMethod,pmid, addressDetail);
            DonationDAO donationDAO = new DonationDAO();
            try {
                int doID = donationDAO.addDonation(donation);
                session.setAttribute("donationId", doID);
                request.setAttribute("username", us);
                request.setAttribute("projectId", projectId);
                request.getRequestDispatcher("vietinbanktransaction.jsp").forward(request, response);
            } catch (SQLException e) {
                // Xử lý lỗi, bạn có thể chuyển hướng đến trang lỗi hoặc hiển thị thông báo lỗi
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing donation");
            }
        } catch (Exception ex) {
            Logger.getLogger(DonationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
