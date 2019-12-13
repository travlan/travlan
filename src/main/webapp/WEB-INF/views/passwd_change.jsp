<%@ page contentType = "text/html;charset=utf-8" %>

<style>
	.red-box {
		border: 1px solid #f00;
	}
</style>

<section class="clean-block clean-post dark">
	<div class="container">
		<%@ include file="include/menutop.jsp" %>
		
		<div class="block-content mt-4 p-4" data-aos="fade-up-right">
			<form method="post" action="passwd_change">
				<div class="form-group">
					<label>비밀번호</label>
					<input class="form-control" id="password" type="password" name="password" placeholder="비밀번호" required/>
					<div id="oldpassword"></div>
				</div>
				<div class="form-group">
					<label>비밀번호 확인</label>
					<input class="form-control" id="password_chk" type="password" name="password_chk" placeholder="비밀번호 확인" required/>
					<div id="passwordcheck"></div>
				</div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="submit">변경</button></div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
			</form>
		</div>
	</div>
</section>

<script>
	$("#password").focusout(function() {
		var password = $("#password").val();
		if(password != "") {
			$("#oldpassword").addClass('alert');
			$.ajax({
				url: "oldpassword",
				data: { "password" : $("#password").val() },
				type: "get",
			}).done(function (data) {
				if(data.flag == 'Y') {
					$("#oldpassword").text("사용할 수 없는 비밀번호입니다.");
					$("#oldpassword").addClass('alert-danger');
					$("#password").addClass('red-box');
				} else {
					$("#oldpassword").text("");
					$("#oldpassword").removeClass('alert');
					$("#oldpassword").removeClass('alert-danger');
					$("#password").removeClass('red-box');
					
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
				}
			});
		}
	})
</script>