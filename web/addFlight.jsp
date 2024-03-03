<%-- 
    Document   : addJet
    Created on : Mar 2, 2024, 10:33:44 PM
    Author     : Trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="flightList" class="dao.FlightDAO" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Jet Page</title>
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
        <h1>Enter the flight details</h1>
        <h3>${msg}</h3>
        <h3>${err}</h3>

        <form action="add-flight" method="get">
            <div class="form-group">
                <label for="exampleInputEmail1">Flight ID</label>
                <input type="text" class="form-control" name="flightID" aria-describedby="emailHelp" placeholder="Ex:VN101">
            </div>
            <div class="row">
                <div class="col">
                    <label for="fromCity">From City</label>
                    <select id="inputState" class="form-control" name="fromCity">
                        <c:forEach var="f" items="${flightList.getAll()}">
                            <option>${f.fromCity}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col">
                    <label for="fromCity">To City</label>
                    <select id="inputState" class="form-control" name="toCity">
                        <c:forEach var="f" items="${flightList.getAll()}">
                            <option>${f.toCity}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="exampleInputEmail1">Departure Date:</label>
                    <input type="date" class="form-control" name="departureDate">
                </div>
                <div class="col">
                    <label for="exampleInputEmail1">Arrival Date:</label>
                    <input type="date" class="form-control" name="arrivalDate">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="exampleInputEmail1">Departure Time:</label>
                    <input type="time" class="form-control" name="departureTime">
                </div>
                <div class="col">
                    <label for="exampleInputEmail1">Arrival Time:</label>
                    <input type="time" class="form-control" name="arrivalTime">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="exampleInputEmail1">Seat Economy:</label>
                    <input type="number" class="form-control" name="seatEconomy">
                </div>
                <div class="col">
                    <label for="exampleInputEmail1">Seat Business</label>
                    <input type="number" class="form-control" name="seatBusiness">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="exampleInputEmail1">Price Economy:</label>
                    <input type="text" class="form-control" name="priceEconomy">
                </div>
                <div class="col">
                    <label for="exampleInputEmail1">Price Business</label>
                    <input type="text" class="form-control" name="priceBusiness">
                </div>
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Jet ID</label>
                <select id="inputState" class="form-control" name="jetID">
                    <c:forEach var="f" items="${flightList.getAll()}">
                        <option>${f.jetID}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary" >Submit</button>
        </form>

    </body>
</html>
