

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="flightList" class="dao.FlightDAO" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>HomeFlight User</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Travelix Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Expires" content="0">

        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
         <link rel="icon" type="image/png" href="images/flight3.jpg"/>
    </head>

    <body>

        <div class="super_container">
            <jsp:include page="header.jsp"/>
            <div class="search">
                <div class="search_inner">
                    <div class="container fill_height">
                        <div class="row fill_height">
                            <div class="col fill_height">
                                



                                <div class="search_panel active" style="margin-top: 10px;">
                                    <form action="flightController" method="get" id="search_form_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                        <input type="hidden" name="command" value="search" />
                                        <div class="search_item">
                                            <div style="color: #000;">From City</div>
                                            <select id="inputState" class="form-control" name="fromCity" style="width: 9rem; border-radius: 10px;" >
                                                <c:forEach var="f" items="${flightList.getAll()}">
                                                    <option>${f.fromCity}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="search_item">
                                            <div style="color: #000;">To City</div>
                                            <select id="inputState" class="form-control" name="toCity" style="width: 9rem; border-radius: 10px;">
                                                <c:forEach var="f" items="${flightList.getAll()}">
                                                    <option>${f.toCity}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="search_item">
                                            <div style="color: #000;">Depart. Date</div>
                                            <input type="date" class="form-control" name="departureDate" style="width: 7.5rem; border-radius: 10px;" required>
                                        </div>

                                        <div class="search_item">
                                            <div style="color: #000;">Type</div>
                                            <select id="inputState" class="form-control" name="ticketType" style="width: 7.5rem;border-radius: 10px;">
                                                <option value="Economy">Economy</option>
                                                <option value="Business">Business</option>
                                            </select>
                                        </div>
                                        <div class="search_item">
                                            <div style="color: #000;">Pax</div>
                                            <input type="number" class="form-control" name="numPassenger" value="1" style="width: 3rem; border-radius: 10px;" required>
                                        </div>


                                        <button class="button search_button">search<span></span><span></span><span></span></button>
                                    </form>


                                </div>
                            </div>
                        </div>		
                    </div>
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
