package controller.admin;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.EmailService;
import model.IJavamail;

/**
 *
 * @author OS
 */
public class ContactFounder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ContactFounder</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactFounder at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            String projectIdStr = request.getParameter("projectId");
            int projectId = 0;
            try {
                projectId = Integer.parseInt(projectIdStr);
            } catch (Exception e) {
                System.out.println(e);
            }
            UserDAO dao = new UserDAO();
            String email = dao.getEmailByProjectId(projectId);
            System.out.println(email);
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            IJavamail emailService = new EmailService();
            String subject = "Notification of successful fundraising for your project";
            String message = "Hello,\n\n"
                    + "This is DonateDoDreaming.\n\n"
                    + "We would like to inform you that your project has successfully raised funds.\n"
                    + "Below is the total amount you will receive: [Amount]\n\n"
                    + "We will deduct 5% as a part to maintain the platform, as agreed upon initially.\n"
                    + "As discussed previously, we will disburse this amount in several stages, and the first stage will be 20% of the project.\n"
                    + "Please provide us with your bank account information so that we can transfer the money to you.\n\n"
                    + "Thank you for using our service.\n"
                    + "Best regards,\n"
                    + "DonateDoDreaming Team";
            boolean success = emailService.send(email, subject, message);
            if (success) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().print("success");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().print("error");
            }
        } catch (Exception ex) {
            Logger.getLogger(ContactFounder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
