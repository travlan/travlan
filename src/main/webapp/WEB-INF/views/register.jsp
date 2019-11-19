<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="login-dark">
    <form method="post" action="register" onsubmit="return required(this)">
		<img src="assets/image/logo.png" width="100%">
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
	$("#id").focusout(function(){
		var id = $("#id").val();
		if(id != "") {
			$("#idcheck").addClass('alert');
			$.ajax({
				url: "idcheck",
				data: { "id" : $("#id").val() },
				type: "get",
			}).done(function (data) {
				if(data.flag == 'Y') {
					$("#idcheck").text("사용할 수 있는 아이디입니다.");
					$("#idcheck").removeClass('alert-danger');
					$("#idcheck").addClass('alert-success');
					$("#id").css('border', '1px solid #080');
				} else {
					$("#idcheck").text("이미 등록된 아이디입니다.");
					$("#idcheck").removeClass('alert-success');
					$("#idcheck").addClass('alert-danger');
					$("#id").css('border', '1px solid #f00');
				}
			});
		}
	});
	
	$("#email").focusout(function(){
		var email = $("#email").val();
		if(email != "") {
			$("#emailcheck").addClass('alert');
			$.ajax({
				url: "emailcheck",
				data: { "email" : $("#email").val() },
				type: "get",
			}).done(function (data) {
				if(data.flag == 'Y') {
					$("#emailcheck").text("사용할 수 있는 이메일입니다.");
					$("#emailcheck").removeClass('alert-danger');
					$("#emailcheck").addClass('alert-success');
					$("#email").css('border', '1px solid #080');
				} else {
					$("#emailcheck").text("이미 등록된 이메일입니다.");
					$("#emailcheck").removeClass('alert-success');
					$("#emailcheck").addClass('alert-danger');
					$("#email").css('border', '1px solid #f00');
				}
			});
		}
	});
	
	$("#password_chk").focusout(function(){
		var password = $("#password").val();
		var passcheck = $("#password_chk").val();
		if(password != "" && passcheck != "") {
			$("#passwordcheck").addClass('alert');
			if(password == passcheck) {
				$("#passwordcheck").text("비밀번호가 일치합니다.");
				$("#passwordcheck").removeClass('alert-danger');
				$("#passwordcheck").addClass('alert-success');
			} else {
				$("#passwordcheck").text("비밀번호가 일치하지 않습니다.");
				$("#passwordcheck").removeClass('alert-success');
				$("#passwordcheck").addClass('alert-danger');
			}
		}
	});
	
	$("#nickname").focusout(function(){
		var nickname = $("#nickname").val();
		if(nickname != "") {
			$("#nicknamecheck").addClass('alert');
			$.ajax({
				url: "nicknamecheck",
				data: { "nickname" : $("#nickname").val() },
				type: "get",
			}).done(function (data) {
				if(data.flag == 'Y') {
					$("#nicknamecheck").text("사용할 수 있는 닉네임입니다.");
					$("#nicknamecheck").removeClass('alert-danger');
					$("#nicknamecheck").addClass('alert-success');
					$("#nickname").css('border', '1px solid #080');
				} else {
					$("#nicknamecheck").text("이미 등록된 닉네임입니다.");
					$("#nicknamecheck").removeClass('alert-success');
					$("#nicknamecheck").addClass('alert-danger');
					$("#nickname").css('border', '1px solid #f00');
				}
			});
		}
	});
</script>
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