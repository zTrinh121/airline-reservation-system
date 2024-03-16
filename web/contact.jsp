<%-- 
    Document   : contact
    Created on : Mar 8, 2024, 3:26:18 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Contact</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="HomeFlight Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
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
                                 <div class="user_box ml-auto" style="display: flex; align-items: center;">
                                    <% if (session != null && session.getAttribute("username") != null) {
                                        String username = (String) session.getAttribute("username");
                                    %>
                                    <p style="color: #fff; font-family: 'Open Sans', 'sans-serif'; font-size: 16px; margin-right: 10px;">Welcome, <%= username %> !</p>
                                   <a href="<%= request.getContextPath() %>/Login?action=logout" style=" color: #fff; text-decoration: none; padding:2px; cursor: pointer;font-weight:bold; margin-top: -10px; ">Log out</a>


                                    <% } %>
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
                                    <div class="logo"><a href="#"><img src="images/logo.png" alt="">HomeFlight</a></div>
                                </div>
                                <div class="main_nav_container ml-auto">
                                    <ul class="main_nav_list">
                                        <li class="main_nav_item"><a href="user.jsp">home</a></li>

                                        <li class="main_nav_item"><a href="ticketBooked.jsp">ticket</a></li>

                                        <li class="main_nav_item"><a href="#">contact</a></li>
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
                        <li class="menu_item"><a href="user.jsp">home</a></li>
                        <li class="menu_item"><a href="ticketBooked.jsp">ticket</a></li>
                        <li class="menu_item"><a href="contact.html">contact</a></li>
                    </ul>
                </div>
            </div>

            <!-- Home -->

            

            <!-- Contact -->

            <div class="contact_form_section">
                <div class="container">
                    <div class="row">
                        <div class="col">

                            <!-- Contact Form -->
                            <div class="contact_form_container">
                                <div class="contact_title text-center">Get latest information from us</div>
                                <form action="MailServlet" method="get" id="contact_form" class="contact_form text-center">
                                    <input name="name" type="text" id="contact_form_name" class="contact_form_name input_field" placeholder="Name" required="required" data-error="Name is required.">
                                    <input name="email" type="text" id="contact_form_email" class="contact_form_email input_field" placeholder="E-mail" required="required" data-error="Email is required.">
                                    <button type="submit" id="form_submit_button" class="form_submit_button button trans_200">subscribe<span></span><span></span><span></span></button>
                                </form>
                                <p style="margin-top: 10px; color: #fff; font-family: 'Open Sans', 'sans-serif'; font-size: 16px; text-align: center;" >${mess}</p>
                            </div>
                            

                        </div>
                    </div>
                </div>
            </div>


            <!-- Google Map -->

            <div class="travelix_map">
                <div id="google_map" class="google_map">
                    <div class="map_container">
                        <div id="map"><p><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3835.530391474877!2d108.228167!3d15.985882!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421b40be596029%3A0x57f47da73f6041c0!2zVsOpIE3DoXkgQmF5IMSQw6AgTuG6tW5n!5e0!3m2!1svi!2sus!4v1709870332747!5m2!1svi!2sus" width="1200" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p></div>
                    </div>
                </div>
            </div>

            <!-- Footer -->

            <jsp:include page="footer.jsp"/>
           
        </div>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        
        <script src="js/contact_custom.js"></script>
        

    </body>

</html>
