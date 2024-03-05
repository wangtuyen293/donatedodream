/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quang
 */
public class ProjectImages {
    private int projectId;
    private String image1_path;
    private String image2_path;
    private String image3_path;
    private String image4_path;

    public ProjectImages() {
    }

    public ProjectImages(int projectId, String image1_path, String image2_path, String image3_path, String image4_path) {
        this.projectId = projectId;
        this.image1_path = image1_path;
        this.image2_path = image2_path;
        this.image3_path = image3_path;
        this.image4_path = image4_path;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getImage1_path() {
        return image1_path;
    }

    public void setImage1_path(String image1_path) {
        this.image1_path = image1_path;
    }

    public String getImage2_path() {
        return image2_path;
    }

    public void setImage2_path(String image2_path) {
        this.image2_path = image2_path;
    }

    public String getImage3_path() {
        return image3_path;
    }

    public void setImage3_path(String image3_path) {
        this.image3_path = image3_path;
    }

    public String getImage4_path() {
        return image4_path;
    }

    public void setImage4_path(String image4_path) {
        this.image4_path = image4_path;
    }
    
}
