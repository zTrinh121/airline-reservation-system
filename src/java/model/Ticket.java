/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.util.Date;

/**
 *
 * @author ThanhThuy
 */

public class Ticket {
    private String pNameRecord;
    private Date dateReservation;
    private String flightID;
    private Date journeyDate;
    private String ticketClass;
    private String bookingStatus;
    private int noPassengers;
    private String payID;
    private int accountID;
    public Ticket() {
    }

    public Ticket(String pNameRecord, Date dateReservation, String flightID, Date journeyDate, String ticketClass,
                  String bookingStatus, int noPassengers, String payID, int accountID) {
        this.pNameRecord = pNameRecord;
        this.dateReservation = dateReservation;
        this.flightID = flightID;
        this.journeyDate = journeyDate;
        this.ticketClass = ticketClass;
        this.bookingStatus = bookingStatus;
        this.noPassengers = noPassengers;
        this.payID = payID;
        this.accountID = accountID;
    }

    public String getpNameRecord() {
        return pNameRecord;
    }

    public void setpNameRecord(String pNameRecord) {
        this.pNameRecord = pNameRecord;
    }

    public Date getDateReservation() {
        return dateReservation;
    }

    public void setDateReservation(Date dateReservation) {
        this.dateReservation = dateReservation;
    }

    public String getFlightID() {
        return flightID;
    }

    public void setFlightID(String flightID) {
        this.flightID = flightID;
    }

    public Date getJourneyDate() {
        return journeyDate;
    }

    public void setJourneyDate(Date journeyDate) {
        this.journeyDate = journeyDate;
    }

    public String getTicketClass() {
        return ticketClass;
    }

    public void setTicketClass(String ticketClass) {
        this.ticketClass = ticketClass;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public int getNoPassengers() {
        return noPassengers;
    }

    public void setNoPassengers(int noPassengers) {
        this.noPassengers = noPassengers;
    }

    public String getPayID() {
        return payID;
    }

    public void setPayID(String payID) {
        this.payID = payID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    @Override
    public String toString() {
        return "Ticket{" + "pNameRecord=" + pNameRecord + ", dateReservation=" + dateReservation + ", flightID=" + flightID + ", journeyDate=" + journeyDate + ", ticketClass=" + ticketClass + ", bookingStatus=" + bookingStatus + ", noPassengers=" + noPassengers + ", payID=" + payID + ", accountID=" + accountID + '}';
    }

}
