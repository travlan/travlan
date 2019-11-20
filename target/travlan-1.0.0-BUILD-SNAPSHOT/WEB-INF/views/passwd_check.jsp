<%@ page contentType = "text/html;charset=utf-8" %>
<%%>

<div class="container">
	<ul class="info-tab">
		<li class="active"><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
		<li><a class="immutable" href="myinfo">내 정보</a></li>
		<li><a class="immutable" href="scrap">스크랩 목록</a></li>
		<li><a class="immutable" href="secession">회원탈퇴</a></li>
	</ul>
	<span>비밀번호를 변경하시려면 현재 비밀번호를 입력하세요.</span>
	<form method="post" action="passwd_check">
		<div class="form-group">
			<label>비밀번호 입력</label>
			<input class="form-control" id="password" type="password" name="password" placeholder="비밀번호" />
			<div id="currentpassword"></div>
		</div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="goNext()">확인</button></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
	</form>
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
			$("#currentpassword").addClass('alert');
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
					done = true;
				} else {
					$("#currentpassword").text("잘못된 비밀번호입니다.");
					$("#currentpassword").removeClass('alert-success');
					$("#currentpassword").addClass('alert-danger');
					$("#password").css('border', '1px solid #f00');
				}
			});
		}
	});
</script>