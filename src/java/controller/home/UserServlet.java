package controller.home;

import dao.ProjectDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Project;
import model.Users;

/**
 *
 * @author OS
 */
public class UserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO userDAO = new UserDAO();
        int userId = Integer.parseInt(request.getParameter("userId"));
        Users user = userDAO.getUserByUserId(userId);
        request.setAttribute("userinfor", user);

        ProjectDAO projectDAO = new ProjectDAO();
        List<Project> listProjects = projectDAO.getProjectsByUserIdApproved(userId);
        request.setAttribute("userproject", listProjects);

        request.getRequestDispatcher("userdetail.jsp").forward(request, response);

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
