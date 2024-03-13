package controller.admin;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
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
                    String categoryName = request.getParameter("categoryName");

                    boolean isCategoryNameExisted = categoryDAO.checkCategoryName(categoryName);

                    if (isCategoryNameExisted) {
                        request.setAttribute("updateFail", "Update failed! Category name exists!");
                        List<Category> categoryList = categoryDAO.getAllCategories();
                        request.setAttribute("categoryList", categoryList);

                        request.getRequestDispatcher("/admin/category.jsp").forward(request, response);
                    } else {
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

                        boolean updateSuccess = categoryDAO.updateCategoryByCategoryId(categoryId, categoryName);

                        if (updateSuccess) {
                            request.setAttribute("updateSuccess", "Update category successfully!");
                        } else {
                            request.setAttribute("updateFail", "Fail to update the category!");
                        }
                        List<Category> categoryList = categoryDAO.getAllCategories();
                        request.setAttribute("categoryList", categoryList);

                        request.getRequestDispatcher("/admin/category.jsp").forward(request, response);
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
                } else if (action.equalsIgnoreCase("insertcategory")) {
                    String categoryName = request.getParameter("categoryName");

                    boolean isCategoryNameExisted = categoryDAO.checkCategoryName(categoryName);

                    if (isCategoryNameExisted) {
                        request.setAttribute("insertFail", "Create new failed! Category name exists!");
                        List<Category> categoryList = categoryDAO.getAllCategories();
                        request.setAttribute("categoryList", categoryList);

                        request.getRequestDispatcher("/admin/category.jsp").forward(request, response);
                    } else {
                        boolean insertSuccess = categoryDAO.insertCategory(categoryName);
                        out.println(insertSuccess);
                        if (insertSuccess) {
                            request.setAttribute("insertSuccess", "Create new category successfully!");
                        } else {
                            request.setAttribute("insertFail", "Fail to create new category!");
                        }
                        List<Category> categoryList = categoryDAO.getAllCategories();
                        request.setAttribute("categoryList", categoryList);

                        request.getRequestDispatcher("/admin/category.jsp").forward(request, response);
                    }
                }
            } else {
                response.sendRedirect("login.jsp");
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