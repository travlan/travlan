<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="login-dark">
    <form method="post" action="${pageContext.request.contextPath}/signup">
		<img src="assets/image/logo.png" width="100%">
		<h2 class="sr-only">Login Form</h2>
		<div class="illustration">
			<i class="icon ion-ios-locked-outline"></i>
		</div>
		<div class="form-group">
			<input class="form-control" type="text" name="id" placeholder="아이디" />
		</div>
		<div class="form-group">
			<input class="form-control" type="password" name="password" placeholder="비밀번호" />
		</div>
		<div class="form-group">
			<input class="form-control" type="password" name="password" placeholder="비밀번호 확인" />
		</div>
		<div class="form-group">
			<input class="form-control" type="email" name="email" placeholder="이메일" />
		</div>
		<div class="form-group">
			<input class="form-control" type="text" name="nickname" placeholder="닉네임" />
		</div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button">회원가입</button></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
	</form>
</div>