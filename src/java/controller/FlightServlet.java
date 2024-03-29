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
import javax.servlet.http.HttpSession;
import model.Flight;

/**
 *
 * @author Trinh
 */
public class FlightServlet extends HttpServlet {

    FlightDAO flightDAO = new FlightDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        System.out.println(request);
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
                case "search":
                    searchFlight(request, response);
                    break;
                case "result":
                    bookFlight(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ ở đây, ví dụ:
            e.printStackTrace(); // In stack trace để xem chi tiết lỗi trong log
            request.setAttribute("errorMessage", e.getMessage()); // Truyền thông điệp lỗi đến trang error.jsp hoặc trang khác
            request.getRequestDispatcher("error.jsp").forward(request, response); // Chuyển hướng đến trang error.jsp hoặc trang khác để hiển thị thông điệp lỗi
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
                case "search":
                    searchFlight(request, response);
                    break;
                case "result":
                    bookFlight(request, response);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ ở đây, ví dụ:
            e.printStackTrace(); // In stack trace để xem chi tiết lỗi trong log
            request.setAttribute("errorMessage", e.getMessage()); // Truyền thông điệp lỗi đến trang error.jsp hoặc trang khác
            request.getRequestDispatcher("error.jsp").forward(request, response); // Chuyển hướng đến trang error.jsp hoặc trang khác để hiển thị thông điệp lỗi
        }
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
        ArrayList<Flight> list = flightDAO.getAll();
        request.setAttribute("list", list);
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
            if (validate(flightID, fromCity, toCity, seatEconomy, seatBusiness, priceEconomy, priceBusiness) != "") {
                request.setAttribute("err", validate(flightID, fromCity, toCity, seatEconomy, seatBusiness, priceEconomy, priceBusiness));
                request.setAttribute("flightID", flightID);
                request.setAttribute("fromCity", fromCity);
                request.setAttribute("toCity", toCity);
                request.setAttribute("departureDate", departureDate_raw);
                request.setAttribute("arrivalDate", arrivalDate_raw);
                request.setAttribute("arrivalTime", arrivalTime_raw);
                request.setAttribute("departureTime", departureTime_raw);

                request.setAttribute("seatEconomy", seatEconomy_raw);
                request.setAttribute("seatBusiness", seatBusiness_raw);
                request.setAttribute("priceEconomy", priceEconomy_raw);
                request.setAttribute("priceBusiness", priceBusiness_raw);

                request.getRequestDispatcher("addFlight.jsp").forward(request, response);
            } else {
                Flight f = new Flight(flightID, fromCity, toCity, departureDate, arrivalDate, departureTime, arrivalTime, seatEconomy, seatBusiness, priceEconomy, priceBusiness);
                flightDAO.addFlight(f);
                System.out.println(f);
                listFlight(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("err", "Invalid Format");
        } catch (ParseException ex) {
            Logger.getLogger(FlightServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void loadFlight(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String flightID = request.getParameter("flightID");
        Flight f = flightDAO.getFlightById(flightID);
        HttpSession session = request.getSession();
        session.setAttribute("flight", f);
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

            Flight f = new Flight(flightID, fromCity, toCity, departureDate, arrivalDate, departureTime, arrivalTime, seatEconomy, seatBusiness, priceEconomy, priceBusiness);
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
        flightDAO.delete(flightID);
        request.setAttribute("msg", flightID + " has been deleted");
        listFlight(request, response);
    }

    private void searchFlight(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
            if (validateSearch(fromCity, toCity, numPassenger) != "") {
                request.setAttribute("fromCity", fromCity);
                request.setAttribute("toCity", toCity);
                request.setAttribute("numPassenger", numPassenger);
                request.setAttribute("departureDate", departureDate);
                request.setAttribute("ticketType", ticketType);
                request.setAttribute("err", validateSearch(fromCity, toCity, numPassenger));
                request.getRequestDispatcher("user.jsp").forward(request, response);

            }

            ArrayList<Flight> listSearch = flightDAO.searchFlight(fromCity, toCity, departureDate_raw, ticketType, numPassenger);
            for (Flight flight : listSearch) {
                System.out.println(flight);
            }
            session.setAttribute("searchList", listSearch);
            session.setAttribute("numPass", numPassenger);
            session.setAttribute("ticketType", ticketType);
            request.getRequestDispatcher("searchResult.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    private String validateSearch(String fromCity, String toCity, int numPass) {
        if (fromCity.equalsIgnoreCase(toCity)) {
            return "From and to city cannot be the same";
        }
        if (numPass <= 0) {
            return "Number of passengers must be greater than 0";
        }
        return "";
    }

    private void bookFlight(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String flightID = request.getParameter("flightID");
        System.out.println(flightID);
        System.out.println("flightID");

        HttpSession session = request.getSession();
        Flight f = flightDAO.getFlightById(flightID);
        session.setAttribute("flight", f);
        request.getRequestDispatcher("addFlightPassenger.jsp").forward(request, response);
    }

    private String validate(String flightID, String fromCity, String toCity, int seatEco, int seatBus, double priceEco, double priceBus) {
        Flight f = flightDAO.getFlightById(flightID);
        if (!flightID.matches("^VN\\d{3}$")) {
            return "FlightID must follow VN + 3digits";
        }
        if (fromCity.equalsIgnoreCase(toCity)) {
            return "From City and To City cannot be the same";
        }
        if (f != null) {
            return "Flight ID has been existed. Try again";
        }
        if (fromCity.isEmpty() || toCity.isEmpty()) {
            return "City cannot be empty";
        }
        if (seatEco <= 0) {
            return "Seat Economy must be a positive integer";
        }
        if (seatBus < 0) {
            return "Seat Business must be a positive integer";
        }
        if (priceEco < 0) {
            return "Price Economy must be a positive integer";
        }
        if (priceBus < 0) {
            return "Price Business must be a positive integer";
        }
        return "";
    }
}
