<%-- 
    Document   : displayPassengerInfo
    Created on : Mar 12, 2024, 9:59:34 PM
    Author     : ThanhThuy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="flightList" class="dao.FlightDAO" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Passenger info </title>
        <link rel="icon" type="image/png" href="images/flight3.jpg"/>
    </head>

    <body>

        <div class="super_container">
            <jsp:include page="header.jsp"/>
            <div class="search">
                <div class="search_inner">
                    <div class="container fill_height">
                        <div class="row fill_height">
                            <div class="col fill_height">
                                <div class="search_panel active" style="margin-top: 10px; margin-bottom: 20px;">

                                    <form action="ticketController" method="get">
                                        <!-- Font Awesome -->
                                        <input type="hidden" value="checkout" name="command" />
                                        <div class="main" style="position: static;">
                                            <c:set var="count" value="1" />
                                            <h1 style="color: black;">INFORMATION OF PASSENGER</h1>

                                            <c:forEach var="passenger" items="${sessionScope.passengers}">
                                                <div class="containerPassenger">

                                                    <div class="heading">
                                                        <h1 style="color: black;">PASSENGER ${count}</h1>
                                                    </div>
                                                    <label for="name${count}">Passenger's Name</label>
                                                    <input type="text" id="name${count}" name="passengerName" placeholder="Name" value="${passenger.pName}" readonly="">
                                                    <br>
                                                    <label for="age${count}">Passenger's Age</label>
                                                    <input type="number" id="age${count}" name="passengerAge" placeholder="Age number" value="${passenger.age}" readonly="">
                                                    <br>
                                                    <label for="gender${count}">Passenger's Gender</label>
                                                    <input type="text" id="gender${count}" name="passengerGender" placeholder="Gender" value="${passenger.gender}" readonly="">
                                                    <br>
                                                    <c:set var="count" value="${count + 1}" />
                                                    <br>
                                                </div>

                                            </c:forEach>
                                        </div>
                                        <div class="btn">
                                            
                                            <button class="search_button button"  type="submit"id="submit">Confirm</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>		
                    </div>

                </div>

            </div>
            <jsp:include page="footer.jsp" />
        </div>

    </body>
</html>
