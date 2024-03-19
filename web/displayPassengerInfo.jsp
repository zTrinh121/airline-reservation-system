<%-- 
    Document   : displayPassengerInfo
    Created on : Mar 12, 2024, 9:59:34 PM
    Author     : ThanhThuy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <h1>Confirm information passenger</h1>
        <form action="ticketController" method="get">
            <input type="hidden" value="checkout" name="command" />

            <table border="1">
                <thead>
                    <tr>
                        <th>Passenger Name</th>
                        <th>Passenger Age</th>
                        <th>Passenger Gender</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="passenger" items="${sessionScope.passengers}">
                        <tr>
                            <td>${passenger.pName}</td>
                            <td>${passenger.age}</td>
                            <td>${passenger.gender}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button type="submit" class="btn btn-primary">Confirm</button>
        </form>
        <jsp:include page="footer.jsp" />

    </body>
</html>
