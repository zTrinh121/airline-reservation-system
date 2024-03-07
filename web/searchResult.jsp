<%-- 
    Document   : searchResult
    Created on : Mar 6, 2024, 8:55:25 AM
    Author     : Trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Search Flight Page</title>
    </head>
    <body>
        <h1>Available Flights</h1>
        <c:if test="${empty searchList}">
            <h3>Not available flights</h3>
        </c:if>
        <c:if test="${not empty searchList}">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Flight ID</th>
                        <th scope="col">From City</th>
                        <th scope="col">To City</th>
                        <th scope="col">Departure Date</th>
                        <th scope="col">Arrival Date</th>
                        <th scope="col">Departure Time</th>
                        <th scope="col">Arrival Time</th>
                            <c:if test="${ticketType=='Economy'}">
                            <th scope="col">Price (Economy)</th>
                            </c:if>
                            <c:if test="${ticketType=='Business'}">
                            <th scope="col">Price (Business)</th>
                            </c:if>
                            <th></th>
                                

                    </tr>
                </thead>
                <c:forEach var="f" items="${searchList}">
                    <form action="flightController" method="get">
                        <input  type="hidden" value="result" name="command" />
                        <tr>
                            <th>${f.flightID}</th>
                        <input type="hidden" name="flightID" value="${f.flightID}" />
                            <th>${f.fromCity}</th>
                            <th>${f.toCity}</th>
                            <th>${f.departureDate}</th>
                            <th>${f.arrivalDate}</th>
                            <th>${f.departureTime}</th>
                            <th>${f.arrivalTime}</th>
                                <c:if  test="${ticketType=='Economy'}">
                                <th scope="col">${f.priceEconomy}</th>
                                </c:if>
                                <c:if  test="${ticketType=='Business'}">
                                <th scope="col">${f.priceBusiness}</th>
                                </c:if>
                                <th><button type="submit" class="btn btn-primary" >Book</button></th>
                        </tr>


                    </form>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
