/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Trinh
 */
public class Flight {
    private String flightID;
    private String fromCity, toCity;
    private Date departureDate, arrivalDate;
    private Time departureTime, arrivalTime;
    private int seatEconomy, seatBusiness;
    private double priceEconomy, priceBusiness;

    public Flight() {
    }

    public Flight(String flightID, String fromCity, String toCity, Date departureDate, Date arrivalDate, Time departureTime, Time arrivalTime, int seatEconomy, int seatBusiness, double priceEconomy, double priceBusiness) {
        this.flightID = flightID;
        this.fromCity = fromCity;
        this.toCity = toCity;
        this.departureDate = departureDate;
        this.arrivalDate = arrivalDate;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.seatEconomy = seatEconomy;
        this.seatBusiness = seatBusiness;
        this.priceEconomy = priceEconomy;
        this.priceBusiness = priceBusiness;
    }

    public String getFlightID() {
        return flightID;
    }

    public void setFlightID(String flightID) {
        this.flightID = flightID;
    }

    public String getFromCity() {
        return fromCity;
    }

    public void setFromCity(String fromCity) {
        this.fromCity = fromCity;
    }

    public String getToCity() {
        return toCity;
    }

    public void setToCity(String toCity) {
        this.toCity = toCity;
    }

    public Date getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(Date departureDate) {
        this.departureDate = departureDate;
    }

    public Date getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public Time getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Time departureTime) {
        this.departureTime = departureTime;
    }

    public Time getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Time arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getSeatEconomy() {
        return seatEconomy;
    }

    public void setSeatEconomy(int seatEconomy) {
        this.seatEconomy = seatEconomy;
    }

    public int getSeatBusiness() {
        return seatBusiness;
    }

    public void setSeatBusiness(int seatBusiness) {
        this.seatBusiness = seatBusiness;
    }

    public double getPriceEconomy() {
        return priceEconomy;
    }

    public void setPriceEconomy(double priceEconomy) {
        this.priceEconomy = priceEconomy;
    }

    public double getPriceBusiness() {
        return priceBusiness;
    }

    public void setPriceBusiness(double priceBusiness) {
        this.priceBusiness = priceBusiness;
    }



    @Override
    public String toString() {
        return "Flight{" + "flightID=" + flightID + ", fromCity=" + fromCity + ", toCity=" + toCity + ", departureDate=" + departureDate + ", arrivalDate=" + arrivalDate + ", departureTime=" + departureTime + ", arrivalTime=" + arrivalTime + ", seatEconomy=" + seatEconomy + ", seatBusiness=" + seatBusiness + ", priceEconomy=" + priceEconomy + ", priceBusiness=" + priceBusiness +'}';
    }
    
    
    
}
