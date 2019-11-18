<%@ page contentType = "text/html;charset=utf-8" %>
<%	
%>

<div>
	<h2>비밀번호 찾기</h2>
	<form method="post" action="passwd_find_Proc" onsubmit="return required(this)">
		<div class="form-group">
			<input class="form-control" type="text" name="id" placeholder="아이디" />
		</div>
		<div class="form-group">
			<input class="form-control" type="email" name="email" placeholder="이메일" />
		</div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="submit">찾기</button></div>
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
		if(f.email.value.length == 0) {
    		alert("이메일을 입력하세요");
		  	f.email.focus();
		  	return false;
	  	}
	}
</script>