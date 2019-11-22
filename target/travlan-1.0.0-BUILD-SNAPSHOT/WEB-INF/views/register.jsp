<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="login-dark">
    <form method="post" action="register" onsubmit="return required(this)">
		<a href="./"><img src="assets/image/logo.png" width="100%"></a>
		<h2 class="sr-only">Login Form</h2>
		<div class="illustration">
			<i class="icon ion-ios-locked-outline"></i>
		</div>
		<div class="form-group">
			<input class="form-control" id="id" type="text" name="id" placeholder="아이디" />
		</div>
		<div id="idcheck"></div>
		<div class="form-group">
			<input class="form-control" id="password" type="password" name="password" placeholder="비밀번호" />
		</div>
		<div class="form-group">
			<input class="form-control" id="password_chk" type="password" name="password_chk" placeholder="비밀번호 확인" />
		</div>
		<div id="passwordcheck"></div>
		<div class="form-group">
			<input class="form-control" id="email" type="email" name="email" placeholder="이메일" />
		</div>
		<div id="emailcheck"></div>
		<div class="form-group">
			<input class="form-control" id="nickname" type="text" name="nickname" placeholder="닉네임" />
		</div>
		<div id="nicknamecheck"></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="submit">회원가입</button></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
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
		if(f.password_chk.value.length == 0) {
    		alert("비밀번호를 확인하세요");
		  	f.password_chk.focus();
		  	return false;
		}
		if(f.email.value.length == 0) {
    		alert("이메일을 입력하세요");
		  	f.email.focus();
		  	return false;
	  	}
		if(f.nickname.value.length == 0) {
    		alert("닉네임을 입력하세요");
		  	f.nickname.focus();
		  	return false;
	  	}
	}
</script>
<script src="assets/register.js"></script>