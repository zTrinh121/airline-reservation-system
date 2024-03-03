<%-- 
    Document   : addJet
    Created on : Mar 2, 2024, 10:33:44 PM
    Author     : Trinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Jet Page</title>
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">

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
    </head>
    <body>
        <h1>Enter the jet details</h1>
        <form action="add-jet" method="post">
            <div class="form-group">
                <label for="exampleInputEmail1">Enter jet ID</label>
                <input type="text" class="form-control" nam="jetId" aria-describedby="emailHelp" placeholder="Ex:VN101">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Enter jet type</label>
                <input type="text" class="form-control" nam="jetType" placeholder="Jet type">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Enter total capacity</label>
                <input type="text" class="form-control" nam="capacity" placeholder="Total capacity">
            </div>
            <button type="submit" class="btn btn-primary" >Submit</button>
        </form>

    </body>
</html>
