package model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author OS
 */
public class Feedback implements Serializable {

    private int feedbackId;
    private String content;
    private Date realTime;
    private int projectId;
    private int userId;

    public Feedback(int feedbackId, String content, Date realTime, int projectId, int userId) {
        this.feedbackId = feedbackId;
        this.content = content;
        this.realTime = realTime;
        this.projectId = projectId;
        this.userId = userId;
    }

    public Feedback() {
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getRealTime() {
        return realTime;
    }

    public void setRealTime(Date realTime) {
        this.realTime = realTime;
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
