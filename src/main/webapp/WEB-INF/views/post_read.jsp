<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <link rel="stylesheet" href="assets/css/read.css">
 <main class="page blog-post">
    <section class="clean-block clean-post dark">
        <div class="container">
            <div class="block-content">
                <div class="post-image" style="background-image:url(storage/photo_thumbnail/${post.thumbnail});"></div>
                <div class="post-body">
                    <h3>${post.title}</h3>
                    <div class="post-info"><span>By ${author.nickname}</span><span>${post.created_date}</span></div>
					<c:if test="${post.member_num != sessionScope.num}">
						<c:choose>
							<c:when test="${checkScrap == 0}">
								<button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#exampleModal">스크랩</button>
							</c:when>
						
							<c:otherwise>
								<button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#cancelModal">스크랩 취소</button>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${author.nickname == sessionScope.id}">
						<button class="btn btn-primary btn-block" type="button" >글삭제</button>
					</c:if>
                    <p>${post.content}</p>
                    <figure class="figure"></figure>
                </div>
            </div>
        </div>
    </section>
</main>

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
							<textarea id="memo" cols="10" rows="3" name="memo" style="resize: none;"></textarea>
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
		if($('#memo').val() == "") {
			$('#memo').focus();
			alert("메모를 입력하세요");
			return;
		}
		else {
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
</script>