package controller.admin;

import dao.CharityOrganizationDAO;
import dao.FeedbackDAO;
import dao.ProjectDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Dashboard extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            PrintWriter out = response.getWriter();
            
            if (user.getUserTypeId() == 1) {
                UserDAO userDAO = new UserDAO();
                ProjectDAO projectDAO = new ProjectDAO();
                CharityOrganizationDAO charityOrgDAO = new CharityOrganizationDAO();
                FeedbackDAO feedbackDAO = new FeedbackDAO();
                int countProject = projectDAO.countProject();
                int countUser = userDAO.countUserAsUser();
                int countCharityOrg = charityOrgDAO.countCharityOrg();
                int countSucceedProject = projectDAO.countSucceedProject();
                int countFeedback = feedbackDAO.countFeedback();
                request.setAttribute("project", countProject);
                request.setAttribute("user", countUser);
                request.setAttribute("charityOrg", countCharityOrg);
                request.setAttribute("feedback", countSucceedProject);
                request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
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
    }// </editor-fold>

}
