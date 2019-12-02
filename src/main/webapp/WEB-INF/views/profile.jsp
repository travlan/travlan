<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="container">
	<ul class="info-tab">
		<c:choose>
			<c:when test="${sessionScope.num == num}">
				<li class="active"><a class="immutable" href="profile?num=${sessionScope.num}">내가 쓴 글/댓글 목록</a></li>
				<li><a class="immutable" href="myinfo">내 정보</a></li>
				<li><a class="immutable" href="scraplist">스크랩 목록</a></li>
				<li><a class="immutable" href="passwd_check">비밀번호 변경</a></li>
				<li><a class="immutable" href="secession">회원탈퇴</a></li>
			</c:when>
			
			<c:otherwise>
				<li class="active">${author.nickname}님의 글/댓글 목록</li>
			</c:otherwise>
		</c:choose>
	</ul>
	
	<div>
		<ul class="user-info-tab">
			<li class="active"><a class="immutable" href="listpost()">글</a></li>
			<li><a class="immutable" href="listcomment()">댓글</a></li>
		</ul>
		
		<div id="listpostshow">
			<c:choose>
				<c:when test="${empty list}">
				게시글이 존재하지 않습니다.
				</c:when>
				
				<c:otherwise>
					<c:forEach var="list" items="${list}">
						<div class="post-list row aos-init aos-animate" data-aos="zoom-in">
							<div class="post-thumb fill-img" style="background-image: url(storage/photo_thumbnail/${list.thumbnail});"></div>
							<div class="post-content font-myungjo">
								<h4><a class="immutable" href="post_read?num=${list.post_num}">${list.title}</a></h4>
								<span class="type op1">
									<c:choose>
										<c:when test="${fn:substring(list.type, 0, 1) == 'A'}">빡빡</c:when>
										<c:when test="${fn:substring(list.type, 0, 1) == 'B'}">느긋</c:when>
									</c:choose>
								</span>
								<span class="type op2">
									<c:choose>
										<c:when test="${fn:substring(list.type, 1, 2) == 'A'}">주간</c:when>
										<c:when test="${fn:substring(list.type, 1, 2) == 'B'}">야간</c:when>
									</c:choose>
								</span>
								<span class="type op3">
									<c:choose>
										<c:when test="${fn:substring(list.type, 2, 3) == 'A'}">활기</c:when>
										<c:when test="${fn:substring(list.type, 2, 3) == 'B'}">조용</c:when>
									</c:choose>
								</span>
								<span class="type op4">
									<c:choose>
										<c:when test="${list.season == 'S'}">봄</c:when>
										<c:when test="${list.season == 'U'}">여름</c:when>
										<c:when test="${list.season == 'F'}">가을</c:when>
										<c:when test="${list.season == 'W'}">봄</c:when>
									</c:choose>
								</span>
								<span class="type">${list.region}</span>
								<ul class="post-info">
									<li><i class="far fa-thumbs-up"></i> 25</li>
									<li><i class="far fa-comment"></i> 25</li>
									<li><i class="far fa-heart"></i></li>
								</ul>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div id="listcommentshow" style="display:none;">
			<c:choose>
				<c:when test="${empty comment}">
				댓글이 존재하지 않습니다.
				</c:when>
				
				<c:otherwise>
					<c:forEach var="comment" items="${comment}">
						<div class="post-list row aos-init aos-animate" data-aos="zoom-in">
							<div class="post-thumb fill-img" style="background-image: url(storage/photo_thumbnail/${comment.thumbnail});"></div>
							<div class="post-content font-myungjo">
								<h4><a class="immutable" href="post_read?num=${comment.post_num}">${comment.title}</a></h4>
								<p><a class="immutable" href="profile?num=${author.member_num}">${comment.nickname}</a></p>
								<div>${comment.content}</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<script>
	function listpost() {
		$('#listcommentshow').css('display', 'none');
		$('#listpostshow').css('display', 'block');
	}
	
	function listcomment() {
		$('#listpostshow').css('display', 'none');
		$('#listcommentshow').css('display', 'block');
	}
</script>