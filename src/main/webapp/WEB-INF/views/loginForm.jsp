<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://static.blex.kr/assets/library/bootstrap.css">
    <link rel="stylesheet" href="https://baejino.com/baealex.css">
    <link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/login.css" rel="stylesheet">
</head>

<body>
    <div class="login-dark">
        <form method="post">
            <img src="${pageContext.request.contextPath}/assets/image/logo.png" width="100%">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
            <div class="form-group"><input class="form-control" type="email" name="email" placeholder="Email" /></div>
            <div class="form-group"><input class="form-control" type="password" name="password"
                    placeholder="Password" /></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="button"
                    onclick="location.href='./'">Log In</button></div>
            <a class="forgot" href="#">Forgot your email or password?</a>
        </form>
    </div>
    <script src="https://static.blex.kr/assets/library/jquery.js"></script>
    <script src="https://static.blex.kr/assets/library/bootstrap.js"></script>
</body>

</html>