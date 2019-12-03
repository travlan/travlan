<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    .user-info-top {
        border-bottom: 1px solid #ccc;
    }
    .user-info h3 {
        font-size: 1.5rem;
        font-weight: bold;
    }
    .user-info h5 {
        font-size: 0.8rem;
    }
    ul.user-action {
        margin-top: 20px;
        padding: 0;
    }
    ul.user-action li {
        width: 38px;
        padding: 5px;
        font-size: 18px;
        text-align: center;
        display: inline-block;
        border-radius: 100%;
    }
    .user-info-tab {
        list-style: none;
        padding: 0;
        width: 100%;
    }
    .user-info-tab li {
        display: inline-block;
        text-align: center;
        width: 49%;
        padding-top: 10px;
        font-size: 1rem;
    }
    .user-info-tab li.active {
        border-top: 1px solid #000;
    }
</style>

<section class="clean-block clean-post dark">
	<div class="container">
		<c:choose>
			<c:when test="${sessionScope.num == num}">
				<%@ include file="include/menutop.jsp" %>
			</c:when>
		</c:choose>
		
		<div class="block-content mt-4 p-4" data-aos="fade-up-right">
			<div class="user-info-top">
                <div class="user-info">
                    <h3>${author.nickname}</h3>
                    <h5>${author.nickname}</h5>
                </div>
                <ul class="user-action">
                    <li><i class="far fa-comment-alt"></i></li>
                    <li><i class="fas fa-user-alt-slash"></i></li>
                </ul>
            </div>
			<ul class="user-info-tab">
				<li id="post-btn" class="active"><a class="immutable" href="javascript:listpost()">글</a></li>
				<li id="comment-btn"><a class="immutable" href="javascript:listcomment()">댓글</a></li>
			</ul>
		</div>
		
		<div id="listpostshow">
			<c:choose>
			<c:when test="${empty list}">
				<div class="block-content mt-4 p-4" data-aos="fade-up-right">
					게시글이 존재하지 않습니다.
				</div>
			</c:when>
			<c:otherwise>
				<div id="card-wrapper" class="row mt-4">
				<c:forEach var="dto" items="${list}">
					<div class="col-lg-4" data-aos="fade-up-right">
						<div class="block-content mb-4">
							<a href="post_read?num=${dto.post_num}">
								<div class="post-thumb fill-image" style="width: 100%; height: 300px; background-image: url(storage/photo_thumbnail/${dto.thumbnail});"></div>
							</a>
							<div class="p-4">
								<div class="post-content font-myungjo">
									<h4><a class="immutable" href="post_read?num=${dto.post_num}">${dto.title}</a></h4>
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
									<ul class="post-info list-none">
										<li><i class="far fa-thumbs-up"></i> 25</li>
										<li><i class="far fa-comment"></i> 25</li>
										<li><i class="far fa-heart"></i></li>
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
		
		<div id="listcommentshow" style="display:none;" class="block-content mt-4 p-4" data-aos="fade-up-right">
			<c:choose>
				<c:when test="${empty comment}">
				댓글이 존재하지 않습니다.
				</c:when>
				
				<c:otherwise>
					<c:forEach var="comment" items="${comment}">
						<div class="post-list row aos-init aos-animate" data-aos="zoom-in">
							<div class="post-thumb fill-img" style="background-image: url(storage/photo_thumbnail/${comment.thumbnail});"></div>
							<div class="post-content font-myungjo">
								<h4><a class="immutable" href="post_read?num=${comment.post_num}">${comment.posttitle}</a></h4>
								<p><a class="immutable">${comment.nickname}</a></p>
								<h5>${comment.title}</h5>
								<div>${comment.content}</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>

<script>
	function listpost() {
		$('#listcommentshow').css('display', 'none');
		$('#listpostshow').css('display', 'block');
		$('#post-btn').addClass('active');
		$('#comment-btn').removeClass('active');
	}
	
	function listcomment() {
		$('#listpostshow').css('display', 'none');
		$('#listcommentshow').css('display', 'block');
		$('#post-btn').removeClass('active');
		$('#comment-btn').addClass('active');
	}
</script>