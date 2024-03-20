

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="passengerList" class="dao.PassengerDAO" />


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

            <h4 style="color: red;">${err}</h4>
            <div>
                <div class="container">
                    <h1 class="text-center"style="color: #fff;font-size: 48px;font-weight: 800 ;color:#46185F" ><b>CUSTOMER LIST</b></h1> 
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

                                    <th>ID</th>
                                    <th>PNameRecord</th>
                                    <th>Full Name</th>
                                    <th>Age</th>
                                    <th>Gender</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="p" items="${passengerList.getAll()}">

                                    <tr>
                                        <td>${p.pID}</td>
                                        <td>${p.pNameRecord}</td>
                                        <td>${p.pName}</td>
                                        <td>${p.age}</td>
                                        <td>${p.gender}</td>

                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>

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

