package controller.admin;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Users;

/**
 *
 * @author OS
 */
public class CategoryManagement extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        CategoryDAO categoryDAO = new CategoryDAO();
        PrintWriter out = response.getWriter();
        try {
            Users user = (Users) session.getAttribute("user");
            if (user.getUserTypeId() == 1) {
                if (action == null || action.equalsIgnoreCase("")) {
                    List<Category> categoryList = categoryDAO.getAllCategories();
                    request.setAttribute("categoryList", categoryList);
                    
                    request.getRequestDispatcher("/admin/category.jsp").forward(request, response);
                } else if (action.equalsIgnoreCase("updatecategory")) {
                    String categoryIdStr = request.getParameter("categoryId");

                    int categoryId = 0;
                    try {
                        categoryId = Integer.parseInt(categoryIdStr);
                    } catch (NullPointerException ex) {
                        ex.printStackTrace();
                    } catch (NumberFormatException ex) {
                        ex.printStackTrace();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    boolean updateSuccess = categoryDAO.updateUserStatus(categoryId, userStatus);
                    if (updateSuccess) {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().print("success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().print("error");
                    }
                } else if (action.equalsIgnoreCase("deletecategory")) {
                    String categoryIdStr = request.getParameter("categoryId");
                    int categoryId = 0;
                    try {
                        categoryId = Integer.parseInt(categoryIdStr);
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                    boolean deletionSuccess = categoryDAO.deleteCategory(categoryId);
                    if (deletionSuccess) {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().print("success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().print("error");
                    }
                } else if (action.equalsIgnoreCase("deletecategoryselected")) {
                    String categoryIdStr = request.getParameter("categoryId");
                    int[] categoryIdList = null;

                    try {
                        String[] categoryIds = categoryIdStr.split(",");

                        // Create an int array with the same length as the categoryIds array
                        categoryIdList = new int[categoryIds.length];

                        // Convert the category IDs from strings to integers
                        for (int i = 0; i < categoryIds.length; i++) {
                            categoryIdList[i] = Integer.parseInt(categoryIds[i]);
                        }
                    } catch (Exception e) {
                        System.out.println(e);
                    }

                    boolean deletionSuccess = categoryDAO.deleteCategorySelected(categoryIdList);
                    if (deletionSuccess) {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().print("success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().print("error");
                    }
                }
            } else {
                response.sendRedirect("login");
            }
        } catch (Exception e) {
            response.sendRedirect("404.jsp");
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
    }

}