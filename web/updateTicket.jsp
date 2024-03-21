<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.FlightDAO" %>
<%@ page import="model.Flight" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Update ticket</title>
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
        <link rel="stylesheet" type="text/css" href="styles/ticket.scss">
        <link rel="stylesheet" type="text/css" href="styles/updateTicket.scss">
         <link rel="icon" type="image/png" href="images/flight3.jpg"/>

    </head>

    <body>

        <div class="super_container">

            <jsp:include page="headerAdmin.jsp"/>


            <form action="ticketController">
                <input type="hidden" value="update" name="command" />
                <div class="container_ticket">
                    <div class="ticket basic">
                        <div class="form-group">
                            <label for="pNameRecord">Passenger Name Record</label>
                            <input type="text" class="form-control" name="pNameRecord" value="${ticket.pNameRecord}" readonly>
                        </div>
                    </div>

                    <div class="ticket airline">
                        <div class="top">
                            <h1>Update ticket</h1>
                            <div class="big">
                                <p class="from">${flight.fromCity}</p>
                                <p class="to"><i class="fas fa-arrow-right"></i> ${flight.toCity}</p>
                            </div>

                            <img src="images/icon_2.png" alt="travelt" style="margin: 20px" >


                        </div>

                        <div class="bottom">
                            <div class="column">
                                <div class="form-group">
                                    <label for="pNameRecord">Passenger Name Record</label>
                                    <input type="text" class="form-control" name="pNameRecord" value="${ticket.pNameRecord}" readonly>
                                </div>

                                <div class="form-group">
                                    <label for="dateReservation">Date Reservation</label>
                                    <input type="date" class="form-control" name="dateReservation" value="${ticket.dateReservation}">
                                </div>

                                <div class="form-group">
                                    <label for="flightID">Flight ID</label>
                                    <input type="text" class="form-control" name="flightID" value="${ticket.flightID}">
                                </div>

                                <div class="form-group">
                                    <label for="journeyDate">Journey Date</label>
                                    <input type="date" class="form-control" name="journeyDate" value="${ticket.journeyDate}">
                                </div>

                                <div class="form-group">
                                    <label for="ticketClass">Ticket Class</label>
                                    <select class="form-control" name="ticketClass">
                                        <option value="Economy" ${ticket.ticketClass == 'Economy' ? 'selected' : '' }>Economy</option>
                                        <option value="Business" ${ticket.ticketClass == 'Business' ? 'selected' : '' }>Business
                                        </option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="bookingStatus">Booking Status</label>
                                    <select class="form-control" name="bookingStatus">
                                        <option value="Confirmed" ${ticket.bookingStatus == 'Confirmed' ? 'selected' : '' }>Confirmed
                                        </option>
                                        <option value="Pending" ${ticket.bookingStatus == 'Pending' ? 'selected' : '' }>Pending
                                        </option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="noPassengers">Number of Passengers</label>
                                    <input type="number" class="form-control" name="noPassengers" value="${ticket.noPassengers}">
                                </div>

                                <div class="form-group">
                                    <label for="payAmount">Pay Amount</label>
                                    <input type="text" class="form-control" name="payAmount" value="${ticket.payAmount}">
                                </div>

                                <div class="form-group">
                                    <label for="accountID">Account ID</label>
                                    <input type="text" class="form-control" name="accountID" value="${ticket.accountID}">
                                </div>
                                <button type="submit" class="btn btn-primary">Update Ticket</button>
                            </div>
                        </div>
                    </div>


            </form>
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

