<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<ul class="list-none">
		<li class="block-content p-2"><a class="immutable" href="myinfo">계정</a></li>
		<li class="block-content p-2"><a class="immutable" href="profile?num=${sessionScope.num}">활동</a></li>
		<li class="block-content p-2"><a class="immutable" href="note">쪽지</a></li>
		<li class="block-content p-2"><a class="immutable" href="scraplist">스크랩</a></li>
		<li class="block-content p-2"><a class="immutable" href="passwd_check">패스워드 변경</a></li>
		<li class="block-content p-2"><a class="immutable" href="secession">회원탈퇴</a></li>
	</ul>
</div>