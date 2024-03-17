package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 *
 * @author OS
 */
public class Project implements Serializable {

    private int projectId;
    private String projectName;
    private BigDecimal projectTarget;
    private BigDecimal donatedAmountOfMoney;
    private String projectStatus;
    private String projectDescription;
    private Date startDate;
    private Date endDate;
    private byte isApproved;
    private int userId;
    private int charityOrganizationId;
    private Users user;
    private ProjectImages prj;

    public Project(String projectName, BigDecimal projectTarget, String projectDescription, Date startDate, Date endDate, int userId, int charityOrganizationId) {
        this.projectName = projectName;
        this.projectTarget = projectTarget;
        this.projectDescription = projectDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.userId = userId;
        this.charityOrganizationId = charityOrganizationId;
    }
    
    public Project(int projectId, String projectName, BigDecimal projectTarget, BigDecimal donatedAmountOfMoney, String projectStatus, String projectDescription, Date startDate, Date endDate, byte isApproved, Users user, ProjectImages prj) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.projectTarget = projectTarget;
        this.donatedAmountOfMoney = donatedAmountOfMoney;
        this.projectStatus = projectStatus;
        this.projectDescription = projectDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isApproved = isApproved;
        this.user = user;
        this.prj = prj;
    }

    public Project(int projectId, String projectName, BigDecimal projectTarget, BigDecimal donatedAmountOfMoney, String projectStatus, String projectDescription, Date startDate, Date endDate, byte isApproved, int userId, int charityOrganizationId) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.projectTarget = projectTarget;
        this.donatedAmountOfMoney = donatedAmountOfMoney;
        this.projectStatus = projectStatus;
        this.projectDescription = projectDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isApproved = isApproved;
        this.userId = userId;
        this.charityOrganizationId = charityOrganizationId;
    }

    public Project(int projectId, String projectName, BigDecimal projectTarget, BigDecimal donatedAmountOfMoney, String projectStatus, String projectDescription, Date startDate, Date endDate, byte isApproved, Users user) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.projectTarget = projectTarget;
        this.donatedAmountOfMoney = donatedAmountOfMoney;
        this.projectStatus = projectStatus;
        this.projectDescription = projectDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isApproved = isApproved;
        this.user = user;
    }

    public Project() {
    }

    public ProjectImages getPrj() {
        return prj;
    }

    public void setPrj(ProjectImages prj) {
        this.prj = prj;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public BigDecimal getProjectTarget() {
        return projectTarget;
    }

    public void setProjectTarget(BigDecimal projectTarget) {
        this.projectTarget = projectTarget;
    }

    public BigDecimal getDonatedAmountOfMoney() {
        return donatedAmountOfMoney;
    }

    public void setDonatedAmountOfMoney(BigDecimal donatedAmountOfMoney) {
        this.donatedAmountOfMoney = donatedAmountOfMoney;
    }

    public String getProjectStatus() {
        return projectStatus;
    }

    public void setProjectStatus(String projectStatus) {
        this.projectStatus = projectStatus;
    }

    public String getProjectDescription() {
        return projectDescription;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public byte getIsApproved() {
        return isApproved;
    }

    public void setIsApproved(byte isApproved) {
        this.isApproved = isApproved;
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

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Project{" + "projectId=" + projectId + ", projectName=" + projectName + ", projectTarget=" + projectTarget + ", donatedAmountOfMoney=" + donatedAmountOfMoney + ", projectStatus=" + projectStatus + ", projectDescription=" + projectDescription + ", startDate=" + startDate + ", endDate=" + endDate + ", isApproved=" + isApproved + ", userId=" + userId + ", charityOrganizationId=" + charityOrganizationId + '}';
    }

}
