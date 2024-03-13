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
    </head>
    <body>
        <div>TODO write content</div>
        <div style="text-align: center;">
            <h1>Payment Done. Thanks for booking tickets</h1>
            <form action="PaymentServlet" method="get">
                <input type="hidden" name="command" value="review" />
                <table>
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

                </table>
            </form>
        </div>
    </body>
</html>
