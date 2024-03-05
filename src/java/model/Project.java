package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author OS
 */
public class Project implements Serializable {

    private int projectId;
    private String projectName;
    private BigDecimal projectTarget;
    private String projectImage;
    private BigDecimal donatedAmountOfMoney;
    private String projectStatus;
    private String projectDescription;
    private Date startDate;
    private Date endDate;
    private byte isApproved;
    private int userId;
    private int charityOrganizationId;
    private int categoryId;
    private Category category;

    public Project(int projectId, String projectName, BigDecimal projectTarget, String projectImage, BigDecimal donatedAmountOfMoney, String projectStatus, String projectDescription, Date startDate, Date endDate, byte isApproved, int userId, int charityOrganizationId, Category category) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.projectTarget = projectTarget;
        this.projectImage = projectImage;
        this.donatedAmountOfMoney = donatedAmountOfMoney;
        this.projectStatus = projectStatus;
        this.projectDescription = projectDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isApproved = isApproved;
        this.userId = userId;
        this.charityOrganizationId = charityOrganizationId;
        this.category = category;
    }

    public Project(int projectId, String projectName, BigDecimal projectTarget, String projectImage, BigDecimal donatedAmountOfMoney, String projectStatus, String projectDescription, Date startDate, Date endDate, byte isApproved, int userId, int charityOrganizationId, int categoryId) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.projectTarget = projectTarget;
        this.projectImage = projectImage;
        this.donatedAmountOfMoney = donatedAmountOfMoney;
        this.projectStatus = projectStatus;
        this.projectDescription = projectDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.userId = userId;
        this.charityOrganizationId = charityOrganizationId;
        this.isApproved = isApproved;
        this.categoryId = categoryId;
    }

    public Project(String projectName, BigDecimal projectTarget, String projectImage, BigDecimal donatedAmountOfMoney, String projectStatus, String projectDescription, Date startDate, Date endDate, byte isApproved, int userId, int charityOrganizationId, Category category) {
        this.projectName = projectName;
        this.projectTarget = projectTarget;
        this.projectImage = projectImage;
        this.donatedAmountOfMoney = donatedAmountOfMoney;
        this.projectStatus = projectStatus;
        this.projectDescription = projectDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isApproved = isApproved;
        this.userId = userId;
        this.charityOrganizationId = charityOrganizationId;
        this.category = category;
    }

    public Project(int projectId, String projectName, BigDecimal projectTarget, String projectImage, BigDecimal donatedAmountOfMoney, String projectStatus, String projectDescription, Date startDate, Date endDate, int userId, int charityOrganizationId, int categoryId) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.projectTarget = projectTarget;
        this.projectImage = projectImage;
        this.donatedAmountOfMoney = donatedAmountOfMoney;
        this.projectStatus = projectStatus;
        this.projectDescription = projectDescription;
        this.startDate = startDate;
        this.endDate = endDate;
        this.userId = userId;
        this.charityOrganizationId = charityOrganizationId;
        this.categoryId = categoryId;
    }

    public Project() {
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
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

    public String getProjectImage() {
        return projectImage;
    }

    public void setProjectImage(String projectImage) {
        this.projectImage = projectImage;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Project{" + "projectId=" + projectId + ", projectName=" + projectName + ", projectTarget=" + projectTarget + ", projectImage=" + projectImage + ", donatedAmountOfMoney=" + donatedAmountOfMoney + ", projectStatus=" + projectStatus + ", projectDescription=" + projectDescription + ", startDate=" + startDate + ", endDate=" + endDate + ", isApproved=" + isApproved + ", userId=" + userId + ", charityOrganizationId=" + charityOrganizationId + ", categoryId=" + categoryId + '}';
    }

}