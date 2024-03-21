<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Review Payment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
         <link rel="icon" type="image/png" href="images/flight3.jpg"/>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div style="text-align: center;">
            <h1 style="color: #000;">Please Review before Paying</h1>
            <div class="search">
                <div class="search_inner">
                    <div class="container fill_height">
                        <div class="row fill_height">
                            <div class="col fill_height">
                                <div class="search_panel active" style="margin-top: 10px; margin-bottom: 20px; justify-content: center;">
                                    <form action="ticketController" method="get">
                                        <input type="hidden" value="updateStatus" name="command" />
                                        <table class="table">
                                            <tr>
                                                <td colspan="2"><b style="color: #000;">Transaction Details:</b></td>
                                                <td>
                                                    <input type="hidden" name="paymentId" value="${param.paymentId}"/>
                                                    <input type="hidden" name="PayerID" value="${param.PayerID}"/>

                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Total</td>
                                                <td>${transaction.amount.total}</td>
                                            </tr>

                                            <tr>
                                                <td colspan="2"><b style="color: #000;">Payer Information:</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>First Name:</td>
                                                <td>${payer.firstName}</td>
                                            </tr>
                                            <tr>
                                                <td>Last Name:</td>
                                                <td>${payer.lastName}</td>
                                            </tr>
                                            <tr>
                                                <td>Email:</td>
                                                <td>${payer.email}</td>
                                            </tr>

                                            <tr>
                                                <td colspan="2"><b style="color: #000;"> Address:</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>Recipient name:</td>
                                                <td>${shippingAddress.recipientName}</td>
                                            </tr>
                                            <tr>
                                                <td>Line 1:</td>
                                                <td>${shippingAddress.line1}</td>
                                            </tr>
                                            <tr>
                                                <td>City:</td>
                                                <td>${shippingAddress.city}</td>
                                            </tr>
                                            <tr>
                                                <td>State:</td>
                                                <td>${shippingAddress.state}</td>
                                            </tr>
                                            <tr>
                                                <td>Country Code:</td>
                                                <td>${shippingAddress.countryCode}</td>
                                            </tr>
                                            <tr>
                                                <td>Postal Code:</td>
                                                <td>${shippingAddress.postalCode}</td>
                                            </tr>

                                            <tr>
                                                <td colspan="2" align="center"><button class="button search_button"/>Pay Now</button></td>
                                            </tr>


                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <jsp:include page="footer.jsp" />

    </body>
</html>
