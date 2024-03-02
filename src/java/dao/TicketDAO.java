/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbcontext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;
import model.PaymentDetails;
import model.Ticket;

/**
 *
 * @author ThanhThuy
 */
public class TicketDAO {

    Connection con = null;
//add ticket
    public void addTicket(String pNameRecord, Date dateReservation, String flightID, Date journeyDate, String ticketClass, String bookingStatus, int noPassengers, String payID, int accountID) throws ClassNotFoundException {
        String sql = "INSERT INTO ticketDetails (pNameRecord, dateReservation, flightID, journeyDate, class, bookingStatus, noPassengers, payID, accountID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = ConnectDB.getInstance().openConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, pNameRecord);
            st.setDate(2, (java.sql.Date) dateReservation);
            st.setString(3, flightID);
            st.setDate(4, (java.sql.Date) journeyDate);
            st.setString(5, ticketClass);
            st.setString(6, bookingStatus);
            st.setInt(7, noPassengers);
            st.setString(8, payID);
            st.setInt(9, accountID);

            st.executeUpdate();

            System.out.println("Vé đã được thêm mới thành công!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//update ticket
    public void updateTicket(String pNameRecord, String newFlightID, Date newJourneyDate, String newTicketClass, String newBookingStatus, int newNoPassengers, String newPayID, int newAccountID) throws ClassNotFoundException {
        String sql = "UPDATE ticketDetails SET flightID = ?, journeyDate = ?, class = ?, bookingStatus = ?, noPassengers = ?, payID = ?, accountID = ? WHERE pNameRecord = ?";

        try {
            con = ConnectDB.getInstance().openConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, newFlightID);
            st.setDate(2, (java.sql.Date) newJourneyDate);
            st.setString(3, newTicketClass);
            st.setString(4, newBookingStatus);
            st.setInt(5, newNoPassengers);
            st.setString(6, newPayID);
            st.setInt(7, newAccountID);
            st.setString(8, pNameRecord);

            int rowsUpdated = st.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("Update successful!");
            } else {
                System.out.println("No find ticket with Name Record is " + pNameRecord);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//delete

    public void deleteTicket(String pNameRecord) throws ClassNotFoundException {
        String sql = "DELETE FROM ticketDetails WHERE pNameRecord = ?";

        try {
            con = ConnectDB.getInstance().openConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, pNameRecord);
            int rowsDeleted = st.executeUpdate();

            if (rowsDeleted > 0) {
                System.out.println("Delete ticket successful!");
            } else {
                System.out.println("No find ticket with NameRecord is " + pNameRecord);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void closeResources(ResultSet rs, PreparedStatement statement, Connection connection) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//find ticket by account (xem trong account id đã mua bao nhiêu vé)
    public List<Ticket> getTicketsByAccount(int accountID) throws ClassNotFoundException {
        List<Ticket> tickets = new ArrayList<>();
        String sql = "SELECT * FROM ticketDetails WHERE accountID = ?";

        try {
            con = ConnectDB.getInstance().openConnection();
            PreparedStatement st = con.prepareStatement(sql);
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                statement.setInt(1, accountID);

                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Ticket ticket = mapResultSetToTicket(resultSet);
                        tickets.add(ticket);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tickets;
    }

    private Ticket mapResultSetToTicket(ResultSet resultSet) throws SQLException {

        String pNameRecord = resultSet.getString("pNameRecord");
        Date dateReservation = resultSet.getDate("dateReservation");
        String flightID = resultSet.getString("flightID");
        Date journeyDate = resultSet.getDate("journeyDate");
        String ticketClass = resultSet.getString("class");
        String bookingStatus = resultSet.getString("bookingStatus");
        int noPassengers = resultSet.getInt("noPassengers");
        String payID = resultSet.getString("payID");
        int accountID = resultSet.getInt("accountID");

        return new Ticket(pNameRecord, dateReservation, flightID, journeyDate, ticketClass, bookingStatus, noPassengers, payID, accountID);
    }

    public boolean orderTicket(Ticket ticket, PaymentDetails paymentDetails) {
        Connection con = null;

        try {
            con = ConnectDB.getInstance().openConnection();
            con.setAutoCommit(false);
            saveTicketToDatabase(con, ticket);
            savePaymentDetailsToDatabase(con, paymentDetails);
            con.commit();
            return true;
        } catch (Exception e) {
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException rollbackException) {
                    rollbackException.printStackTrace();
                }
            }
            e.printStackTrace();
            throw new RuntimeException("Payment ticket fail", e);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException closeException) {
                    closeException.printStackTrace();
                }
            }
        }
    }

    private void saveTicketToDatabase(Connection connection, Ticket ticket) throws SQLException {

    }

    private void savePaymentDetailsToDatabase(Connection connection, PaymentDetails paymentDetails) throws SQLException {
        
    }


}
