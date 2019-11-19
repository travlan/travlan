<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<a href="myinfo"><h2>스크랩 목록</h2></a>
	<a href="scrap"><h4>내 정보</h4></a>
	<a href="passwd_change"><h4>비밀번호 변경</h4></a>
	<a href="secession"><h4>회원탈퇴</h4></a>
	<form>
		<div>
			<c:forEach var="i" begin="0" end="4">
				<img>
				<a href="#"><strong>제목</strong></a>
				<label>내용</label>
				<label>메모</label>
				<button>스크랩</button>
			</c:forEach>
		</div>
	</form>
</div>