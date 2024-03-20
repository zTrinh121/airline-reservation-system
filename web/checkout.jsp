<%-- Document : checkout Created on : Mar 11, 2024, 1:58:37 PM Author : ThanhThuy --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Passenger" %>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
              rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
              rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
              rel="stylesheet">
        <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <title>Checkout</title>
        <link rel="icon" type="image/png" href="images/flight3.jpg"/>
    </head>

    <body>
        <form action="PaymentServlet" method="post">
            <input type="hidden" name="command" value="authorize" />
            <div class="container">
                <h1 class="mt-5">Checkout Information</h1>
                <input type="text" name="total" value="120"/></p>
                <c:if test="${not empty sessionScope.passengers}">
                    <div class="mt-3">
                        <p><strong>Total Number of Passengers:</strong> ${totalPassengers}</p>
                        <p><strong>Price per Person:</strong>
                            ${pricePer}
                        </p>
                        <p><strong>Tax:</strong>
                            7.5%
                        </p>
                        <p><strong>Total:</strong>
                            <!--<input type="text" name="total" value="${totalPrice}"/></p>-->
                    </div>
                </c:if>
            </div>
            <button type="submit" class="btn btn-warning">Payment</button>

        </form>
    </body>

</html>