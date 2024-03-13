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
import java.util.ArrayList;
import model.Flight;

/**
 *
 * @author Trinh
 */
public class FlightDAO {

    public FlightDAO() {
    }

    public ArrayList<Flight> getAll() {
        ArrayList<Flight> list = new ArrayList<>();
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String sql = "select * from Flight";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                Flight b = new Flight(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getDate(4),
                        rs.getDate(5), rs.getTime(6), rs.getTime(7),
                        rs.getInt(8), rs.getInt(9), rs.getDouble(10),
                        rs.getDouble(11));
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

    public void addFlight(Flight b) {
        String sql = "INSERT INTO [dbo].[Flight]\n"
                + "           ([flightID]\n"
                + "           ,[fromCity]\n"
                + "           ,[toCity]\n"
                + "           ,[departureDate]\n"
                + "           ,[arrivalDate]\n"
                + "           ,[departureTime]\n"
                + "           ,[arrivalTime]\n"
                + "           ,[seatEconomy]\n"
                + "           ,[seatBusiness]\n"
                + "           ,[priceEconomy]\n"
                + "           ,[priceBusiness])\n" // Closing parenthesis was missing here
                + "     VALUES (?,?,?,?,?,?,?,?,?,?,?)";

        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);

            statement.setString(1, b.getFlightID());
            statement.setString(2, b.getFromCity());
            statement.setString(3, b.getToCity());
            statement.setDate(4, new java.sql.Date(b.getDepartureDate().getTime()));
            statement.setDate(5, new java.sql.Date(b.getArrivalDate().getTime()));
            statement.setTime(6, new java.sql.Time(b.getDepartureTime().getTime()));
            statement.setTime(7, new java.sql.Time(b.getArrivalTime().getTime()));
            statement.setInt(8, b.getSeatEconomy());
            statement.setInt(9, b.getSeatBusiness());
            statement.setDouble(10, b.getPriceEconomy());
            statement.setDouble(11, b.getPriceBusiness());
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

    public Flight getFlightById(String id) {
        String sql = "Select * from Flight where flightID=?";
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, id);
            rs = statement.executeQuery();
            if (rs.next()) {
                Flight b = new Flight(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getDate(4),
                        rs.getDate(5), rs.getTime(6), rs.getTime(7),
                        rs.getInt(8), rs.getInt(9), rs.getDouble(10),
                        rs.getDouble(11));
                return b;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Flight> searchFlight(String fromCity, String toCity, String departureDate, String ticketType, int numPassenger) {
        ArrayList<Flight> list = new ArrayList<>();
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String sql = "Select * from Flight where 1=1";
        if (fromCity != null && !fromCity.equals("")) {
            sql += " and fromCity like '%" + fromCity + "%'";
        }
        if (toCity != null && !toCity.equals("")) {
            sql += " and toCity like '%" + toCity + "%'";
        }
        if (departureDate != null && !departureDate.equals("")) {
            sql += " and departureDate like '%" + departureDate + "%'";
        }
        if ((ticketType != null && !ticketType.equals("")) && ticketType.equalsIgnoreCase("Economy")) {
            sql += " and seatEconomy>=" + numPassenger;
        } else if ((ticketType != null && !ticketType.equals("")) && ticketType.equalsIgnoreCase("Business")) {
            sql += " and seatBusiness>=" + numPassenger;
        }
        System.out.println(sql);
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                Flight b = new Flight(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getDate(4),
                        rs.getDate(5), rs.getTime(6), rs.getTime(7),
                        rs.getInt(8), rs.getInt(9), rs.getDouble(10),
                        rs.getDouble(11));
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

//    public void update(Flight b) {
//        ConnectDB db = ConnectDB.getInstance();
//        Connection con = null;
//        PreparedStatement statement = null;
//        String sql = "UPDATE [dbo].[Flight]\n"
//                + "   SET [fromCity] = ?\n"
//                + "      ,[toCity] = ?\n"
//                + "      ,[departureDate] = ?\n"
//                + "      ,[arrivalDate] = ?\n"
//                + "      ,[departureTime] = ?\n"
//                + "      ,[arrivalTime] = ?\n"
//                + "      ,[seatEconomy] = ?\n"
//                + "      ,[seatBusiness] = ?\n"
//                + "      ,[priceEconomy] = ?\n"
//                + "      ,[priceBusiness] = ?\n"
//                + "      ,[jetID] = ?\n"
//                + " WHERE flightID=?";
//        try {
//            con = db.openConnection();
//            statement = con.prepareStatement(sql);
//            statement.setString(1, b.getFromCity());
//            statement.setString(2, b.getToCity());
//            statement.setDate(3, new java.sql.Date(b.getDepartureDate().getTime()));
//            statement.setDate(4, new java.sql.Date(b.getArrivalDate().getTime()));
//            statement.setTime(5, new java.sql.Time(b.getDepartureTime().getTime()));
//            statement.setTime(6, new java.sql.Time(b.getArrivalTime().getTime()));
//            statement.setInt(7, b.getSeatEconomy());
//            statement.setInt(8, b.getSeatBusiness());
//            statement.setDouble(9, b.getPriceEconomy());
//            statement.setDouble(10, b.getPriceBusiness());
//            statement.setString(11, b.getJetID());
//            statement.setString(12, b.getFlightID());
//
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        } catch (ClassNotFoundException e) {
//            System.out.println(e);
//        } finally {
//            try {
//                con.close();
//                statement.close();
//            } catch (SQLException e) {
//            }
//        }
//    }
    public void update(Flight b) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        String sql = "UPDATE [dbo].[Flight] SET [fromCity] = ?, [toCity] = ?, [departureDate] = ?, [arrivalDate] = ?, [departureTime] = ?, [arrivalTime] = ?, [seatEconomy] = ?, [seatBusiness] = ?, [priceEconomy] = ?, [priceBusiness] = ? WHERE flightID=?";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, b.getFromCity());
            statement.setString(2, b.getToCity());
            statement.setDate(3, new java.sql.Date(b.getDepartureDate().getTime()));
            statement.setDate(4, new java.sql.Date(b.getArrivalDate().getTime()));
            statement.setTime(5, new java.sql.Time(b.getDepartureTime().getTime()));
            statement.setTime(6, new java.sql.Time(b.getArrivalTime().getTime()));
            statement.setInt(7, b.getSeatEconomy());
            statement.setInt(8, b.getSeatBusiness());
            statement.setDouble(9, b.getPriceEconomy());
            statement.setDouble(10, b.getPriceBusiness());
            statement.setString(11, b.getFlightID());

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
        ArrayList<Flight> list = new FlightDAO().getAll();
//        for (Flight flight : list) {
//            System.out.println(flight);
//        }
        FlightDAO dao = new FlightDAO();
        System.out.println(dao.getFlightById("VN101").getFromCity());

    }
}
