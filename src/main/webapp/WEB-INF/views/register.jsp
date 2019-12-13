<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="login-dark">
    <form method="post" action="register">
		<a class="font-classic text-title immutable" href="./">Travlan</a>
		<h2 class="sr-only">Login Form</h2>
		<div class="illustration">
			<i class="icon ion-ios-locked-outline"></i>
		</div>
		<div class="form-group">
			<input class="form-control" id="id" type="text" name="id" placeholder="아이디" required />
		</div>
		<div id="idcheck"></div>
		<div class="form-group">
			<input class="form-control" id="password" type="password" name="password" placeholder="비밀번호" required />
		</div>
		<div class="form-group">
			<input class="form-control" id="password_chk" type="password" name="password_chk" placeholder="비밀번호 확인" required />
		</div>
		<div id="passwordcheck"></div>
		<div class="form-group">
			<input class="form-control" id="email" type="email" name="email" placeholder="이메일" required />
		</div>
		<div id="emailcheck"></div>
		<div class="form-group">
			<input class="form-control" id="nickname" type="text" name="nickname" placeholder="닉네임" required />
		</div>
		<div id="nicknamecheck"></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="submit">회원가입</button></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
	</form>
</div>
<script src="assets/js/register.js"></script>