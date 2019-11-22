<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="login-dark">
    <form method="post"
  		  action="${pageContext.request.contextPath}/login"
		  onsubmit="return required(this)">
        <a href="./"><img src="assets/image/logo.png" width="100%"></a>
        <h2 class="sr-only">Login Form</h2>
        <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
        <div class="form-group"><input class="form-control" type="text" name="id" placeholder="ID" /></div>
        <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" /></div>
		<c:if test="${msg == 'failure'}">
			<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
		</c:if>
        <div class="form-group"><button class="btn btn-primary btn-block" type="submit">로그인</button></div>
        <div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="location.href='register'">회원가입</button></div>
        <a class="forgot" href="${pageContext.request.contextPath}/forgot">아이디 혹은 비밀번호를 잊으셨나요?</a>
    </form>
</div>

<script>
	function required(f) {
		if(f.id.value.length == 0) {
    		alert("아이디를 입력하세요");
		  	f.id.focus();
		  	return false;
	  	}
		if(f.password.value.length == 0) {
    		alert("비밀번호를 입력하세요");
		  	f.password.focus();
		  	return false;
	  	}
	}
</script>