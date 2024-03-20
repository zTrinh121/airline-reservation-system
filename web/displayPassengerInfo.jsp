<%-- 
    Document   : displayPassengerInfo
    Created on : Mar 12, 2024, 9:59:34 PM
    Author     : ThanhThuy
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="flightList" class="dao.FlightDAO" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>HomeFlight</title>
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
        <link rel="stylesheet" type="text/css" href="styles/addFlightPassenger.scss">

    </head>

    <body>

        <div class="super_container">
            <jsp:include page="header.jsp"/>
            <div class="search">
                <div class="search_inner">
                    <div class="container fill_height">
                        <div class="row fill_height">
                            <div class="col fill_height">
                                <div class="search_panel active" style="margin-top: 10px; margin-bottom: 20px;">

                                    <form action="ticketController" method="get">
                                        <!-- Font Awesome -->
                                        <input type="hidden" value="checkout" name="command" />
                                        <div class="main" style="position: static;">
                                            <c:set var="count" value="1" />
                                            <h1>INFORMATION OF PASSENGER</h1>

                                            <c:forEach var="passenger" items="${sessionScope.passengers}">
                                                <div class="containerPassenger">

                                                    <div class="heading">
                                                        <h1>PASSENGER ${count}</h1>
                                                    </div>
                                                    <label for="name${count}">Passenger's Name</label>
                                                    <input type="text" id="name${count}" name="passengerName" placeholder="Name" value="${passenger.pName}" readonly="">
                                                    <br>
                                                    <label for="age${count}">Passenger's Age</label>
                                                    <input type="number" id="age${count}" name="passengerAge" placeholder="Age number" value="${passenger.age}" readonly="">
                                                    <br>
                                                    <label for="gender${count}">Passenger's Gender</label>
                                                    <input type="text" id="gender${count}" name="passengerGender" placeholder="Gender" value="${passenger.gender}" readonly="">
                                                    <br>
                                                    <c:set var="count" value="${count + 1}" />
                                                    <br>
                                                </div>

                                            </c:forEach>
                                        </div>
                                        <div class="btn">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M12.8768 16.1682C13.0292 15.7535 13.6375 15.7535 13.7899 16.1682L14.2066 17.3023C14.2554 17.435 14.3637 17.5395 14.5013 17.5865L15.6774 17.9884C16.1075 18.1353 16.1075 18.7218 15.6774 18.8688L14.5013 19.2706C14.3637 19.3177 14.2554 19.4221 14.2066 19.5549L13.7899 20.6889C13.6375 21.1037 13.0292 21.1037 12.8768 20.6889L12.4601 19.5549C12.4113 19.4221 12.303 19.3177 12.1653 19.2706L10.9892 18.8688C10.5591 18.7218 10.5591 18.1353 10.9892 17.9884L12.1653 17.5865C12.303 17.5395 12.4113 17.435 12.4601 17.3023L12.8768 16.1682Z" stroke="#1B1B1B" stroke-width="1.5" stroke-linejoin="round"/>
                                            <path d="M14.6394 3.47278C14.8711 2.84241 15.7956 2.84241 16.0272 3.47278L16.8211 5.63332C16.8953 5.8351 17.0599 5.99384 17.2691 6.06534L19.5097 6.83089C20.1634 7.05426 20.1634 7.94574 19.5097 8.16911L17.2691 8.93466C17.0599 9.00616 16.8953 9.1649 16.8211 9.36668L16.0272 11.5272C15.7956 12.1576 14.8711 12.1576 14.6394 11.5272L13.8455 9.36668C13.7714 9.1649 13.6068 9.00616 13.3975 8.93466L11.157 8.16911C10.5032 7.94574 10.5032 7.05426 11.157 6.83089L13.3975 6.06534C13.6068 5.99384 13.7714 5.8351 13.8455 5.63332L14.6394 3.47278Z" stroke="#1B1B1B" stroke-width="1.5" stroke-linejoin="round"/>
                                            <path d="M6.48641 9.36289C6.65786 8.87904 7.34214 8.87904 7.51358 9.36289L7.9824 10.686C8.03728 10.8409 8.15913 10.9627 8.31401 11.0176L9.63711 11.4864C10.121 11.6579 10.121 12.3421 9.63711 12.5136L8.31401 12.9824C8.15913 13.0373 8.03728 13.1591 7.9824 13.314L7.51358 14.6371C7.34214 15.121 6.65786 15.121 6.48641 14.6371L6.0176 13.314C5.96272 13.1591 5.84087 13.0373 5.68599 12.9824L4.36289 12.5136C3.87904 12.3421 3.87904 11.6579 4.36289 11.4864L5.68599 11.0176C5.84087 10.9627 5.96272 10.8409 6.0176 10.686L6.48641 9.36289Z" stroke="#1B1B1B" stroke-width="1.5" stroke-linejoin="round"/>
                                            </svg>
                                            <button class="btn1"  type="submit"id="submit">Confirm</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>		
                    </div>

                </div>

            </div>
            <jsp:include page="footer.jsp" />
        </div>

    </body>
</html>
