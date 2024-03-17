/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quang
 */
public class Transaction {
    private String MaGD;
    private String MoTa;
    private String GiaTri;
    private String NgayDienRa;
    private String SoTaiKhoan;
    private String SoDu;

    public Transaction(String MaGD, String MoTa, String GiaTri, String NgayDienRa, String SoTaiKhoan, String SoDu) {
        this.MaGD = MaGD;
        this.MoTa = MoTa;
        this.GiaTri = GiaTri;
        this.NgayDienRa = NgayDienRa;
        this.SoTaiKhoan = SoTaiKhoan;
        this.SoDu = SoDu;
    }

    public Transaction() {
    }

    public String getMaGD() {
        return MaGD;
    }

    public void setMaGD(String MaGD) {
        this.MaGD = MaGD;
    }

    public String getMoTa() {
        return MoTa;
    }

    public void setMoTa(String MoTa) {
        this.MoTa = MoTa;
    }

    public String getGiaTri() {
        return GiaTri;
    }

    public void setGiaTri(String GiaTri) {
        this.GiaTri = GiaTri;
    }

    public String getNgayDienRa() {
        return NgayDienRa;
    }

    public void setNgayDienRa(String NgayDienRa) {
        this.NgayDienRa = NgayDienRa;
    }

    public String getSoTaiKhoan() {
        return SoTaiKhoan;
    }

    public void setSoTaiKhoan(String SoTaiKhoan) {
        this.SoTaiKhoan = SoTaiKhoan;
    }

    public String getSoDu() {
        return SoDu;
    }

    public void setSoDu(String SoDu) {
        this.SoDu = SoDu;
    }
    
}
