<%@ page contentType = "text/html;charset=utf-8" %>

<div class="container">
	<ul class="info-tab">
		<li class="active"><a class="immutable" href="secession">회원탈퇴</a></li>
		<li><a class="immutable" href="myinfo">내 정보</a></li>
		<li><a class="immutable" href="scrap">스크랩 목록</a></li>
		<li><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
	</ul>
	<div class="container" data-aos="fade-right">
		<div class="form-group">
    		<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" readonly>
탈퇴 후 게시물과 댓글, 쪽지는 모두 삭제됩니다.
(삭제된 데이터는 복구할 수 없습니다.)
탈퇴 후 Travlan 사이트를 이용할 수 없습니다.
이에 동의하시면, 동의 후 탈퇴를 진행하세요.
    		</textarea>
  		</div>
		<form method="post" action="secession" onsubmit="return send()" name="frm">
			<div class="custom-control custom-checkbox mb-3">
			   <input id="agree" name="agree" value="1" type="checkbox" class="custom-control-input" required>
			   <label class="custom-control-label" for="agree">상기 내용에 동의하며 탈퇴를 진행합니다.</label>
			</div>
			<div class="form-group"><button class="btn btn-primary" type="submit">탈퇴</button></div>
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