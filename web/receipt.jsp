<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Receipt Payment</title>
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
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div style="text-align: center;">
            <h1 style="padding-top: 10px;">Payment Done. Thanks for booking ticket(s)</h1>

            <form action="ticketController" method="get">
                <input type="hidden" name="command" value="ticketBooked" />
                <!--                <table>
                                    <tr>
                                        <td>Merchant:</td>
                                        <td>Company ABC Ltd.</td>
                                    </tr>
                                    <tr>
                                        <td>Payer</td>
                                        <td>${payer.firstName} ${payer.lastName}</td>
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td>${transaction.amount.total}</td>
                                    </tr>
                
                                </table>-->
                <button type="submit" class="btn btn-search">Check ticket(s) booked</button>
            </form>

        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
