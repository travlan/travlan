<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
	a:link {
		color: black;
	}
	a:visited {
		color: black;
	}
	a:hover {
		color: black;
	}
	.info-tab {
		padding-left: 0;
		list-style: none;
	}
	.info-tab li {
		display: inline-block;
	}
	.info-tab .active {
		font-size: 24px;
	}
</style>

<div class="container">
	<ul class="info-tab">
		<li class="active"><a href="myinfo">내 정보</a></li>
		<li><a href="scrap">스크랩 목록</a></li>
		<li><a href="passwd_check">비밀번호 변경</a></li>
		<li><a href="secession">회원탈퇴</a></li>
	</ul>
	<form>
		<div>
			<strong>아이디</strong>
			<label>${sessionScope.id}</label>
		</div>
		<div>
			<strong>닉네임</strong>
			<label>${dto.nickname}</label>
		</div>
		<div>
			<strong>이메일</strong>
			<label>${dto.email}</label>
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
				</div>
			</c:when>
			<c:otherwise>
				<button type="button" onclick="showInfobox()">추가 정보를 입력하세요!</button>
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
	</form>
</div>

<script>
<<<<<<< HEAD
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
		
		
=======
function showInfobox() {
	$('#infobox').css('display','block');
}
>>>>>>> 3e6c71415b54b4a1f06a4a34fbf4df21a8b300e4
</script>