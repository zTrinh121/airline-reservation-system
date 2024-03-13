<%-- 
    Document   : ticketBooked
    Created on : Mar 13, 2024, 10:33:35 AM
    Author     : ThanhThuy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Your Booked Tickets</h2>

        <table>
            <thead>
                <tr>
                    <th>Name Record</th>
                    <th>Flight ID</th>
                    <th>Journey Date</th>
                    <th>Ticket Class</th>
                    <th>Booking Status</th>
                    <th>No. of Passengers</th>
                    <th>Pay Amount</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="ticket" items="${bookedTickets}">
                <tr>
                    <td>${ticket.pNameRecord}</td>
                    <td>${ticket.flightID}</td>
                    <td>${ticket.journeyDate}</td>
                    <td>${ticket.ticketClass}</td>
                    <td>${ticket.bookingStatus}</td>
                    <td>${ticket.noPassengers}</td>
                    <td>${ticket.payAmount}</td>
                    <td>
                        <button type="submit">Cancel</button>
                        <button type="submit">Refund</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>


</body>
</html>
