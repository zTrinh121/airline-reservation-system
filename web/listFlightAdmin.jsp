

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
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="decorate/profile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-..." crossorigin="anonymous">

    </head>

    <body>

        <div class="super_container">

            <jsp:include page="headerAdmin.jsp"/>

            <h4 style="color: green; margin-left: 30px; margin-top: 30px;">${msg}</h4>
            <div class="container">
                <h1 class="text-center"style="color: #fff;font-size: 48px;font-weight: 800;color: #46185F" ><b>FLIGHT LIST</b></h1> 
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">

                            <div class="col-sm-6">

                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>City</th>
                                <th>Day</th>
                                <th>Time</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="f" items="${list}">
                                <tr>
                                    <c:url value="flightController" var="loadLink">
                                        <c:param name="command" value="load"></c:param>
                                        <c:param name="flightID" value="${f.flightID}"></c:param>
                                    </c:url>
                                    <c:url value="flightController" var="deleteLink">
                                        <c:param name="command" value="delete"></c:param>
                                        <c:param name="flightID" value="${f.flightID}"></c:param>
                                    </c:url>
                                    <td>${f.flightID}</td>
                                    <td>From ${f.fromCity} - To ${f.toCity}</td>
                                    <td>${f.departureDate} - ${f.arrivalDate}</td>
                                    <td>${f.departureTime} - ${f.arrivalTime}</td>
                                    <td>
                                        <a href="${loadLink}" class="btn btn-primary"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="${deleteLink}"  onclick="if (!(confirm('Sure?')))
                                                        return false" class="btn btn-primary"><i class="material-icons" data-toggle="tooltip" title="Delete" data-flightid="${f.flightID}">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>

                </div>
            </div>

            <a href="addFlight.jsp" class="btn btn-success" style="background-color: #7e57c2;"><i class="material-icons">&#xE147;</i> <span>Add New Flight</span></a> <!-- Điều chỉnh màu sắc cho nút -->

        </div>
        <!-- Footer -->

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

