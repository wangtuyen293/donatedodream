package controller.home;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
import model.Constants;
import model.UserGoogle;
import model.Users;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author OS
 */
public class LoginGoogle extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            UserGoogle userGoogle = getUserInfo(accessToken);
            UserDAO dao = new UserDAO();
            Users user = new Users();
            user.setFullName(userGoogle.getName());
            user.setEmail(userGoogle.getEmail());
            user.setAvatar(userGoogle.getPicture());
            String username = dao.getUserNameByEmail(userGoogle.getEmail());
            user.setUserName(username);
            if (username == "") {
                HttpSession session = request.getSession();
                session.setAttribute("email", userGoogle.getEmail());
                response.sendRedirect("signup.jsp");
            }
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            dao.addUserLoginByEmail(userGoogle, accessToken);
            response.sendRedirect("home.jsp");
        } catch (Exception ex) {
            Logger.getLogger(LoginGoogle.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogle googlePojo = new Gson().fromJson(response, UserGoogle.class);

        return googlePojo;
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
