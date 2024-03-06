/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.FlightDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Flight;

/**
 *
 * @author Trinh
 */
public class FlightServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddFlightServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddFlightServlet at " + request.getContextPath() + "</h1>");
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
                case "list":
                    listFlight(request, response);
                    break;
                case "add":
                    addFlight(request, response);
                    break;
                case "update":
                    updateFlight(request, response);
                    break;
                case "delete":
                    deleteFlight(request, response);
                    break;
                case "load":
                    loadFlight(request, response);
                    break;
                default:
                    throw new AssertionError();
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

    private void listFlight(HttpServletRequest request, HttpServletResponse response) throws Exception {
        FlightDAO flightDAO = new FlightDAO();
        ArrayList<Flight> list = flightDAO.getAll();
        request.setAttribute("list", list);
        for (Flight flight : list) {
            System.out.println(flight);
        }
        request.getRequestDispatcher("listFlightAdmin.jsp").forward(request, response);
    }

    private void addFlight(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String flightID = request.getParameter("flightID");
        String fromCity = request.getParameter("fromCity");
        String toCity = request.getParameter("toCity");
        String departureDate_raw = request.getParameter("departureDate");
        String arrivalDate_raw = request.getParameter("arrivalDate");
        String departureTime_raw = request.getParameter("departureTime");
        String arrivalTime_raw = request.getParameter("arrivalTime");
        String seatEconomy_raw = request.getParameter("seatEconomy");
        String seatBusiness_raw = request.getParameter("seatBusiness");
        String priceEconomy_raw = request.getParameter("priceEconomy");
        String priceBusiness_raw = request.getParameter("priceBusiness");
        String jetID = request.getParameter("jetID");

        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        Date departureDate, arrivalDate;
        Time departureTime, arrivalTime;
        int seatEconomy, seatBusiness;
        double priceEconomy, priceBusiness;

        try {
            seatEconomy = Integer.parseInt(seatEconomy_raw);
            seatBusiness = Integer.parseInt(seatBusiness_raw);

            departureDate = Date.valueOf(departureDate_raw);
            arrivalDate = Date.valueOf(arrivalDate_raw);

            departureTime = new Time(timeFormat.parse(request.getParameter("departureTime")).getTime());
            arrivalTime = new Time(timeFormat.parse(request.getParameter("arrivalTime")).getTime());

            priceEconomy = Double.parseDouble(priceEconomy_raw);
            priceBusiness = Double.parseDouble(priceBusiness_raw);

            FlightDAO flightDAO = new FlightDAO();
            flightDAO.addFlight(new Flight(flightID, fromCity, toCity, departureDate, arrivalDate, departureTime, arrivalTime, seatEconomy, seatBusiness, priceEconomy, priceBusiness, jetID));
            listFlight(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("err", "Invalid Format");
        } catch (ParseException ex) {
            Logger.getLogger(FlightServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void loadFlight(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String flightID = request.getParameter("flightID");
        FlightDAO flightDAO = new FlightDAO();
        Flight f = flightDAO.getFlightById(flightID);
        request.setAttribute("flight", f);
        System.out.println("VAo load");
        request.getRequestDispatcher("updateFlight.jsp").forward(request, response);
    }

    private void updateFlight(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String flightID = request.getParameter("flightID");
        String fromCity = request.getParameter("fromCity");
        String toCity = request.getParameter("toCity");
        String departureDate_raw = request.getParameter("departureDate");
        String arrivalDate_raw = request.getParameter("arrivalDate");
        String departureTime_raw = request.getParameter("departureTime");
        String arrivalTime_raw = request.getParameter("arrivalTime");
        String seatEconomy_raw = request.getParameter("seatEconomy");
        String seatBusiness_raw = request.getParameter("seatBusiness");
        String priceEconomy_raw = request.getParameter("priceEconomy");
        String priceBusiness_raw = request.getParameter("priceBusiness");
        String jetID = request.getParameter("jetID");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        Date departureDate, arrivalDate;
        Time departureTime, arrivalTime;
        int seatEconomy, seatBusiness;
        double priceEconomy, priceBusiness;
        try {

            seatEconomy = Integer.parseInt(seatEconomy_raw);
            seatBusiness = Integer.parseInt(seatBusiness_raw);

            departureDate = Date.valueOf(departureDate_raw);
            arrivalDate = Date.valueOf(arrivalDate_raw);

            departureTime = new Time(timeFormat.parse(request.getParameter("departureTime")).getTime());
            arrivalTime = new Time(timeFormat.parse(request.getParameter("arrivalTime")).getTime());
            System.out.println(arrivalTime);
            priceEconomy = Double.parseDouble(priceEconomy_raw);
            priceBusiness = Double.parseDouble(priceBusiness_raw);

            FlightDAO flightDAO = new FlightDAO();
            Flight f = new Flight(flightID, fromCity, toCity, departureDate, arrivalDate, departureTime, arrivalTime, seatEconomy, seatBusiness, priceEconomy, priceBusiness, jetID);
            System.out.println(f);
            flightDAO.update(f);
            listFlight(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("err", "Invalid Format");
        } catch (ParseException ex) {
        }
    }

    private void deleteFlight(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String flightID = request.getParameter("flightID");

        FlightDAO flightDAO = new FlightDAO();
        flightDAO.delete(flightID);
        listFlight(request, response);
    }
}
