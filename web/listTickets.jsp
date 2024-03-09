<%-- 
    Document   : listTicket
    Created on : Mar 9, 2024, 1:23:35 PM
    Author     : ThanhThuy
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket List Page</title>
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
              rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <h4 style="color: green">${msg}</h4>
        <a href="addTicketAdmin.jsp" class="btn btn-primary">Add Ticket</a>
        <c:forEach var="ticket" items="${list}">
            <c:url value="ticketController" var="loadLink">
                <c:param name="command" value="load"></c:param>
                <c:param name="pNameRecord" value="${ticket.pNameRecord}"></c:param>
            </c:url>
            <c:url value="ticketController" var="deleteLink">
                <c:param name="command" value="delete"></c:param>
                <c:param name="pNameRecord" value="${ticket.pNameRecord}"></c:param>
            </c:url>
            <div class="card">
                <div class="card-header">
                    ${ticket.pNameRecord}
                </div>
                <div class="card-body">
                    <p class="card-text">Date Reservation: ${ticket.dateReservation}</p>
                    <p class="card-text">Flight ID: ${ticket.flightID}</p>
                    <p class="card-text">Journey Date: ${ticket.journeyDate}</p>
                    <p class="card-text">Ticket Class: ${ticket.ticketClass}</p>
                    <p class="card-text">Booking Status: ${ticket.bookingStatus}</p>
                    <p class="card-text">Number of Passengers: ${ticket.noPassengers}</p>
                    <p class="card-text">Pay ID: ${ticket.payID}</p>
                    <p class="card-text">Account ID: ${ticket.accountID}</p>
                    <p class="card-text">Additional Field 1: ${ticket.additionalField1}</p>
                    <p class="card-text">Additional Field 2: ${ticket.additionalField2}</p>
                    <a href="loadLink" class="btn btn-primary">Update</a>
                    <c:if test="${isAdmin}">
                        <a href="${deleteLink}" onclick="if (!(confirm('Sure?')))
                                    return false" class="btn btn-danger">Delete</a>
                    </c:if>
                </div>
            </div>
        </c:forEach>
    </body>

</html>
