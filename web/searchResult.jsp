<%-- 
    Document   : searchFlight
    Created on : Mar 3, 2024, 8:55:16 PM
    Author     : Trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="flightList" class="dao.FlightDAO" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Flight</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Travelix Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/offers_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/offers_responsive.css">
    </head>
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

    <body>

        <div class="super_container">

            <!-- Header -->

            <header class="header">

                <!-- Top Bar -->

                <div class="top_bar">
                    <div class="container">
                        <div class="row">
                            <div class="col d-flex flex-row">
                                <div class="phone">+45 345 3324 56789</div>
                                <div class="social">
                                    <ul class="social_list">
                                        <li class="social_list_item"><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                        <li class="social_list_item"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li class="social_list_item"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                        <li class="social_list_item"><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                                        <li class="social_list_item"><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
                                        <li class="social_list_item"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                    </ul>
                                </div>
                                <div class="user_box ml-auto">
                                    <div class="user_box_login user_box_link"><a href="login.jsp">login</a></div>
                                    <div class="user_box_register user_box_link"><a href="register.jsp">register</a></div>
                                </div>
                            </div>
                        </div>
                    </div>		
                </div>

                <!-- Main Navigation -->

                <nav class="main_nav">
                    <div class="container">
                        <div class="row">
                            <div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
                                <div class="logo_container">
                                    <div class="logo"><a href="#"><img src="images/logo.png" alt="">travelix</a></div>
                                </div>
                                <div class="main_nav_container ml-auto">
                                    <ul class="main_nav_list">
                                        <li class="main_nav_item"><a href="home.jsp">home</a></li>

                                        <li class="main_nav_item"><a href="offers.jsp">offers</a></li>

                                        <li class="main_nav_item"><a href="contact.jsp">contact</a></li>
                                    </ul>
                                </div>




                            </div>
                        </div>
                    </div>	
                </nav>

            </header>
            <div class="menu trans_500">
                <div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
                    <div class="menu_close_container"><div class="menu_close"></div></div>
                    <div class="logo menu_logo"><a href="#"><img src="images/logo.png" alt=""></a></div>
                    <ul>
                        <li class="menu_item"><a href="#">home</a></li>
                        <li class="menu_item"><a href="about.html">about us</a></li>
                        <li class="menu_item"><a href="offers.html">offers</a></li>
                        <li class="menu_item"><a href="blog.html">news</a></li>
                        <li class="menu_item"><a href="contact.html">contact</a></li>
                    </ul>
                </div>
            </div>


            <!-- Home -->

            <div class="home">
                <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/about_background.jpg"></div>
                <div class="home_content">
                    <div class="home_title">Search Result</div>
                </div>
            </div>
            <c:if test="${ empty searchList}">
                <h3 class="text-center" style="color: black; margin-top: 50px;"> No available flights    </h3>
                </c:if>

            <!-- Offers -->

            <div class="offers" style="padding-top: 0 !important;">

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
                                        <form action="flightController" method="get" class="offers_item rating_4">
                                            <input  type="hidden" value="result" name="command" />

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
                                                        <button class="button book_button">Book<span></span><span></span><span></span></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>

                    </div>
                </div>		
            </div>
            <!-- Footer -->


            <jsp:include page="footer.jsp" />

        </div>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/offers_custom.js"></script>

    </body>

</html>