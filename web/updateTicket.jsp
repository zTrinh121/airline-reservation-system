<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Ticket Page</title>
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
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
        <h1>Update Ticket</h1>
        <form action="ticketController">
            <input type="hidden" value="update" name="command" />

            <div class="form-group">
                <label for="pNameRecord">Passenger Name Record</label>
                <input type="text" class="form-control" name="pNameRecord" value="${ticket.pNameRecord}" readonly>
            </div>

            <div class="form-group">
                <label for="dateReservation">Date Reservation</label>
                <input type="date" class="form-control" name="dateReservation" value="${ticket.dateReservation}">
            </div>

            <div class="form-group">
                <label for="flightID">Flight ID</label>
                <input type="text" class="form-control" name="flightID" value="${ticket.flightID}">
            </div>

            <div class="form-group">
                <label for="journeyDate">Journey Date</label>
                <input type="date" class="form-control" name="journeyDate" value="${ticket.journeyDate}">
            </div>

            <div class="form-group">
                <label for="ticketClass">Ticket Class</label>
                <select class="form-control" name="ticketClass">
                    <option value="Economy" ${ticket.ticketClass == 'Economy' ? 'selected' : '' }>Economy</option>
                    <option value="Business" ${ticket.ticketClass == 'Business' ? 'selected' : '' }>Business
                    </option>
                </select>
            </div>

            <div class="form-group">
                <label for="bookingStatus">Booking Status</label>
                <select class="form-control" name="bookingStatus">
                    <option value="Confirmed" ${ticket.bookingStatus == 'Confirmed' ? 'selected' : '' }>Confirmed
                    </option>
                    <option value="Pending" ${ticket.bookingStatus == 'Pending' ? 'selected' : '' }>Pending
                    </option>
                </select>
            </div>

            <div class="form-group">
                <label for="noPassengers">Number of Passengers</label>
                <input type="number" class="form-control" name="noPassengers" value="${ticket.noPassengers}">
            </div>

            <div class="form-group">
                <label for="payAmount">Pay Amount</label>
                <input type="text" class="form-control" name="payAmount" value="${ticket.payAmount}">
            </div>

            <div class="form-group">
                <label for="accountID">Account ID</label>
                <input type="text" class="form-control" name="accountID" value="${ticket.accountID}">
            </div>
            <button type="submit" class="btn btn-primary">Update Ticket</button>
        </form>

        <a href="ticketController" class="btn btn-secondary">Back to Ticket List</a>
    </body>

</html>
