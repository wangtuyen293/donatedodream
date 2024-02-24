package controller.admin;

import dao.ProjectDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author OS
 */
public class UserManagement extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        UserDAO userDAO = new UserDAO();
        PrintWriter out = response.getWriter();
        try {
            Users user = (Users) session.getAttribute("user");
            if (user.getUserTypeId() == 1) {
                if (action == null || action.equalsIgnoreCase("")) {
                    ProjectDAO projectDAO = new ProjectDAO();

                    List<Users> userList = userDAO.getAllUsers();
                    request.setAttribute("userList", userList);

                    request.getRequestDispatcher("/admin/user.jsp").forward(request, response);
                } else if (action.equalsIgnoreCase("updateuser")) {
                    String userIdStr = request.getParameter("userId");
                    String userStatus = request.getParameter("userStatus");

                    int userId = 0;
                    try {
                        userId = Integer.parseInt(userIdStr);
                    } catch (NullPointerException ex) {
                        ex.printStackTrace();
                    } catch (NumberFormatException ex) {
                        ex.printStackTrace();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    boolean updateSuccess = userDAO.updateUserStatus(userId, userStatus);
                    if (updateSuccess) {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().print("success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().print("error");
                    }
                } else if (action.equalsIgnoreCase("deleteuser")) {
                    String userIdStr = request.getParameter("userId");
                    int userId = 0;
                    try {
                        userId = Integer.parseInt(userIdStr);
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                    boolean deletionSuccess = userDAO.deleteUser(userId);
                    if (deletionSuccess) {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().print("success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().print("error");
                    }
                } else if (action.equalsIgnoreCase("deleteuserselected")) {
                    String userIdStr = request.getParameter("userId");
                    int[] userIdList = null;

                    try {
                        String[] userIds = userIdStr.split(",");

                        // Create an int array with the same length as the userIds array
                        userIdList = new int[userIds.length];

                        // Convert the user IDs from strings to integers
                        for (int i = 0; i < userIds.length; i++) {
                            userIdList[i] = Integer.parseInt(userIds[i]);
                        }
                    } catch (Exception e) {
                        System.out.println(e);
                    }

                    boolean deletionSuccess = userDAO.deleteUserSelected(userIdList);
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
    }// </editor-fold>

}
