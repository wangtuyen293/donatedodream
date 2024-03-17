package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author OS
 */
public class ProjectProcess implements Serializable {

    private int processId;
    private String processName;
    private Date updateDate;
    private String planOfPhase;
    private BigDecimal moneyCost;
    private String image1;
    private String image2;
    private String image3;
    private String image4;
    private String description;
    private int userId;
    private int charityOrganizationId;
    private int projectId;

    public ProjectProcess(String processName, Date updateDate, BigDecimal moneyCost, String image1, String image2, String image3, String image4, String description, int userId, int charityOrganizationId, int projectId) {
        this.processName = processName;
        this.updateDate = updateDate;
        this.moneyCost = moneyCost;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.description = description;
        this.userId = userId;
        this.charityOrganizationId = charityOrganizationId;
        this.projectId = projectId;
    }

    public ProjectProcess() {
    }

    public String getProcessName() {
        return processName;
    }

    public void setProcessName(String processName) {
        this.processName = processName;
    }

    public int getProcessId() {
        return processId;
    }

    public void setProcessId(int processId) {
        this.processId = processId;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getPlanOfPhase() {
        return planOfPhase;
    }

    public void setPlanOfPhase(String planOfPhase) {
        this.planOfPhase = planOfPhase;
    }

    public BigDecimal getMoneyCost() {
        return moneyCost;
    }

    public void setMoneyCost(BigDecimal moneyCost) {
        this.moneyCost = moneyCost;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCharityOrganizationId() {
        return charityOrganizationId;
    }

    public void setCharityOrganizationId(int charityOrganizationId) {
        this.charityOrganizationId = charityOrganizationId;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

}
