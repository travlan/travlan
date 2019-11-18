<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="login-dark">
    <form method="post" action="register">
		<img src="assets/image/logo.png" width="100%">
		<h2 class="sr-only">Login Form</h2>
		<div class="illustration">
			<i class="icon ion-ios-locked-outline"></i>
		</div>
		<div class="form-group">
			<input class="form-control" id="id" type="text" name="id" placeholder="아이디" />
			<div id="idcheck"></div>
		</div>
		<div class="form-group">
			<input class="form-control" type="password" name="password" placeholder="비밀번호" />
		</div>
		<div class="form-group">
			<input class="form-control" type="password" name="password_chk" placeholder="비밀번호 확인" />
		</div>
		<div class="form-group">
			<input class="form-control" type="email" name="email" placeholder="이메일" />
			<div id="emailcheck"></div>
		</div>
		<div class="form-group">
			<input class="form-control" type="text" name="nickname" placeholder="닉네임" />
		</div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="submit">회원가입</button></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
	</form>
</div>
<script >
	$("#id").focusout(function(){
		$.ajax({
			url: "idcheck",
			data: { "id" : $("#id").val() },
			type: "get",
		}).done(function (data) {
			$("#idcheck").text(data.str);
		});
	});
	
	$("#email").focusout(function(){
		$.ajax({
			url: "emailcheck",
			data: { "email" : $("#email").val() },
			type: "get",
		}).done(function (data) {
			$("#emailcheck").text(data.str);
		});
	});
</script>