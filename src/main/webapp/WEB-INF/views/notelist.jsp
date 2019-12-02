<%@ page contentType = "text/html;charset=utf-8" %><%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<ul class="info-tab">
        <li class="active"><a class="immutable" href="note">쪽지</a></li>
		<li><a class="immutable" href="myinfo">내 정보</a></li>
		<li><a class="immutable" href="profile?num=${sessionScope.num}">내가 쓴 글/댓글 목록</a></li>
		<li><a class="immutable" href="scrap">스크랩 목록</a></li>
		<li><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
		<li><a class="immutable" href="secession">회원탈퇴</a></li>
	</ul>
	<c:choose>
		<c:when test="${empty list}">
			게시글이 존재하지 않습니다.
		</c:when>
		<c:otherwise>
			<ul class="list-group list-group-flush">
			<c:forEach var="dto" items="${list}">
  				<li class="list-group-item">${ dto.content }</li>
			</c:forEach>
			</ul>
			</div>
		</c:otherwise>
	</c:choose>
</div>