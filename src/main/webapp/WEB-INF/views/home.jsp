<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.slide ul,.slide li{list-style:none;}
	.slide{overflow:hidden;}
    .slide ul{height:calc(100% * 4);animation:slide 16s infinite; padding-left: 0;}
    .slide li{height:calc(100% / 4);}
    @keyframes slide {
      0% {margin-top:0;}
      10% {margin-top:0;}
      25% {margin-top:-50vh;}
      35% {margin-top:-50vh;}
      50% {margin-top:-100vh;}
      60% {margin-top:-100vh;}
      75% {margin-top:-150vh;}
      85% {margin-top:-150vh;}
      100% {margin-top:0;}
    }
</style>

<!--
<div id="title-image" class="fill-half-display fill-img" style="background-image: url(assets/image/1.jpg);">
	<div class="main-title">
		<c:choose>
			<c:when test="${not empty sessionScope.id}">
				<h3>특별한 순간 ${sessionScope.nickname}님과 함께</h3>
			</c:when>
			<c:otherwise>
				<h3>특별한 순간 우리와 함께</h3>
			</c:otherwise>
		</c:choose>
	</div>
</div>
-->

<div class="slide fill-half-display">
    <ul>
      <li class="fill-img" style="background-image: url(assets/image/1.jpg);"></li>
      <li class="fill-img" style="background-image: url(assets/image/2.jpg);"></li>
      <li class="fill-img" style="background-image: url(assets/image/3.jpg);"></li>
      <li class="fill-img" style="background-image: url(assets/image/4.jpg);"></li>
	</ul>
</div>

<script>
	$(document).ready(function() {
		var i = 2;
		var imageChange = setInterval(function() {
		    $('#title-image').fadeOut(50);
			$('#title-image').css('background-image', 'url(assets/image/'+ i +'.jpg)');
			$('#title-image').fadeIn(50);
			i += 1;
			if(i > 4) i = 1;
		}, 3000);
	});
</script>

<div class="container mt-5">
	<div class="intro mb-5">
		<h5 class="text-center">Travlan에서 완벽한 계획을 찾아보세요!</h5>
	</div>
	<div class="articles">
		<div class="post-list row">
			<div class="post-thumb fill-img"
				style="background-image: url(assets/image/1.jpg);"></div>
			<div class="post-content">
				<h3>강릉으로 여행을 떠나요!!</h3>
				<p>배진오</p>
				<span class="type">저렴한</span> <span class="type">조용한</span> <span
					class="type">겨울</span> <span class="type">강릉</span>
				<ul class="post-info">
					<li><i class="far fa-thumbs-up"></i> 25</li>
					<li><i class="far fa-comment"></i> 25</li>
					<li><i class="far fa-heart"></i></li>
				</ul>
			</div>
		</div>
		<div class="post-list row">
			<div class="post-thumb fill-img"
				style="background-image: url(assets/image/3.jpg);"></div>
			<div class="post-content">
				<h3>강릉으로 여행을 떠나요!!</h3>
				<p>배진오</p>
				<span class="type">저렴한</span> <span class="type">조용한</span> <span
					class="type">겨울</span> <span class="type">강릉</span>
				<ul class="post-info">
					<li><i class="far fa-thumbs-up"></i> 25</li>
					<li><i class="far fa-comment"></i> 25</li>
					<li><i class="far fa-heart"></i></li>
				</ul>
			</div>
		</div>
		<div class="post-list row">
			<div class="post-thumb fill-img"
				style="background-image: url(assets/image/4.jpg);"></div>
			<div class="post-content">
				<h3>강릉으로 여행을 떠나요!!</h3>
				<p>배진오</p>
				<span class="type">저렴한</span> <span class="type">조용한</span> <span
					class="type">겨울</span> <span class="type">강릉</span>
				<ul class="post-info">
					<li><i class="far fa-thumbs-up"></i> 25</li>
					<li><i class="far fa-comment"></i> 25</li>
					<li><i class="far fa-heart"></i></li>
				</ul>
			</div>
		</div>
		<div class="post-list row">
			<div class="post-thumb fill-img"
				style="background-image: url(assets/image/1.jpg);"></div>
			<div class="post-content">
				<h3>강릉으로 여행을 떠나요!!</h3>
				<p>배진오</p>
				<span class="type">저렴한</span> <span class="type">조용한</span> <span
					class="type">겨울</span> <span class="type">강릉</span>
				<ul class="post-info">
					<li><i class="far fa-thumbs-up"></i> 25</li>
					<li><i class="far fa-comment"></i> 25</li>
					<li><i class="far fa-heart"></i></li>
				</ul>
			</div>
		</div>
	</div>
</div>

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
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
				class="sr-only">Next</span>
		</a></li>
	</ul>
</nav>