<%-- 
    Document   : ticketBooked
    Created on : Mar 13, 2024, 10:33:35 AM
    Author     : ThanhThuy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.FlightDAO" %>
<%@ page import="model.Flight" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket Bboked</title>
        <link rel="icon" type="image/png" href="images/flight3.jpg"/>
    </head>
    <body>
        <div class="super_container">
            <jsp:include page="header.jsp"/>
            <c:if test="${not empty infor}">
                <h1 style="padding-top: 10px;">${infor}</h1>
            </c:if>
            <div class="grid-container">

                <c:forEach var="ticket" items="${list}">

                    <c:set var="flight" value="${flightDAO.getFlightById(ticket.flightID)}" />
                    <div class="container_ticket">

                        <div class="ticket basic">
                            <p>${ticket.pNameRecord}</p>
                        </div>
                        <div class="ticket airline">
                            <div class="top" 
                                 style="    height: max-content;
                                 padding-top: 50px;
                                 ">
                                <h1>Ticket Airline</h1>
                                <div class="big" style="left: 5%;
                                     position: relative;
                                     top: 15%;">
                                    <p class="from" style="position: relative"> ${flight.fromCity}</p>    
                                    <p class="to" style="font-size: 16px; left: 100px;"><i class="fas fa-arrow-right"></i> ${flight.toCity}</p>
                                    <img style="    position: relative;
                                         left: 10%;
                                         bottom: 15px;" src="images/icon_2.png" alt="travelt"  >
                                </div>
                            </div>

                            <div class="bottom">
                                <div class="column">
                                    <div class="row row-1">
                                        <p><span>Flight</span>${ticket.flightID}</p>
                                        <p class="row--right"><span>Ticket class</span>${ticket.ticketClass}</p>

                                        <p class="row--right"><span>Name Record</span>${ticket.pNameRecord}</p>


                                    </div>
                                    <div class="row row-2">
                                        <p class="row--center"><span>Date Reservation</span>${ticket.dateReservation}</p>
                                        <p class="row--right"><span>Journey Date</span>${ticket.journeyDate}</p>
                                    </div>
                                    <div class="row row-3">
                                        <p><span>Passenger ID</span>${ticket.accountID}</p>
                                        <p class="row--center"><span>Booking status</span>${ticket.bookingStatus}</p>
                                        <p class="row--right"><span>Pay Amount</span>${ticket.payAmount}</p>
                                    </div>
                                </div>
                                <div class="bar--code"></div>
                            </div>
                        </div>
                    </div>

                </c:forEach>

            </div>
            <jsp:include page="footer.jsp" />

        </div>

    </body>
</html>
