

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
                                <div class="user_box ml-auto justify-content-end" style="display: flex; align-items: center; position: relative;">
                                    <% if (session != null && session.getAttribute("username") != null) {
                                            String username = (String) session.getAttribute("username");
                                    %>
                                    <p style="color: #fff; font-family: 'Open Sans', 'sans-serif'; font-size: 16px; display: flex; align-items: center;">Welcome, <%= username%> ! <i id="avatarIcon" class="fa-solid fa-user" style="cursor: pointer; margin-left: 5px;"></i></p>


                                    <div id="avatarDropdown" class="dropdown-content">
                                        <a href="<%= request.getContextPath()%>/Login?action=logout">Log out</a>
                                        <a href="<%= request.getContextPath()%>/a_profile.jsp">Show Profile</a>
                                        <a href="<%= request.getContextPath()%>/password_a.jsp">Change Password</a>
                                    </div>
                                    <% }%>
                                </div>

                                <script>

                                    var modal = document.getElementById('avatarModal');


                                    var icon = document.getElementById("avatarIcon");


                                    icon.onclick = function () {
                                        var dropdown = document.getElementById("avatarDropdown");
                                        dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
                                    }


                                    window.onclick = function (event) {
                                        if (!event.target.matches('#avatarIcon')) {
                                            var dropdowns = document.getElementsByClassName("dropdown-content");
                                            for (var i = 0; i < dropdowns.length; i++) {
                                                var openDropdown = dropdowns[i];
                                                if (openDropdown.style.display === "block") {
                                                    openDropdown.style.display = "none";
                                                }
                                            }
                                        }
                                    }
                                </script>


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
                                        <li class="main_nav_item"><a href="admin.jsp">home</a></li>
                                        <li class="main_nav_item"><a href="flightController">Flight</a></li>
                                        <li class="main_nav_item"><a href="customer.jsp">Customer</a></li>

                                        <li class="main_nav_item"><a href="ticket.jsp">Ticket</a></li>
                                    </ul>
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

