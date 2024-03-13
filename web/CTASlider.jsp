<%-- 
    Document   : CTASlider
    Created on : Mar 13, 2024, 9:36:08 AM
    Author     : Trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </head>
    <body>
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
    </body>
</html>
