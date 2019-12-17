<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<section class="clean-block clean-post dark">
	<div class="container">
		<%@ include file="include/menutop.jsp" %>
		
		<div class="block-content mt-4 p-4" data-aos="fade-up-right">
			<div class="form-group row">
				<strong for="staticEmail" class="col-sm-2 col-form-label">아이디</strong>
				<div class="col-sm-10">
					<label class="col-sm-10">${sessionScope.id}</label>
				</div>
			</div>
			<div class="form-group row">
				<strong for="staticEmail" class="col-sm-2 col-form-label">닉네임</strong>
				<div class="col-sm-4" id="oldnickname">
					<label class="col-sm-4">${dto.nickname}</label>
				</div>
				<div class="col-sm-4" id="newnickname" style="display:none;">
					<input type="text" class="form-control-plaintext card" id="nickname" value="${dto.nickname}">
				</div>
				<div id="nicknamecheck"></div>
				<button class="btn btn-light" id="nickname_btn" type="button" onclick="updateNickname()">변경</button>
				<button style="display:none;" class="btn btn-light" id="nicknameSave_btn" type="button" onclick="saveNickname()">저장</button>
				<button style="display:none;" class="btn btn-light" id="nicknameCancel_btn" type="button" onclick="cancelNickname()">취소</button>
			</div>
			<div class="form-group row">
				<strong for="staticEmail" class="col-sm-2 col-form-label">이메일</strong>
				<div class="col-sm-10">
					<label class="col-sm-10">${dto.email}</label>
				</div>
			</div>
			<c:if test="${!is_info }">
				<button class="btn btn-light" id="infobox_btn" type="button" onclick="showInfobox()">추가정보를 입력하세요!</button>
			</c:if>
		</div>
		<c:choose>
			<c:when test="${is_info}">
				<div id="addInfo" class="block-content mt-4" data-aos="fade-up-right">
					<div class="p-4">
						<div class="form-group row" id="oldgender">
							<strong for="staticEmail" class="col-sm-2 col-form-label">성별</strong>
							<div class="col-sm-10">
								<label class="col-sm-10">${idto.gender}</label>
							</div>
						</div>
						<div class="form-group row" id="oldage">
							<strong for="staticEmail" class="col-sm-2 col-form-label">나이</strong>
							<div class="col-sm-10">
								<label class="col-sm-10">${idto.age}대</label>
							</div>
						</div>
						<div class="form-group row" id="oldregion">
							<strong for="staticEmail" class="col-sm-2 col-form-label">사는곳</strong>
							<div class="col-sm-10">
								<label class="col-sm-10">${idto.region}</label>
							</div>
						</div>
						<div class="form-group row" id="oldtype">
							<strong for="staticEmail" class="col-sm-2 col-form-label">선호도</strong>
							<label class="col-sm-10">
								<div class="col-sm-10">
									<c:choose>
										<c:when test="${fn:substring(idto.type, 0, 1) == 'A'}">빡빡</c:when>
										<c:when test="${fn:substring(idto.type, 0, 1) == 'B'}">느긋</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${fn:substring(idto.type, 1, 2) == 'A'}">주간</c:when>
										<c:when test="${fn:substring(idto.type, 1, 2) == 'B'}">야간</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${fn:substring(idto.type, 2, 3) == 'A'}">활기</c:when>
										<c:when test="${fn:substring(idto.type, 2, 3) == 'B'}">조용</c:when>
									</c:choose>
								</div>
							</label>
						</div>
					</div>
					<button class="btn btn-dark btn-block" id="additional_btn" type="button" onclick="updateAdditional()">추가정보 변경</button>
				</div>
					
				<div id="updateInfo" class="block-content mt-4" data-aos="fade-up-right" style="display: none;">
					<div class="p-4">
						<form method="post" action="updateAdditionalInfo" onsubmit="return required(this)">
							<div class="col-xs-3" id="addtional">
									<input type="hidden" name="num" value="${num}">
									
									<strong>성별</strong>
									<div class="form-group">
										<div class="form-check form-check-inline">
											<input type="radio" class="m-2" name="gender" value="M" ${idto.gender eq '남성' ? 'checked' : ''}>남성<br>
											<input type="radio" class="m-2" name="gender" value="F" ${idto.gender eq '여성' ? 'checked' : ''}>여성<br>
										</div>
									</div>
									<strong>나이</strong>
									<div class="form-group">
										<select id="age" class="form-control" name="age">
											<option value="10" ${idto.age eq '10' ? 'selected' : ''}>10대</option>
											<option value="20" ${idto.age eq '20' ? 'selected' : ''}>20대</option>
											<option value="30" ${idto.age eq '30' ? 'selected' : ''}>30대</option>
											<option value="40" ${idto.age eq '40' ? 'selected' : ''}>40대</option>
											<option value="50" ${idto.age eq '50' ? 'selected' : ''}>50대</option>
											<option value="60" ${idto.age eq '60' ? 'selected' : ''}>60대</option>
											<option value="70" ${idto.age eq '70' ? 'selected' : ''}>70대</option>
											<option value="80" ${idto.age eq '80' ? 'selected' : ''}>80대</option>
										</select>
									</div>
									<strong>선호도</strong>
									<div class="form-group">
										<select id="type1" class="form-control" name="type1">
											<option value="A"<c:if test="${fn:substring(idto.type, 0, 1) == 'A'}">selected</c:if> >빡빡한 일정을 좋아해요</option>
											<option value="B"<c:if test="${fn:substring(idto.type, 0, 1) == 'B'}">selected</c:if> >느슨한 일정을 좋아해요</option>
										</select>
									</div>
									<div class="form-group">
										<select id="type2" class="form-control" name="type2">
											<option value="A"<c:if test="${fn:substring(idto.type, 1, 2) == 'A'}">selected</c:if> >주간 여행을 좋아해요</option>
											<option value="B"<c:if test="${fn:substring(idto.type, 1, 2) == 'B'}">selected</c:if> >야간 여행을 좋아해요</option>
										</select>
									</div>
									<div class="form-group">
										<select id="type3" class="form-control" name="type3">
											<option value="A"<c:if test="${fn:substring(idto.type, 2, 3) == 'A'}">selected</c:if> >활기찬 분위기를 선호해요</option>
											<option value="B"<c:if test="${fn:substring(idto.type, 2, 3) == 'B'}">selected</c:if> >조용한 분위기를 선호해요</option>
										</select>
									</div>
									<strong>거주 지역</strong>
									<div class="form-group">
										<select id="province" class="form-control" name="province">
											<option value="서울"<c:if test="${fn:substringBefore(idto.region, ' ') == '서울'}">selected</c:if> >서울특별시</option>
											<option value="강원"<c:if test="${fn:substringBefore(idto.region, ' ') == '강원'}">selected</c:if> >강원도</option>
											<option value="대전"<c:if test="${fn:substringBefore(idto.region, ' ') == '대전'}">selected</c:if> >대전광역시</option>
											<option value="충남"<c:if test="${fn:substringBefore(idto.region, ' ') == '충남'}">selected</c:if> >충청남도</option>
											<option value="충북"<c:if test="${fn:substringBefore(idto.region, ' ') == '충북'}">selected</c:if> >충청북도</option>
											<option value="인천"<c:if test="${fn:substringBefore(idto.region, ' ') == '인천'}">selected</c:if> >인천광역시</option>
											<option value="경기"<c:if test="${fn:substringBefore(idto.region, ' ') == '경기'}">selected</c:if> >경기도</option>
											<option value="광주"<c:if test="${fn:substringBefore(idto.region, ' ') == '광주'}">selected</c:if> >광주광역시</option>
											<option value="전남"<c:if test="${fn:substringBefore(idto.region, ' ') == '전남'}">selected</c:if> >전라남도</option>
											<option value="전북"<c:if test="${fn:substringBefore(idto.region, ' ') == '전북'}">selected</c:if> >전라북도</option>
											<option value="부산"<c:if test="${fn:substringBefore(idto.region, ' ') == '부산'}">selected</c:if> >부산광역시</option>
											<option value="경남"<c:if test="${fn:substringBefore(idto.region, ' ') == '경남'}">selected</c:if> >경상남도</option>
											<option value="경북"<c:if test="${fn:substringBefore(idto.region, ' ') == '경북'}">selected</c:if> >경상북도</option>
											<option value="울산"<c:if test="${fn:substringBefore(idto.region, ' ') == '울산'}">selected</c:if> >울산광역시</option>
											<option value="대구"<c:if test="${fn:substringBefore(idto.region, ' ') == '대구'}">selected</c:if> >대구광역시</option>
											<option value="제주"<c:if test="${fn:substringBefore(idto.region, ' ') == '제주'}">selected</c:if> >제주도</option>
										</select>
									</div>
									<div class="form-group">
										<select id="region_num" class="form-control" name="region_num"></select>
									</div>
								</div>
							<div id="done" class="form-group">
								<button class="btn btn-dark btn-block" type="submit">변경완료</button>
							</div>
							<div class="form-group">
								<button class="btn btn-dark btn-block" id="cancel" type="button" onclick="cancelInfo()">취소</button>
							</div>
						</form>
					</div>
				</div>
			</c:when>

			<c:otherwise>
				<div id="infobox" style="display: none;" data-aos="flip-up">
					<form method="post" action="inputAdditionalInfo" onsubmit="return required()">
						<div class="col-xs-3" id="addtional">
							<input type="hidden" name="num" value="${num}">

							<strong>성별</strong>
							<div class="form-group">
								<div class="form-check form-check-inline">
									<input type="radio" class="m-2" name="gender" value="M" checked>남자<br>
									<input type="radio" class="m-2" name="gender" value="F">여자<br>
								</div>
							</div>
							<strong>나이</strong>
							<div class="form-group">
								<select id="age" class="form-control" name="age">
									<option value="10" selected>10대</option>
									<option value="20">20대</option>
									<option value="30">30대</option>
									<option value="40">40대</option>
									<option value="50">50대</option>
									<option value="60">60대</option>
									<option value="70">70대</option>
									<option value="80">80대</option>
								</select>
							</div>
							<strong>선호도</strong>
							<div class="form-group">
								<select id="inputState" class="form-control" name="type1">
									<option value="A">빡빡한 일정을 좋아해요</option>
									<option value="B">느슨한 일정을 좋아해요</option>
								</select>
							</div>
							<div class="form-group">
								<select id="inputState" class="form-control" name="type2">
									<option value="A">주간 여행을 좋아해요</option>
									<option value="B">야간 여행을 좋아해요</option>
								</select>
							</div>
							<div class="form-group">
								<select id="inputState" class="form-control" name="type3">
									<option value="A">활기찬 분위기를 선호해요</option>
									<option value="B">조용한 분위기를 선호해요</option>
								</select>
							</div>
							<strong>거주 지역</strong>
							<div class="form-group">
								<select id="province" class="form-control" name="province">
									<option value="XX" selected>지역을 선택해주세요</option>
									<option value="서울">서울특별시</option>
									<option value="강원">강원도</option>
									<option value="대전">대전광역시</option>
									<option value="충남">충청남도</option>
									<option value="충북">충청북도</option>
									<option value="인천">인천광역시</option>
									<option value="경기">경기도</option>
									<option value="광주">광주광역시</option>
									<option value="전남">전라남도</option>
									<option value="전북">전라북도</option>
									<option value="부산">부산광역시</option>
									<option value="경남">경상남도</option>
									<option value="경북">경상북도</option>
									<option value="울산">울산광역시</option>
									<option value="대구">대구광역시</option>
									<option value="제주">제주도</option>
								</select>
							</div>
							<div class="form-group">
								<select id="region_num" class="form-control" name="region_num"></select>
							</div>
						</div>
						<div id="done" class="form-group">
							<button class="btn btn-dark btn-block" type="submit">완료</button>
						</div>
					</form>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</section>

<script>
	function required() {
		if($('#province option:selected').val() == 'XX') {
			alert('지역을 선택하세요.');
			return false;
		}
	}

	function showInfobox() {
		$('#infobox').css('display', 'block');
		$('#infobox_btn').css('visibility', 'hidden');
	}

	$("#province").change(function(){
		$.ajax({
            url: "getRegion",
            data: { "province" : $("#province").val() },
            type: "get",
        }).done(function (data) {
            var codes = "";
            $("#region_num").html("");
            $.each(data, function(index, item){
                codes += "<option value=" + item.num + ">" + item.region + "</option>"
            	$("#region_num").html(codes);
            });
		});
	});
	
	function updateNickname() {
		$('#nickname_btn').css('display', 'none');
		$('#oldnickname').css('display', 'none');
		$('#newnickname').css('display', 'block');
		$('#nicknameSave_btn').css('display', 'block');
		$('#nicknameCancel_btn').css('display', 'block');
	}
	
	function saveNickname() {
		if($('#nickname').val() == "") {
			$('#nickname').focus();
			alert("닉네임을 입력하세요");
			return;
		}
		else {
			$.ajax({
				url: "nicknamechange",
				data: { 'nickname' : $('#nickname').val() },
				type: "get",
			}).done(function (data) {
				if(data.flag == 'Y') {
					$('#nickname_btn').css('display', 'block');
					$('#oldnickname').css('display', 'block');
					$('#oldnickname').html('');
					$('#oldnickname').append('<label class="col-sm-4">' + data.nickname + '</label>');
					$('#newnickname').css('display', 'none');
					$("#nicknamecheck").css('display', 'none');
					$('#nicknameSave_btn').css('display', 'none');
					$('#nicknameCancel_btn').css('display', 'none');
					done = true;
				} else {
					$('#nickname_btn').css('display', 'block');
					$('#oldnickname').css('display', 'block');
					$('#newnickname').css('display', 'none');
					$('#nicknameSave_btn').css('display', 'none');
					$('#nicknameCancel_btn').css('display', 'none');
					done = true;
				}
			});
		}
	}
	
	$("#nickname").focusout(function(){
    	var nickname = $("#nickname").val();
    	if(nickname != "") {
			$.ajax({
				url: "nicknamecheck",
				data: { "nickname" : $("#nickname").val() },
            	type: "get",
        	}).done(function (data) {
            	$("#nicknamecheck").addClass('alert');
				$("#nicknamecheck").css('display', 'block');
            	if(data.flag == 'Y') {
                	$("#nicknamecheck").text("사용할 수 있는 닉네임입니다.");
                	$("#nicknamecheck").removeClass('alert-danger');
                	$("#nicknamecheck").addClass('alert-success');
                	$("#nickname").css('border', '1px solid #080');
            	} else {
                	$("#nicknamecheck").text("이미 등록된 닉네임입니다.");
                	$("#nicknamecheck").removeClass('alert-success');
                	$("#nicknamecheck").addClass('alert-danger');
                	$("#nickname").css('border', '1px solid #f00');
            	}
        	});
    	}
	});
	
	function cancelNickname() {
		$('#nickname_btn').css('display', 'block');
		$('#oldnickname').css('display', 'block');
		$('#newnickname').css('display', 'none');
		$("#nicknamecheck").css('display', 'none');
		$('#nicknameSave_btn').css('display', 'none');
		$('#nicknameCancel_btn').css('display', 'none');
		$("#nickname").css('border', '');
	}
	
	function updateAdditional() {
		$('#addInfo').css('display', 'none');
		$('#updateInfo').css('display', 'block');
		$('#additional_btn').css('display', 'none');

		$.ajax({
	        url: "getRegion",
	        data: { "province" : $("#province").val() },
	        type: "get",
	    }).done(function (data) {
	        var codes = "";
	        $("#region_num").html("");
	        $.each(data, function(index, item){
	            codes += "<option value=" + item.num + ">" + item.region + "</option>"
	        	$("#region_num").html(codes);
	        });
	        $("#region_num").val(${idto.region_num}).prop("selected", true);
		});
	}
	
	function cancelInfo() {
		$('#addInfo').css('display', 'block');
		$('#updateInfo').css('display', 'none');
		$('#additional_btn').css('display', 'block');
	}
</script>