package model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author OS
 */
public class Users implements Serializable {

    private int userId;
    private String fullName;
    private String userName;
    private String password;
    private byte gender;
    private Date dateOfBirth;
    private String avatar;
    private String email;
    private String phoneNumber;
    private String userStatus;
    private Date dateCreated;
    private int userTypeId;

    public Users(int userId, String fullName, String userName, String password, byte gender, Date dateOfBirth, String avatar, String email, String phoneNumber, String userStatus, Date dateCreated, int userTypeId) {
        this.userId = userId;
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.avatar = avatar;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.userStatus = userStatus;
        this.dateCreated = dateCreated;
        this.userTypeId = userTypeId;
    }

    public Users(int userId, String fullName, String userName, String password, byte gender, Date dateOfBirth, String avatar, String email, String phoneNumber, Date dateCreated, int userTypeId) {
        this.userId = userId;
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.avatar = avatar;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dateCreated = dateCreated;
        this.userTypeId = userTypeId;
    }

    public Users(int userId, String fullName, String userName, String password, byte gender, Date dateOfBirth, String avatar, String email, String phoneNumber, int userTypeId) {
        this.userId = userId;
        this.fullName = fullName;
        this.userName = userName;
        this.password = password;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.avatar = avatar;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.userTypeId = userTypeId;
    }

    public Users() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public byte getGender() {
        return gender;
    }

    public void setGender(byte gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public int getUserTypeId() {
        return userTypeId;
    }

    public void setUserTypeId(int userTypeId) {
        this.userTypeId = userTypeId;
    }

    @Override
    public String toString() {
        return "Users{" + "userId=" + userId + ", fullName=" + fullName + ", userName=" + userName + ", password=" + password + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth + ", avatar=" + avatar + ", email=" + email + ", phoneNumber=" + phoneNumber + ", userStatus=" + userStatus + ", dateCreated=" + dateCreated + ", userTypeId=" + userTypeId + '}';
    }

}
