<%@ page contentType = "text/html;charset=utf-8" %>

<section class="clean-block clean-post dark">
	<div class="container">
		<%@ include file="include/menutop.jsp" %>
		
		<div class="block-content mt-4" data-aos="fade-up-right">
			<div class="form-group">
    			<textarea class="form-control" id="exampleFormControlTextarea1" rows="10" readonly>
1. 탈퇴 후 회원정보는 모두 삭제됩니다.
2. 사이트에 등록된 게시글 및 댓글은 삭제되지 않습니다.
(삭제를 원하는 게시글 및 댓글은 반드시 탈퇴하기 전에 삭제하시기 바랍니다.
탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
삭제된 데이터는 복구할 수 없습니다.)
3. 탈퇴 후 Travlan 사이트를 이용할 수 없습니다.
이에 동의하시면, 동의 후 탈퇴를 진행하세요.
    			</textarea>
  			</div>
			<form method="post" action="secession" onsubmit="return send()" name="frm">
				<div class="custom-control custom-checkbox mb-3">
				   <input id="agree" name="agree" value="1" type="checkbox" class="custom-control-input" required>
				   <input type="hidden" name="id" value="${sessionScope.id}">
				   <label class="custom-control-label" for="agree">상기 내용에 동의하며 탈퇴를 진행합니다.</label>
				</div>
				<div class="form-group"><button class="btn btn-dark btn-block" type="submit">탈퇴</button></div>
			</form>
		</div>
	</div>
</section>
<script>
	function send() {
		if(document.frm.agree.checked == false){
    		alert('안내사항을 확인하신 후, 동의해 주세요.'); 
      		return false; 
      	}
	}
</script>