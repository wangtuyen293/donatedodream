package model;

import java.io.Serializable;

/**
 *
 * @author OS
 */
public class UserFacebook implements Serializable {

    private int facebookUserId;
    private String userName;
    private String email;
    private String accessToken;

    public UserFacebook(int facebookUserId, String userName, String email, String accessToken) {
        this.facebookUserId = facebookUserId;
        this.userName = userName;
        this.email = email;
        this.accessToken = accessToken;
    }
    
    public UserFacebook() {
    }

    public int getFacebookUserId() {
        return facebookUserId;
    }

    public void setFacebookUserId(int facebookUserId) {
        this.facebookUserId = facebookUserId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

}
