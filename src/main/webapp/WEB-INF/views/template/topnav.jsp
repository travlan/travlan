<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<nav id="top-main-nav" class="navbar navbar-dark bg-dark navbar-expand-md navigation-clean fixed-top"
	style="padding: 50px 10px 50px 10px; position: absolute;">
	<div class="container">
		<a class="navbar-brand font-classic" href="./">TRAVLAN</a>
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
						<li class="nav-item" role="presentation"><a class="nav-link" href="myinfo">내정보</a></li>
						<li class="nav-item" role="presentation">
						<li class="nav-item" role="presentation">
								<a class="nav-link" data-toggle="modal" data-target="#infoModal">알림 <span id="notify-count" class="badge badge-light"></span></a>
						</li>
						<li class="nav-item" role="presentation"><a class="nav-link" href="post_write">글쓰기</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
<div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="infoModalLabel"><i class="fas fa-info-circle"></i> Notify</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div id="notify-content" class="modal-body">
      		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="deleteNotifyAll()">Clean</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>