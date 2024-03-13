<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Search Ticket</title>
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
                                    <div class="button home_slider_button"><div class="button_bcg"></div><a href="#">explore now<span></span><span></span><span></span></a></div>
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

            <!-- Search -->

            <div class="search">


                <!-- Search Contents -->

                <div class="container fill_height">
                    <div class="row fill_height">
                        <div class="col fill_height">

                            <!-- Search Tabs -->

                            <!-- Search Tabs -->
                            <div class="search_tabs_container">
                                <div class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                    <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start">
                                        <img src="images/departure.png" alt="">Trips
                                    </div>
                                    <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start active">
                                        <div style="width: 50px; height: 50px; overflow: hidden;">
                                            <img src="images/ticket3.png" style="max-width: 100%; max-height: 100%; display: block;">
                                        </div>
                                        <span style="margin-left: 10px;">Tickets Booked</span>
                                    </div>
                                </div>
                            </div>
                            <!-- Search Panel -->

                            <div class="search_panel">
                                <form action="search_trips" id="search_form_trips" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                    <div class="search_item">
                                        <div>From City</div>
                                        <input type="text" class="destination search_input" required="required">
                                    </div>
                                    <div class="search_item">
                                        <div>To City</div>
                                        <input type="text" class="check_in search_input" placeholder="">
                                    </div>
                                    <div class="search_item">
                                        <div>Departure Time</div>
                                        <input type="text" class="check_out search_input" placeholder="">
                                    </div>
                                    <div class="search_item">
                                        <div>Arrival Time</div>
                                        <input type="text" class="check_out search_input" placeholder="">
                                    </div>


                                    <button class="button search_button">search<span></span><span></span><span></span></button>
                                </form>
                            </div>

                            <!-- Search Panel -->
                            <div class="search_panel active">
                                <form action="ticketController" method="get">
                                    <input type="hidden" name="command" value="search" />
                                    <div class="search_item">
                                        <div>Passenger Name Record:</div>
                                        <label for="pNameRecord"></label>
                                        <input type="text" class="check_out search_input" name="pNameRecord" placeholder="Enter Passenger Name Record" value=${pNameRecord}>
                                    </div>
                                    <br />
                                    <button class="button search_button">Search Tickets Booked<span></span><span></span><span></span></button>
                                    <br />
                                </form>
                            </div>

                            <!--</form>-->

                            <!-- Search Panel -->


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
                                        <div class="logo"><a href="#"><img src="images/logo.png" alt="">travelix</a></div>
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
