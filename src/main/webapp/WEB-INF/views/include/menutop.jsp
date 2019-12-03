<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="url" value="${pageContext.request.servletPath}"/>
<c:if test="${request.queryString != null}">
	<c:set var="url" value="${pageContext.request.requestPath + '?' + request.queryString}"/>
</c:if>

<div>
	<ul class="list-none">
		<li class="block-content p-2"><a class="immutable" ${url eq '/myinfo' ? 'active' : ''} href="myinfo">계정</a></li>
		<li class="block-content p-2"><a class="immutable" ${url eq '/profile?num=${sessionScope.num}' ? 'active' : ''} href="profile?num=${sessionScope.num}">활동</a></li>
		<li class="block-content p-2"><a class="immutable" ${url eq '/note' ? 'active' : ''} href="note">쪽지</a></li>
		<li class="block-content p-2"><a class="immutable" ${url eq '/scraplist' ? 'active' : ''} href="scraplist">스크랩</a></li>
		<li class="block-content p-2"><a class="immutable" ${url eq '/passwd_check' ? 'active' : ''} href="passwd_check">패스워드 변경</a></li>
		<li class="block-content p-2"><a class="immutable" ${url eq '/secession' ? 'active' : ''} href="secession">회원탈퇴</a></li>
	</ul>
</div>