<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="slide fill-half-display">
    <ul>
      <li class="fill-image" style="background-image: url(assets/image/1.jpg);"><div class="dark-mask"></div></li>
      <li class="fill-image" style="background-image: url(assets/image/2.jpg);"><div class="dark-mask"></div></li>
      <li class="fill-image" style="background-image: url(assets/image/3.jpg);"><div class="dark-mask"></div></li>
      <li class="fill-image" style="background-image: url(assets/image/4.jpg);"><div class="dark-mask"></div></li>
	</ul>
</div>
<div class="main-title font-namyun">
	<c:choose>
		<c:when test="${not empty sessionScope.id}">
			<h3>특별한 순간 ${sessionScope.nickname}님과 함께</h3>
		</c:when>
		<c:otherwise>
			<h3>특별한 순간 우리와 함께</h3>
		</c:otherwise>
	</c:choose>
</div>
<div class="container mt-5">
	<div class="intro mb-5 font-myungjo">
		<h5 class="text-center">Travlan에서 완벽한 계획을 찾아보세요!</h5>
	</div>
	<c:choose>
		<c:when test="${empty list}">
			게시글이 존재하지 않습니다.
		</c:when>
		<c:otherwise>
			<div id="card-wrapper">
			<c:forEach var="dto" items="${list}">
				<div class="articles" data-aos="zoom-in">
					<div class="post-list row">
						<a href="post_read?num=${dto.post_num}">
							<div class="post-thumb fill-image" style="background-image: url(storage/photo_thumbnail/${dto.thumbnail});"></div>
						</a>
						<div class="post-content font-myungjo">
							<h4><a class="immutable" href="post_read?num=${dto.post_num}">${dto.title}</a></h4>
							<p><a class="immutable" href="profile?num=${dto.member_num}">${dto.nickname}</a></p>
							<span class="type op1">
							<c:choose>
								<c:when test="${fn:substring(dto.type, 0, 1) == 'A'}">빡빡</c:when>
								<c:when test="${fn:substring(dto.type, 0, 1) == 'B'}">느긋</c:when>
							</c:choose>
							</span>
							<span class="type op2">
							<c:choose>
								<c:when test="${fn:substring(dto.type, 1, 2) == 'A'}">주간</c:when>
								<c:when test="${fn:substring(dto.type, 1, 2) == 'B'}">야간</c:when>
							</c:choose>
							</span>
							<span class="type op3">
							<c:choose>
								<c:when test="${fn:substring(dto.type, 2, 3) == 'A'}">활기</c:when>
								<c:when test="${fn:substring(dto.type, 2, 3) == 'B'}">조용</c:when>
							</c:choose>
							</span>
							<span class="type op4">
							<c:choose>
								<c:when test="${dto.season == 'S'}">봄</c:when>
								<c:when test="${dto.season == 'U'}">여름</c:when>
								<c:when test="${dto.season == 'F'}">가을</c:when>
								<c:when test="${dto.season == 'W'}">봄</c:when>
							</c:choose>
							</span>
							<span class="type">${dto.region}</span>
							<ul class="post-info">
								<li><i class="far fa-thumbs-up"></i> 25</li>
								<li><i class="far fa-comment"></i> 25</li>
								<li><i class="far fa-heart"></i></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<script src="assets/js/infiscroll.js"></script>
<script>
var postWrapperId = 'card-wrapper';
var paginatePath = '/travlan/?page=';
var lastPage = ${lastPage};
new InfiniteScroll(paginatePath, postWrapperId, lastPage);
</script>