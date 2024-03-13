

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Passenger Info</title>
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
    </head>
    <body>
        <!-- Header -->
        <div class="super_container">
            <jsp:include page="header.jsp" />

            

            
            <c:set var="flightController" value="${requestScope.flight}" />
            <form action="flightController" method="get">
                <input type="hidden" value="update" name="command" />
                <div class="modal-body">					
                    <div class="form-group">
                        <label>Flight ID</label>
                        <input type="text" class="form-control" name="flightID" value="${flight.flightID}" readonly="">
                    </div>
                    <div class="form-group">
                        <label>From City</label>
                        <select id="fromCity" class="form-control" name="fromCity" style="height: 3.5rem;">
                            <c:forEach var="f" items="${flightList.getAll()}">
                                <option value="${f.fromCity}" ${f.fromCity eq flight.fromCity ? 'selected' : ''}>${f.fromCity}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>To city</label>
                        <select id="toCity" class="form-control" name="toCity" style="height: 3.5rem;">
                            <c:forEach var="f" items="${flightList.getAll()}">
                                <option value="${f.toCity}" ${f.toCity eq flight.toCity ? 'selected' : ''}>${f.toCity}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Departure Date</label>
                        <input type="date" class="form-control" name="departureDate" value="${flight.departureDate}">
                    </div>
                    <div class="form-group">
                        <label>Arrival Date</label>
                        <input type="date" class="form-control" name="arrivalDate" value="${flight.arrivalDate}">
                    </div>
                    <div class="form-group">
                        <label>departure Time</label>
                        <input type="time" class="form-control" name="departureTime" value="${flight.departureTime}">
                    </div>
                    <div class="form-group">
                        <label>Arrival Time</label>
                        <input type="time" class="form-control" name="arrivalTime" value="${flight.arrivalTime}">
                    </div>
                    <div class="form-group">
                        <label>Seat Economy</label>
                        <input type="number" class="form-control" name="seatEconomy" value="${flight.seatEconomy}">
                    </div>
                    <div class="form-group">
                        <label>Seat Business</label>
                        <input type="number" class="form-control" name="seatBusiness" value="${flight.seatBusiness}">
                    </div>
                    <div class="form-group">
                        <label>Price Economy</label>
                        <input type="text" class="form-control" name="priceEconomy" value="${flight.priceEconomy}">
                    </div>
                    <div class="form-group">
                        <label>Price Business</label>
                        <input type="text" class="form-control" name="priceBusiness" value="${flight.priceBusiness}">
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="flightController" class="btn btn-default" >Back to List</a>
                    <input type="submit" class="btn btn-info" value="Save" style="background-color: #52452b">
                </div>
            </form>
        </div>
    </body>
</html>


