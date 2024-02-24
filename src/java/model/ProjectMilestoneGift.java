package model;

import java.io.Serializable;

/**
 *
 * @author OS
 */
public class ProjectMilestoneGift implements Serializable {

    private int projectMilestoneGiftId;
    private String projectMilestoneGiftName;
    private String description;
    private int projectId;
    private int userId;

    public ProjectMilestoneGift(int projectMilestoneGiftId, String projectMilestoneGiftName, String description, int projectId, int userId) {
        this.projectMilestoneGiftId = projectMilestoneGiftId;
        this.projectMilestoneGiftName = projectMilestoneGiftName;
        this.description = description;
        this.projectId = projectId;
        this.userId = userId;
    }

    public ProjectMilestoneGift() {
    }

    public int getProjectMilestoneGiftId() {
        return projectMilestoneGiftId;
    }

    public void setProjectMilestoneGiftId(int projectMilestoneGiftId) {
        this.projectMilestoneGiftId = projectMilestoneGiftId;
    }

    public String getProjectMilestoneGiftName() {
        return projectMilestoneGiftName;
    }

    public void setProjectMilestoneGiftName(String projectMilestoneGiftName) {
        this.projectMilestoneGiftName = projectMilestoneGiftName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}
