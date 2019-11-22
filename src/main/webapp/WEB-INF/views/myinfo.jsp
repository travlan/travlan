<%@ page contentType = "text/html;charset=utf-8" %>
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
				<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${sessionScope.id}">
			</div>
		</div>
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-2 col-form-label">닉네임</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${dto.nickname}">
			</div>
		</div>
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-2 col-form-label">이메일</label>
			<div class="col-sm-10">
				<input type="text" readonly class="form-control-plaintext" id="staticEmail" value="${dto.email}">
			</div>
		</div>
		<c:choose>
			<c:when test="${is_info}">
				<div>
					<strong>성별</strong>
					<label>
						<div id="gender"></div>
					</label>
				</div>
				<div>
					<strong>나이</strong>
					<label>${dto.age}대</label>
				</div>
				<div>
					<strong>선호도</strong>
					<label>
						<div id="type"></div>
					</label>
				</div>
				<div>
					<strong>사는곳</strong>
					<label>${dto.region}</label>
				</div></c:when><c:otherwise>
				<button class="btn btn-light" type="button" onclick="showInfobox()">추가 정보를 입력하세요!</button>
				<div id="infobox" style="display: none;">
					<div>
						<strong>성별</strong>
						<select>
							<option>남자</option>
							<option>여자</option>
						</select>
					</div>
					<div>
					<strong>나이</strong>
						<select>
							<option>10</option>
							<option>20</option>
						</select>
					</div>
					<div>
						<strong>선호도</strong>
						<select>
							<option>10</option>
							<option>20</option>
						</select>
					</div>
					<div>
						<strong>사는곳</strong>
						<select>
							<option>10</option>
							<option>20</option>
						</select>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<script>
	$(document).ready(function(){
		var type = '${dto.type}';
		var typeArr = type.split('');

		var gender = '${dto.gender}';

		if(typeArr[0] == 'A'){
			$("#type").append("<span class='badge'>빡빡</span>");
		}else{
			$("#type").append("<span class='badge'>느긋</span>");
		}
		if(typeArr[1] == 'A'){
			$("#type").append("<span class='badge'>빡빡</span>");
		}else{
			$("#type").append("<span class='badge'>느긋</span>");
		}
		if(typeArr[2] == 'A'){
			$("#type").append("<span class='badge'>빡빡</span>");
		}else{
			$("#type").append("<span class='badge'>느긋</span>");
		}
		if(gender == 'M'){
			$("#gender").append("남성");
		}else{
			$("#gender").append("여성");
		}
	});
		
function showInfobox() {
	$('#infobox').css('display','block');
}
</script>