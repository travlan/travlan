<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<h2>내 정보</h2>
	<a href="scrap"><h4>스크랩 목록</h4></a>
	<a href="passwd_change"><h4>비밀번호 변경</h4></a>
	<a href="secession"><h4>회원탈퇴</h4></a>
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
		<div>
			<strong>성별</strong>
			<label>여자</label>
			<select>
				<option>여자</option>
				<option>남자</option>
			</select>
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
	</form>
</div>