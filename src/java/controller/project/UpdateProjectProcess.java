/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.project;

import dao.CharityOrganizationDAO;
import dao.ProjectDAO;
import dao.UserDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import model.Category;
import model.CharityOrganization;
import model.Project;
import model.ProjectProcess;
import model.Users;

/**
 *
 * @author quang
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class UpdateProjectProcess extends HttpServlet {

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
        String projectId = request.getParameter("id");
        String donationPercentage = request.getParameter("donationPercentage");
        System.out.println(projectId);
        System.out.println("Hi" + donationPercentage);
        if (Double.parseDouble(donationPercentage) != 100.00) {
            String alertMessage = "Your project hasn't raised successfully.";
            request.setAttribute("alertMessage", alertMessage);
            request.getRequestDispatcher("profile").forward(request, response);
            return;
        } else {
            session.setAttribute("projectId", projectId);
            request.getRequestDispatcher("updateprocess.jsp").forward(request, response);
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
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            System.out.println(projectId);
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            String us = user.getUserName();
            String projectProcess = request.getParameter("projectProcess");
            String projectCostString = request.getParameter("projectCost");
            BigDecimal projectCost = null; // Khởi tạo BigDecimal

            try {
                // Chuyển đổi chuỗi thành BigDecimal
                projectCost = new BigDecimal(projectCostString);
            } catch (NumberFormatException e) {
                // Xử lý nếu có lỗi khi chuyển đổi
                System.out.println("Invalid project cost. Please enter a valid number.");
                return; // Kết thúc phương thức nếu có lỗi
            }
            String projectDescription = request.getParameter("projectDescription");
            Date startDate = null;
            Date currentDate = new Date(System.currentTimeMillis());
            System.out.println(currentDate);
            try {
                java.util.Date utilStartDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("startDate"));
                startDate = new java.sql.Date(utilStartDate.getTime());
                System.out.println(utilStartDate);
                if (startDate.before(utilStartDate)) {
                    String alertMessage = "Your start date not applied with current date";
                    request.setAttribute("alertMessage", alertMessage);
                    request.getRequestDispatcher("updateprocess.jsp").forward(request, response);
                    return;
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }

            String folderName = "projectProcessImages";
            String uploadPath = "D:\\Semester 5-FPT\\SWP\\donatedodream\\web\\" + File.separator + folderName;
            File dir = new File(uploadPath);

            if (!dir.exists()) {
                dir.mkdirs();
            }
            Part filePart1 = request.getPart("projectImage1");
            String fileName1 = filePart1.getSubmittedFileName();
            String path1 = folderName + File.separator + fileName1;
            Part filePart2 = request.getPart("projectImage2");
            String fileName2 = filePart2.getSubmittedFileName();
            String path2 = folderName + File.separator + fileName2;
            Part filePart3 = request.getPart("projectImage3");
            String fileName3 = filePart3.getSubmittedFileName();
            String path3 = folderName + File.separator + fileName3;
            Part filePart4 = request.getPart("projectImage4");
            String fileName4 = filePart4.getSubmittedFileName();
            String path4 = folderName + File.separator + fileName4;
            InputStream is1 = filePart1.getInputStream();
            InputStream is2 = filePart2.getInputStream();
            InputStream is3 = filePart3.getInputStream();
            InputStream is4 = filePart4.getInputStream();
            Files.copy(is1, Paths.get(uploadPath + File.separator + fileName1), StandardCopyOption.REPLACE_EXISTING);
            Files.copy(is2, Paths.get(uploadPath + File.separator + fileName2), StandardCopyOption.REPLACE_EXISTING);
            Files.copy(is3, Paths.get(uploadPath + File.separator + fileName3), StandardCopyOption.REPLACE_EXISTING);
            Files.copy(is4, Paths.get(uploadPath + File.separator + fileName4), StandardCopyOption.REPLACE_EXISTING);
            ProjectDAO dao = new ProjectDAO();
            UserDAO used = new UserDAO();
            boolean checkimg = dao.areImagesPathsExist(path1, path2, path3, path4);
            if (checkimg == true) {
                String alertMessage = "These picture had import before. Please input the real images of your project";
                request.setAttribute("alertMessage", alertMessage);
                request.getRequestDispatcher("updateprocess.jsp").forward(request, response);
                return;
            }
            int i = used.getIdByUserName(us);
            ProjectProcess pp = new ProjectProcess(projectProcess, startDate, projectCost, path1, path2, path3, path4, projectDescription, i, 0, projectId);
            boolean check = dao.addProjectProcess(pp);
            if (!check) {
                String alertMessage = "Update fail,please try again!";
                request.setAttribute("alertMessage", alertMessage);
                request.getRequestDispatcher("updateprocess.jsp").forward(request, response);
                return;
            }
            session.setAttribute("projectProcess", pp);
            request.getRequestDispatcher("profile").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UpdateProjectProcess.class.getName()).log(Level.SEVERE, null, ex);
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
