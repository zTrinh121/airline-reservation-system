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
        <title>Travelix</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Travelix Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
        <link rel="stylesheet" type="text/css" href="styles/ticket.scss">
    </head>
    <body>
        <div class="super_container">
            <jsp:include page="header.jsp"/>
            <div class="grid-container">
                <c:forEach var="ticket" items="${list}">

                    <c:set var="flight" value="${flightDAO.getFlightById(ticket.flightID)}" />
                    <c:url value="ticketController" var="loadLink">
                        <c:param name="command" value="load"></c:param>
                        <c:param name="pNameRecord" value="${ticket.pNameRecord}"></c:param>
                    </c:url>
                    <c:url value="ticketController" var="deleteLink">
                        <c:param name="command" value="delete"></c:param>
                        <c:param name="pNameRecord" value="${ticket.pNameRecord}"></c:param>
                    </c:url>

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

                                <a href="${deleteLink}" onclick="return confirm('Are you sure to delete?')">
                                    <img src="images/trash-solid.svg" alt="delete" height="20px" style="left: 90%; position: absolute; top: 10px;">
                                </a>
                                <a href="${loadLink}" >
                                    <img src="images/pen-to-square-sharp-solid.svg" alt="load" height="20px" style="left: 76%; position: absolute; top: 10px;">
                                </a>

                            </div>

                            <div class="bottom">
                                <div class="column">
                                    <div class="row row-1">
                                        <p><span>Flight</span>${ticket.flightID}</p>
                                        <p class="row--right"><span>Ticket class</span>${ticket.ticketClass}</p>

                                        <p class="row--right"><span>NO passengers</span>${ticket.noPassengers}</p>

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
