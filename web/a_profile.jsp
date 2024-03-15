<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Admin" %>

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
            margin: 30px auto;
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

        .edit-icon {
            cursor: pointer;
            color: #007bff;
            margin-left: 5px;
        }

    </style>
</head>
<body>
    <header class="header">
    </header>
    <div class="home_slider_container" style="height: 160%">
        <div class="home_slider_background" style="background-image:url(images/home_slider.jpg); "></div>
        <div class="profile-section">
            <h2>Admin Profile</h2>
            <form action="profile_a" method="post" class="profile-form">
                <%
                Admin adminAccount = (Admin) session.getAttribute("admin");
                if (adminAccount != null) {
                %>
                <div class="form-group">
                    <label for="adminId">Admin ID:</label>
                    <input type="text" id="adminId" name="adminId" value="<%= adminAccount.getAdminId() %>" readonly>
                    <i class="fa fa-pencil edit-icon" aria-hidden="true" onclick="toggleEdit('adminId')"></i>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="<%= adminAccount.getName() %>" readonly>
                    <i class="fa fa-pencil edit-icon" aria-hidden="true" onclick="toggleEdit('username')"></i>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= adminAccount.getEmail() %>" readonly>
                    <i class="fa fa-pencil edit-icon" aria-hidden="true" onclick="toggleEdit('email')"></i>
                </div>
                <% } %>
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
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="styles/bootstrap4/popper.js"></script>
    <script src="styles/bootstrap4/bootstrap.min.js"></script>
    <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="plugins/easing/easing.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>
