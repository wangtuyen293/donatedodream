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
                int countProject = projectDAO.countProject();
//                int countProjectCurrentMonth = projectDAO.countProjectCurrentMonth();
//                int countProjectLastMonth = projectDAO.countProjectLastMonth();
//
//                int countUser = userDAO.countUserAsUser();
//                int countUserAsUserCurrentMonth = userDAO.countUserAsUserCurrentMonth();
//                int countUserAsUserLastMonth = userDAO.countUserAsUserLastMonth();
//
//                int countCharityOrg = charityOrgDAO.countCharityOrg();
//                int countCharityOrgCurrentMonth = charityOrgDAO.countCharityOrgCurrentMonth();
//                int countCharityOrgLastMonth = charityOrgDAO.countCharityOrgLastMonth();
//
//                int countSucceedProject = projectDAO.countSucceedProject();
//                int countSucceedProjectCurrentMonth = projectDAO.countSucceedProjectCurrentMonth();
//                int countSucceedProjectLastMonth = projectDAO.countSucceedProjectLastMonth();
//
//                request.setAttribute("project", countProject);
//                request.setAttribute("projectCurrentMonth", countProjectCurrentMonth);
//                request.setAttribute("projectLastMonth", countProjectLastMonth);
//                request.setAttribute("user", countUser);
//                request.setAttribute("userCurrentMonth", countUserAsUserCurrentMonth);
//                request.setAttribute("userLastMonth", countUserAsUserLastMonth);
//                request.setAttribute("charityOrg", countCharityOrg);
//                request.setAttribute("charityOrgCurrentMonth", countCharityOrgCurrentMonth);
//                request.setAttribute("charityOrgLastMonth", countCharityOrgLastMonth);
//                request.setAttribute("succeedProject", countSucceedProject);
//                request.setAttribute("succeedProjectCurrentMonth", countSucceedProjectCurrentMonth);
//                request.setAttribute("succeedProjectLastMonth", countSucceedProjectLastMonth);

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
