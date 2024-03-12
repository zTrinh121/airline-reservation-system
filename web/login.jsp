<!DOCTYPE html>
<html>
<head>
    <title>HOMEFLIGHT LOGIN</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <<link rel="stylesheet" href="decorate/style.css"/>
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <header class="heading text-center" >WELCOME TO HOMEFLIGHT</header>
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <header class="sub-heading text-center" style="font-size: 36px;color: #FF9966">LOGIN</header>
            <form id="login-form" class="form" action="Login" method="post">
                <div class="form-group">
                    <label for="username" class="text-info">Username:</label>
                    <input type="text" name="username" id="username" class="form-control">
                </div>
                <div class="form-group">
                    <label for="password" class="text-info">Password:</label>
                    <input type="password" name="password" id="password" class="form-control">
                </div>
                <div class="form-group row">
                    <div class="col-xs-6">
                        <div class="checkbox " style="width: 500px"  >
                            <label>
                                <input type="checkbox" name="remember_me" id="remember_me"> <span class="text-info">Remember me</span>
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-6 text-right">
                        <a href="register.jsp" class="register-link">Register here</a>
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" name="login" class="btn btn-info btn-login" value="Login">
                    <input type="hidden" name="action" value="login">
                </div>
            </form>
        </div>
    </div>
</body>
</html>
