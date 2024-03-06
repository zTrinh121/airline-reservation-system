<%-- 
    Document   : listFlightAdmin
    Created on : Mar 5, 2024, 9:34:47 AM
    Author     : Trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flight List Page</title>
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
        <h4 style="color: green">${msg}</h4>
      <a href="addFlight.jsp" class="btn btn-primary">Add Flight</a>
        <c:forEach var="f" items="${list}">
            <c:url value="flightController" var="loadLink">
                <c:param name="command" value="load"></c:param>
                <c:param name="flightID" value="${f.flightID}"></c:param>
            </c:url>
            <c:url value="flightController" var="deleteLink">
                <c:param name="command" value="delete"></c:param>
                <c:param name="flightID" value="${f.flightID}"></c:param>
            </c:url>
            <div class="card">
                <div class="card-header">
                    ${f.flightID}
                </div>
                <div class="card-body">
                    <p class="card-text">From ${f.fromCity} - To ${f.toCity}</h5>
                    <p class="card-text">${f.departureDate} - ${f.arrivalDate}</p>
                    <p class="card-text">${f.departureTime} - ${f.arrivalTime}</p>
                    <a href="${deleteLink}"  onclick="if(!(confirm('Sure?'))) return false" class="btn btn-primary">Delete</a>

                    <a href="${loadLink}" class="btn btn-primary">Update</a>

                </div>
            </div>
        </c:forEach>

    </body>
</html>
