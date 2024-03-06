<!DOCTYPE html>
<html>
    <head>
        <title>Registration Form</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="decorate/style2.css" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <div class="container">

            <header class="heading"> Registration Form</header><hr>

            <div class="row">
                <form action="register" method="post">

                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="fullname">Full Name :</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="text" name="fullname" id="fullname" placeholder="Enter your Full Name" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="username">Username :</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="text" name="username" id="username" placeholder="Enter your Username" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="pass">Password :</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="password" name="password" id="password" placeholder="Enter your Password" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="mail">Email :</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="email" name="email" id="email" placeholder="Enter your email" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="phone">Phone Number :</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="text" name="phoneNumber" id="phoneNumber" placeholder="Enter your Phone Number" class="form-control">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-xs-4">
                                <label class="address">Address :</label>
                            </div>
                            <div class="col-xs-8">
                                <input type="text" name="address" id="address" placeholder="Enter your Address" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-warning">Submit</button>
                    </div>

                </form>

            </div>
        </div>
    </body>
</html>

