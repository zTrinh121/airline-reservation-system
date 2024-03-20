/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Trinh
 */
import com.google.gson.Gson;
import static dao.TicketDAO.getAllTickets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TicketChart {

    public static String getJsonDataFromDatabase() {
        ArrayList<Ticket> tickets = getAllConfirmedTickets();
        Gson gson = new Gson();
        return gson.toJson(tickets);
    }

    public static ArrayList<Ticket> getAllConfirmedTickets() {
        ArrayList<Ticket> confirmedTickets = new ArrayList<>();
        ArrayList<Ticket> allTickets = new ArrayList<>();
        try {
            allTickets = getAllTickets(); // Assume you have this method
//            for (Ticket allTicket : allTickets) {
//                System.out.println(allTicket);
//            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TicketChart.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (Ticket ticket : allTickets) {
            if ("confirmed".equalsIgnoreCase(ticket.getBookingStatus())) {
                confirmedTickets.add(ticket);
            }
        }
        return confirmedTickets;
    }

    public static float getTotalPayAmountByReservationDay(Date d) {
        float totalPayAmount = 0;
        ArrayList<Ticket> confirmedTickets = getAllConfirmedTickets();
        SimpleDateFormat formatter = new SimpleDateFormat("MMM d, yyyy");

        for (Ticket ticket : confirmedTickets) {
            if (formatter.format(ticket.getDateReservation()).equals(formatter.format(d))) {
                totalPayAmount += ticket.getPayAmount();
            }
        }

        return totalPayAmount;
    }

    public static void main(String[] args) {
        ArrayList<Ticket> list = getAllConfirmedTickets();
        for (Ticket ticket : list) {
            float moeny = getTotalPayAmountByReservationDay((Date) ticket.getDateReservation());
            System.out.println(moeny);
        }
    }
}
