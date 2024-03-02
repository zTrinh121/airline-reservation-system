/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Trinh
 */
public class Jet {
    private String jetID;
    private String jetType;
    private int totalCapacity;

    public Jet() {
    }

    public Jet(String jetID, String jetType, int totalCapacity) {
        this.jetID = jetID;
        this.jetType = jetType;
        this.totalCapacity = totalCapacity;
    }

    public String getJetID() {
        return jetID;
    }

    public void setJetID(String jetID) {
        this.jetID = jetID;
    }

    public String getJetType() {
        return jetType;
    }

    public void setJetType(String jetType) {
        this.jetType = jetType;
    }

    public int getTotalCapacity() {
        return totalCapacity;
    }

    public void setTotalCapacity(int totalCapacity) {
        this.totalCapacity = totalCapacity;
    }

    @Override
    public String toString() {
        return "Jet{" + "jetID=" + jetID + ", jetType=" + jetType + ", totalCapacity=" + totalCapacity + '}';
    }
    
    
}
