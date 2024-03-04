/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.FlightDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class UpdateFlightServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateFlightServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateFlightServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String flightID = request.getParameter("flightID");
        FlightDAO flightDAO = new FlightDAO();
        Flight f = flightDAO.getFlightById(flightID);
        request.setAttribute("flight", f);
        request.getRequestDispatcher("updateFlight.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
            Flight f = new Flight(flightID, fromCity, toCity, departureDate, arrivalDate, departureTime, arrivalTime, seatEconomy, seatBusiness, priceEconomy, priceBusiness, jetID);
            flightDAO.update(f);
        } catch (NumberFormatException e) {
            request.setAttribute("err", "Invalid Format");
        } catch (ParseException ex) {
            Logger.getLogger(AddFlightServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("msg", "Update flight successfully!!!");
        request.getRequestDispatcher("searchFlight.jsp").forward(request, response);

    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
