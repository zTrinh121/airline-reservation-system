/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.Date;

/**
 *
 * @author ThanhThuy
 */

public class PaymentDetails {
    private String payID;
    private String pNameRecord;
    private Date payDate;
    private double payAmount;
    private String payMode;

    // Constructors, getters, and setters

    public PaymentDetails() {
    }

    public PaymentDetails(String payID, String pNameRecord, Date payDate, double payAmount, String payMode) {
        this.payID = payID;
        this.pNameRecord = pNameRecord;
        this.payDate = payDate;
        this.payAmount = payAmount;
        this.payMode = payMode;
    }

    public String getPayID() {
        return payID;
    }

    public void setPayID(String payID) {
        this.payID = payID;
    }

    public String getPNameRecord() {
        return pNameRecord;
    }

    public void setPNameRecord(String pNameRecord) {
        this.pNameRecord = pNameRecord;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public double getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(double payAmount) {
        this.payAmount = payAmount;
    }

    public String getPayMode() {
        return payMode;
    }

    public void setPayMode(String payMode) {
        this.payMode = payMode;
    }
}
