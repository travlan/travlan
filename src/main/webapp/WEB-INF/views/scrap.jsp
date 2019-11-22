<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<ul class="info-tab">
		<li class="active"><a class="immutable" href="scrap">스크랩 목록</a></li>
		<li><a class="immutable" href="myinfo">내 정보</a></li>
		<li><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
		<li><a class="immutable" href="secession">회원탈퇴</a></li>
	</ul>
	<form>
		<div data-aos="fade-right">
			<img>
			<a href="#"><strong>제목</strong></a>
			<label>내용</label>
			<label>메모</label>
			<button>스크랩</button>
		</div>
	</form>
</div>