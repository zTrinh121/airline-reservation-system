<%-- 
    Document   : addTicket
    Created on : Mar 9, 2024, 1:11:53 PM
    Author     : ThanhThuy
--%>

<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dao.TicketDAO"%>
<%@page import="model.Ticket"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Ticket Page</title>
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">

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
        <h1>Enter the ticket details</h1>
        <h5 style="color: red;">${err}</h5>
        <h5 style="color: green">${msg}</h5>

        <form action="ticketController" method="get">
            <input type="hidden" value="add" name="command" />

            <div class="form-group">
                <label for="passengerName">Passenger Name</label>
                <input type="text" class="form-control" name="passengerName" placeholder="Enter passenger name">
            </div>

            <div class="form-group">
                <label for="dateReservation">Date Reservation</label>
                <input type="date" class="form-control" name="dateReservation">
            </div>

            <div class="form-group">
                <label for="flightID">Flight ID</label>
                <input type="text" class="form-control" name="flightID" placeholder="Enter flight ID">
            </div>

            <div class="form-group">
                <label for="journeyDate">Journey Date</label>
                <input type="date" class="form-control" name="journeyDate">
            </div>

            <div class="form-group">
                <label for="ticketClass">Ticket Class</label>
                <input type="text" class="form-control" name="ticketClass" placeholder="Enter ticket class">
            </div>

            <div class="form-group">
                <label for="bookingStatus">Booking Status</label>
                <input type="text" class="form-control" name="bookingStatus" placeholder="Enter booking status">
            </div>

            <div class="form-group">
                <label for="noPassengers">Number of Passengers</label>
                <input type="number" class="form-control" name="noPassengers" placeholder="Enter number of passengers">
            </div>

            <div class="form-group">
                <label for="payID">Pay ID</label>
                <input type="text" class="form-control" name="payID" placeholder="Enter pay ID">
            </div>

            <div class="form-group">
                <label for="accountID">Account ID</label>
                <input type="number" class="form-control" name="accountID" placeholder="Enter account ID">
            </div>

            <button type="submit" class="btn btn-primary">Add new ticket</button>
        </form>

        <a href="ticketController" class="btn btn-primary" >Back to Ticket List</a>
    </body>
</html>
