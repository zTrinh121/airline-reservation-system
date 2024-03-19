<%-- 
    Document   : contact
    Created on : Mar 8, 2024, 3:26:18 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Travelix</title>
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
        <link rel="stylesheet" type="text/css" href="decorate/profile.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-..." crossorigin="anonymous">

    </head>

    <body>
        <jsp:include page="header.jsp"/>

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
