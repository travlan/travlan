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
						<li class="nav-item" role="presentation"><a class="nav-link" href="login">Login</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link" href="register">Signup</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item" role="presentation"><a class="nav-link" href="logout">Logout</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link" href="logout">Scrap</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link" href="logout">Notify</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link" href="logout">Note</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>