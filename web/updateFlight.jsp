<%-- Document : updateFlight Created on : Mar 3, 2024, 8:43:30 PM Author : Trinh --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <jsp:useBean id="flightList" class="dao.FlightDAO" />
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Update Flight</title>
                <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
                <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
                <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
                <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
                <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
                <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
                <link rel="stylesheet" type="text/css" href="styles/responsive.css">
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
                <link rel="stylesheet"
                    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            </head>

            <body>
                <!-- Header -->
                <div class="super_container">
                    <jsp:include page="headerAdmin.jsp" />


                    <c:set var="flightController" value="${requestScope.flight}" />
                    <form action="flightController" method="get">
                        <input type="hidden" value="update" name="command" />
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Flight ID</label>
                                <input type="text" class="form-control" name="flightID" value="${flight.flightID}"
                                    readonly="">
                            </div>
                            <div class="form-group">
                                <label>From City</label>
                                <select id="fromCity" class="form-control" name="fromCity" style="height: 3.5rem;">
                                    <c:forEach var="f" items="${flightList.getUniqueCity()}">
                                        <option value="${f}" <c:if test="${f eq flight.fromCity}">selected</c:if>>${f}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>To city</label>
                                <select id="toCity" class="form-control" name="toCity" style="height: 3.5rem;">
                                    <c:forEach var="f" items="${flightList.getUniqueCity()}">
                                        <option value="${f}" ${f eq flight.toCity ? 'selected' : '' }>${f}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Departure Date</label>
                                <input type="date" class="form-control" name="departureDate"
                                    value="${flight.departureDate}">
                            </div>
                            <div class="form-group">
                                <label>Arrival Date</label>
                                <input type="date" class="form-control" name="arrivalDate"
                                    value="${flight.arrivalDate}">
                            </div>
                            <div class="form-group">
                                <label>departure Time</label>
                                <input type="time" class="form-control" name="departureTime"
                                    value="${flight.departureTime}">
                            </div>
                            <div class="form-group">
                                <label>Arrival Time</label>
                                <input type="time" class="form-control" name="arrivalTime"
                                    value="${flight.arrivalTime}">
                            </div>
                            <div class="form-group">
                                <label>Seat Economy</label>
                                <input type="number" class="form-control" name="seatEconomy"
                                    value="${flight.seatEconomy}">
                            </div>
                            <div class="form-group">
                                <label>Seat Business</label>
                                <input type="number" class="form-control" name="seatBusiness"
                                    value="${flight.seatBusiness}">
                            </div>
                            <div class="form-group">
                                <label>Price Economy</label>
                                <input type="text" class="form-control" name="priceEconomy"
                                    value="${flight.priceEconomy}">
                            </div>
                            <div class="form-group">
                                <label>Price Business</label>
                                <input type="text" class="form-control" name="priceBusiness"
                                    value="${flight.priceBusiness}">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="flightController" class="btn btn-default">Back to List</a>
                            <input type="submit" class="btn btn-info" value="Save" style="background-color: #52452b">
                        </div>
                    </form>
                </div>
            </body>

            </html>