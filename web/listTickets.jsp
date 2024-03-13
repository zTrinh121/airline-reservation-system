<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <title>Search Ticket Page</title>

    </head>

    <body>
        <h4 style="color: red;">${error}</h4>
        <h4 style="color: green;">${msg}</h4>
        <a href="addTicketAdmin.jsp" class="btn btn-primary">Add Ticket</a>

        <table class="table">
            <thead>
                <tr>
                    <th scope="col">PName Record</th>
                    <th scope="col">Date Reservation</th>
                    <th scope="col">Flight ID</th>
                    <th scope="col">Journey Date</th>
                    <th scope="col">Ticket Class</th>
                    <th scope="col">Booking Status</th>
                    <th scope="col">No. of Passengers</th>
                    <th scope="col">Pay Amount</th>
                    <th scope="col">Account ID</th>
                        <%--<c:if test="${isAdmin}">--%>
                    <th scope="col">Action</th>
                        <%--</c:if>--%>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="ticket" items="${list}">
                    <c:url value="ticketController" var="loadLink">
                        <c:param name="command" value="load"></c:param>
                        <c:param name="pNameRecord" value="${ticket.pNameRecord}"></c:param>
                    </c:url>
                    <c:url value="ticketController" var="deleteLink">
                        <c:param name="command" value="delete"></c:param>
                        <c:param name="pNameRecord" value="${ticket.pNameRecord}"></c:param>
                    </c:url>

                    <tr>
                        <td>${ticket.pNameRecord}</td>
                        <td>${ticket.dateReservation}</td>
                        <td>${ticket.flightID}</td>
                        <td>${ticket.journeyDate}</td>
                        <td>${ticket.ticketClass}</td>
                        <td>${ticket.bookingStatus}</td>
                        <td>${ticket.noPassengers}</td>
                        <td>${ticket.payAmount}</td>
                        <td>${ticket.accountID}</td>
                        <td>
                            <%--<c:if test="${isAdmin}">--%>
                            <c:if test="true">
                                <a href="${deleteLink}" onclick="if (!(confirm('Are you sure to delete?')))
                                        return false" class="btn btn-primary">Delete</a>
                                <a href="${loadLink}" class="btn btn-primary">Update</a>
                                </c:if>
                            </td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>

</html>