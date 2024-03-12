package dao;

import dbcontext.ConnectDB;
import model.PaymentDetails;
import model.Ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Flight;
import model.Passenger;

public class TicketDAO {

    // Private constructor to prevent instantiation
    public TicketDAO() {
    }

    // Add ticket
    public static void addTicket(Ticket newTicket) throws ClassNotFoundException {
        // Extract values from the newTicket object
        String pNameRecord = newTicket.getpNameRecord();
        Date dateReservation = newTicket.getDateReservation();
        String flightID = newTicket.getFlightID();
        Date journeyDate = newTicket.getJourneyDate();
        String ticketClass = newTicket.getTicketClass();
        String bookingStatus = newTicket.getBookingStatus();
        int noPassengers = newTicket.getNoPassengers();
        float payAmount = newTicket.getPayAmount();
        int accountID = newTicket.getAccountID();

        // Call the existing addTicket method with the extracted values
        addTicket(pNameRecord, dateReservation, flightID, journeyDate, ticketClass, bookingStatus, noPassengers, accountID, payAmount);
    }

    // Add ticket
    public static void addTicket(String pNameRecord, Date dateReservation, String flightID, Date journeyDate, String ticketClass, String bookingStatus, int noPassengers, int accountID, float payAmount) throws ClassNotFoundException {
        String sql = "INSERT INTO [dbo].[ticketDetails]\n"
                + "           ([pNameRecord]\n"
                + "           ,[dateReservation]\n"
                + "           ,[flightID]\n"
                + "           ,[journeyDate]\n"
                + "           ,[class]\n"
                + "           ,[bookingStatus]\n"
                + "           ,[noPassengers]\n"
                + "           ,[accountID]\n"
                + "           ,[payAmount]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = ConnectDB.getInstance().openConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, pNameRecord);
            st.setDate(2, new java.sql.Date(dateReservation.getTime()));
            st.setString(3, flightID);
            st.setDate(4, new java.sql.Date(journeyDate.getTime()));
            st.setString(5, ticketClass);
            st.setString(6, bookingStatus);
            st.setInt(7, noPassengers);
            st.setInt(8, accountID);
            st.setFloat(9, payAmount);
            st.executeUpdate();

            System.out.println("Add ticket " + pNameRecord + " success!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update ticket
    public static void updateTicket(String pNameRecord, String newFlightID, Date newJourneyDate, String newTicketClass, String newBookingStatus, int newNoPassengers, float newPayAmount, int newAccountID, Date newDateReservation) throws ClassNotFoundException {
        String sql = "UPDATE ticketDetails SET pNameRecord = ?, dateReservation = ?, flightID = ?, journeyDate = ?, class = ?, bookingStatus = ?, noPassengers = ?, accountID = ?, payAmount = ? WHERE pNameRecord = ?";

        try (Connection con = ConnectDB.getInstance().openConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, pNameRecord);
            st.setDate(2, new java.sql.Date(newDateReservation.getTime()));
            st.setString(3, newFlightID);
            st.setDate(4, new java.sql.Date(newJourneyDate.getTime()));
            st.setString(5, newTicketClass);
            st.setString(6, newBookingStatus);
            st.setInt(7, newNoPassengers);
            st.setInt(8, newAccountID);
            st.setFloat(9, newPayAmount);
            st.setString(10, pNameRecord);

            int rowsUpdated = st.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("Update successful!");
            } else {
                System.out.println("No ticket found with Name Record: " + pNameRecord);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete ticket
    public static void deleteTicket(String pNameRecord) throws ClassNotFoundException {
        String sql = "DELETE FROM ticketDetails WHERE pNameRecord = ?";

        try (Connection con = ConnectDB.getInstance().openConnection(); PreparedStatement st = con.prepareStatement(sql)) {
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

    // Close resources
    private static void closeResources(ResultSet rs, PreparedStatement statement, Connection connection) {
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

    // Find tickets by account
    public static List<Ticket> getTicketsByAccount(int accountID) throws ClassNotFoundException {
        List<Ticket> tickets = new ArrayList<>();
        String sql = "SELECT * FROM ticketDetails WHERE accountID = ?";

        try (Connection con = ConnectDB.getInstance().openConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, accountID);

            try (ResultSet resultSet = st.executeQuery()) {
                while (resultSet.next()) {
                    Ticket ticket = mapResultSetToTicket(resultSet);
                    tickets.add(ticket);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tickets;
    }

    // Order ticket
    public static boolean orderTicket(Ticket ticket, PaymentDetails paymentDetails) {
        Connection con = null;

        try {
            con = ConnectDB.getInstance().openConnection();
            con.setAutoCommit(false);
            addTicket(ticket);
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

    // Save payment details to database
    private static void savePaymentDetailsToDatabase(Connection connection, PaymentDetails paymentDetails) throws SQLException {
        // Implement this method based on your requirements
    }

    private static Ticket mapResultSetToTicket(ResultSet resultSet) throws SQLException {
        String pNameRecord = resultSet.getString("pNameRecord");
        Date dateReservation = resultSet.getDate("dateReservation");
        String flightID = resultSet.getString("flightID");
        Date journeyDate = resultSet.getDate("journeyDate");
        String ticketClass = resultSet.getString("class");
        String bookingStatus = resultSet.getString("bookingStatus");
        int noPassengers = resultSet.getInt("noPassengers");
        Float payAmount = resultSet.getFloat("payAmount");
        int accountID = resultSet.getInt("accountID");

        return new Ticket(pNameRecord, dateReservation, flightID, journeyDate, ticketClass, bookingStatus, noPassengers, accountID, payAmount);
    }

    public static ArrayList<Ticket> getAllTickets() throws ClassNotFoundException {
        ArrayList<Ticket> tickets = new ArrayList<>();
        String sql = "SELECT * FROM ticketDetails";

        try (Connection con = ConnectDB.getInstance().openConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            try (ResultSet resultSet = st.executeQuery()) {
                while (resultSet.next()) {
                    Ticket ticket = mapResultSetToTicket(resultSet);
                    tickets.add(ticket);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tickets;
    }

    // Get ticket by pNameRecord
    public static Ticket getTicketByPNameRecord(String pNameRecord) throws ClassNotFoundException {
        String sql = "SELECT * FROM ticketDetails WHERE pNameRecord = ?";

        try (Connection con = ConnectDB.getInstance().openConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, pNameRecord);

            try (ResultSet resultSet = st.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToTicket(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static ArrayList<Ticket> searchTicket(String pNameRecord, Date dateReservation, String flightID, Date journeyDate,
            String ticketClass, String bookingStatus, int noPassengers, int accountID, float payAmount) {
        ArrayList<Ticket> ticketList = new ArrayList<>();

        String sql = "SELECT * FROM ticketDetails WHERE "
                + "(pNameRecord LIKE ? OR ? IS NULL) AND "
                + "(dateReservation = ? OR ? IS NULL) AND "
                + "(flightID LIKE ? OR ? IS NULL) AND "
                + "(journeyDate = ? OR ? IS NULL) AND "
                + "(ticketClass LIKE ? OR ? IS NULL) AND "
                + "(bookingStatus LIKE ? OR ? IS NULL) AND "
                + "(noPassengers = ? OR ? IS NULL) AND "
                + "(accountID = ? OR ? IS NULL) AND "
                + "(payAmount = ? OR ? IS NULL)";

        try (Connection con = ConnectDB.getInstance().openConnection();
                PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, "%" + pNameRecord + "%");
            st.setObject(2, pNameRecord);
            st.setDate(3, (java.sql.Date) dateReservation);
            st.setObject(4, dateReservation);
            st.setString(5, "%" + flightID + "%");
            st.setObject(6, flightID);
            st.setDate(7, (java.sql.Date) journeyDate);
            st.setObject(8, journeyDate);
            st.setString(9, "%" + ticketClass + "%");
            st.setObject(10, ticketClass);
            st.setString(11, "%" + bookingStatus + "%");
            st.setObject(12, bookingStatus);
            st.setInt(13, noPassengers);
            st.setObject(14, noPassengers);
            st.setInt(15, accountID);
            st.setObject(16, accountID);
            st.setFloat(17, payAmount);
            st.setObject(18, payAmount);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Ticket ticket = new Ticket();
                    ticket.setpNameRecord(rs.getString("pNameRecord"));
                    ticket.setDateReservation(rs.getDate("dateReservation"));
                    ticket.setFlightID(rs.getString("flightID"));
                    ticket.setJourneyDate(rs.getDate("journeyDate"));
                    ticket.setTicketClass(rs.getString("ticketClass"));
                    ticket.setBookingStatus(rs.getString("bookingStatus"));
                    ticket.setNoPassengers(rs.getInt("noPassengers"));
                    ticket.setAccountID(rs.getInt("accountID"));
                    ticket.setPayAmount(rs.getFloat("payAmount"));
                    ticketList.add(ticket);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return ticketList;
    }
//
//    public static ArrayList<Ticket> searchTicket(String pNameRecord, Date dateReservation, String flightID, Date journeyDate,
//            String ticketClass, String bookingStatus, int noPassengers, int accountID, float payAmount) {
//        ArrayList<Ticket> ticketList = new ArrayList<>();
//
////        String sql = "SELECT * FROM ticketDetails WHERE pNameRecord = ? AND dateReservation = ? AND flightID = ? "
////                + "AND journeyDate = ? AND ticketClass = ? AND bookingStatus = ? AND noPassengers = ? "
////                + "AND accountID = ? AND payAmount = ?";
//        String sql = "SELECT * FROM ticketDetails WHERE "
//                + "(pNameRecord = ? OR ? IS NULL) AND "
//                + "(dateReservation = ? OR ? IS NULL) AND "
//                + "(flightID = ? OR ? IS NULL) AND "
//                + "(journeyDate = ? OR ? IS NULL) AND "
//                + "(ticketClass = ? OR ? IS NULL) AND "
//                + "(bookingStatus = ? OR ? IS NULL) AND "
//                + "(noPassengers = ? OR ? IS NULL) AND "
//                + "(accountID = ? OR ? IS NULL) AND "
//                + "(payAmount = ? OR ? IS NULL)";
//
//        try (Connection con = ConnectDB.getInstance().openConnection();
//                PreparedStatement st = con.prepareStatement(sql)) {
//
//            st.setString(1, pNameRecord);
//            st.setDate(2, (java.sql.Date) dateReservation);
//            st.setString(3, flightID);
//            st.setDate(4, (java.sql.Date) journeyDate);
//            st.setString(5, ticketClass);
//            st.setString(6, bookingStatus);
//            st.setInt(7, noPassengers);
//            st.setInt(8, accountID);
//            st.setFloat(9, payAmount);
//
//            try (ResultSet rs = st.executeQuery()) {
//                while (rs.next()) {
//                    Ticket ticket = new Ticket();
//                    ticket.setpNameRecord(rs.getString("pNameRecord"));
//                    ticket.setDateReservation(rs.getDate("dateReservation"));
//                    ticket.setFlightID(rs.getString("flightID"));
//                    ticket.setJourneyDate(rs.getDate("journeyDate"));
//                    ticket.setTicketClass(rs.getString("ticketClass"));
//                    ticket.setBookingStatus(rs.getString("bookingStatus"));
//                    ticket.setNoPassengers(rs.getInt("noPassengers"));
//                    ticket.setAccountID(rs.getInt("accountID"));
//                    ticket.setPayAmount(rs.getFloat("payAmount"));
//                    ticketList.add(ticket);
//                }
//            }
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//
//        return ticketList;
//    }

    public void addTicketAndPassenger(Ticket ticketDetails, Passenger passenger) throws ClassNotFoundException {
        ArrayList<Ticket> tickets = new ArrayList<>();
        String sqlTicket = "INSERT INTO ticketDetails (pNameRecord, dateReservation, flightID, journeyDate, "
                + "ticketClass, bookingStatus, noPassengers, accountID, payAmount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String sqlPassenger = "INSERT INTO passengers (pNameRecord, pName, age, gender) VALUES (?, ?, ?, ?)";
        try (Connection con = ConnectDB.getInstance().openConnection();
                PreparedStatement stTicket = con.prepareStatement(sqlTicket);
                PreparedStatement stPassenger = con.prepareStatement(sqlPassenger)) {

            // Disable auto-commit to manage transactions
            con.setAutoCommit(false);

            // Insert ticket details
            stTicket.setString(1, ticketDetails.getpNameRecord());
            stTicket.setDate(2, new java.sql.Date(ticketDetails.getDateReservation().getTime()));
            stTicket.setString(3, ticketDetails.getFlightID());
            stTicket.setDate(4, new java.sql.Date(ticketDetails.getJourneyDate().getTime()));
            stTicket.setString(5, ticketDetails.getTicketClass());
            stTicket.setString(6, ticketDetails.getBookingStatus());
            stTicket.setInt(7, ticketDetails.getNoPassengers());
            stTicket.setInt(8, ticketDetails.getAccountID());
            stTicket.setFloat(9, ticketDetails.getPayAmount());

            stTicket.executeUpdate();

            // Insert passenger details
            stPassenger.setString(1, passenger.getpNameRecord());
            stPassenger.setString(2, passenger.getpName());
            stPassenger.setInt(3, passenger.getAge());
            stPassenger.setString(4, passenger.getGender());

            stPassenger.executeUpdate();

            con.commit();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//
//    public static ArrayList<Ticket> searchTicket(String pNameRecord, Date dateReservation, String flightID, Date journeyDate,
//            String ticketClass, String bookingStatus, int noPassengers, int accountID, float payAmount) {
//        ArrayList<Ticket> ticketList = new ArrayList<>();
//
////        String sql = "SELECT * FROM ticketDetails WHERE pNameRecord = ? AND dateReservation = ? AND flightID = ? "
////                + "AND journeyDate = ? AND ticketClass = ? AND bookingStatus = ? AND noPassengers = ? "
////                + "AND accountID = ? AND payAmount = ?";
//        String sql = "SELECT * FROM ticketDetails WHERE "
//                + "(pNameRecord = ? OR ? IS NULL) AND "
//                + "(dateReservation = ? OR ? IS NULL) AND "
//                + "(flightID = ? OR ? IS NULL) AND "
//                + "(journeyDate = ? OR ? IS NULL) AND "
//                + "(ticketClass = ? OR ? IS NULL) AND "
//                + "(bookingStatus = ? OR ? IS NULL) AND "
//                + "(noPassengers = ? OR ? IS NULL) AND "
//                + "(accountID = ? OR ? IS NULL) AND "
//                + "(payAmount = ? OR ? IS NULL)";
//
//        try (Connection con = ConnectDB.getInstance().openConnection();
//                PreparedStatement st = con.prepareStatement(sql)) {
//
//            st.setString(1, pNameRecord);
//            st.setDate(2, (java.sql.Date) dateReservation);
//            st.setString(3, flightID);
//            st.setDate(4, (java.sql.Date) journeyDate);
//            st.setString(5, ticketClass);
//            st.setString(6, bookingStatus);
//            st.setInt(7, noPassengers);
//            st.setInt(8, accountID);
//            st.setFloat(9, payAmount);
//
//            try (ResultSet rs = st.executeQuery()) {
//                while (rs.next()) {
//                    Ticket ticket = new Ticket();
//                    ticket.setpNameRecord(rs.getString("pNameRecord"));
//                    ticket.setDateReservation(rs.getDate("dateReservation"));
//                    ticket.setFlightID(rs.getString("flightID"));
//                    ticket.setJourneyDate(rs.getDate("journeyDate"));
//                    ticket.setTicketClass(rs.getString("ticketClass"));
//                    ticket.setBookingStatus(rs.getString("bookingStatus"));
//                    ticket.setNoPassengers(rs.getInt("noPassengers"));
//                    ticket.setAccountID(rs.getInt("accountID"));
//                    ticket.setPayAmount(rs.getFloat("payAmount"));
//                    ticketList.add(ticket);
//                }
//            }
//        } catch (SQLException | ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//
//        return ticketList;
//    }
    public double calculatePricePerPersion(Flight flight, String ticketType) {
        double ticketPrice = 0.0;
        if ("Economy".equalsIgnoreCase(ticketType)) {
            ticketPrice = flight.getPriceEconomy();
        } else if ("Business".equalsIgnoreCase(ticketType)) {
            ticketPrice = flight.getPriceBusiness();
        }
        return ticketPrice;
    }

    public double calculateTotalTicketPrice(int numPassengers, Flight flight, String ticketType, double tax) {
        double totalPrice = 0.0;
        double ticketPrice = calculatePricePerPersion(flight, ticketType);
        totalPrice = numPassengers * ticketPrice;
        return totalPrice + totalPrice*tax;
    }

    public static void main(String[] args) throws ClassNotFoundException {
        // Test the getAllTickets method
        ArrayList<Ticket> a = getAllTickets();
        System.out.println(a);

    }

}
