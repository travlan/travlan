<%@ page contentType = "text/html;charset=utf-8" %>
<%%>

<div>
	<span>비밀번호를 변경하시려면 현재 비밀번호를 입력하세요.</span>
	<form method="post" action="passwd_check">
		<div class="form-group">
			<label>비밀번호 입력</label>
			<input class="form-control" id="password" type="password" name="password" placeholder="비밀번호" />
		</div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="submit">확인</button></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
	</form>
</div>