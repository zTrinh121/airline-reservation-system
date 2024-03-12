<%-- 
    Document   : home
    Created on : Mar 6, 2024, 9:13:23 AM
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
        <link rel="stylesheet" href="decorate/style.css"/>
    </head>

    <body>
        <header class="header">
            <div class="row">
                <div class="col main_nav_col d-flex flex-row align-items-center justify-content-start">
                    <div class="logo_container">
                        <div class="logo ">
                            <a href="#"><img src="images/logo.png" alt="">Welcome to HomeFlight</a>                     
                        </div>
                    </div>   
                </div>
            </div>
        </header>
        <div class="home_slider_container">
            <div class="home_slider_background" style="background-image:url(images/home_slider.jpg)"></div>
            <!--Login-->
            <form  action="Login" method="post" class="login d-flex flex-column align-items-center justify-content-between ">
                <div class="form-group">
                    <div>Username</div>
                    <input type="text" name="username" >
                </div>
                <div class="form-group ">
                    <div>Password</div>
                    <input type="password" name="password" >

                </div>
                <div class=" remember">
                    <div class="form-check">
                        <input class="form-check-input" name="remember_me" type="checkbox" id="gridCheck">
                        Remeber me
                    </div>
                    <div class="user_box_register user_box_link">
                        <a href="register.jsp" style="font-size: 12px;">Register</a>
                    </div>
                </div>
                <button type="submit"  name="login"  class="button search_button">Login</button>
                 <input type="hidden" name="action" value="login">
            </form>
            <!--Login-->
        </div>

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/custom.js"></script>

    </body>

</html>
