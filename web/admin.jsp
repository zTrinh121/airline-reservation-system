<%-- 
    Document   : admin
    Created on : Mar 8, 2024, 1:23:07 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
     <head>
        <title>HomeFlight Admin</title>
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
         <link rel="icon" type="image/png" href="images/flight3.jpg"/>
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
                                    <div class="logo"><a href="admin.jsp"><img src="images/logo.png" alt="">HomeFlight</a></div>
                                </div>
                                <div class="main_nav_container ml-auto">
                                    <ul class="main_nav_list">
                                        <li class="main_nav_item"><a href="admin.jsp">home</a></li>
                                        <li class="main_nav_item"><a href="listFlightAdmin.jsp">Flight</a></li>
                                        <li class="main_nav_item"><a href="customer.jsp">Customer</a></li>

                                        <li class="main_nav_item"><a href="ticket.jsp">Ticket</a></li>
                                    </ul>
                                </div>
                                <div class="content_search ml-lg-0 ml-auto">
                                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="17px" height="17px" viewBox="0 0 512 512" enable-background="new 0 0 512 512" xml:space="preserve">
                                    <g>
                                    <g>
                                    <g>
                                    <path class="mag_glass" fill="#FFFFFF" d="M78.438,216.78c0,57.906,22.55,112.343,63.493,153.287c40.945,40.944,95.383,63.494,153.287,63.494
                                          s112.344-22.55,153.287-63.494C489.451,329.123,512,274.686,512,216.78c0-57.904-22.549-112.342-63.494-153.286
                                          C407.563,22.549,353.124,0,295.219,0c-57.904,0-112.342,22.549-153.287,63.494C100.988,104.438,78.439,158.876,78.438,216.78z
                                          M119.804,216.78c0-96.725,78.69-175.416,175.415-175.416s175.418,78.691,175.418,175.416
                                          c0,96.725-78.691,175.416-175.416,175.416C198.495,392.195,119.804,313.505,119.804,216.78z"/>
                                    </g>
                                    </g>
                                    <g>
                                    <g>
                                    <path class="mag_glass" fill="#FFFFFF" d="M6.057,505.942c4.038,4.039,9.332,6.058,14.625,6.058s10.587-2.019,14.625-6.058L171.268,369.98
                                          c8.076-8.076,8.076-21.172,0-29.248c-8.076-8.078-21.172-8.078-29.249,0L6.057,476.693
                                          C-2.019,484.77-2.019,497.865,6.057,505.942z"/>
                                    </g>
                                    </g>
                                    </g>
                                    </svg>
                                </div>

                                <form id="search_form" class="search_form bez_1">
                                    <input type="search" class="search_content_input bez_1">
                                </form>

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


            <!-- Intro -->

            <div class="intro">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <h2 class="intro_title text-center">We have the best tours</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <div class="intro_text text-center">
                                <p>Travel to make memories all around the world!!! </p>
                            </div>
                        </div>
                    </div>
                    <div class="row intro_items">

                        <!-- Intro Item -->

                        <div class="col-lg-4 intro_col">
                            <div class="intro_item">
                                <div class="intro_item_overlay"></div>
                                <!-- Image by https://unsplash.com/@dnevozhai -->
                                <div class="intro_item_background" style="background-image:url(images/intro_1.jpg)"></div>
                                <div class="intro_item_content d-flex flex-column align-items-center justify-content-center">
                                    <div class="intro_date">May 25th - June 01st</div>
                                    <div class="button intro_button"><div class="button_bcg"></div><a href="#">see more<span></span><span></span><span></span></a></div>
                                    <div class="intro_center text-center">
                                        <h1>Da Nang</h1>
                                        <div class="intro_price">From $1450</div>
                                        <div class="rating rating_4">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Intro Item -->

                        <div class="col-lg-4 intro_col">
                            <div class="intro_item">
                                <div class="intro_item_overlay"></div>
                                <!-- Image by https://unsplash.com/@hellolightbulb -->
                                <div class="intro_item_background" style="background-image:url(images/intro_2.jpg)"></div>
                                <div class="intro_item_content d-flex flex-column align-items-center justify-content-center">
                                    <div class="intro_date">May 25th - June 01st</div>
                                    <div class="button intro_button"><div class="button_bcg"></div><a href="#">see more<span></span><span></span><span></span></a></div>
                                    <div class="intro_center text-center">
                                        <h1>Nha Trang</h1>
                                        <div class="intro_price">From $1450</div>
                                        <div class="rating rating_4">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Intro Item -->

                        <div class="col-lg-4 intro_col">
                            <div class="intro_item">
                                <div class="intro_item_overlay"></div>
                                <!-- Image by https://unsplash.com/@willianjusten -->
                                <div class="intro_item_background" style="background-image:url(images/intro_3.jpg)"></div>
                                <div class="intro_item_content d-flex flex-column align-items-center justify-content-center">
                                    <div class="intro_date">May 25th - June 01st</div>
                                    <div class="button intro_button"><div class="button_bcg"></div><a href="#">see more<span></span><span></span><span></span></a></div>
                                    <div class="intro_center text-center">
                                        <h1>Ha Noi</h1>
                                        <div class="intro_price">From $1450</div>
                                        <div class="rating rating_4">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- CTA -->

            <div class="cta">
                <!-- Image by https://unsplash.com/@thanni -->
                <div class="cta_background" style="background-image:url(images/cta.jpg)"></div>

                <div class="container">
                    <div class="row">
                        <div class="col">

                            <!-- CTA Slider -->

                            <div class="cta_slider_container">
                                <div class="owl-carousel owl-theme cta_slider">

                                    <!-- CTA Slider Item -->
                                    <div class="owl-item cta_item text-center">
                                        <div class="cta_title">Happiness isn’t a destination, it’s a journey we are on</div>
                                        <div class="rating_r rating_r_4">
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                        </div>
                                        <p class="cta_text">Travel makes one modest. You see what a tiny place you occupy in the world!!!</p>

                                    </div>

                                    <!-- CTA Slider Item -->
                                    <div class="owl-item cta_item text-center">
                                        <div class="cta_title">maldives deluxe package</div>
                                        <div class="rating_r rating_r_4">
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                        </div>
                                        <p class="cta_text">He that travels much knows much.</p>
                                        <div class="button cta_button"><div class="button_bcg"></div><a href="#">book now<span></span><span></span><span></span></a></div>
                                    </div>

                                    <!-- CTA Slider Item -->
                                    <div class="owl-item cta_item text-center">
                                        <div class="cta_title">maldives deluxe package</div>
                                        <div class="rating_r rating_r_4">
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                            <i></i>
                                        </div>
                                        <p class="cta_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec. Proin bibendum, augue faucibus tincidunt ultrices, tortor augue gravida lectus, et efficitur enim justo vel ligula.</p>
                                        <div class="button cta_button"><div class="button_bcg"></div><a href="#">book now<span></span><span></span><span></span></a></div>
                                    </div>

                                </div>

                                <!-- CTA Slider Nav - Prev -->
                                <div class="cta_slider_nav cta_slider_prev">
                                    <svg version="1.1" id="Layer_4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                    <defs>
                                    <linearGradient id='cta_grad_prev'>
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

                                <!-- CTA Slider Nav - Next -->
                                <div class="cta_slider_nav cta_slider_next">
                                    <svg version="1.1" id="Layer_5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                    <defs>
                                    <linearGradient id='cta_grad_next'>
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

                            </div>

                        </div>
                    </div>
                </div>

            </div>

            <!-- Offers -->



            <!-- Offers Item -->

            <!-- Testimonials -->

            <div class="testimonials">
                <div class="test_border"></div>
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <h2 class="section_title">what our clients say about us</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">

                            <!-- Testimonials Slider -->

                            <div class="test_slider_container">
                                <div class="owl-carousel owl-theme test_slider">

                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_1.jpg" alt="https://unsplash.com/@anniegray"></div>
                                            <div class="test_icon"><img src="images/backpack.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">May 24, 2023</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best holliday ever "</div>
                                                    <p class="test_quote_text">I had a wonderful and safety flight.Thank you so much.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_2.jpg" alt="https://unsplash.com/@tschax"></div>
                                            <div class="test_icon"><img src="images/island_t.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">Thu Ha</div>
                                                        <div class="test_date">May 24, 2023</div>
                                                    </div>
                                                    <div class="test_quote_title">"Chuyến bay tuyệt vời"</div>
                                                    <p class="test_quote_text">Dịch vụ tốt,giá cả hợp lí,trải nghiệm tuyệt vời</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_3.jpg" alt="https://unsplash.com/@seefromthesky"></div>
                                            <div class="test_icon"><img src="images/kayak.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">jan 24, 2024</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best experience ever "</div>
                                                    <p class="test_quote_text">The service is really good</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_2.jpg" alt=""></div>
                                            <div class="test_icon"><img src="images/island_t.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">May 24, 2017</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best holliday ever "</div>
                                                    <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_1.jpg" alt=""></div>
                                            <div class="test_icon"><img src="images/backpack.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">May 24, 2017</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best holliday ever "</div>
                                                    <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Testimonial Item -->
                                    <div class="owl-item">
                                        <div class="test_item">
                                            <div class="test_image"><img src="images/test_3.jpg" alt=""></div>
                                            <div class="test_icon"><img src="images/kayak.png" alt=""></div>
                                            <div class="test_content_container">
                                                <div class="test_content">
                                                    <div class="test_item_info">
                                                        <div class="test_name">carla smith</div>
                                                        <div class="test_date">May 24, 2017</div>
                                                    </div>
                                                    <div class="test_quote_title">" Best holliday ever "</div>
                                                    <p class="test_quote_text">Nullam eu convallis tortor. Suspendisse potenti. In faucibus massa arcu, vitae cursus mi hendrerit nec.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- Testimonials Slider Nav - Prev -->
                                <div class="test_slider_nav test_slider_prev">
                                    <svg version="1.1" id="Layer_6" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                    <defs>
                                    <linearGradient id='test_grad_prev'>
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

                                <!-- Testimonials Slider Nav - Next -->
                                <div class="test_slider_nav test_slider_next">
                                    <svg version="1.1" id="Layer_7" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="28px" height="33px" viewBox="0 0 28 33" enable-background="new 0 0 28 33" xml:space="preserve">
                                    <defs>
                                    <linearGradient id='test_grad_next'>
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

                            </div>

                        </div>
                    </div>

                </div>
            </div>
            <p><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3835.530391474877!2d108.228167!3d15.985882!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421b40be596029%3A0x57f47da73f6041c0!2zVsOpIE3DoXkgQmF5IMSQw6AgTuG6tW5n!5e0!3m2!1svi!2sus!4v1709870332747!5m2!1svi!2sus" width="1200" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>




            <!-- Footer -->

            <footer class="footer">
                <div class="container">
                    <div class="row">

                        <!-- Footer Column -->
                        <div class="col-lg-3 footer_column">
                            <div class="footer_col">
                                <div class="footer_content footer_about">
                                    <div class="logo_container footer_logo">
                                        <div class="logo"><a href="#"><img src="images/logo.png" alt="">HomeFlight</a></div>
                                    </div>
                                    <p class="footer_about_text">No one realized how beautiful the trip was until they got home and fell on an old, familiar pillow.</p>
                                    <ul class="footer_social_list">
                                        <li class="footer_social_item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                        <li class="footer_social_item"><a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                        <li class="footer_social_item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li class="footer_social_item"><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                        <li class="footer_social_item"><a href="#"><i class="fa fa-behance"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- Footer Column -->
                        <div class="col-lg-3 footer_column">
                            <div class="footer_col">
                                <div class="footer_title">blog posts</div>
                                <div class="footer_content footer_blog">

                                    <!-- Footer blog item -->
                                    <div class="footer_blog_item clearfix">
                                        <div class="footer_blog_image"><img src="images/footer_blog_1.jpg" alt="https://unsplash.com/@avidenov"></div>
                                        <div class="footer_blog_content">
                                            <div class="footer_blog_title"><a href="blog.html">Travel with us this year</a></div>
                                            <div class="footer_blog_date">Nov 29, 2017</div>
                                        </div>
                                    </div>

                                    <!-- Footer blog item -->
                                    <div class="footer_blog_item clearfix">
                                        <div class="footer_blog_image"><img src="images/footer_blog_2.jpg" alt="https://unsplash.com/@deannaritchie"></div>
                                        <div class="footer_blog_content">
                                            <div class="footer_blog_title"><a href="blog.html">New destinations for you</a></div>
                                            <div class="footer_blog_date">Nov 29, 2017</div>
                                        </div>
                                    </div>

                                    <!-- Footer blog item -->
                                    <div class="footer_blog_item clearfix">
                                        <div class="footer_blog_image"><img src="images/footer_blog_3.jpg" alt="https://unsplash.com/@bergeryap87"></div>
                                        <div class="footer_blog_content">
                                            <div class="footer_blog_title"><a href="blog.html">Travel with us this year</a></div>
                                            <div class="footer_blog_date">Nov 29, 2017</div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Footer Column -->
                        <div class="col-lg-3 footer_column">
                            <div class="footer_col">

                                <div class="footer_content footer_tags">
                                    <ul class="tags_list clearfix">
                                        <li class="tag_item"><a href="#">design</a></li>
                                        <li class="tag_item"><a href="#">fashion</a></li>
                                        <li class="tag_item"><a href="#">music</a></li>
                                        <li class="tag_item"><a href="#">video</a></li>
                                        <li class="tag_item"><a href="#">party</a></li>
                                        <li class="tag_item"><a href="#">photography</a></li>
                                        <li class="tag_item"><a href="#">adventure</a></li>
                                        <li class="tag_item"><a href="#">travel</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- Footer Column -->
                        <div class="col-lg-3 footer_column">
                            <div class="footer_col">
                                <div class="footer_title">contact info</div>
                                <div class="footer_content footer_contact">
                                    <ul class="contact_info_list">
                                        <li class="contact_info_item d-flex flex-row">
                                            <div><div class="contact_info_icon"><img src="images/placeholder.svg" alt=""></div></div>
                                            <div class="contact_info_text">55 Lê Thì Hiến, Hoà Quý, Ngũ Hành Sơn, Đà Nẵng </div>
                                        </li>
                                        <li class="contact_info_item d-flex flex-row">
                                            <div><div class="contact_info_icon"><img src="images/phone-call.svg" alt=""></div></div>
                                            <div class="contact_info_text">2556-808-8613</div>
                                        </li>
                                        <li class="contact_info_item d-flex flex-row">
                                            <div><div class="contact_info_icon"><img src="images/message.svg" alt=""></div></div>
                                            <div class="contact_info_text"><a href="mailto:contactme@gmail.com?Subject=Hello" target="_top">contactme@gmail.com</a></div>
                                        </li>
                                        <li class="contact_info_item d-flex flex-row">
                                            <div><div class="contact_info_icon"><img src="images/planet-earth.svg" alt=""></div></div>
                                            <div class="contact_info_text"><a href="https://colorlib.com">FlightHome@gmail.com</a></div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </footer>

            <!-- Copyright -->

            <div class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 order-lg-1 order-2  ">
                            <div class="copyright_content d-flex flex-row align-items-center">
                                <div><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
                            </div>
                        </div>
                        <div class="col-lg-9 order-lg-2 order-1">
                            <div class="footer_nav_container d-flex flex-row align-items-center justify-content-lg-end">
                                <div class="footer_nav">
                                    <ul class="footer_nav_list">
                                        <li class="footer_nav_item"><a href="#">home</a></li>
                                        <li class="footer_nav_item"><a href="about.html">about us</a></li>
                                        <li class="footer_nav_item"><a href="offers.html">offers</a></li>
                                        <li class="footer_nav_item"><a href="blog.html">news</a></li>
                                        <li class="footer_nav_item"><a href="contact.html">contact</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/custom.js"></script>

    </body>

</html>

