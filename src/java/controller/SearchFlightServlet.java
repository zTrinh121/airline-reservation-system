/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.FlightDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
public class SearchFlightServlet extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flightID = request.getParameter("flightID");
        String fromCity = request.getParameter("fromCity");
        String toCity = request.getParameter("toCity");
        String departureDate = request.getParameter("departureDate");
        String arrivalDate = request.getParameter("arrivalDate");

        FlightDAO flightDAO = new FlightDAO();
        ArrayList<Flight> flightList = flightDAO.searchFlight(fromCity, toCity, departureDate, arrivalDate);
        if (flightList.size() == 0) {
            request.setAttribute("error", "Sorry, cannot find an approriate flight");
            request.getRequestDispatcher("searchFlight.jsp").forward(request, response);
        }
        request.setAttribute("list", flightList);
        response.sendRedirect("listFlightSearchAdmin.jsp");

    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
