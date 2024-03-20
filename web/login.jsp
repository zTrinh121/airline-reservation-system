

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HOMEFLIGHT LOGIN</title>
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
            <form id="login-form" class="form d-flex flex-column align-items-center justify-content-between" action="Login" method="post" style="margin-top: 150px;">
                    <div class="form-group">
                       <div>Username</div>
                        <input type="text" name="username" id="username" class="form-control">
                    </div>
                    <div class="form-group">
                        <div>Password</div>
                        <input type="password" name="password" id="password" class="form-control">
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
                    <%
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null && !errorMessage.isEmpty()) {
                    %>
                    <div id="error-message" class="text-center" style="color: red; margin-top: 10px; font-weight: bold"><%= errorMessage%></div>
                    <%
                        }
                    %>
                </form>
            </div>
        </div>
    </body>
</html>