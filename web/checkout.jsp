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
        <link rel="stylesheet" type="text/css" href="styles/checkout.scss">
        <script
            src="https://kit.fontawesome.com/bb515311f9.js"
            crossorigin="anonymous"
        ></script>
        <title>Checkout</title>

    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <form action="PaymentServlet" method="post">
            <input type="hidden" name="command" value="authorize" />

            <body>

            </body>
            <div class="checkout-container">

                <c:set var="flight" value="${sessionScope.flight}"/>
                <c:set var="type" value="${sessionScope.ticketType}"/>
                <c:if test="${not empty sessionScope.passengers}">

                    <div class="left-side" style="background-image:url(images/offer_1.jpg)">
                        <div class="text-box">
                            <h1 class="home-heading">${flight.getFlightID()}         ${type}</h1>


                            <p class="home-desc"><em>${flight.getArrivalDate() } </em></p>

                            <p class="home-price"><em>${pricePer}USD </em>/ 1 person</p>
                            <hr class="left-hr" />
                            <p class="home-desc">
                                <em>${flight.getFromCity() }</em> to <em>${flight.getToCity() }</em>
                            </p>

                        </div>
                    </div>
                    <div class="right-side">
                        <div class="receipt">
                            <h2 class="receipt-heading">Receipt Summary</h2>
                            <div>
                                <table class="table">
                                    <tr>
                                        <td>Total Number of Passengers</td>
                                        <td class="price">${totalPassengers}</td>
                                    </tr>
                                    <tr>
                                        <td>Price per Person</td>
                                        <td class="price"> ${pricePer} USD</td>
                                    </tr>

                                    <tr>
                                        <td>Tax</td>
                                        <td class="price">7.5%</td>
                                    </tr>
                                    <tr class="total">
                                        <td>Total</td>
                                        <td class="price"> ${totalPrice} USD</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <input hidden  class="price" style="    border: none;" readonly="" type="text" name="total" value="${totalPrice}"/>

                    </c:if>
                    <button type="submit" class="btn"> <i class="fa-solid fa-lock"></i>Payment</button>

                    <p class="footer-text">
                        <i class="fa-solid fa-lock"></i>
                        Your credit card infomration is encrypted
                    </p>
                </div>
            </div>

            <jsp:include page="footer.jsp"/>

        </form>
    </body>

</html>
