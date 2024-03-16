
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="flightList" class="dao.FlightDAO" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Flight</title>
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
                                    <div class="logo"><a href="admin.jsp"><img src="images/logo.png" alt="">HomeFlight</a></div>
                                </div>
                                <div class="main_nav_container ml-auto">
                                    <ul class="main_nav_list">
                                        <li class="main_nav_item"><a href="admin.jsp">home</a></li>
                                        <li class="main_nav_item"><a href="flightController">Flight</a></li>
                                        <li class="main_nav_item"><a href="customer.jsp">Customer</a></li>

                                        <li class="main_nav_item"><a href="ticket.jsp">Ticket</a></li>
                                    </ul>
                                </div>
                                <div class="user_box ml-auto" style="display: flex; align-items: center;">
                                    <% if (session != null && session.getAttribute("username") != null) {
                                            String username = (String) session.getAttribute("username");
                                    %>
                                    <p style="color: #fff; font-family: 'Open Sans', 'sans-serif'; font-size: 16px; margin-right: 10px;">Welcome, <%= username%> !</p>
                                    <a href="<%= request.getContextPath()%>/Login?action=logout" style=" color: #fff; text-decoration: none; margin-top: -16px; cursor: pointer;font-weight:bold ">Log out</a>


                                    <% }%>
                                </div>


                                <div class="hamburger">
                                    <i class="fa fa-bars trans_200"></i>
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

                <!-- Home Slider -->

                <div class="home_slider_container">

                    <div class="owl-carousel owl-theme home_slider">

                        <!-- Slider Item -->
                        <div class="owl-item home_slider_item">
                            <!-- Image by https://unsplash.com/@anikindimitry -->
                            <div class="home_slider_background" style="background-image:url(images/home_slider.jpg)"></div>

                            <div class="home_slider_content text-center">
                                <div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
                                    <h1>discover</h1>
                                    <h1>the world</h1>

                                </div>
                            </div>
                        </div>

                        <!-- Slider Item -->
                        <div class="owl-item home_slider_item">
                            <div class="home_slider_background" style="background-image:url(images/home_slider.jpg)"></div>

                            <div class="home_slider_content text-center">
                                <div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
                                    <h1>discover</h1>
                                    <h1>the world</h1>

                                </div>
                            </div>
                        </div>

                        <!-- Slider Item -->
                        <div class="owl-item home_slider_item">
                            <div class="home_slider_background" style="background-image:url(images/home_slider.jpg)"></div>

                            <div class="home_slider_content text-center">
                                <div class="home_slider_content_inner" data-animation-in="flipInX" data-animation-out="animate-out fadeOut">
                                    <h1>discover</h1>
                                    <h1>the world</h1>
                                    <div class="button home_slider_button"><div class="button_bcg"></div><a href="#">explore now<span></span><span></span><span></span></a></div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Home Slider Nav - Prev -->
                    <div class="home_slider_nav home_slider_prev">
                        <svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                        <defs>
                        <linearGradient id='home_grad_prev'>
                        <stop offset='0%' stop-color='#fa9e1b'/>
                        <stop offset='100%' stop-color='#8d4fff'/>
                        </linearGradient>
                        </defs>
                        <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
                              M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
                              C22.545,2,26,5.541,26,9.909V23.091z"/>
                        <polygon class="nav_arrow" fill="#F3F6F9" points="15.044,22.222 16.377,20.888 12.374,16.885 16.377,12.882 15.044,11.55 9.708,16.885 11.04,18.219 
                                 11.042,18.219 "/>
                        </svg>
                    </div>

                    <!-- Home Slider Nav - Next -->
                    <div class="home_slider_nav home_slider_next">
                        <svg version="1.1" id="Layer_3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                             width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                        <defs>
                        <linearGradient id='home_grad_next'>
                        <stop offset='0%' stop-color='#fa9e1b'/>
                        <stop offset='100%' stop-color='#8d4fff'/>
                        </linearGradient>
                        </defs>
                        <path class="nav_path" fill="#F3F6F9" d="M19,0H9C4.029,0,0,4.029,0,9v15c0,4.971,4.029,9,9,9h10c4.97,0,9-4.029,9-9V9C28,4.029,23.97,0,19,0z
                              M26,23.091C26,27.459,22.545,31,18.285,31H9.714C5.454,31,2,27.459,2,23.091V9.909C2,5.541,5.454,2,9.714,2h8.571
                              C22.545,2,26,5.541,26,9.909V23.091z"/>
                        <polygon class="nav_arrow" fill="#F3F6F9" points="13.044,11.551 11.71,12.885 15.714,16.888 11.71,20.891 13.044,22.224 18.379,16.888 17.048,15.554 
                                 17.046,15.554 "/>
                        </svg>
                    </div>

                    <!-- Home Slider Dots -->

                    <div class="home_slider_dots">
                        <ul id="home_slider_custom_dots" class="home_slider_custom_dots">
                            <li class="home_slider_custom_dot active"><div></div>01.</li>
                            <li class="home_slider_custom_dot"><div></div>02.</li>
                            <li class="home_slider_custom_dot"><div></div>03.</li>
                        </ul>
                    </div>

                </div>

            </div>
            <h4 style="color: red; margin-left: 10px;">${err}</h4>
            <form action="flightController" method="get">
                <input type="hidden" value="add" name="command" />
                <div class="modal-body">					
                    <div class="form-group">
                        <label>Flight ID</label>
                        <input type="text" class="form-control" name="flightID" value="${flightID}">
                    </div>
                    <div class="form-group">
                        <label>From City</label>
                        <select id="fromCity" class="form-control" name="fromCity" style="height: 3.5rem;" required="">
                            <c:forEach var="f" items="${flightList.getAll()}">
                                <option value="${fromCity}" ${f.fromCity eq fromCity ? 'selected' : ''}>${f.fromCity}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>To city</label>
                        <select id="toCity" class="form-control" name="toCity" style="height: 3.5rem;" required="">
                            <c:forEach var="f" items="${flightList.getAll()}">
                                <option value="${toCity}" ${f.toCity eq toCity ? 'selected' : ''}>${f.toCity}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Departure Date</label>
                        <input type="date" class="form-control" name="departureDate" value="${departureDate}">
                    </div>
                    <div class="form-group">
                        <label>Arrival Date</label>
                        <input type="date" class="form-control" name="arrivalDate" value="${arrivalDate}">
                    </div>
                    <div class="form-group">
                        <label>departure Time</label>
                        <input type="time" class="form-control" name="departureTime" value="${departureTime}">
                    </div>
                    <div class="form-group">
                        <label>Arrival Time</label>
                        <input type="time" class="form-control" name="arrivalTime" value="${arrivalTime}">
                    </div>
                    <div class="form-group">
                        <label>Seat Economy</label>
                        <input type="number" class="form-control" name="seatEconomy" value="${seatEconomy}">
                    </div>
                    <div class="form-group">
                        <label>Seat Business</label>
                        <input type="number" class="form-control" name="seatBusiness" value="${seatBusiness}">
                    </div>
                    <div class="form-group">
                        <label>Price Economy</label>
                        <input type="text" class="form-control" name="priceEconomy" value="${priceEconomy}">
                    </div>
                    <div class="form-group">
                        <label>Price Business</label>
                        <input type="text" class="form-control" name="priceBusiness" value="${priceBusiness}">
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="flightController" class="btn btn-default" >Back to List</a>
                    <input type="submit" class="btn btn-info" value="Save" style="background-color: #52452b">
                </div>
            </form>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>


