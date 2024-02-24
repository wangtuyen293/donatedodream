package controller.admin;

import dao.CharityOrganizationDAO;
import dao.ProjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CharityOrganization;
import model.Users;

/**
 *
 * @author OS
 */
public class CharityOrganizationManagement extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        CharityOrganizationDAO charityOrgDAO = new CharityOrganizationDAO();
        
        try {
            Users user = (Users) session.getAttribute("user");
            if (user.getUserTypeId() == 1) {
                if (action == null || action.equalsIgnoreCase("")) {
                    ProjectDAO projectDAO = new ProjectDAO();

                    List<CharityOrganization> charityOrgList = charityOrgDAO.getAllCharityOrg();
                    request.setAttribute("charityOrgList", charityOrgList);

                    request.getRequestDispatcher("/admin/charityorg.jsp").forward(request, response);
                } else if (action.equalsIgnoreCase("updatecharityorg")) {
                    String charityOrgIdStr = request.getParameter("charityOrganizationId");
                    String userStatus = request.getParameter("userStatus");

                    int charityOrganizationId = 0;
                    try {
                        charityOrganizationId = Integer.parseInt(charityOrgIdStr);
                    } catch (NullPointerException ex) {
                        ex.printStackTrace();
                    } catch (NumberFormatException ex) {
                        ex.printStackTrace();
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }

                    boolean updateSuccess = userDAO.updateUserStatus(charityOrganizationId, userStatus);
                    if (updateSuccess) {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().print("success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().print("error");
                    }
                } else if (action.equalsIgnoreCase("deletecharityorg")) {
                    String charityOrgIdStr = request.getParameter("charityOrganizationId");
                    int charityOrganizationId = 0;
                    try {
                        charityOrganizationId = Integer.parseInt(charityOrgIdStr);
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                    boolean deletionSuccess = charityOrgDAO.deleteCharityOrgByCharityOrgId(charityOrganizationId);
                    if (deletionSuccess) {
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().print("success");
                    } else {
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                        response.getWriter().print("error");
                    }
                } else if (action.equalsIgnoreCase("deletecharityorgselected")) {
                    String charityOrgIdStr = request.getParameter("charityOrganizationId");
                    int[] charityOrgIdList = null;

                    try {
                        String[] charityOrgIds = charityOrgIdStr.split(",");

                        charityOrgIdList = new int[charityOrgIds.length];

                        for (int i = 0; i < charityOrgIds.length; i++) {
                            charityOrgIdList[i] = Integer.parseInt(charityOrgIds[i]);
                        }
                    } catch (Exception e) {
                        System.out.println(e);
                    }

                    boolean deletionSuccess = charityOrgDAO.deleteCharityOrgSelectedByCharityOrgId(charityOrgIdList);
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
