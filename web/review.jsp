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
    </head>
    <body>
        <div>TODO write content</div>
        <div style="text-align: center;">
            <h1>Please Review before Paying</h1>
            <form action="PaymentServlet" method="post">
                <input type="hidden" name="command" value="execute" />
                <table>
                    <tr>
                        <td colspan="2"><b>Transaction Details:</b></td>
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
                        <td colspan="2"><b>Payer Information:</b></td>
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
                        <td colspan="2"><b> Address:</b></td>
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
                        <td colspan="2" align="center"><input type="submit" value="Pay Now"/></td>
                    </tr>


                </table>
            </form>
        </div>
    </body>
</html>
