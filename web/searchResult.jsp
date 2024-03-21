

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="flightList" class="dao.FlightDAO" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Search result</title>
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
        <style>
            button{
                display: block;
                font-size: 13px;
                font-weight: 700;
                color: #fff;
                text-transform: uppercase;
                line-height: 53px;
                padding-left: 46px;
                padding-right: 46px;
                white-space: nowrap;
            }
        </style>
    </head>

    <body>

        <div class="super_container">
            <jsp:include page="header.jsp"/>
            <div class="search">
                <div class="search_inner">
                    <div class="container fill_height">
                        <div class="row fill_height">
                            <div class="col fill_height">
                                <c:if test="${ empty searchList}">
                                    <h3 class="text-center" style="color: black; margin-top: 50px;"> No available flights    </h3>
                                </c:if>
                                <a href="user.jsp" class="btn btn-default text-center" >Back to Home</a>
                                <!-- Offers -->

                                <div class="offers" style="padding-top: 10px; background: #fff;">

                                    <!-- Offers -->

                                    <div class="container">

                                        <div class="row">
                                            <div class="col-lg-1 temp_col"></div>

                                            <div class="col-lg-12">
                                                <!-- Offers Grid -->

                                                <div class="offers_grid">

                                                    <!-- Offers Item -->

                                                    <c:if test="${not empty searchList}">
                                                        <c:forEach var="f" items="${searchList}">
                                                            <!--<form action="flightController" method="get" class="offers_item rating_4">-->
                                                            <!--<input  type="hidden" value="result" name="command" />-->
                                                            <c:url value="flightController" var="bookLink">
                                                                <c:param name="command" value="result"></c:param>
                                                                <c:param name="flightID" value="${f.flightID}"></c:param>
                                                            </c:url>
                                                            <div class="row">
                                                                <div class="col-lg-1 temp_col"></div>
                                                                <div class="col-lg-3 col-1680-4">
                                                                    <div class="offers_image_container">
                                                                        <div class="offers_image_background" style="background-image:url(images/offer_1.jpg)"></div>

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-8">
                                                                    <div class="offers_content">
                                                                        <div class="offers_price">${f.flightID}<span>${f.fromCity}-${f.toCity}</span></div>

                                                                        <p class="offers_text">${f.departureDate} <br>
                                                                            ${f.departureTime}-${f.arrivalTime} <br>
                                                                            <c:if  test="${ticketType=='Economy'}">
                                                                            <th scope="col">Economy Price: ${f.priceEconomy}</th>
                                                                            </c:if>
                                                                            <c:if  test="${ticketType=='Business'}">
                                                                            <th scope="col">Business price: ${f.priceBusiness}</th>
                                                                            </c:if>
                                                                        </p>
                                                                        <a href="${bookLink}" >
                                                                            <button type="submit" class="button search_button">Book<span></span><span></span><span></span></button>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--</form>-->
                                                        </c:forEach>
                                                    </c:if>
                                                </div>
                                            </div>

                                        </div>
                                    </div>      
                                </div>




                            </div>
                        </div>		
                    </div>

                </div>

                <!-- CTA -->

                <jsp:include page="CTASlider.jsp" />

                <!-- Testimonials -->
                <jsp:include page="Testimonials_Map.jsp"/>

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
