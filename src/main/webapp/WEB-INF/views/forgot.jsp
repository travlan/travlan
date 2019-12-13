<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="login-dark">
    <form>
        <a class="font-classic text-title immutable" href="./">Travlan</a>
        <div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="idFindShow()">아이디 찾기</button></div>
		<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="pwFindShow()">비밀번호 찾기</button></div>
		<div id="id-layout" style="display:none;">
			<div id="id-form">
				<div class="form-group">
					<input class="form-control" type="email" id="id_email" placeholder="이메일" />
				</div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#exampleModal" onclick="idFind()">찾기</button></div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
			</div>
		</div>
		<div id="pw-layout" style="display:none;">
			<div id="pw-form">
				<div class="form-group">
					<input class="form-control" type="text" id="pw_id" placeholder="아이디" />
				</div>
				<div class="form-group">
					<input class="form-control" type="email" id="pw_email" placeholder="이메일" />
				</div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#exampleModal" onclick="pwFind()">찾기</button></div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="history.back()">취소</button></div>
			</div>
		</div>
		<a class="forgot" href="${pageContext.request.contextPath}/login">로그인하러 가기</a>
    </form>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Infomation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		  <div id="found"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<script>
	$("#modalCloseBtn").on("click", function(e){
		$('#myModal').hide();
	});
	
	function idFindShow() {
		$('#pw-layout').css('display', 'none');
		$('#id-layout').css('display', 'block');
	}
	
	function idFind() {
		if($('#id_email').val() == "") {
			$('#id_email').focus();
			alert("이메일을 입력하세요");
			return;
		}
		else {
			$.ajax({
				url: "find_id",
				data: { 'email' : $('#id_email').val() },
				type: "get",
			}).done(function (data) {
				console.log(data);
				if(data.result == 'N') {
					$('#myModal').show();
					$('#modal-title').text("아이디 찾기");
					$('#found').text("찾으시는 아이디는 존재하지 않습니다.");
					done = true;
				} else {
					$('#myModal').show();
					$('#modal-title').text("아이디 찾기");
					$('#found').text("찾으시는 아이디는 " + data.result + "입니다.");
					done = true;
				}
			});
		}
	}

	function pwFindShow() {
		$('#id-layout').css('display', 'none');
		$('#pw-layout').css('display', 'block');
	}
	
	function pwFind() {
		if($('#pw_id').val() == "") {
			$('#pw_id').focus();
			alert("아이디를 입력하세요");
			return;
		}
		if($('#pw_email').val() == "") {
			$('#pw_email').focus();
			alert("이메일을 입력하세요");
			return;
		}
		else {
			$.ajax({
				url: "find_passwd",
				data: { 'id' : $('#pw_id').val(), 'email' : $('#pw_email').val() },
				type: "get",
			}).done(function (data) {
				if(data.result == 'N') {
					$('#myModal').show();
					$('#modal-title').text("비밀번호 찾기");
					$('#found').text("찾으시는 비밀번호는 존재하지 않습니다.");
					done = true;
				} else {
					$('#myModal').show();
					$('#modal-title').text("비밀번호 찾기");
					$('#found').text("변경된 비밀번호를 이메일로 보냈습니다.");
					done = true;
				}
			});
		}
	}
</script>