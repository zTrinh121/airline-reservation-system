<%-- 
    Document   : searchTicket
    Created on : Mar 10, 2024, 1:41:09 PM
    Author     : ThanhThuy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Search Tickets</h1>
        <form action="ticketController" method="get">
            <input type="hidden" name="command" value="search" />

            <label for="pNameRecord">Passenger Name Record:</label>
            <input type="text" name="pNameRecord" placeholder="Enter Passenger Name Record">
            <br/>
            <label for="flightID">Flight ID:</label>
            <input type="text" name="flightID" placeholder="Enter Flight ID">
            <br/>

            <label for="ticketClass">Ticket Class:</label>
            <select name="ticketClass">
                <option value="">Any</option>
                <option value="Economy">Economy</option>
                <option value="Business">Business</option>
            </select>
            <br/>

            <label for="bookingStatus">Booking Status:</label>
            <select name="bookingStatus">
                <option value="">Any</option>
                <option value="Confirmed">Confirmed</option>
                <option value="Pending">Pending</option>
            </select>
            <br/>

            <label for="minNoPassengers">Minimum Number of Passengers:</label>
            <input type="number" name="minNoPassengers" placeholder="Min">
            <br/>

            <label for="maxNoPassengers">Maximum Number of Passengers:</label>
            <input type="number" name="maxNoPassengers" placeholder="Max">
            <br/>

            <label for="minJourneyDate">Minimum Journey Date:</label>
            <input type="date" name="minJourneyDate">
            <br/>

            <label for="maxJourneyDate">Maximum Journey Date:</label>
            <input type="date" name="maxJourneyDate">
            <br/>

            <button type="submit">Search</button>
            <br/>

        </form>
    <c:if test="${not empty tickets}">
        <h2>Search Results:</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Passenger Name Record</th>
                    <th>Date Reservation</th>
                    <th>Flight ID</th>
                    <th>Journey Date</th>
                    <th>Ticket Class</th>
                    <th>Booking Status</th>
                    <th>Number of Passengers</th>
                    <th>Pay Amount</th>
                    <th>Account ID</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="ticket" items="${tickets}">
                <tr>
                    <td>${ticket.pNameRecord}</td>
                    <td>${ticket.dateReservation}</td>
                    <td>${ticket.flightID}</td>
                    <td>${ticket.journeyDate}</td>
                    <td>${ticket.ticketClass}</td>
                    <td>${ticket.bookingStatus}</td>
                    <td>${ticket.noPassengers}</td>
                    <td>${ticket.payAmount}</td>
                    <td>${ticket.accountID}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>