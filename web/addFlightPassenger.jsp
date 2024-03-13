

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="flightList" class="dao.FlightDAO" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>HomeFlight</title>
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

        <div class="super_container">
            <jsp:include page="header.jsp"/>
            <div class="search">
                <div class="search_inner">
                    <div class="container fill_height">
                        <div class="row fill_height">
                            <div class="col fill_height">




                                <div class="search_panel active" style="margin-top: 10px; margin-bottom: 20px;">

                                    <c:set var="numPass" value="${sessionScope.numPass}"></c:set>
                                        <form action="ticketController" method="get">
                                        <c:forEach var="count" begin="1" end="${numPass}">
                                            <p><strong style="color: black;">PASSENGER ${count}</strong></p>
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
                                                    <select name="passengerGender" class="form-control">
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>

                                                    </select>

                                                </div>
                                            </div>
                                            <br><hr>
                                        </c:forEach>

                                        <button  type="submit" class="btn btn-search">Submit Passenger Info</button>
                                    </form>

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
