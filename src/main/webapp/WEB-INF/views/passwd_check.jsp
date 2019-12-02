<%@ page contentType = "text/html;charset=utf-8" %>
<%%>

<div class="container">
	<ul class="info-tab">
		<li class="active"><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
		<li><a class="immutable" href="myinfo">내 정보</a></li>
		<li><a class="immutable" href="profile?num=${sessionScope.num}">내가 쓴 글/댓글 목록</a></li>
		<li><a class="immutable" href="scraplist">스크랩 목록</a></li>
		<li><a class="immutable" href="secession">회원탈퇴</a></li>
	</ul>
	<div data-aos="fade-right">
		<div id="currentpassword" class="alert alert-primary">패스워드를 변경하려면 현재 비밀번호를 입력하십시오.</div>
		<div class="form-inline">
			<div class="form-group mx-sm-4 mb-2">
			    <label for="inputPassword2" class="sr-only">Password</label>
			    <input type="password" class="form-control" id="password" type="password" name="password" placeholder="비밀번호">
			</div>
			<button type="submit" class="btn btn-primary mb-2" type="button" id="passwd_change_btn" onclick="checkPassword()">비밀번호 확인</button>
		</div>
	</div>
</div>

<script>
	function checkPassword() {
		var password = $("#password").val();
		if(password != "") {
			$.ajax({
				url: "currentpassword",
				data: { "password" : $("#password").val() },
				type: "get",
			}).done(function (data) {
				$("#currentpassword").removeClass('alert-primary');
				if(data.flag == 'Y') {
					$("#currentpassword").text("올바른 비밀번호입니다.");
					$("#currentpassword").removeClass('alert-danger');
					$("#currentpassword").addClass('alert-success');
					$("#password").css('border', '1px solid #080');
					$("#passwd_change_btn").removeClass('btn-primary btn-danger');
					$("#passwd_change_btn").addClass('btn-success');
					location.href="passwd_change";
				} else {
					$("#currentpassword").text("잘못된 비밀번호입니다.");
					$("#currentpassword").removeClass('alert-success');
					$("#currentpassword").addClass('alert-danger');
					$("#password").css('border', '1px solid #f00');
					$("#passwd_change_btn").removeClass('btn-primary btn-success');
					$("#passwd_change_btn").addClass('btn-danger');
				}
			});
		}
	}
</script>