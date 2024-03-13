package controller.home;

import dao.ProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Project;
import model.Users;

/**
 *
 * @author OS
 */
public class Profile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        ProjectDAO projectDAO = new ProjectDAO();
        try {
            Users user = (Users) session.getAttribute("user");
            if (user != null) {
                int userId = user.getUserId();
                List<Project> listProjects = projectDAO.getProjectsByUserIdApproved(userId);
                request.setAttribute("projectList", listProjects);
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            } else {
                response.sendRedirect("user?action=login");
            }
        } catch (Exception e) {
            response.sendRedirect("login.jsp");
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
