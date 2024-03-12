/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Trinh
 */
public class Passenger {
    private int pID;
    private String pNameRecord, pName;
    private int age;
    private String gender;

    public Passenger(int pID, String pNameRecord, String pName, int age, String gender) {
        this.pID = pID;
        this.pNameRecord = pNameRecord;
        this.pName = pName;
        this.age = age;
        this.gender = gender;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public String getpNameRecord() {
        return pNameRecord;
    }

    public void setpNameRecord(String pNameRecord) {
        this.pNameRecord = pNameRecord;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    
    
}
