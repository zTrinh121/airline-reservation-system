<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Account" %>

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
        <link rel="stylesheet" href="decorate/style.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-..." crossorigin="anonymous">
        <style>
            body {
                background-color: #6f42c1;
                color: white;
                padding: 20px;
            }

            .header {
                text-align: center;
                margin-bottom: 30px;
            }

            .logo a {
                display: inline-block;
                margin-top: 20px;
                color: white;
                text-decoration: none;
            }

            .profile-section {
                max-width: 400px;
                margin: 30px auto; /* Thay đổi margin ở đây */
                background-color: rgba(255, 255, 255, 0.1);
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .profile-section h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .profile-form {
                display: flex;
                flex-direction: column;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                font-weight: bold;
                margin-bottom: 5px;
                display: block;
            }

            .form-group input {
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            .button {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .button:hover {
                background-color: #0056b3;
            }
            .profile-section {
                max-width: 400px;
                margin: 30px auto; /* Thay đổi margin ở đây */
                background-color: rgba(255, 255, 255, 0.1);
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                height: auto; /* Đặt chiều cao tự động */
                overflow: hidden; /* Ẩn phần tử tràn ra nếu nội dung vượt quá */
            }

            .profile-form {
                display: flex;
                flex-direction: column;
                align-items: center; /* Căn giữa nội dung form */
            }

            .button {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                text-align: center; /* Căn giữa nút */
            }

            .button-container {
                display: flex;
                justify-content: center;
            }

            .button {
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .button:hover {
                background-color: #0056b3;
            }
            .button.search_button {
                display: inline-block;
                position: relative;
                text-align: center;
            }

            .button.search_button::after {
                
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

        </style>
    </head>

    <body>
        <header class="header">
            

        </header>
        <div class="home_slider_container" style="height: 160%">
            <div class="home_slider_background" style="background-image:url(images/home_slider.jpg); "></div>
            <!--Login-->
          <div class="profile-section">
            <h2>User Profile</h2>
            <form action="ProfileServlet" method="post" class="profile-form">
                <%
                  
                    Account userAccount = (Account) session.getAttribute("userAccount");

                 
                    if (userAccount != null) {
                %>
                <div class="form-group">
                    <label for="fullname">Full Name:</label>
                    <input type="text" id="fullname" name="fullname" value="<%= userAccount.getFullName() %>" readonly>
                    <i class="fa fa-pencil edit-icon" aria-hidden="true" onclick="toggleEdit('fullname')"></i>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="<%= userAccount.getUserName() %>" readonly>
                    <i class="fa fa-pencil edit-icon" aria-hidden="true" onclick="toggleEdit('username')"></i>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= userAccount.getEmail() %>" readonly>
                    <i class="fa fa-pencil edit-icon" aria-hidden="true" onclick="toggleEdit('email')"></i>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number:</label>
                    <input type="tel" id="phoneNumber" name="phoneNumber" value="<%= userAccount.getPhoneNumber() %>" readonly>
                    <i class="fa fa-pencil edit-icon" aria-hidden="true" onclick="toggleEdit('phoneNumber')"></i>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="<%= userAccount.getAddress() %>" readonly>
                    <i class="fa fa-pencil edit-icon" aria-hidden="true" onclick="toggleEdit('address')"></i>
                </div>
                <%
                    } // Kết thúc kiểm tra thông tin người dùng từ session
                %>
                <div class="button-container">
                    <button type="submit" class="button search_button" style="padding-top: 0px" name="action" value="saveProfile">Save Profile</button>

                </div>
            </form>
        </div>
    </div>

    <script>
        function toggleEdit(fieldId) {
            var field = document.getElementById(fieldId);
            if (field.readOnly) {
                field.readOnly = false;
                field.focus();
            } else {
                field.readOnly = true;
            }
        }
    </script>

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
