package controller.home;

import dao.CategoryDAO;
import dao.ProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();

        if (action == null || action.equalsIgnoreCase("")) {
            String type = request.getParameter("type");
            List<Project> listProjects = null;

            if (type == null || type.isEmpty()) {
                listProjects = projectDAO.getProjectsApproved();
            } else if (type.equalsIgnoreCase("a-z")) {
                listProjects = projectDAO.getProjectByProjectNameAZ();
                request.setAttribute("type", type);
            } else if (type.equalsIgnoreCase("success")) {
                listProjects = projectDAO.getSuccessProject();
                request.setAttribute("type", type);
            } else if (type.equalsIgnoreCase("new")) {
                listProjects = projectDAO.getNewProject();
                request.setAttribute("type", type);
            } else if (type.equalsIgnoreCase("active")) {
                listProjects = projectDAO.getActiveProject();
                request.setAttribute("type", type);
            } else if (type.equalsIgnoreCase("outdated")) {
                listProjects = projectDAO.getOutdatedProject();
                request.setAttribute("type", type);
            }

            int page = 1, numberPerPage = 3;
            int size = listProjects.size();
            int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // page number
            String pageCur = request.getParameter("page");
            if (pageCur != null && !pageCur.isEmpty()) {
                try {
                    page = Integer.parseInt(pageCur);
                } catch (NumberFormatException e) {
                    System.out.println("Invalid page number format: " + pageCur);
                }
            }
            int start, end;
            start = (page - 1) * numberPerPage;
            end = Math.min(page * numberPerPage, size);
            List<Project> projects = projectDAO.getListByPage(listProjects, start, end);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
            request.setAttribute("projectsApproved", projects);
            request.getRequestDispatcher("allproject.jsp").forward(request, response);
        } else if (action.equalsIgnoreCase("search")) {
            String searchStr = request.getParameter("search");

            if (searchStr == null || searchStr.equalsIgnoreCase("")) {
                List<Project> listProjects = projectDAO.getProjectsApproved();

                int page = 1, numberPerPage = 3;
                int size = listProjects.size();
                int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // page number
                String pageCur = request.getParameter("page");
                if (pageCur != null && !pageCur.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageCur);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid page number format: " + pageCur);
                        response.sendRedirect("404.jsp");
                    }
                }
                int start, end;
                start = (page - 1) * numberPerPage;
                end = Math.min(page * numberPerPage, size);
                List<Project> projects = projectDAO.getListByPage(listProjects, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("projectsApproved", projects);
                request.getRequestDispatcher("allproject.jsp").forward(request, response);
            } else {
                List<Project> listProjects = projectDAO.searchProject(searchStr);

                int page = 1, numberPerPage = 3;
                int size = listProjects.size();
                int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // page number
                String pageCur = request.getParameter("page");
                if (pageCur != null && !pageCur.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageCur);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid page number format: " + pageCur);
                    }
                }
                int start, end;
                start = (page - 1) * numberPerPage;
                end = Math.min(page * numberPerPage, size);
                List<Project> projects = projectDAO.getListByPage(listProjects, start, end);

                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("projectsApproved", projects);
                request.getRequestDispatcher("allproject.jsp").forward(request, response);
            }
        } else if (action.equalsIgnoreCase("filter")) {
            String type = request.getParameter("type");

            if (type == null || type.equalsIgnoreCase("")) {
                List<Project> listProjects = projectDAO.getProjectsApproved();

                int page = 1, numberPerPage = 3;
                int size = listProjects.size();
                int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // page number
                String pageCur = request.getParameter("page");
                if (pageCur != null && !pageCur.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageCur);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid page number format: " + pageCur);
                        response.sendRedirect("404.jsp");
                    }
                }
                int start, end;
                start = (page - 1) * numberPerPage;
                end = Math.min(page * numberPerPage, size);
                List<Project> projects = projectDAO.getListByPage(listProjects, start, end);
                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("projectsApproved", projects);
                request.getRequestDispatcher("allproject.jsp").forward(request, response);
            } else if (type.equalsIgnoreCase("a-z")) {
                List<Project> listProjects = projectDAO.getProjectByProjectNameAZ();

                int page = 1, numberPerPage = 3;
                int size = listProjects.size();
                int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // page number
                String pageCur = request.getParameter("page");
                if (pageCur != null && !pageCur.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageCur);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid page number format: " + pageCur);
                    }
                }
                int start, end;
                start = (page - 1) * numberPerPage;
                end = Math.min(page * numberPerPage, size);
                List<Project> projects = projectDAO.getListByPage(listProjects, start, end);

                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("type", type);
                request.setAttribute("projectsApproved", projects);
                request.getRequestDispatcher("allproject.jsp").forward(request, response);
            } else if (type.equalsIgnoreCase("success")) {
                List<Project> listProjects = projectDAO.getSuccessProject();

                int page = 1, numberPerPage = 3;
                int size = listProjects.size();
                int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // page number
                String pageCur = request.getParameter("page");
                if (pageCur != null && !pageCur.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageCur);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid page number format: " + pageCur);
                    }
                }
                int start, end;
                start = (page - 1) * numberPerPage;
                end = Math.min(page * numberPerPage, size);
                List<Project> projects = projectDAO.getListByPage(listProjects, start, end);

                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("type", type);
                request.setAttribute("projectsApproved", projects);
                request.getRequestDispatcher("allproject.jsp").forward(request, response);
            } else if (type.equalsIgnoreCase("new")) {
                List<Project> listProjects = projectDAO.getNewProject();

                int page = 1, numberPerPage = 3;
                int size = listProjects.size();
                int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // page number
                String pageCur = request.getParameter("page");
                if (pageCur != null && !pageCur.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageCur);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid page number format: " + pageCur);
                    }
                }
                int start, end;
                start = (page - 1) * numberPerPage;
                end = Math.min(page * numberPerPage, size);
                List<Project> projects = projectDAO.getListByPage(listProjects, start, end);

                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("type", type);
                request.setAttribute("projectsApproved", projects);
                request.getRequestDispatcher("allproject.jsp").forward(request, response);
            } else if (type.equalsIgnoreCase("active")) {
                List<Project> listProjects = projectDAO.getActiveProject();

                int page = 1, numberPerPage = 3;
                int size = listProjects.size();
                int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // page number
                String pageCur = request.getParameter("page");
                if (pageCur != null && !pageCur.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageCur);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid page number format: " + pageCur);
                    }
                }
                int start, end;
                start = (page - 1) * numberPerPage;
                end = Math.min(page * numberPerPage, size);
                List<Project> projects = projectDAO.getListByPage(listProjects, start, end);

                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("type", type);
                request.setAttribute("projectsApproved", projects);
                request.getRequestDispatcher("allproject.jsp").forward(request, response);
            } else if (type.equalsIgnoreCase("outdated")) {
                List<Project> listProjects = projectDAO.getOutdatedProject();

                int page = 1, numberPerPage = 3;
                int size = listProjects.size();
                int num = (size % 3 == 0 ? (size / 3) : ((size / 3)) + 1); // page number
                String pageCur = request.getParameter("page");
                if (pageCur != null && !pageCur.isEmpty()) {
                    try {
                        page = Integer.parseInt(pageCur);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid page number format: " + pageCur);
                    }
                }
                int start, end;
                start = (page - 1) * numberPerPage;
                end = Math.min(page * numberPerPage, size);
                List<Project> projects = projectDAO.getListByPage(listProjects, start, end);

                request.setAttribute("page", page);
                request.setAttribute("num", num);
                request.setAttribute("type", type);
                request.setAttribute("projectsApproved", projects);
                request.getRequestDispatcher("allproject.jsp").forward(request, response);
            }
//        } else if (action.equalsIgnoreCase("updateproject")) {
//            Project project = new Project();
//            int projectId = Integer.parseInt(request.getParameter("projectId").trim());
//
//            String projectName = request.getParameter("projectName").trim();
//            String projectTargetStr = request.getParameter("projectTarget").trim();
//            String projectImageStr = request.getParameter("projectImage").trim();
//            String donatedAmountOfMoneyStr = request.getParameter("donatedAmountOfMoney").trim();
//            String projectDescription = request.getParameter("projectDescription").trim();
//            String startDateStr = request.getParameter("startDate").trim();
//            String endDateStr = request.getParameter("endDate").trim();
//            String isApprovedStr = request.getParameter("isApproved").trim();
//            int userId = Integer.parseInt(request.getParameter("userId").trim());
//            int charityOrganizationId = Integer.parseInt(request.getParameter("charityOrganizationId").trim());
//            int categoryId = Integer.parseInt(request.getParameter("categoryId").trim());

        } else if (action.equalsIgnoreCase("projectdetail")) {
            CategoryDAO categoryDAO = new CategoryDAO();
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            Project project = projectDAO.getProjectApprovedByProjectId(projectId);

            request.setAttribute("project", project);
            request.getRequestDispatcher("projectdetail.jsp").forward(request, response);
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
