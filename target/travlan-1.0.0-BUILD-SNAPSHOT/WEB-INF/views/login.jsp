<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="login-dark">
    <form method="post"
  		action="${pageContext.request.contextPath}/login">
        <img src="assets/image/logo.png" width="100%">
        <h2 class="sr-only">Login Form</h2>
        <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
        <div class="form-group"><input class="form-control" type="text" name="id" placeholder="ID" /></div>
        <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" />
        </div>
        <div class="form-group"><button class="btn btn-primary btn-block" type="submit">로그인</button></div>
        <div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="location.href='register'">회원가입</button></div>
        <a class="forgot" href="${pageContext.request.contextPath}/forgot">비밀번호 혹은 아이디를 잊으셨나요?</a>
    </form>
</div>