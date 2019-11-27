<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="slide fill-half-display">
    <ul>
      <li class="fill-img" style="background-image: url(assets/image/1.jpg);"><div class="dark-mask"></div></li>
      <li class="fill-img" style="background-image: url(assets/image/2.jpg);"><div class="dark-mask"></div></li>
      <li class="fill-img" style="background-image: url(assets/image/3.jpg);"><div class="dark-mask"></div></li>
      <li class="fill-img" style="background-image: url(assets/image/4.jpg);"><div class="dark-mask"></div></li>
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
			<c:forEach var="dto" items="${list}">
				<div class="articles">
					<div class="post-list row" data-aos="zoom-in">
						<a href="post_read?num=${dto.post_num}">
							<div class="post-thumb fill-img" style="background-image: url(assets/image/1.jpg);"></div>
						</a>
						<div class="post-content font-myungjo">
							<h4><a class="immutable" href="post_read?num=${dto.post_num}">${dto.title}</a></h4>
							<p>${dto.nickname}</p>
							<span class="type op1">${dto.type.charAt(0)}</span>
							<span class="type op2">${dto.type.charAt(1)}</span>
							<span class="type op3">${dto.type.charAt(2)}</span>
							<span class="type op4">${dto.season}</span>
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
		</c:otherwise>
	</c:choose>
</div>

<!--
<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
				class="sr-only">Previous</span>
		</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#">4</a></li>
		<li class="page-item"><a class="page-link" href="#">5</a></li>
		<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> 
		<span class="sr-only">Next</span>
		</a></li>
	</ul>
</nav>
-->

<script>
	$(document).ready(function() {
		
		$('.op1').each(function (index, item) {
			if($(item).html() == 'A') {
				$(item).html('빡빡')
			} else {
				$(item).html('느긋')
			}
		});
		
		$('.op2').each(function (index, item) {
			if($(item).html() == 'A') {
				$(item).html('주간')
			} else {
				$(item).html('야간')
			}
		});
		
		$('.op3').each(function (index, item) {
			if($(item).html() == 'A') {
				$(item).html('활기')
			} else {
				$(item).html('조용')
			}
		});
		
		$('.op4').each(function (index, item) {
			if($(item).html() == 'S') {
				$(item).html('봄')
			} else if($(item).html() == 'U') {
				$(item).html('여름')
			} else if($(item).html() == 'F') {
				$(item).html('가을')
			} else {
				$(item).html('겨울')
			}
		});
	});
	
</script>