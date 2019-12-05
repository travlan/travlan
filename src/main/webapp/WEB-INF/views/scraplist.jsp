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
										<p id="scrapmemo-${dto.post_num}">${dto.memo}</p>
										<button class="btn btn-light" id="scrapmemo_btn-${dto.post_num}" type="button" onclick="scrapedPost(${dto.post_num})">수정</button>
										<textarea id="memo-${dto.post_num}" class="form-control" cols="10" rows="5" name="memo" style="resize: none; display: none;">${dto.memo }</textarea>
										<button style="display:none;" class="btn btn-light" id="scrapmemoSave_btn-${dto.post_num}" type="button" onclick="updateScrap(${dto.post_num})">저장</button>
										<button style="display:none;" class="btn btn-light" id="scrapmemoCancel_btn-${dto.post_num}" type="button" onclick="cancelScrap(${dto.post_num})">취소</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</section>

<script>
	function scrapedPost(post_num) {
		$.ajax({
			url: "scrapedPost",
			data: { 'post_num' : post_num },
			type: "post",
		}).done(function (data) {
			if(data.flag == 'Y') {
				$('#scrapmemo-' + post_num).css('display', 'none');
				$('#scrapmemo_btn-' + post_num).css('display', 'none');
				$('#memo-' + post_num).css('display', 'block');
				$('#scrapmemoSave_btn-' + post_num).css('display', 'block');
				$('#scrapmemoCancel_btn-' + post_num).css('display', 'block');
				done = true;
			} else {
				$('#scrapmemo-' + post_num).css('display', 'none');
				$('#scrapmemo_btn-' + post_num).css('display', 'none');
				$('#memo-' + post_num).css('display', 'block');
				$('#scrapmemoSave_btn-' + post_num).css('display', 'block');
				$('#scrapmemoCancel_btn-' + post_num).css('display', 'block');
				done = true;
			}
		});
	}
	
	function updateScrap(post_num) {
		$.ajax({
			url: "updateScrap",
			data: { 'post_num' : post_num, 'memo' : $('#memo-' + post_num).val() },
			type: "post",
		}).done(function (data) {
			if(data.flag == 'Y') {
				$('#scrapmemo-' + post_num).html('');
				$('#scrapmemo-' + post_num).append(data.memo);
				$('#scrapmemo-' + post_num).css('display', 'block');
				$('#scrapmemo_btn-' + post_num).css('display', 'block');
				$('#memo-' + post_num).css('display', 'none');
				$('#scrapmemoSave_btn-' + post_num).css('display', 'none');
				$('#scrapmemoCancel_btn-' + post_num).css('display', 'none');
				done = true;
			} else {
				$('#scrapmemo-' + post_num).css('display', 'block');
				$('#scrapmemo_btn-' + post_num).css('display', 'block');
				$('#memo-' + post_num).css('display', 'none');
				$('#scrapmemoSave_btn-' + post_num).css('display', 'none');
				$('#scrapmemoCancel_btn-' + post_num).css('display', 'none');
				done = true;
			}
		});
	}
	
	function cancelScrap(post_num) {
		$('#scrapmemo-' + post_num).css('display', 'block');
		$('#scrapmemo_btn-' + post_num).css('display', 'block');
		$('#memo-' + post_num).css('display', 'none');
		$('#scrapmemoSave_btn-' + post_num).css('display', 'none');
		$('#scrapmemoCancel_btn-' + post_num).css('display', 'none');
	}
</script>