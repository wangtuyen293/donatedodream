/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.project;

import dao.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.*;

/**
 *
 * @author quang
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class CreateProject extends HttpServlet {

    PrintWriter out;
    ServletOutputStream os;

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
        Users user = (Users) session.getAttribute("user");

        if (user != null) {
            // Nếu đã đăng nhập, chuyển hướng đến trang chỉnh sửa
            response.sendRedirect("createproject.jsp");
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
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            String us = user.getUserName();
            String charityOrganizationName = request.getParameter("charityOrganizationName");
            String projectName = request.getParameter("projectName");
            String projectTarget = request.getParameter("projectTarget");
            BigDecimal bigDecimalValue = new BigDecimal(projectTarget);
            String projectDescription = request.getParameter("projectDescription");
            String reward1 = request.getParameter("reward1");
            String reward1Description = request.getParameter("reward1Description");
            String reward2 = request.getParameter("reward2");
            String reward2Description = request.getParameter("reward2Description");
            String reward3 = request.getParameter("reward3");
            String reward3Description = request.getParameter("reward3Description");
            String reward4 = request.getParameter("reward4");
            String reward4Description = request.getParameter("reward4Description");
            Date startDate = null;
            Date endDate = null;
            Date currentDate = new Date(System.currentTimeMillis());
            System.out.println(currentDate);
            try {
                java.util.Date utilStartDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("startDate"));
                java.util.Date utilEndDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("endDate"));
                startDate = new java.sql.Date(utilStartDate.getTime());
                endDate = new java.sql.Date(utilEndDate.getTime());
                System.out.println(utilStartDate);
                System.out.println(utilEndDate);
                if (startDate.before(utilStartDate)) {
                    String alertMessage = "Your start date not applied with current date";
                    request.setAttribute("alertMessage", alertMessage);
                    request.getRequestDispatcher("createproject.jsp").forward(request, response);
                    return;
                }
                if (endDate.before(utilEndDate)) {
                    String alertMessage = "Start date is after End date";
                    request.setAttribute("alertMessage", alertMessage);
                    request.getRequestDispatcher("createproject.jsp").forward(request, response);
                    return;
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }

            String folderName = "projectimage";
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
            String[] selectedCategoryIds = request.getParameterValues("categories");
            ProjectDAO dao = new ProjectDAO();
            UserDAO used = new UserDAO();
            boolean checkimg = dao.areImagesPathsExist(path1, path2, path3, path4);
            boolean checkName = dao.isProjectNameExists(projectName);
            if (checkName == true) {
                String alertMessage = "The project name has taken before. Please input the real name of your project";
                request.setAttribute("alertMessage", alertMessage);
                request.getRequestDispatcher("createproject.jsp").forward(request, response);
                return;
            }
            if (checkimg == true) {
                String alertMessage = "These picture had import before. Please input the real images of your project";
                request.setAttribute("alertMessage", alertMessage);
                request.getRequestDispatcher("createproject.jsp").forward(request, response);
                return;
            }

            CharityOrganizationDAO cha = new CharityOrganizationDAO();
            int i = used.getIdByUserName(us);
            if (charityOrganizationName != null) {
                CharityOrganization co = new CharityOrganization(charityOrganizationName, null, null, null, null);
                cha.insertCharityOrg(co);
            }
            int coId = cha.getCharityOrganizationIdByName(charityOrganizationName);
            System.out.println(coId);
            if (selectedCategoryIds != null) {
                List<Category> selectedCategories = new ArrayList<>();
                for (String categoryId : selectedCategoryIds) {
                    Category category = new Category();
                    category.setCategoryId(Integer.parseInt(categoryId));
                    selectedCategories.add(category);
                }
                Project project = new Project(projectName, bigDecimalValue, projectDescription, startDate, endDate, i, coId);
                dao.saveProject(project);
                session.setAttribute("project", project);
                int id = dao.getIdByProjectName(project.getProjectName());
                System.out.println(id);
                dao.saveProjectImages(id, path1, path2, path3, path4);
                dao.addCategoriesProject(id, selectedCategories);
                if (reward1 != null && reward1Description != null) {
                    dao.addProjectMilesStone(reward1, reward1Description, id, i);
                }
                if (reward2 != null && reward2Description != null) {
                    dao.addProjectMilesStone(reward2, reward2Description, id, i);
                }
                if (reward3 != null && reward3Description != null) {
                    dao.addProjectMilesStone(reward3, reward3Description, id, i);
                }
                if (reward4 != null && reward4Description != null) {
                    dao.addProjectMilesStone(reward4, reward4Description, id, i);
                }
                request.getRequestDispatcher("createprojectsuccess.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            Logger.getLogger(CreateProject.class.getName()).log(Level.SEVERE, null, ex);
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
