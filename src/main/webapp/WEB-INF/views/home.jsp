<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions"%>

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
<section class="clean-block clean-post dark">
	<div class="container">
	<div class="intro mb-5 font-myungjo">
		<h5 class="text-center">Travlan에서 완벽한 계획을 찾아보세요!</h5>
	</div>
	<c:choose>
		<c:when test="${empty list}">
			<div class="block-content mt-4" data-aos="fade-up-right">
				게시글이 존재하지 않습니다.
        	</div>
		</c:when>
		<c:otherwise>
			<div id="card-wrapper" class="row">
			<c:forEach var="dto" items="${list}">
				<div class="col-lg-4" data-aos="fade-up-right">
					<div class="block-content mb-4">
						<a href="post_read?num=${dto.post_num}">
							<div class="post-list-thumb fill-image" style="background-image: url(storage/photo_thumbnail/${dto.thumbnail});"></div>
						</a>
						<div class="p-4">
							<div class="post-content font-myungjo">
								<h4 class="post-list-title"><a class="immutable" href="post_read?num=${dto.post_num}">${dto.title}</a></h4>
								<p><a class="immutable" href="profile?num=${dto.member_num}">${dto.nickname}</a></p>
								<ul class="post-type list-none">
									<li>
										<c:choose>
											<c:when test="${fn:substring(dto.type, 0, 1) == 'A'}">빡빡</c:when>
											<c:when test="${fn:substring(dto.type, 0, 1) == 'B'}">느긋</c:when>
										</c:choose>
									</li>
									<li>
										<c:choose>
											<c:when test="${fn:substring(dto.type, 1, 2) == 'A'}">주간</c:when>
											<c:when test="${fn:substring(dto.type, 1, 2) == 'B'}">야간</c:when>
										</c:choose>
									</li>
									<li>
										<c:choose>
											<c:when test="${fn:substring(dto.type, 2, 3) == 'A'}">활기</c:when>
											<c:when test="${fn:substring(dto.type, 2, 3) == 'B'}">조용</c:when>
										</c:choose>
									</li>
									<li>
									<c:choose>
										<c:when test="${dto.season == 'S'}">봄</c:when>
										<c:when test="${dto.season == 'U'}">여름</c:when>
										<c:when test="${dto.season == 'F'}">가을</c:when>
										<c:when test="${dto.season == 'W'}">봄</c:when>
									</c:choose>
									</li>
									<li>${dto.region}</li>
								</ul>
								<c:set var="count" value="${util:count(dto.post_num, comment_mapper) }"/>
								<c:set var="checkScrap" value="${util:checkScrap(sessionScope.num, dto.post_num, scrap_mapper)}"/>
								<ul class="post-info list-none">
									<li><i class="far fa-star"></i> 25</li>
									<li><i class="far fa-comment"></i> ${count }</li>
									<c:if test="${not empty sessionScope.id}">
										<c:if test="${dto.member_num != sessionScope.num}">
											<c:choose>
												<c:when test="${checkScrap == 0}">
													<li id="heart-icon-${dto.post_num}" onclick="doScrap(${dto.post_num})"><i class="far fa-heart"></i></li>
												</c:when>
												<c:otherwise>
													<li id="heart-icon-${dto.post_num}" class="active" onclick="cancelScrap(${dto.post_num})"><i class="fas fa-heart"></i></li>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
        		</div>
			</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
	</div>
</section>

<script src="assets/js/infiscroll.js"></script>
<script>
	var postWrapperId = 'card-wrapper';
	var paginatePath = '/travlan/?page=';
	var lastPage = ${lastPage};
	new InfiniteScroll(paginatePath, postWrapperId, lastPage);
</script>
<script>
	function doScrap(post_num) {
		$.ajax({
			url: "scrap",
			data: { 'post_num' : post_num },
			type: "post",
		}).done(function (data) {
			if(data.flag == 'Y') {
				$('#heart-icon-' + post_num).addClass('active');
				$('#heart-icon-' + post_num).html('<i class=\"fas fa-heart\"></i>');
				$('#heart-icon-' + post_num).removeAttr('onclick');
				$('#heart-icon-' + post_num).attr('onclick', 'cancelScrap(' + post_num + ')');
				done = true;
			} else {
				$('#heart-icon-' + post_num).addClass('active');
				$('#heart-icon-' + post_num).html('<i class=\"fas fa-heart\"></i>');
				$('#heart-icon-' + post_num).removeAttr('onclick');
				$('#heart-icon-' + post_num).attr('onclick', 'cancelScrap(' + post_num + ')');
				done = true;
			}
		});
	}
	
	function cancelScrap(post_num) {
		$.ajax({
			url: "deleteScrap",
			data: { 'post_num' : post_num },
			type: "post",
		}).done(function (data) {
			if(data.flag == 'Y') {
				$('#heart-icon-' + post_num).removeClass('active');
				$('#heart-icon-' + post_num).html('<i class=\"far fa-heart\"></i>');
				$('#heart-icon-' + post_num).removeAttr('onclick');
				$('#heart-icon-' + post_num).attr('onclick', 'doScrap(' + post_num + ')');
				done = true;
			} else {
				$('#heart-icon-' + post_num).removeClass('active');
				$('#heart-icon-' + post_num).html('<i class=\"far fa-heart\"></i>');
				$('#heart-icon-' + post_num).removeAttr('onclick');
				$('#heart-icon-' + post_num).attr('onclick', 'doScrap(' + post_num + ')');
				done = true;
			}
		});
	}
</script>