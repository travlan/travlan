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
                    <div class="post-info"><span>By ${author.nickname}</span><span>${post.created_date}</span><button class="btn btn-primary btn-block" type="button" data-toggle="modal" data-target="#exampleModal" onclick="scrap()">스크랩</button></div>
                    <p>${post.content}</p>
                    <figure class="figure"></figure>
                </div>
            </div>
        </div>
    </section>
</main>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">스크랩</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p><img src="storage/photo_thumbnail/${post.thumbnail}" class="post-image"></p>
				<div class="post-body">
					<h3>${post.title}</h3>
					<span>${author.nickname}</span>
					<textarea id="memo" cols="10" rows="3" name="memo" style="resize: none;"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary">스크랩하기</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

	
<script>
	$("#modalCloseBtn").on("click", function(e){
		$('#myModal').hide();
	});
	
	function scrap() {
		$('#myModal').show();
	}
</script>