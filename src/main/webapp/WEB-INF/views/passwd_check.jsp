<%@ page contentType = "text/html;charset=utf-8" %>
<%%>

<div class="container">
	<ul class="info-tab">
		<li class="active"><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
		<li><a class="immutable" href="myinfo">내 정보</a></li>
		<li><a class="immutable" href="scrap">스크랩 목록</a></li>
		<li><a class="immutable" href="secession">회원탈퇴</a></li>
	</ul>
	<div data-aos="fade-right">
		<div id="currentpassword" class="alert alert-primary">패스워드를 변경하려면 현재 비밀번호를 입력하십시오.</div>
		<form class="form-inline" method="post" action="passwd_check">
			<div class="form-group mx-sm-4 mb-2">
			    <label for="inputPassword2" class="sr-only">Password</label>
			    <input type="password" class="form-control" id="password" type="password" name="password" placeholder="비밀번호">
			</div>
			<button type="submit" class="btn btn-primary mb-2" type="button" id="passwd_change_btn" disabled onclick="goNext()">비밀번호 확인</button>
		</form>
	</div>
</div>

<script>
	var done = false;
	function goNext() {
		if(done) {
			location.href="passwd_change";
		} else {
			alert("잘못된 비밀번호입니다.");
			$("#currentpassword").focus();
		}
	}
	$("#password").focusout(function(){
		var password = $("#password").val();
		if(password != "") {
			$("#currentpassword").removeClass('alert-primary');
			$.ajax({
				url: "currentpassword",
				data: { "password" : $("#password").val() },
				type: "get",
			}).done(function (data) {
				if(data.flag == 'Y') {
					$("#currentpassword").text("올바른 비밀번호입니다.");
					$("#currentpassword").removeClass('alert-danger');
					$("#currentpassword").addClass('alert-success');
					$("#password").css('border', '1px solid #080');
					$("#passwd_change_btn").attr('disabled', false);
					done = true;
				} else {
					$("#currentpassword").text("잘못된 비밀번호입니다.");
					$("#currentpassword").removeClass('alert-success');
					$("#currentpassword").addClass('alert-danger');
					$("#password").css('border', '1px solid #f00');
					$("#passwd_change_btn").attr('disabled', true);
				}
			});
		}
	});
</script>