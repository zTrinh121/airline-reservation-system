

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="flightList" class="dao.FlightDAO" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Add Passenger</title>
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

                                    <c:set var="numPass" value="${sessionScope.numPass}"/>
                                    <form action="ticketController" method="get">
                                        <input type="hidden" value="addPassenger" name="command" />
                                        <div class="main" style="position: static;">

                                            <c:forEach var="count" begin="1" end="${numPass}">
                                                <div class="containerPassenger">
                                                    <div class="heading">
                                                        <h1 style="color: black;">PASSENGER ${count}</h1>
                                                    </div>
                                                    <label for="name">Passenger's Name</label>
                                                    <input type="text" id="name" name="passengerName" placeholder="Name"required/>
                                                    <br>
                                                    <label for="card">Passenger's Age</label>
                                                    <input type="number" id="card" name="passengerAge" placeholder="Age number" required/>
                                                    <br>
                                                    <div class="security">
                                                        <label for="cvc">Passenger's Gender</label>
                                                        <select name="passengerGender"id="cvc">
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                        </select>
                                                        <br>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <div class="btn">
                                                <button class="search_button button"  type="submit"id="submit">Submit Passenger Info</button>
                                            </div>
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

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/custom.js"></script>

    </body>

</html>
