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
        String payAmount = newTicket.getPayAmount(); // Update to 'payAmount'
        int accountID = newTicket.getAccountID();

        // Call the existing addTicket method with the extracted values
        addTicket(pNameRecord, dateReservation, flightID, journeyDate, ticketClass, bookingStatus, noPassengers, payAmount, accountID);
    }

    // Add ticket
    public static void addTicket(String pNameRecord, Date dateReservation, String flightID, Date journeyDate, String ticketClass, String bookingStatus, int noPassengers, String payAmount, int accountID) throws ClassNotFoundException {
        String sql = "INSERT INTO ticketDetails (pNameRecord, dateReservation, flightID, journeyDate, class, bookingStatus, noPassengers, payAmount, accountID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = ConnectDB.getInstance().openConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, pNameRecord);
            st.setDate(2, new java.sql.Date(dateReservation.getTime()));
            st.setString(3, flightID);
            st.setDate(4, new java.sql.Date(journeyDate.getTime()));
            st.setString(5, ticketClass);
            st.setString(6, bookingStatus);
            st.setInt(7, noPassengers);
            st.setString(8, payAmount);
            st.setInt(9, accountID);

            st.executeUpdate();

            System.out.println("Add ticket " + pNameRecord + " success!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update ticket
    public static void updateTicket(String pNameRecord, String newFlightID, Date newJourneyDate, String newTicketClass, String newBookingStatus, int newNoPassengers, String newPayAmount, int newAccountID, Date newDateReservation) throws ClassNotFoundException {
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
            st.setString(9, newPayAmount);
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

    // Save ticket to database
    private static void saveTicketToDatabase(Connection connection, Ticket ticket) throws SQLException {
        String sql = "INSERT INTO ticketDetails (pNameRecord, dateReservation, flightID, journeyDate, class, bookingStatus, noPassengers, payAmount, accountID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, ticket.getpNameRecord());
            st.setDate(2, new java.sql.Date(ticket.getDateReservation().getTime()));
            st.setString(3, ticket.getFlightID());
            st.setDate(4, new java.sql.Date(ticket.getJourneyDate().getTime()));
            st.setString(5, ticket.getTicketClass());
            st.setString(6, ticket.getBookingStatus());
            st.setInt(7, ticket.getNoPassengers());
            st.setString(8, ticket.getPayAmount());
            st.setInt(9, ticket.getAccountID());

            st.executeUpdate();
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
        String payAmount = resultSet.getString("payAmount");
        int accountID = resultSet.getInt("accountID");

        return new Ticket(pNameRecord, dateReservation, flightID, journeyDate, ticketClass, bookingStatus, noPassengers, payAmount, accountID);
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

    // Search tickets based on specified criteria
    public static List<Ticket> searchTicket(String fromCity, String toCity, Date departureDate, String ticketType, int numPassenger) throws ClassNotFoundException {
        List<Ticket> tickets = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM ticketDetails WHERE 1=1");

        // Add conditions based on provided parameters
        if (fromCity != null && !fromCity.isEmpty()) {
            sql.append(" AND fromCity = ?");
        }
        if (toCity != null && !toCity.isEmpty()) {
            sql.append(" AND toCity = ?");
        }
        if (departureDate != null) {
            sql.append(" AND departureDate = ?");
        }
        if (ticketType != null && !ticketType.isEmpty()) {
            sql.append(" AND ticketType = ?");
        }
        sql.append(" AND numPassenger = ?");

        try (Connection con = ConnectDB.getInstance().openConnection(); PreparedStatement st = con.prepareStatement(sql.toString())) {
            int parameterIndex = 1;

            // Set values for conditions
            if (fromCity != null && !fromCity.isEmpty()) {
                st.setString(parameterIndex++, fromCity);
            }
            if (toCity != null && !toCity.isEmpty()) {
                st.setString(parameterIndex++, toCity);
            }
            if (departureDate != null) {
                st.setDate(parameterIndex++, new java.sql.Date(departureDate.getTime()));
            }
            if (ticketType != null && !ticketType.isEmpty()) {
                st.setString(parameterIndex++, ticketType);
            }
            st.setInt(parameterIndex, numPassenger);

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

    public static void main(String[] args) throws ClassNotFoundException {
        // Test the getAllTickets method
        ArrayList<Ticket> a = getAllTickets();
        System.out.println(a);

    }
}
