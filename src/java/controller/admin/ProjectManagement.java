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
import model.Project;
import model.Users;

/**
 *
 * @author OS
 */
public class ProjectManagement extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/ html;charset=UTF-8");
        String action = request.getParameter("action");
        ProjectDAO projectDAO = new ProjectDAO();
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("user");
            if (user.getUserTypeId() == 1) {
                if (action == null || action.equalsIgnoreCase("")) {
                    List<Project> projectsApproved = projectDAO.getProjectsApproved();
                    List<Project> projectsUnapproved = projectDAO.getProjectsUnapproved();
                    request.setAttribute("projectsApproved", projectsApproved);
                    request.setAttribute("projectsUnapproved", projectsUnapproved);

                    request.getRequestDispatcher("/admin/project.jsp").forward(request, response);
                } else if (action.equalsIgnoreCase("approve")) {
                    String projectIdStr = request.getParameter("projectId");

                    int projectId = 0;
                    byte isApproved = 1;

                    try {
                        projectId = Integer.parseInt(projectIdStr);

                    } catch (NullPointerException ex) {
                        ex.printStackTrace();
                    } catch (NumberFormatException ex) {
                        ex.printStackTrace();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    boolean updateSuccess = projectDAO.updateProjectApproval(projectId, isApproved);

                    if (updateSuccess) {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().print("success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().print("error");
                    }
                } else if (action.equalsIgnoreCase("reject")) {
                    String projectIdStr = request.getParameter("projectId");

                    int projectId = 0;

                    try {
                        projectId = Integer.parseInt(projectIdStr);
                    } catch (NullPointerException ex) {
                        ex.printStackTrace();
                    } catch (NumberFormatException ex) {
                        ex.printStackTrace();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    boolean deleteFeedback = projectDAO.deleteFeedback(projectId);
                    System.out.println(deleteFeedback);
                    boolean deleteCat = projectDAO.deleteCategories(projectId);
                    boolean deleteImg = projectDAO.deleteImages(projectId);
                    System.out.println(deleteCat);
                    System.out.println(deleteImg);
                    if ((deleteCat && deleteImg) || deleteFeedback) {
                        boolean deletionSuccess = projectDAO.deleteProject(projectId);
                        if (deletionSuccess) {
                            response.setStatus(HttpServletResponse.SC_OK);
                            response.getWriter().print("success");
                        } else {
                            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                            response.getWriter().print("error");
                        }
                    }
                } else if (action.equalsIgnoreCase("updateproject")) {
                    String projectIdStr = request.getParameter("projectId");
                    String isApprovedStr = request.getParameter("isApproved");

                    int projectId = 0;
                    byte isApproved = 0;

                    try {
                        projectId = Integer.parseInt(projectIdStr);
                        if (isApprovedStr.equalsIgnoreCase("true")) {
                            isApproved = 1;
                        } else {
                            isApproved = 0;
                        }
                    } catch (NullPointerException ex) {
                        ex.printStackTrace();
                    } catch (NumberFormatException ex) {
                        ex.printStackTrace();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    boolean updateSuccess = projectDAO.updateProjectApproval(projectId, isApproved);
                    if (updateSuccess) {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().print("success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().print("error");
                    }
                } else if (action.equalsIgnoreCase("deleteproject")) {
                    String projectIdStr = request.getParameter("projectId");

                    int projectId = 0;
                    try {
                        projectId = Integer.parseInt(projectIdStr);
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                    boolean checkdonate = projectDAO.isProjectOnDonate(projectId);
                    System.out.println(checkdonate);
                    if (checkdonate) {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().print("Project on donation");
                    } else {
                        boolean deleteFeedback = projectDAO.deleteFeedback(projectId);
                        System.out.println(deleteFeedback);
                        boolean deleteCat = projectDAO.deleteCategories(projectId);
                        boolean deleteImg = projectDAO.deleteImages(projectId);
                        System.out.println(deleteCat);
                        System.out.println(deleteImg);
                        if ((deleteCat && deleteImg) || deleteFeedback) {
                            boolean deletionSuccess = projectDAO.deleteProject(projectId);
                            if (deletionSuccess) {
                                response.setStatus(HttpServletResponse.SC_OK);
                                response.getWriter().print("success");
                            } else {
                                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                                response.getWriter().print("error");
                            }
                        }
                    }

                } else if (action.equalsIgnoreCase("deleteprojectselected")) {
                    String projectIdStr = request.getParameter("projectId");
                    int[] projectIdList = null;

                    try {
                        String[] userIds = projectIdStr.split(",");

                        // Create an int array with the same length as the userIds array
                        projectIdList = new int[userIds.length];

                        // Convert the user IDs from strings to integers
                        for (int i = 0; i < userIds.length; i++) {
                            projectIdList[i] = Integer.parseInt(userIds[i]);
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                    for (int i = 0; i < projectIdList.length; i++) {
                        boolean deleteFeedback = projectDAO.deleteFeedback(i);
                        boolean deleteCat = projectDAO.deleteCategories(i);
                        boolean deleteImg = projectDAO.deleteImages(i);
                        if ((deleteCat && deleteImg) || deleteFeedback) {
                            boolean deletionSuccess = projectDAO.deleteProject(i);
                            if (deletionSuccess) {
                                response.setStatus(HttpServletResponse.SC_OK);
                                response.getWriter().print("success");
                            } else {
                                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                                response.getWriter().print("error");
                            }
                        }
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
