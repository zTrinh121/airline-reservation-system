/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbcontext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class AccountDao {

    public boolean checkAccountExist(String username, String password) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;

        PreparedStatement pre = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Account WHERE username = ? AND password = ?";
        try {
            connection = db.openConnection();
            if(connection==null){
                System.out.println("Null ngay day");
            }
            pre = connection.prepareStatement(sql);

            pre.setString(1, username);
            pre.setString(2, password);
            rs = pre.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return this.isAdmin(username, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {

        }
        return false;
    }

    public boolean isAdmin(String adminId, String password) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;

//        if (connection == null) {
//            return false;
//        }
        System.out.println(adminId + " " + password);

        String sql = "SELECT * FROM [Admin] WHERE adminId = ? AND password = ?";
        try {
            connection = db.openConnection();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, adminId);
            pre.setString(2, password);
            ResultSet resultSet = pre.executeQuery();
            return resultSet.next();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {

        }
        return false;
    }

    public boolean addUser(String fullname, String username, String password, String email, String phoneNumber, String address) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;
        PreparedStatement pre = null;

        try {
            connection = db.openConnection();
            String sql = "INSERT INTO Account (fullName, username, password, email, phoneNumber, address) VALUES (?, ?, ?, ?, ?, ?)";
            pre = connection.prepareStatement(sql);
            pre.setString(1, fullname);
            pre.setString(2, username);
            pre.setString(3, password);
            pre.setString(4, email);
            pre.setString(5, phoneNumber);
            pre.setString(6, address);

            int rowsAffected = pre.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pre != null) {
                    pre.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public int getAccountIdByUsername(String username) {
        ConnectDB db = ConnectDB.getInstance();
        Connection connection = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        int accountId = -1;
        try {
            connection = db.openConnection();
            String sql = "SELECT accountId FROM Account WHERE username =?";
            pre = connection.prepareStatement(sql);
            pre.setString(1, username);
            rs = pre.executeQuery();

            if (rs.next()) {
                accountId = rs.getInt("accountId");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pre != null) {
                    pre.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return accountId;
    }

    public String getUserRole(String username, String password) {
        if (isAdmin(username, password)) {
            return "admin";
        } else {
            return "user";
        }
    }
}
