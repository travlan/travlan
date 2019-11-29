<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<ul class="info-tab">
		<li class="active"><a class="immutable" href="scrap">스크랩 목록</a></li>
		<li><a class="immutable" href="myinfo">내 정보</a></li>
		<li><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
		<li><a class="immutable" href="secession">회원탈퇴</a></li>
	</ul>
	<div class="row">
		<!-- 여기 무한루프 돌리면 됨 -->
		<div class="col-md-4 mb-4" data-aos="fade-up" data-aos-anchor-placement="top-bottom">
			<div class="card">
				<img class="card-img-top" src="assets/image/1.jpg">
				<div class="card-body">
					<h5 class="card-title">{ 타이틀 들어갈 부분 }</h5>
					<p class="card-text">{ 메모 들어갈 부분 }</p>
				</div>
			</div>
		</div>
	</div>
</div>