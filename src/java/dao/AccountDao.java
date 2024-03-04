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
        Connection connection= null;
         
           PreparedStatement pre = null;
        ResultSet rs = null;
        
        
        

        String sql = "SELECT * FROM Account WHERE userName = ? AND password = ?";
        try {
            connection=db.openConnection();
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
        }catch(ClassNotFoundException e){
            
            
        }
        return false;
    }

    public boolean isAdmin(String adminId, String password) {
         ConnectDB db = ConnectDB.getInstance();
        Connection connection= null;
        
//        if (connection == null) {
//            return false;
//        }
        System.out.println(adminId + " " + password);

        String sql = "SELECT * FROM [Admin] WHERE adminId = ? AND password = ?";
        try {
             connection=db.openConnection();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, adminId);
            pre.setString(2, password);
            ResultSet resultSet = pre.executeQuery();
            return resultSet.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }catch(ClassNotFoundException e){
            
        }
        return false;
    }

}
