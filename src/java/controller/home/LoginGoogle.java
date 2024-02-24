package controller.home;

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
public class LoginGoogle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String userName = (String) request.getAttribute("userName");
        String email = (String) request.getAttribute("email");
        String accessToken = (String) request.getAttribute("accessToken");
        UserDAO dao = new UserDAO();
        Users user = dao.getUserByEmail(email);
        if (dao.checkExistedEmail(email)) {
            session.setAttribute("user", user);
            response.sendRedirect("home");
        } else {
            dao.createUser(email, accessToken);
            int userId = dao.getUserIdByEmail(email);
            int googleUserId = dao.getGoogleUserIdByEmail(email);
            if (userId > 0) {
                dao.updateUserAuth(userId, googleUserId);
            } else {
                dao.createAuthenByGoogleId(googleUserId);
            }
            session.setAttribute("user", user);
            response.sendRedirect("home");
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
