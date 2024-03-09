/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Ticket;

/**
 *
 * @author ThanhThuy
 */
@WebServlet(name = "TicketServlet", urlPatterns = {"/ticketController"})
public class TicketServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void addTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        String pNameRecord = request.getParameter("passengerName");
        String dateReservation_raw = request.getParameter("dateReservation");
        String flightID = request.getParameter("flightID");
        String journeyDate_raw = request.getParameter("journeyDate");
        String ticketClass = request.getParameter("ticketClass");
        String bookingStatus = request.getParameter("bookingStatus");
        String noPassengers_raw = request.getParameter("noPassengers");
        String payID = request.getParameter("payID");
        String accountID_raw = request.getParameter("accountID");

        // Basic form validation
        if (pNameRecord == null || pNameRecord.isEmpty()
                || dateReservation_raw == null || dateReservation_raw.isEmpty()
                || flightID == null || flightID.isEmpty()
                || journeyDate_raw == null || journeyDate_raw.isEmpty()
                || ticketClass == null || ticketClass.isEmpty()
                || bookingStatus == null || bookingStatus.isEmpty()
                || noPassengers_raw == null || noPassengers_raw.isEmpty()
                || payID == null || payID.isEmpty()
                || accountID_raw == null || accountID_raw.isEmpty()) {
            request.setAttribute("err", "All fields are required.");
            request.getRequestDispatcher("addTicketAdmin.jsp").forward(request, response);
            return;
        }

        try {
            // Parse date and numeric values
            Date dateReservation = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(dateReservation_raw);
            Date journeyDate = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(journeyDate_raw);
            int noPassengers = Integer.parseInt(noPassengers_raw);
            int accountID = Integer.parseInt(accountID_raw);

            // Create a new Ticket object
            Ticket newTicket = new Ticket(pNameRecord, dateReservation, flightID, journeyDate, ticketClass, bookingStatus, noPassengers, payID, accountID);

            // Add the ticket to the database
            TicketDAO.addTicket(newTicket);

            // Redirect to the list of tickets
            listTickets(request, response);
        } catch (ParseException | NumberFormatException e) {
            e.printStackTrace();
            // Handle the exception, maybe display an error message
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
            // Handle the exception, maybe display an error message
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
            // Handle the exception, maybe display an error message
        }
    }

    private void updateTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        String pNameRecord = request.getParameter("pNameRecord");
        String newFlightID = request.getParameter("newFlightID");
        String newJourneyDate_raw = request.getParameter("newJourneyDate");
        String newTicketClass = request.getParameter("newTicketClass");
        String newBookingStatus = request.getParameter("newBookingStatus");
        String newNoPassengers_raw = request.getParameter("newNoPassengers");
        String newPayID = request.getParameter("newPayID");
        String newAccountID_raw = request.getParameter("newAccountID");

        try {
            Date newJourneyDate = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(newJourneyDate_raw);
            int newNoPassengers = Integer.parseInt(newNoPassengers_raw);
            int newAccountID = Integer.parseInt(newAccountID_raw);

            TicketDAO.updateTicket(pNameRecord, newFlightID, newJourneyDate, newTicketClass, newBookingStatus, newNoPassengers, newPayID, newAccountID);

            listTickets(request, response);
        } catch (ParseException | NumberFormatException e) {
            e.printStackTrace();
            // Handle the exception, maybe display an error message
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
            // Handle the exception, maybe display an error message to the user
            response.sendRedirect("error.jsp");
        } catch (IllegalArgumentException e) {
        }
    }

    private void listTickets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException {
        ArrayList<Ticket> tickets = TicketDAO.getAllTickets();
        request.setAttribute("list", tickets);
        request.getRequestDispatcher("listTickets.jsp").forward(request, response);
    }
}
