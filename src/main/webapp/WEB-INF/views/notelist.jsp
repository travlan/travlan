<%@ page contentType = "text/html;charset=utf-8" %><%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="clean-block clean-post dark">
	<div class="container">
		<%@ include file="include/menutop.jsp" %>
		
		<div class="block-content mt-4" data-aos="fade-up-right">
			<c:choose>
			<c:when test="${empty list}">
				쪽지가 존재하지 않습니다.
			</c:when>
			<c:otherwise>
				<ul class="list-group list-group-flush">
				<c:forEach var="dto" items="${list}">
					<li class="list-group-item">${ dto.content }</li>
				</c:forEach>
				</ul>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>