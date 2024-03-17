package controller.admin;

import dao.CharityOrganizationDAO;
import dao.ProjectDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.CharityOrganization;
import model.Users;

/**
 *
 * @author OS
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class CharityOrganizationManagement extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        CharityOrganizationDAO charityOrgDAO = new CharityOrganizationDAO();
        PrintWriter out = response.getWriter();
        try {
            Users user = (Users) session.getAttribute("user");
            if (user.getUserTypeId() == 1) {
                if (action == null || action.equalsIgnoreCase("")) {
                    List<CharityOrganization> charityOrgList = charityOrgDAO.getAllCharityOrg();
                    request.setAttribute("charityOrgList", charityOrgList);

                    request.getRequestDispatcher("/admin/charityorg.jsp").forward(request, response);
                } else if (action.equalsIgnoreCase("updatecharityorg")) {
                    CharityOrganization charityOrg = null;
                    int charityOrganizationId = Integer.parseInt(request.getParameter("charityOrganizationId"));
                    String charityOrganizationName = request.getParameter("charityOrganizationName");
                    boolean isCharityOrgNameExisted = charityOrgDAO.checkCharityOrgName(charityOrganizationName);

                    if (isCharityOrgNameExisted) {
                        request.setAttribute("updateFail", "Fail to update. Charity Organization Email exists!");
                    } else {
                        String charityOrganizationEmail = request.getParameter("charityOrganizationEmail");
                        boolean isCharityOrgEmailExisted = charityOrgDAO.checkCharityOrgEmail(charityOrganizationEmail);

                        if (isCharityOrgEmailExisted) {
                            request.setAttribute("updateFail", "Fail to update. Charity Organization Email exists!");
                        } else {
                            String charityOrganizationAddress = request.getParameter("charityOrganizationAddress");
                            String charityOrganizationPhone = request.getParameter("charityOrganizationPhone");

                            Part filePart = request.getPart("charityOrganizationLogo");

                            String fileName = filePart.getSubmittedFileName();

                            if (fileName == null || fileName.isEmpty()) {
                                charityOrg = new CharityOrganization(charityOrganizationId, charityOrganizationName, charityOrganizationEmail, charityOrganizationAddress, charityOrganizationPhone);

                                boolean success = charityOrgDAO.updateCharityOrgWithoutLogo(charityOrg);

                                if (success) {
                                    List<CharityOrganization> charityOrgList = charityOrgDAO.getAllCharityOrg();
                                    request.setAttribute("charityOrgList", charityOrgList);

                                    request.setAttribute("updateSuccess", "Update information of charity organization successfully!");
                                } else {
                                    request.setAttribute("updateFail", "Fail to update information of charity organization!");
                                }
                            } else {
                                String folderName = "resources";
                                String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;
                                File dir = new File(uploadPath);
                                if (!dir.exists()) {
                                    dir.mkdirs();
                                }

                                String path = folderName + File.separator + fileName;
                                File file = new File(uploadPath + File.separator + fileName);
                                if (!file.exists()) {
                                    InputStream is = filePart.getInputStream();
                                    Files.copy(is, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                                }

                                charityOrg = new CharityOrganization(charityOrganizationId, charityOrganizationName, charityOrganizationEmail, path, charityOrganizationAddress, charityOrganizationPhone);

                                boolean success = charityOrgDAO.updateCharityOrg(charityOrg);

                                if (success) {
                                    request.setAttribute("updateSuccess", "Update information of charity organization successfully!");
                                } else {
                                    request.setAttribute("updateFail", "Fail to update information of charity organization!");
                                }
                            }
                        }
                    }

                    List<CharityOrganization> charityOrgList = charityOrgDAO.getAllCharityOrg();
                    request.setAttribute("charityOrgList", charityOrgList);
                    request.getRequestDispatcher("/admin/charityorg.jsp").forward(request, response);
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
                } else if (action.equalsIgnoreCase("insertcharityorg")) {
                    String charityOrganizationName = request.getParameter("charityOrganizationName");
                    boolean isCharityOrgNameExisted = charityOrgDAO.checkCharityOrgName(charityOrganizationName);

                    if (isCharityOrgNameExisted) {
                        request.setAttribute("insertFail", "Fail to create. Charity Organization Name exists!");
                    } else {
                        String charityOrganizationEmail = request.getParameter("charityOrganizationEmail");
                        boolean isCharityOrgEmailExisted = charityOrgDAO.checkCharityOrgEmail(charityOrganizationEmail);

                        if (isCharityOrgEmailExisted) {
                            request.setAttribute("insertFail", "Fail to create. Charity Organization Email exists!");
                        } else {
                            String folderName = "resources";
                            String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;
                            File dir = new File(uploadPath);
                            if (!dir.exists()) {
                                dir.mkdirs();
                            }

                            Part filePart = request.getPart("logo");
                            String fileName = filePart.getSubmittedFileName();
                            String path = folderName + File.separator + fileName;
                            File file = new File(uploadPath + File.separator + fileName);
                            if (!file.exists()) {
                                InputStream is = filePart.getInputStream();
                                Files.copy(is, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                            }

                            String charityOrganizationAddress = request.getParameter("charityOrganizationAddress");
                            String charityOrganizationPhone = request.getParameter("charityOrganizationPhone");

                            CharityOrganization charityOrg = new CharityOrganization(charityOrganizationName, charityOrganizationEmail, path, charityOrganizationAddress, charityOrganizationPhone);

                            boolean success = charityOrgDAO.insertCharityOrg(charityOrg);
                            if (success) {
                                request.setAttribute("insertSuccess", "Create new charity organization successfully!");
                            } else {
                                request.setAttribute("insertFail", "Fail to create new charity organization!");
                            }
                        }
                    }

                    List<CharityOrganization> charityOrgList = charityOrgDAO.getAllCharityOrg();
                    request.setAttribute("charityOrgList", charityOrgList);
                    request.getRequestDispatcher("/admin/charityorg.jsp").forward(request, response);
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
