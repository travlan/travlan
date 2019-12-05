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
					<li class="list-group-item">${dto.send_user_name}   ${dto.content} <a href="" onclick="deleteNote(${dto.num}, ${sessionScope.num});">삭제</a></li>
				</c:forEach>
				</ul>
			</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>

<script>
	function deleteNote(note_num, member_num){
		$.ajax({
	        url: "note/delete",
	        data: {"note_num" : note_num, "member_num" : member_num},
	        type: 'POST'
	    }).done(function (data) {
	    	alert(data);
	    	window.location.reload(true);
	    });
	}
</script>