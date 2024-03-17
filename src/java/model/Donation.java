/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @author quang
 */
public class Donation {
    private int donationId;
    private BigDecimal amountOfMoney;
    private Date donationTime;
    private boolean receiveGift;
    private int userId;
    private int projectId;
    private String paymentMethod;
    private int giftId;
    private String province;
    private String address;
    private Users user;
    private ProjectMilestoneGift pm;

    public Donation(BigDecimal amountOfMoney, String address, Users user, ProjectMilestoneGift pm) {
        this.amountOfMoney = amountOfMoney;
        this.address = address;
        this.user = user;
        this.pm = pm;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public ProjectMilestoneGift getPm() {
        return pm;
    }

    public void setPm(ProjectMilestoneGift pm) {
        this.pm = pm;
    }
    
    @Override
    public String toString() {
        return "Donation{" + "donationId=" + donationId + ", amountOfMoney=" + amountOfMoney + ", donationTime=" + donationTime + ", receiveGift=" + receiveGift + ", userId=" + userId + ", projectId=" + projectId + ", giftId=" + giftId + ", address=" + address + '}';
    }

    public Donation(BigDecimal amountOfMoney, Date donationTime, int userId, int projectId, String paymentMethod, int giftId, String address) {
        this.amountOfMoney = amountOfMoney;
        this.donationTime = donationTime;
        this.userId = userId;
        this.projectId = projectId;
        this.paymentMethod = paymentMethod;
        this.giftId = giftId;
        this.address = address;
    }
    
    public Donation() {
    }

    public Donation(BigDecimal amountOfMoney, Date donationTime, int userId, int projectId, String paymentMethod, String address) {
        this.amountOfMoney = amountOfMoney;
        this.donationTime = donationTime;
        this.userId = userId;
        this.projectId = projectId;
        this.paymentMethod = paymentMethod;
        this.address = address;
    }

    public int getDonationId() {
        return donationId;
    }

    public void setDonationId(int donationId) {
        this.donationId = donationId;
    }

    public BigDecimal getAmountOfMoney() {
        return amountOfMoney;
    }

    public void setAmountOfMoney(BigDecimal amountOfMoney) {
        this.amountOfMoney = amountOfMoney;
    }

    public Date getDonationTime() {
        return donationTime;
    }

    public void setDonationTime(Date donationTime) {
        this.donationTime = donationTime;
    }

    public boolean isReceiveGift() {
        return receiveGift;
    }

    public void setReceiveGift(boolean receiveGift) {
        this.receiveGift = receiveGift;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getGiftId() {
        return giftId;
    }

    public void setGiftId(int giftId) {
        this.giftId = giftId;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}
