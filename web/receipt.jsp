<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.FlightDAO" %>
<%@ page import="model.Flight" %>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Receipt Payment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <jsp:include page="header.jsp"/>
        <div style="text-align: center;">
            <h1 style="padding-top: 10px; color: #000; text-align: center;">Payment Done. Thanks for booking</h1>

            <form action="ticketController" method="get">
                <input type="hidden" name="command" value="ticketBooked" />
<!--                <div class="grid-container">
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

                </div>-->
                <!--                <table>
                                    <tr>
                                        <td>Merchant:</td>
                                        <td>Company ABC Ltd.</td>
                                    </tr>
                                    <tr>
                                        <td>Payer</td>
                                        <td>${payer.firstName} ${payer.lastName}</td>
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td>${transaction.amount.total}</td>
                                    </tr>
                
                                </table>-->
                <button type="submit" class="btn btn-search">Check ticket(s) booked</button>
            </form>

        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
