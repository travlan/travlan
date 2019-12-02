<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<ul class="info-tab">
		<li class="active"><a class="immutable" href="scraplist">스크랩 목록</a></li>
		<li><a class="immutable" href="myinfo">내 정보</a></li>
		<li><a class="immutable" href="profile?num=${sessionScope.num}">내가 쓴 글/댓글 목록</a></li>
		<li><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
		<li><a class="immutable" href="secession">회원탈퇴</a></li>
	</ul>
	<div class="row">
		<c:choose>
			<c:when test="${empty list}">
				스크랩한 글이 없습니다.
			</c:when>
			
			<c:otherwise>
				<c:forEach var="dto" items="${list}">
					<div class="col-md-4 mb-4" data-aos="fade-up" data-aos-anchor-placement="top-bottom">
						<div class="card">
							<a href="post_read?num=${dto.post_num}">
								<img class="card-img-top" src="storage/photo_thumbnail/${dto.thumbnail}">
							</a>
							<div class="card-body">
								<a href="post_read?num=${dto.post_num}"><h5 class="card-title">${dto.title}</h5></a>
								<h6>${dto.nickname}</h6>
								<p class="card-text">${dto.memo}(${dto.created_date})</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>