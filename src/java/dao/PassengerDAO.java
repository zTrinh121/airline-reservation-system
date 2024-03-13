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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import model.Passenger;

/**
 *
 * @author Trinh
 */
public class PassengerDAO {

    public PassengerDAO() {
    }

    public ArrayList<Passenger> getAll() {
        ArrayList<Passenger> list = new ArrayList<>();
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String sql = "select * from [passengers]";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();

            while (rs.next()) {
                Passenger b = new Passenger(rs.getInt(1), rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4), rs.getString(5));
                list.add(b);
            }

            rs.close();
            con.close();
            statement.close();
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        } catch (SQLException e) {
            System.out.println(e);

        }
        return list;
    }

    public void addPassenger(Passenger b) {
        String sql = "INSERT INTO [dbo].[passengers]\n"
                + "           ([pID]\n"
                + "           ,[pNameRecord]\n"
                + "           ,[pName]\n"
                + "           ,[age]\n"
                + "           ,[gender])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";

        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);

            statement.setInt(1, b.getpID());
            statement.setString(2, b.getpNameRecord());
            statement.setString(3, b.getpName());
            statement.setInt(4, b.getAge());
            statement.setString(5, b.getGender());
            statement.execute();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
                statement.close();
            } catch (SQLException e) {
            }
        }
    }

    public void delete(String id) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String sql = "DELETE FROM [dbo].[Flight]\n"
                + "      WHERE flightID=?";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();
            if (rs != null) {
                rs.close();
            }
            con.close();
            statement.close();
        } catch (SQLException e) {
            System.out.println(e);
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }
    }

    public void update(Passenger b) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        String sql = "UPDATE [dbo].[passengers]\n"
                + "   SET [pName] = ?\n"
                + "      ,[age] = ?\n"
                + "      ,[gender] = ?\n"
                + " WHERE where [pID]=? and [pNameRecord]=?";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, b.getpName());
            statement.setInt(2, b.getAge());
            statement.setString(3, b.getGender());
            statement.setInt(4, b.getpID());
            statement.setString(5, b.getpNameRecord());

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Update successful");
            } else {
                System.out.println("Update failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        ArrayList<Passenger> list = new PassengerDAO().getAll();
        for (Passenger flight : list) {
            System.out.println(flight);
        }

    }
}
