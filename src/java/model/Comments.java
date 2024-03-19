package model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author OS
 */
public class Comments implements Serializable {

    private int commentId;
    private String content;
    private Date realTime;
    private int projectId;
    private int userId;

    public Comments(String content, Date realTime, int projectId, int userId) {
        this.content = content;
        this.realTime = realTime;
        this.projectId = projectId;
        this.userId = userId;
    }
    
    public Comments(int commentId, String content, Date realTime, int projectId, int userId) {
        this.commentId = commentId;
        this.content = content;
        this.realTime = realTime;
        this.projectId = projectId;
        this.userId = userId;
    }

    public Comments() {
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
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
