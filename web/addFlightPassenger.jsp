<%-- 
    Document   : addFlightPassenger
    Created on : Mar 7, 2024, 7:55:19 AM
    Author     : Trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <h1>Add passenger information</h1>
        <c:set var="numPass" value="${sessionScope.numPass}"></c:set>
            <form action="TicketServlet" method="addPassenger">
            <c:forEach var="count" begin="1" end="${numPass}">
                <p><strong>PASSENGER ${count}</strong></p>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationTooltip03">Passenger's Name</label>
                        <input type="text" class="form-control" id="validationTooltip03" name="passengerName" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationTooltip04">Passenger's Age</label>
                        <input type="number" class="form-control" id="validationTooltip04" name="passengerAge" required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationTooltip05">Passenger's Gender</label>
                        <select name="passengerGender">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>

                        </select>

                    </div>
                </div>
                <br><hr>
            </c:forEach>

            <button  type="submit" class="btn btn-primary">Submit Ticket Details</button>
        </form>

    </body>
</html>
