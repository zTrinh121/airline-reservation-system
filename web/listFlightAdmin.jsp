<%-- 
    Document   : listFlight
    Created on : Mar 3, 2024, 9:13:45 PM
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
        
        <script type="text/javascript">
            function doDelete(flightID){
                if(confirm("Are you sure to delete "+ flightID )){
                    window.location="delete-flight?flightID="+flightID+"?";
                }
            }
        </script>
    </head>
    <body>
        <c:forEach var="f" items="${list}">
            <div class="card">
                <div class="card-header">
                    ${f.flightID}
                </div>
                <div class="card-body">
                    <p class="card-text">From ${f.fromCity} - To ${f.toCity}</h5>
                    <p class="card-text">${f.departureDate} - ${f.arrivalDate}</p>
                    <p class="card-text">${f.departureTime} - ${f.arrivalTime}</p>
                    <a href="#" onclick="doDelete('${f.flightID}')" class="btn btn-primary">Delete</a>
                    <a href="update-flight?flightID=${f.flightID}" class="btn btn-primary">Update</a>

                </div>
            </div>
        </c:forEach>

    </body>
</html>
