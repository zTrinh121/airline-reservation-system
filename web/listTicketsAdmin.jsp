<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.FlightDAO" %>
<%@ page import="model.Flight" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>HomeFlight Ticket</title>
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

            <jsp:include page="headerAdmin.jsp"/>

            <div>
                <h4 style="color: red;">${error}</h4>
                <h4 style="color: green;">${msg}</h4>

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
                                    <div class="big" 
                                         style="left: 5%;
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
                    <div class="container_ticket">
                        <div class="ticket basic">
                            <p>${ticket.pNameRecord}</p>
                        </div>

                        <div class="ticket airline">
                            <div class="top">
                                <h1>Add Ticket Airline</h1>
                                <img src="images/icon_2.png" alt="travelt" style="margin: 10px" >
                            </div>

                            <div class="bottom" style=" display: flex;
                                 align-items: center;
                                 justify-content: space-around; padding-top: 20px">
                                <a href="addTicketAdmin.jsp" class="btn btn-primary">Add Ticket</a>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <p><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3835.530391474877!2d108.228167!3d15.985882!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421b40be596029%3A0x57f47da73f6041c0!2zVsOpIE3DoXkgQmF5IMSQw6AgTuG6tW5n!5e0!3m2!1svi!2sus!4v1709870332747!5m2!1svi!2sus" width="1200" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>



            <jsp:include page="footer.jsp" />

        </div>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/custom.js"></script>

    </body>

</html>
