<%@ page contentType = "text/html;charset=utf-8" %>

<div class="container">
	<ul class="info-tab">
		<li class="active"><a class="immutable" href="secession">회원탈퇴</a></li>
		<li><a class="immutable" href="myinfo">내 정보</a></li>
		<li><a class="immutable" href="scrap">스크랩 목록</a></li>
		<li><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
	</ul>
	<div class="container" data-aos="fade-right">
		<span>탈퇴 후 게시물과 댓글, 쪽지는 모두 삭제됩니다.</span><br>
		<span>(삭제된 데이터는 복구되지 않습니다.)</span><br>
		<span>탈퇴 후 Travlan 사이트를 이용할 수 없습니다.</span>
		<br><br>
		<span>이에 동의하시면, 동의 후 탈퇴를 진행하세요.</span>
		<form method="post" action="secession" onsubmit="return send()" name="frm">
			<div class="form-group">
				<input id="agree" type="checkbox" name="agree" value="1" ><label for="agree">위의 사항에 동의하며, 탈퇴를 진행합니다.</label>
			</div>
			<div class="form-group"><button class="btn btn-primary btn-block" type="submit">탈퇴</button></div>
			<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
		</form>
	</div>
</div>
<script>
	function send() {
		if(document.frm.agree.checked == false){
    		alert('안내사항을 확인하신 후, 동의해 주세요.'); 
      		return false; 
      	}
	}
</script>