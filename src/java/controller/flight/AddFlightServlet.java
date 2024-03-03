/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.flight;

import dao.FlightDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Flight;

/**
 *
 * @author Trinh
 */
public class AddFlightServlet extends HttpServlet {

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

        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
        Date departureDate, arrivalDate;
        Time departureTime, arrivalTime;
        int seatEconomy, seatBusiness;
        double priceEconomy, priceBusiness;

        try {
            seatEconomy = Integer.parseInt(seatEconomy_raw);
            seatBusiness = Integer.parseInt(seatBusiness_raw);

            departureDate = Date.valueOf(departureDate_raw);
            arrivalDate = Date.valueOf(arrivalDate_raw);

            String departureDecodedTime = URLDecoder.decode(departureTime_raw, "UTF-8");
            System.out.println(departureDecodedTime);
            String arrivalDecodedTime = URLDecoder.decode(arrivalTime_raw, "UTF-8");
            System.out.println(departureDecodedTime);

            departureTime = Time.valueOf(departureDecodedTime);

            arrivalTime = Time.valueOf(arrivalTime_raw);

            priceEconomy = Double.parseDouble(priceEconomy_raw);
            priceBusiness = Double.parseDouble(priceBusiness_raw);

            FlightDAO flightDAO = new FlightDAO();
            flightDAO.addFlight(new Flight(flightID, fromCity, toCity, departureDate, arrivalDate, departureTime, arrivalTime, seatEconomy, seatBusiness, priceEconomy, priceBusiness, jetID));

        } catch (NumberFormatException e) {
            request.setAttribute("err", "Invalid Format");
        }
        request.setAttribute("msg", "Add flight successfully!!!");
        request.getRequestDispatcher("add-flight").forward(request, response);

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

}
