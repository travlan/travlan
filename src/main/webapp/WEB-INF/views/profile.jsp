<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions"%>

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
                    <h5>${author.email}</h5>
                </div>
                <ul class="user-action">
                    <c:if test="${sessionScope.num != author.num }">
                    	<li onclick="reporting(${author.num})"><i class="fas fa-user-alt-slash"></i></li>
                    </c:if>
                </ul>
            </div>
            <c:set var="pcount" value="${util:pcount(sessionScope.num, post_mapper) }"/>
            <c:set var="mcount" value="${util:mcount(sessionScope.num, comment_mapper) }"/>
			<ul class="user-info-tab">
				<li id="post-btn" class="active"><a class="immutable" href="javascript:listpost()">글 </a><span>${pcount }</span></li>
				<li id="comment-btn"><a class="immutable" href="javascript:listcomment()">댓글 </a><span>${mcount }</span></li>
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
								<div class="post-list-thumb fill-image" style="background-image: url(storage/photo_thumbnail/${dto.thumbnail});"></div>
							</a>
							<div class="p-4">
								<div class="post-content font-myungjo">
									<h4 class="post-list-title"><a class="immutable" href="post_read?num=${dto.post_num}">${dto.title}</a></h4>
									<p><a class="immutable" href="profile?num=${dto.member_num}">${dto.nickname}</a></p>
									<p>${dto.created_date}</p>
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
									<ul class="post-info list-none">
										<li><i class="far fa-thumbs-up"></i> 25</li>
										<li><i class="far fa-comment"></i> ${count }</li>
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
							<div class="post-content font-myungjo">
								<h4><a class="immutable" href="post_read?num=${comment.post_num}">${comment.posttitle}</a></h4>
								<p><a class="immutable">${comment.nickname}</a></p>
								<h5>${comment.title}</h5>
								<div>${comment.content}</div>
								<p>${comment.created_date}</p>
							</div>
						</div>
						<hr>
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
	
	function reporting(num) {
		window.open('report/receive?user=' + num, '신고하기', 'width=580, height=280');
		return false;
	}
</script>