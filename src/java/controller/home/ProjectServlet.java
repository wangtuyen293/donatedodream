package controller.home;

import dao.ProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Project;

/**
 *
 * @author OS
 */
public class ProjectServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ProjectDAO projectDAO = new ProjectDAO();
        PrintWriter out = response.getWriter();
        List<Project> listProjects = projectDAO.getProjectsApproved();
        System.out.println(listProjects);

        String action = request.getParameter("action");
        if (action == null || action.equalsIgnoreCase("")) {
            int page, numberPerPage = 3;
            int size = listProjects.size();
            int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // page number
            String pageCur = request.getParameter("page");
            if (pageCur == null) {
                page = 1;
            } else {
                page = Integer.parseInt(pageCur);
            }
            int start, end;
            start = (page - 1) * numberPerPage;
            end = Math.min(page * numberPerPage, size);
            List<Project> projects = projectDAO.getListByPage(listProjects, start, end);
            List<List<String>> categoryNamesList = new ArrayList<>();
            for (Project project : projects) {
                List<String> categoryName = projectDAO.getCategoryProject(project.getProjectId());
                categoryNamesList.add(categoryName);
            }
            System.out.println(categoryNamesList);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("projectsApproved", projects);
            request.setAttribute("categoryNamesList", categoryNamesList);
            request.getRequestDispatcher("allproject.jsp").forward(request, response);
        } else if (action.equalsIgnoreCase("projectdetail")) {
            request.getRequestDispatcher("allproject.jsp").forward(request, response);
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
