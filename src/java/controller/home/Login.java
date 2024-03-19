package controller.home;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author OS
 */
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String username = request.getParameter("userName");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        UserDAO userDAO = new UserDAO();
        Users user = userDAO.checkUser(username, password);
        PrintWriter out = response.getWriter();

        if (user == null) {
            String alertMessage = "Username or password is invalid. Please try again.";
            String redirectUrl = "login.jsp";
            String script = "<script>alert('" + alertMessage + "');";
            script += "window.location.href='" + redirectUrl + "';</script>";
            response.getWriter().println(script);
        } else {
            if (user.getUserStatus().equalsIgnoreCase("block")) {
                request.setAttribute("error", "Your account has been disabled. Please check our Terms of Use, and contact our customer support team for more information.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (user.getUserStatus().equalsIgnoreCase("warning")) {
                session.setAttribute("warning", "Your account has been issued a warning due to a violation of our policies. We kindly remind you that any further violations will result in the suspension of your account!");

                Cookie cookieE = new Cookie("username", username);
                Cookie cookieP = new Cookie("password", password);
                Cookie cookieR = new Cookie("remember", remember);

                if (remember != null) {
                    cookieE.setMaxAge(60 * 60);
                    cookieP.setMaxAge(60 * 60);
                    cookieR.setMaxAge(60 * 60);
                } else {
                    cookieE.setMaxAge(0);
                    cookieP.setMaxAge(0);
                    cookieR.setMaxAge(0);
                }
                session.setAttribute("user", user);
                response.addCookie(cookieE);
                response.addCookie(cookieP);
                response.addCookie(cookieR);
                response.sendRedirect("home");
            } else {
                Cookie cookieE = new Cookie("username", username);
                Cookie cookieP = new Cookie("password", password);
                Cookie cookieR = new Cookie("remember", remember);

                if (remember != null) {
                    cookieE.setMaxAge(60 * 60);
                    cookieP.setMaxAge(60 * 60);
                    cookieR.setMaxAge(60 * 60);
                } else {
                    cookieE.setMaxAge(0);
                    cookieP.setMaxAge(0);
                    cookieR.setMaxAge(0);
                }
                session.setAttribute("user", user);
                response.addCookie(cookieE);
                response.addCookie(cookieP);
                response.addCookie(cookieR);
                response.sendRedirect("home");
            }

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
