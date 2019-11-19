<%@ page contentType = "text/html;charset=utf-8" %>
<%%>

<div>
	<form method="post" action="passwd_change">
		<div class="form-group">
			<label>비밀번호</label>
			<input class="form-control" id="password" type="password" name="password" placeholder="비밀번호" />
		</div>
		<div class="form-group">
			<label>비밀번호 확인</label>
			<input class="form-control" id="password_chk" type="password" name="password_chk" placeholder="비밀번호 확인" />
		</div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="submit">변경</button></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
	</form>
</div>