/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.TicketDAO;
import model.Ticket;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TicketServlet", urlPatterns = {"/ticketController"})
public class TicketServlet extends HttpServlet {

    TicketDAO TicketDAO = new TicketDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Your existing code for processing requests
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception, maybe display an error message
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        if (command == null) {
            command = "list";
        }
        try {
            switch (command) {
                case "add":
                    addTicket(request, response);
                    break;
                case "list":
                    listTickets(request, response);
                    break;
                case "update":
                    updateTicket(request, response);
                    break;
                case "delete":
                    deleteTicket(request, response);
                    break;
                case "load":
                    loadTicket(request, response);
                    break;
                case "search":
                    searchTicket(request, response);
                    break;
                default:
                    System.err.println("Unexpected command: " + command);
                    response.sendRedirect("error.jsp");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception, maybe display an error message
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void addTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        String passengerName = request.getParameter("pNameRecord");
        String dateReservation_raw = request.getParameter("dateReservation");
        String flightID = request.getParameter("flightID");
        String journeyDate_raw = request.getParameter("journeyDate");
        String ticketClass = request.getParameter("ticketClass");
        String bookingStatus = request.getParameter("bookingStatus");
        String noPassengers_raw = request.getParameter("noPassengers");
        String payAmount = request.getParameter("payAmount");
        String accountID_raw = request.getParameter("accountID");
        if (passengerName == null || passengerName.isEmpty()
                || dateReservation_raw == null || dateReservation_raw.isEmpty()
                || flightID == null || flightID.isEmpty()
                || journeyDate_raw == null || journeyDate_raw.isEmpty()
                || ticketClass == null || ticketClass.isEmpty()
                || bookingStatus == null || bookingStatus.isEmpty()
                || noPassengers_raw == null || noPassengers_raw.isEmpty()
                || payAmount == null || payAmount.isEmpty()
                || accountID_raw == null || accountID_raw.isEmpty()) {
            request.setAttribute("err", "All fields are required.");
            request.getRequestDispatcher("addTicketAdmin.jsp").forward(request, response);
            return;
        }

        try {
            Date dateReservation = Date.valueOf(dateReservation_raw);
            Date journeyDate = Date.valueOf(journeyDate_raw);
            int noPassengers = Integer.parseInt(noPassengers_raw);
            int accountID = Integer.parseInt(accountID_raw);

            Ticket newTicket = new Ticket(passengerName, dateReservation, flightID, journeyDate, ticketClass, bookingStatus, noPassengers, payAmount, accountID);

            TicketDAO.addTicket(newTicket);
            listTickets(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("err", "Invalid date or number format.");
            request.getRequestDispatcher("addTicket.jsp").forward(request, response);
        }
    }

    private void deleteTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pNameRecord = request.getParameter("pNameRecord");
        try {
            TicketDAO.deleteTicket(pNameRecord);
            listTickets(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void loadTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pNameRecord = request.getParameter("pNameRecord");

        try {
            Ticket ticket = TicketDAO.getTicketByPNameRecord(pNameRecord);
            request.setAttribute("ticket", ticket);
            request.getRequestDispatcher("updateTicket.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        String pNameRecord = request.getParameter("pNameRecord");
        String newFlightID = request.getParameter("flightID");
        String newJourneyDate_raw = request.getParameter("journeyDate");
        String newTicketClass = request.getParameter("ticketClass");
        String newBookingStatus = request.getParameter("bookingStatus");
        String newNoPassengers_raw = request.getParameter("noPassengers");
        String newPayAmount = request.getParameter("payAmount");
        String newAccountID_raw = request.getParameter("accountID");
        String newDateReservation_raw = request.getParameter("dateReservation");

        Date newJourneyDate;
        Date newDateReservation;

        try {
            newJourneyDate = Date.valueOf(newJourneyDate_raw);
            newDateReservation = Date.valueOf(newDateReservation_raw);
            int newNoPassengers = Integer.parseInt(newNoPassengers_raw);
            int newAccountID = Integer.parseInt(newAccountID_raw);
            TicketDAO.updateTicket(pNameRecord, newFlightID, newJourneyDate, newTicketClass, newBookingStatus, newNoPassengers, newPayAmount, newAccountID, newDateReservation);
            listTickets(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("err", "Invalid Format");
        }
    }

    private void searchTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        String fromCity = request.getParameter("fromCity");
        String toCity = request.getParameter("toCity");
        String departureDate_raw = request.getParameter("departureDate");
        String numPassenger_raw = request.getParameter("numPassenger");
        String ticketType = request.getParameter("ticketType");
        int numPassenger;
        Date departureDate;

        try {
            HttpSession session = request.getSession();
            numPassenger = Integer.parseInt(numPassenger_raw);
            departureDate = Date.valueOf(departureDate_raw);
            List<Ticket> listSearch = TicketDAO.searchTicket(fromCity, toCity, departureDate, ticketType, numPassenger);
            session.setAttribute("searchList", listSearch);
            session.setAttribute("numPass", numPassenger);
            session.setAttribute("ticketType", ticketType);
            listTickets(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } catch (IllegalArgumentException e) {
            response.sendRedirect("error.jsp");
        }
    }

    private void listTickets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        ArrayList<Ticket> tickets = TicketDAO.getAllTickets();
        request.setAttribute("list", tickets);
        request.getRequestDispatcher("listTickets.jsp").forward(request, response);
    }
}
