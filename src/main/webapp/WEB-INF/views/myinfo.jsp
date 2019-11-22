<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<ul class="info-tab">
		<li class="active"><a class="immutable" href="myinfo">내 정보</a></li>
		<li><a class="immutable" href="scrap">스크랩 목록</a></li>
		<li><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
		<li><a class="immutable" href="secession">회원탈퇴</a></li>
	</ul>
	<div data-aos="fade-right">
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-2 col-form-label">아이디</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="staticEmail" value="${sessionScope.id}">
			</div>
		</div>
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-2 col-form-label">닉네임</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="staticEmail" value="${dto.nickname}">
			</div>
		</div>
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-2 col-form-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext"
					id="staticEmail" value="${dto.email}">
			</div>
		</div>
		<c:choose>
			<c:when test="${is_info}">
				<div>
					<strong>성별</strong> <label>
						<div id="gender"></div>
					</label>
				</div>
				<div>
					<strong>나이</strong> <label>${dto.age}대</label>
				</div>
				<div>
					<strong>선호도</strong> <label>
						<div id="type"></div>
					</label>
				</div>
				<div>
					<strong>사는곳</strong> <label>${dto.region}</label>
				</div>
			</c:when>
			<c:otherwise>
				<button class="btn btn-light" id="infobox_btn" type="button" onclick="showInfobox()">추가정보를 입력하세요!</button>
				<div id="infobox" style="display: none;" data-aos="flip-up">
					<form method="post" action="register_additional_info">
						<div class="col-xs-3" id="addtional">
							<input type="hidden" name="num" value="${num}">
							

							<div class="form-group row">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="age_male" value="M" name="gender"> 
									<label class="form-check-label" for="age_male">남자</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox" id="age_female" value="F" name="gender"> 
									<label class="form-check-label" for="age_female">여자</label>
								</div>
							</div>
							<div class="form-group">
								<select id="inputState" class="form-control" name="age">
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
							<label>선호도</label>
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
								</select> <label>거주 지역</label>
							</div>
							<div class="form-group">
								<select id="inputState" class="form-control" name="province">
									<option value="서울" selected>서울특별시</option>
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
								<select id="inputState" class="form-control" name="region_num">
								</select>
							</div>
						</div>
						<div id="done" style="display: none" class="form-group">
							<button class="btn btn-primary btn-block" type="submit">완료</button>
						</div>
					</form>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<script>
	$(document).ready(function() {
		var type = '${dto.type}';
		var typeArr = type.split('');

		var gender = '${dto.gender}';

		if (typeArr[0] == 'A') {
			$("#type").append("<span class='type'>빡빡</span>");
		} else {
			$("#type").append("<span class='type'>느긋</span>");
		}
		if (typeArr[1] == 'A') {
			$("#type").append("<span class='type'>주간</span>");
		} else {
			$("#type").append("<span class='type'>야간</span>");
		}
		if (typeArr[2] == 'A') {
			$("#type").append("<span class='type'>활기</span>");
		} else {
			$("#type").append("<span class='type'>조용</span>");
		}
		if (gender == 'M') {
			$("#gender").append("남성");
		} else {
			$("#gender").append("여성");
		}
	});

	function showInfobox() {
		$('#infobox').css('display', 'block');
		$('#infobox_btn').css('visibility', 'hidden');
	}
</script>