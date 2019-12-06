<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <link rel="stylesheet" href="assets/css/read.css">
 <div class="page blog-post">
    <section class="clean-block clean-post dark">
        <div class="container">
            <div class="block-content">
                <div class="post-image" style="background-image:url(storage/photo_thumbnail/${post.thumbnail});">
					<div class="dark-mask">
						<h3 class="post-title font-myungjo">${post.title}</h3>
						<div class="post-action">
							<ul class="list-none">
							<c:choose>
								<c:when test="${post.member_num != sessionScope.num}">
									<c:choose>
										<c:when test="${checkScrap == 0}">
											<li id="heart-icon" data-toggle="modal" data-target="#exampleModal"><i class="far fa-heart"></i></li>
										</c:when>
										<c:otherwise>
											<li id="heart-icon" class="active" data-toggle="modal" data-target="#cancelModal"><i class="fas fa-heart"></i></li>
										</c:otherwise>
									</c:choose>
                    				<li onclick="sendMessage(${author.num})"><i class="far fa-comment-alt"></i></li>
									<li><i class="fas fa-user-alt-slash"></i></li>
								</c:when>
								<c:otherwise>
									<li onclick="location.href='./post_update?num=${param.num}'"><i class="far fa-edit"></i></li>
									<li onclick="location.href='./post_delete?num=${param.num}'"><i class="far fa-trash-alt"></i></li>
								</c:otherwise>
							</c:choose>
							</ul>
						</div>
					</div>
				</div>
                <div class="post-body">
                    <div class="post-info"><span>By ${author.nickname}</span><span>${post.created_date}</span></div>
                    <p>${post.content}</p>
                    <figure class="figure"></figure>
                </div>
            </div>
			
			<div class="block-content mt-4" data-aos="fade-up-right">
				<div class="row">
					<div class="col-lg-6 p-5">
					<c:choose>
					<c:when test="${commenthigh != null}">
						<dic class="start-${commenthigh.score}">
						<div class="box">
							<h5 class="name"><strong>${commenthigh.title}</strong></h5>
							<p class="description">${commenthigh.content}</p>
						</div>
						
						<div class="author">
							<p class="title">${commenthigh.member_num}</p>
						</div>
					</c:when>
					<c:otherwise>
						댓글이 없습니다!
					</c:otherwise>
					</c:choose>
					</div>
					
					<div class="col-lg-6 p-5">
					<c:choose>
					<c:when test="${commentlow != null}">
						<dic class="start-${commentlow.score}">
						<div class="box">
							<h5 class="name"><strong>${commentlow.title}</strong></h5>
							<p class="description">${commentlow.content}</p>
						</div>
						
						<div class="author">
							<p class="title">${commentlow.member_num}</p>
						</div>
					</c:when>
					<c:otherwise>
						댓글이 없습니다!
					</c:otherwise>
					</c:choose>
					</div>
				</div>
            </div>
			
			<div class="block-content mt-4" data-aos="fade-up-right">
			<c:choose>
			<c:when test="${not empty comment}">
			<c:forEach var="comment" items="${comment}" varStatus="i">
				<div class="box p-4" id="commentBox${i.count}" style="display: none; border-bottom: 1px solid #ccc; transition: all 1s; opacity: 0;">
					<div class="start-${comment.score}"></div>
					<h5 class="title"><strong>${comment.title}</strong></h5>
					<p>${comment.content}</p>
					<p>${comment.nickname}</p>
					<c:if test="${sessionScope.num == comment.member_num}">
					<button class="btn btn-dark" type="button" onclick="postUpdate(${comment.num});">수정</button>
					<button class="btn btn-dark" type="button" onclick="deleteComment(${comment.num});">삭제</button>
					</c:if>
				</div>
			</c:forEach>
				<div style="cursor: pointer;" class="text-center font-weight-bold p-4" onclick="viewMoreComment()">💬 더 보기 (<span id="commentCount">0</span>/${fn:length(comment)})</div>
			</c:when>
			<c:otherwise>
				<div class="text-center font-weight-bold p-4">💬 작성된 댓글이 없습니다!</div>
			</c:otherwise>
			</c:choose>
            </div>

			<c:if test="${sessionScope.num != null || sessionScope.num == post.member_num}">
			<div class="block-content mt-4" data-aos="fade-up-right">
				<div class="form-group">
					<form class="form-horizontal" id="commentform" name="commentform">
					<div class="select-star-form">
						<h4 class="font-namyun">이 여행을 평가해주세요!</h4>
						<input id="check-star-1" class="select-star" name="rate1" type="checkbox" onclick="checkStar(1)"><label for="check-star-1"></label>
						<input id="check-star-2" class="select-star" name="rate2" type="checkbox" onclick="checkStar(2)"><label for="check-star-2"></label>
						<input id="check-star-3" class="select-star" name="rate3" type="checkbox" onclick="checkStar(3)"><label for="check-star-3"></label>
						<input id="check-star-4" class="select-star" name="rate4" type="checkbox" onclick="checkStar(4)"><label for="check-star-4"></label>
						<input id="check-star-5" class="select-star" name="rate5" type="checkbox" onclick="checkStar(5)"><label for="check-star-5"></label>
					</div>
					<input type="hidden" name="member_num" value="${sessionScope.num}">
					<input type="hidden" name="post_num" value="${param.num}">
					<input type="text" class="comment-form" id="title" name="title" placeholder="제목을 입력해주세요!">
					<textarea class="comment-form" id="content" name="content" placeholder="후기를 남겨주세요!" rows="5"></textarea>
					<button class="btn btn-dark btn-block" type="button" onclick="postComment();">댓글 작성</button>
					</form>
			    </div>
            </div>
            </c:if>
        </div>
    </section>
</div>

<!-- Modal -->
<c:choose>
	<c:when test="${checkScrap == 0}">
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">스크랩</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div id="mainModal" class="modal-body">
						<p><img src="storage/photo_thumbnail/${post.thumbnail}" class="post-image"></p>
						<div class="post-body">
							<h3>${post.title}</h3>
							<span>${author.nickname}</span>
							<textarea id="memo" class="form-control" cols="10" rows="5" name="memo" style="resize: none;"></textarea>
						</div>
					</div>
					<div id="footerModal" class="modal-footer">
						<button id="postScrap" type="button" class="btn btn-secondary" onclick="doScrap()">스크랩하기</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</c:when>
	
	<c:otherwise>
		<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">스크랩 취소</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div id="mainModal" class="modal-body">
						<span>스크랩을 취소하시겠습니까?</span>
					</div>
					<div id="footerModal" class="modal-footer">
						<button id="postScrap" type="button" class="btn btn-secondary" onclick="cancelScrap()">확인</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
	
<script>
	$('#exampleModal').on('shown.bs.modal', function () {
		$("#memo").focus();
	});
	
	var nextSContext = '<div>스크랩 성공</div>';
	var nextFContext = '<div>스크랩 실패</div>';
	var nextSButton = '<button class=\"btn btn-secondary\" type=\"button\" onclick=\"location.href=\'scraplist\'\">스크랩 목록 가기</button>';
	var nextCButton = '<button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">닫기</button>';

	function doScrap() {
		$.ajax({
			url: "scrap",
			data: { 'post_num' : ${post.post_num}, 'memo' : $('#memo').val() },
			type: "post",
		}).done(function (data) {
			if(data.flag == 'Y') {
				$('#mainModal').html('');
				$('#footerModal').html('');
				$('#mainModal').append(nextSContext);
				$('#footerModal').append(nextSButton);
				$('#footerModal').append(nextCButton);
				done = true;
				$('#heart-icon').addClass('active');
				$('#heart-icon').html('<i class=\"fas fa-heart\"></i>');
				$('#heart-icon').attr('data-target', '#cancelModal');
			} else {
				$('#mainModal').html('');
				$('#footerModal').html('');
				$('#mainModal').append(nextFContext);
				$('#footerModal').append(nextSButton);
				$('#footerModal').append(nextCButton);
				done = true;
			}
		});
	}
	
	var sucessContext = '<div>스크랩 취소 성공</div>';
	var failContext = '<div>스크랩 취소 실패</div>';
	
	function cancelScrap() {
		$.ajax({
			url: "deleteScrap",
			data: { 'post_num' : ${post.post_num} },
			type: "post",
		}).done(function (data) {
			if(data.flag == 'Y') {
				$('#mainModal').html('');
				$('#footerModal').html('');
				$('#mainModal').append(sucessContext);
				$('#footerModal').append(nextSButton);
				$('#footerModal').append(nextCButton);
				done = true;
				$('#heart-icon').removeClass('active');
				$('#heart-icon').html('<i class=\"far fa-heart\"></i>');
				$('#heart-icon').attr('data-target', '#exampleModal');
			} else {
				$('#mainModal').html('');
				$('#footerModal').html('');
				$('#mainModal').append(failContext);
				$('#footerModal').append(nextSButton);
				$('#footerModal').append(nextCButton);
				done = true;
			}
		});
	}

	function sendMessage(num) {
		window.open('note/send?user=' + num, '쪽지 보내기', 'width=580, height=280');
		return false;
	}
	
	function checkStar(num) {
		var starID = 'check-star-';
		for(var i=1; i<=5; i++) {
			$('#' + starID + i).prop('checked', false);
		}
		for(var i=1; i<=num; i++) {
			$('#' + starID + i).prop('checked', true);
		}
	}
	
	function postComment(){
		var formData = $("#commentform").serialize();
		$.ajax({
            url: "comment_write",
            data: formData,
            type: 'POST'
        }).done(function (data) {
        	alert(data);
        	location.reload();
        });
	}

	function deleteComment(num){
		$.ajax({
            url: "comment_delete",
            data: {"num" : num},
            type: 'POST'
        }).done(function (data) {
        	alert(data);
        	location.reload();
        });
	}
	
	
	var nextComment = 0;
	var totalComment = ${fn:length(comment)};
	
	function viewMoreComment() {
		if(nextComment < totalComment) {
			for(var i=nextComment; i < nextComment + 5; i++){
				$('#commentBox' + i).css('display', 'block');
				$('#commentBox' + i).css('opacity', '1');
			}
			nextComment += 5;
			if (nextComment > totalComment) {
				nextComment = totalComment;
			}
			$('#commentCount').text(nextComment);
		}
	}
</script>