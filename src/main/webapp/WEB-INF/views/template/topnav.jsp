<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<nav class="navbar navbar-light navbar-expand-md navigation-clean"
	style="padding: 50px;">
	<div class="container">
		<a class="navbar-brand" href="./">TRAVLAN</a>
		<button data-toggle="collapse" class="navbar-toggler"
			data-target="#navcol-1">
			<span class="sr-only">Toggle navigation</span><span
				class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navcol-1">
			<ul class="nav navbar-nav ml-auto">
				<c:choose>
					<c:when test="${sessionScope.id == null}">
						<li class="nav-item" role="presentation"><a class="nav-link" href="login">로그인</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link" href="register">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item" role="presentation"><a class="nav-link" href="logout">로그아웃</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link" href="myinfo">내 정보</a></li>
						<li class="nav-item" role="presentation">
						<li class="nav-item" role="presentation">
							<div class="dropdown">
								<a class="nav-link" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">알림</a>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item" href="#">Action</a>
									<a class="dropdown-item" href="#">Another action</a>
									<a class="dropdown-item" href="#">Something else here</a>
								</div>
							</div>
						</li>
						<li class="nav-item" role="presentation"><a class="nav-link" href="note">쪽지</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>