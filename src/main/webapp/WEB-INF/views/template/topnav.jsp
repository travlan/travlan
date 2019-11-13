<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
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
					<li class="nav-item" role="presentation"><a class="nav-link"
						href="login">Login</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						href="#">Signup</a></li>
					<li class="nav-item dropdown"><a
						class="dropdown-toggle nav-link" data-toggle="dropdown"
						aria-expanded="false" href="#">Dropdown</a>
						<div class="dropdown-menu" role="menu">
							<a class="dropdown-item" role="presentation" href="#">First
								Item</a> <a class="dropdown-item" role="presentation" href="#">Second
								Item</a> <a class="dropdown-item" role="presentation" href="#">Third
								Item</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
	<script src="https://static.blex.kr/assets/library/jquery.js"></script>
	<script src="https://static.blex.kr/assets/library/bootstrap.js"></script>
</body>
</html>