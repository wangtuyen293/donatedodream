package model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author OS
 */
public class CharityOrganization implements Serializable {

    private int charityOrganizationId;
    private String charityOrganizationName;
    private String charityOrganizationEmail;
    private String charityOrganizationLogo;
    private String charityOrganizationAddress;
    private String charityOrganizationPhone;
    private Date dateCreated;

    public CharityOrganization(int charityOrganizationId, String charityOrganizationName, String charityOrganizationEmail, String charityOrganizationLogo, String charityOrganizationAddress, String charityOrganizationPhone, Date dateCreated) {
        this.charityOrganizationId = charityOrganizationId;
        this.charityOrganizationName = charityOrganizationName;
        this.charityOrganizationEmail = charityOrganizationEmail;
        this.charityOrganizationLogo = charityOrganizationLogo;
        this.charityOrganizationAddress = charityOrganizationAddress;
        this.charityOrganizationPhone = charityOrganizationPhone;
        this.dateCreated = dateCreated;
    }

    public CharityOrganization(int charityOrganizationId, String charityOrganizationName, String charityOrganizationEmail, String charityOrganizationAddress, String charityOrganizationPhone, Date dateCreated) {
        this.charityOrganizationId = charityOrganizationId;
        this.charityOrganizationName = charityOrganizationName;
        this.charityOrganizationEmail = charityOrganizationEmail;
        this.charityOrganizationAddress = charityOrganizationAddress;
        this.charityOrganizationPhone = charityOrganizationPhone;
        this.dateCreated = dateCreated;
    }

    public CharityOrganization(String charityOrganizationName, String charityOrganizationEmail, String charityOrganizationLogo, String charityOrganizationAddress, String charityOrganizationPhone, Date dateCreated) {
        this.charityOrganizationName = charityOrganizationName;
        this.charityOrganizationEmail = charityOrganizationEmail;
        this.charityOrganizationLogo = charityOrganizationLogo;
        this.charityOrganizationAddress = charityOrganizationAddress;
        this.charityOrganizationPhone = charityOrganizationPhone;
        this.dateCreated = dateCreated;
    }

    public CharityOrganization() {
    }

    public int getCharityOrganizationId() {
        return charityOrganizationId;
    }

    public void setCharityOrganizationId(int charityOrganizationId) {
        this.charityOrganizationId = charityOrganizationId;
    }

    public String getCharityOrganizationName() {
        return charityOrganizationName;
    }

    public void setCharityOrganizationName(String charityOrganizationName) {
        this.charityOrganizationName = charityOrganizationName;
    }

    public String getCharityOrganizationEmail() {
        return charityOrganizationEmail;
    }

    public void setCharityOrganizationEmail(String charityOrganizationEmail) {
        this.charityOrganizationEmail = charityOrganizationEmail;
    }

    public String getCharityOrganizationLogo() {
        return charityOrganizationLogo;
    }

    public void setCharityOrganizationLogo(String charityOrganizationLogo) {
        this.charityOrganizationLogo = charityOrganizationLogo;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getCharityOrganizationAddress() {
        return charityOrganizationAddress;
    }

    public void setCharityOrganizationAddress(String charityOrganizationAddress) {
        this.charityOrganizationAddress = charityOrganizationAddress;
    }

    public String getCharityOrganizationPhone() {
        return charityOrganizationPhone;
    }

    public void setCharityOrganizationPhone(String charityOrganizationPhone) {
        this.charityOrganizationPhone = charityOrganizationPhone;
    }

}
