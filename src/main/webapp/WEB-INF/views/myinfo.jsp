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
					<label>여자</label>
				</div>
				<div>
				<strong>나이</strong>
					<label>20대</label>
					<select>
						<option>10</option>
						<option>20</option>
					</select>
				</div>
				<div>
					<strong>선호도</strong>
					<label>아아아아아아아아</label>
					<select>
						<option>10</option>
						<option>20</option>
					</select>
				</div>
				<div>
					<strong>사는곳</strong>
					<label>강원도 원주시</label>
					<select>
						<option>10</option>
						<option>20</option>
					</select>
				</div>
			</c:when>
			<c:otherwise>
				<button>
					추가 정보를 입력하세요!
				</button>
			</c:otherwise>
		</c:choose>
	</form>
</div>