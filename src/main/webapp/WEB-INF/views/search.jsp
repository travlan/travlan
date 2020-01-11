<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<section class="clean-block clean-post dark">
	<div class="container">
		<div class="block-content mb-4 p-4">
			<form method="get">
				<div class="input-group mb-3">
					<input id="search-input" type="text" class="form-control" name="value" placeholder="검색어를 입력하세요!" aria-describedby="basic-addon2">
					<div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="submit">검색</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<input type="checkbox" name="type1A" value="true" id="t1-1" class="search-check"><label for="t1-1">빡빡</label>
						<input type="checkbox" name="type1B" value="true" id="t1-2" class="search-check"><label for="t1-2">느슨</label>
						<input type="checkbox" name="type2A" value="true" id="t2-1" class="search-check"><label for="t2-1">주간</label>
						<input type="checkbox" name="type2B" value="true" id="t2-2" class="search-check"><label for="t2-2">야간</label>
						<input type="checkbox" name="type3A" value="true" id="t3-1" class="search-check"><label for="t3-1">활기</label>
						<input type="checkbox" name="type3B" value="true" id="t3-2" class="search-check"><label for="t3-2">조용</label>
					</div>
					<div class="col-md-6">
						<input type="radio" name="season" value="S" id="s1" class="search-check"><label for="s1">봄</label>
						<input type="radio" name="season" value="U" id="s2" class="search-check"><label for="s2">여름</label>
						<input type="radio" name="season" value="F" id="s3" class="search-check"><label for="s3">가을</label>
						<input type="radio" name="season" value="W" id="s4" class="search-check"><label for="s4">겨울</label>
					</div>
				</div>
			</form>
		</div>
		<c:choose>
		<c:when test="${empty list}">
			<div class="block-content p-4" data-aos="fade-up-right">
				검색결과가 존재하지 않습니다!
        	</div>
		</c:when>
		<c:otherwise>
			<div id="card-wrapper" class="row">
			<c:forEach var="dto" items="${list}">
				<div class="col-lg-4" data-aos="fade-up-right">
					<div class="block-content mb-4">
						<a href="post_read?num=${dto.post_num}">
							<div class="post-list-thumb fill-image" style="background-image: url(/image/photo_thumbnail/${dto.thumbnail});"></div>
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

<script>
$('#search-input').val(getParameter('value'));
if(getParameter('type1A')) {
	$('#t1-1').prop("checked", true);
}
if(getParameter('type1B')) {
	$('#t1-2').prop("checked", true);
}
if(getParameter('type2A')) {
	$('#t2-1').prop("checked", true);
}
if(getParameter('type2B')) {
	$('#t2-2').prop("checked", true);
}
if(getParameter('type3A')) {
	$('#t3-1').prop("checked", true);
}
if(getParameter('type3B')) {
	$('#t3-2').prop("checked", true);
}
if(getParameter('season') == 'S') {
	$('#s1').prop("checked", true);
}
if(getParameter('season') == 'U') {
	$('#s2').prop("checked", true);
}
if(getParameter('season') == 'F') {
	$('#s3').prop("checked", true);
}
if(getParameter('season') == 'W') {
	$('#s4').prop("checked", true);
}
</script>