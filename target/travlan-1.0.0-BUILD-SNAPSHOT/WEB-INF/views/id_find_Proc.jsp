<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<div>
		<c:choose>
			<c:when test="${empty id}">
				찾으시는 아이디는 존재하지 않습니다.
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="location.href='id_find'">다시 찾기</button></div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="location.href='./'">홈</button></div>
			</c:when>
			
			<c:otherwise>
				찾으시는 아이디는 ${id} 입니다.
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="location.href='login'">로그인 하기</button></div>
				<div class="form-group"><button class="btn btn-primary btn-block" type="button" onclick="location.href='./'">홈</button></div>
			</c:otherwise>
		</c:choose>
	</div>
</div>