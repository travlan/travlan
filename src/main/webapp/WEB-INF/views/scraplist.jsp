<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="clean-block clean-post dark">
	<div class="container">
		<%@ include file="include/menutop.jsp" %>
		
		<c:choose>
			<c:when test="${empty list}">
				<div class="block-content mt-4 p-4" data-aos="fade-up-right">
				스크랩한 글이 없습니다.
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
									<p>${dto.memo}</p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
</section>