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
        <link rel="stylesheet" type="text/css" href="styles/searchTicket.scss">

    </head>

    <body>

        <div class="super_container">

            <jsp:include page="header.jsp"/>

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
                                    <div class="search_item_ticket">
                                        <div>Passenger Name Record</div>
                                        <label style="display: block;" for="pNameRecord"></label>
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
