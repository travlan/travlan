<%@ page contentType = "text/html;charset=utf-8" %>
<%	
%>

<div class="login-dark">
    <form>
        <img src="assets/image/logo.png" width="100%">
        <div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="idFindShow()">아이디 찾기</button></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="pwFindShow()">비밀번호 찾기</button></div>
		<div id="id-layout" style="display:none;">
			<h2>아이디 찾기</h2>
			<div id="id-form">
				<div class="form-group">
					<input class="form-control" type="email" name="email" placeholder="이메일" />
				</div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="idFind()">찾기</button></div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
			</div>
		</div>
		<div id="pw-layout" style="display:none;">
			<h2>비밀번호 찾기</h2>
			<div id="pw-form">
				<div class="form-group">
					<input class="form-control" type="text" name="id" placeholder="아이디" />
				</div>
				<div class="form-group">
					<input class="form-control" type="email" name="email" placeholder="이메일" />
				</div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="pwFind()">찾기</button></div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
			</div>
		</div>
    </form>
</div>

<script>
	function idFindShow() {
		$('#pw-layout').css('display', 'none');
		$('#id-layout').css('display', 'block');
	}
	
	function idFind() {
		if($('#id-form[name="email"]').val() == "") {
			$('#id-form[name="email"]').focus();
			alert("이메일을 입력하세요");
			return;
		}
		else {
			$.ajax({
				url: "find_id",
				data: { 'email' : $('#id-form[name="email"]').val() },
				type: "get",
			}).done(function (data) {
				console.log(data);
			});
		}
	}

	function pwFindShow() {
		$('#id-layout').css('display', 'none');
		$('#pw-layout').css('display', 'block');
	}
	
	function pwFind() {
		if($('#pw-form[name="id"]').val() == "") {
			$('#pw-form[name="id"]').focus();
			alert("아이디를 입력하세요");
			return;
		}
		if($('#pw-form[name="email"]').value == "") {
			$('#pw-form[name="email"]').focus();
			alert("이메일을 입력하세요");
			return;
		}
		else {
			$.ajax({
				url: "",
				data: {  },
				type: "get",
			}).done(function (data) {

			});
		}
	}
</script>