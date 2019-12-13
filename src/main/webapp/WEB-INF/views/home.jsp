<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<div class="slide fill-half-display">
    <ul>
      <li class="fill-image" style="background-image: url(assets/image/1.jpg);"><div class="dark-mask"></div></li>
      <li class="fill-image" style="background-image: url(assets/image/2.jpg);"><div class="dark-mask"></div></li>
      <li class="fill-image" style="background-image: url(assets/image/3.jpg);"><div class="dark-mask"></div></li>
      <li class="fill-image" style="background-image: url(assets/image/4.jpg);"><div class="dark-mask"></div></li>
	</ul>
</div>
<div class="main-title font-namyun">
	<c:choose>
		<c:when test="${not empty sessionScope.id}">
			<h3>특별한 순간 ${sessionScope.nickname}님과 함께</h3>
		</c:when>
		<c:otherwise>
			<h3>특별한 순간 우리와 함께</h3>
		</c:otherwise>
	</c:choose>
</div>
<section class="clean-block clean-post dark">
	<div class="container">
	<c:choose>
		<c:when test="${not empty sessionScope.id}">
			<c:choose>
				<c:when test="${is_info}">
					<div class="block-content mb-4 p-4 font-myungjo">
						 ${sessionScope.nickname}님만을 위한 <span id="recommend-title"></span>
					</div>
					<div id="insert-html" class="row"></div>
					<script>
						var randomNumber = Math.floor(Math.random() * 5);
						var age = "${idto.age}";
						var type = "${idto.type}";
						var baseURL = "https://travlan-extends.run.goorm.io";
						console.log(randomNumber);
						
						if(randomNumber == 0) {
							$('#recommend-title').text('취향 저격 여행지!');
							$.ajax({
					            url:  baseURL + "/recommend/type",
					            data: { "value" : type },
					            type: "get",
					        }).done(function (data) {
					        	result = ''
								data.posts.forEach(function(element) {
								 	result += renderPost(element);
								});
							    $('#insert-html').html(result);
					        });
						}
						else if(randomNumber == 1) {
							$('#recommend-title').text(type[0]=='A'?'빡빡':'느슨' + '한 일정의 여행지!');
							$.ajax({
					            url:  baseURL + "/recommend/type/1",
					            data: { "value" : type[0] },
					            type: "get",
					        }).done(function (data) {
					        	result = ''
								data.posts.forEach(function(element) {
									result += renderPost(element);
								});
					        	$('#insert-html').html(result);
					        });
						}
						else if(randomNumber == 2) {
							$('#recommend-title').text(type[1]=='A'?'주간':'야간' + '이 끝내주는 여행지!');
							$.ajax({
					            url:  baseURL + "/recommend/type/2",
					            data: { "value" : type[1] },
					            type: "get",
					        }).done(function (data) {
					        	result = ''
							 	data.posts.forEach(function(element) {
							 		result += renderPost(element);
							 	});
					        	$('#insert-html').html(result);
					        });
						}
						else if(randomNumber == 3) {
							$('#recommend-title').text(type[2]=='A'?'활기찬':'조용한' + ' 분위기의 여행지!');
							$.ajax({
					            url:  baseURL + "/recommend/type/3",
					            data: { "value" : type[2] },
					            type: "get",
					        }).done(function (data) {
					        	result = ''
						 		data.posts.forEach(function(element) {
						 			result += renderPost(element);
						 		});
					        	$('#insert-html').html(result);
					        });
						}
						else if(randomNumber == 4) {
							$('#recommend-title').text(age + '대가 많이 가는 여행지!');
							$.ajax({
					            url:  baseURL + "/best/region",
					            data: { "age" : age },
					            type: "get",
					        }).done(function (data) {
					        	result = ''
							 	data.result.forEach(function(element) {
							 		result += "<h5 class=\"col-md-12\">"+ element[0] +"</h5>";
							 	});
						        $('#insert-html').html(result);
					        });
						}
						
						function renderPost(element) {
							return "\
							<div class=\"col-lg-4\" data-aos=\"fade-up-right\">\
								<div class=\"block-content mb-4\">\
									<a href=\"post_read?num="+ element.num +"\">\
										<div class=\"post-list-thumb fill-image\" style=\"background-image: url(storage/photo_thumbnail/"+ element.image +");\"></div>\
									</a>\
									<div class=\"p-4\">\
										<div class=\"post-content font-myungjo\">\
											<h4 class=\"post-list-title\"><a class=\"immutable\" href=\"post_read?num="+ element.num +"\">"+ element.title +"</a></h4>\
										</div>\
									</div>\
								</div>\
							</div>\
							"
						}
					</script>
				</c:when>
				<c:otherwise>
					<div class="block-content mb-4 p-4 font-myungjo">
						추가 정보를 입력하면 추천 정보를 얻을 수 있습니다!
					</div>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<div class="block-content mb-4 p-4 font-myungjo">
				Travlan의 회원이 되어보세요! 맞춤 정보를 제공합니다!
			</div>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${empty list}">
			<div class="block-content mt-4" data-aos="fade-up-right">
				게시글이 존재하지 않습니다.
        	</div>
		</c:when>
		<c:otherwise>
			<div class="block-content mb-4 p-4 font-myungjo" data-aos="fade-up-right">
				Travlan에서 가장 완벽한 여행을 찾아보세요!
			</div>
			<div id="card-wrapper" class="row">
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
								<c:set var="checkScrap" value="${util:checkScrap(sessionScope.num, dto.post_num, scrap_mapper)}"/>
								<ul class="post-info list-none">
									<li><i class="far fa-star"></i> 25</li>
									<li><i class="far fa-comment"></i> ${count }</li>
									<c:if test="${not empty sessionScope.id}">
										<c:if test="${dto.member_num != sessionScope.num}">
											<c:choose>
												<c:when test="${checkScrap == 0}">
													<li id="heart-icon-${dto.post_num}" onclick="doScrap(${dto.post_num})"><i class="far fa-heart"></i></li>
												</c:when>
												<c:otherwise>
													<li id="heart-icon-${dto.post_num}" class="active" onclick="cancelScrap(${dto.post_num})"><i class="fas fa-heart"></i></li>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:if>
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
</section>

<style>
.wirte-btn {
    cursor: pointer;
    position: fixed;
    left: 23px;
    bottom: 23px;
    background: #000;
    border-radius: 100%;
    width: 50px;
    height: 50px;
    text-align: center;
    color: #fff;
    z-index: 10;
}
.wirte-btn i {
    padding-top: 12px;
    font-size: 24px;
}
input[class="search-check"] + label {
	padding: 5px;
	display: inline-block;
	border: 1px solid #bcbcbc;
	cursor: pointer;
}
input[class="search-check"]:checked + label {
	background-color: #666666;
	color: #fff;
}
input[class="search-check"] {
	display: none;
}
</style>

<a href="#" data-toggle="modal" data-target="#searchModal">
	<div class="wirte-btn">
		<i class="fas fa-search"></i>
	</div>
</a>

<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="searchModalLabel"><i class="fas fa-search"></i> Search</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <form>
		      	<div class="input-group mb-3">
			  		<input type="text" class="form-control" name="value" placeholder="검색어를 입력하세요!" aria-describedby="basic-addon2">
			  		<div class="input-group-append">
			    		<button class="btn btn-outline-secondary" type="button" onclick="searchForm()">검색</button>
			  		</div>
				</div>
		        <input type="checkbox" name="type1" value="A" id="t1-1" class="search-check"><label for="t1-1">빡빡</label>
		        <input type="checkbox" name="type1" value="B" id="t1-2" class="search-check"><label for="t1-2">느슨</label>
		        <input type="checkbox" name="type2" value="A" id="t2-1" class="search-check"><label for="t2-1">주간</label>
		        <input type="checkbox" name="type2" value="B" id="t2-2" class="search-check"><label for="t2-2">야간</label>
		        <input type="checkbox" name="type3" value="A" id="t3-1" class="search-check"><label for="t3-1">활기</label>
		        <input type="checkbox" name="type3" value="B" id="t3-2" class="search-check"><label for="t3-2">조용</label>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script src="assets/js/infiscroll.js"></script>
<script>
	var postWrapperId = 'card-wrapper';
	var paginatePath = '/travlan/?page=';
	var lastPage = ${lastPage};
	new InfiniteScroll(paginatePath, postWrapperId, lastPage);
</script>
<script>
	function doScrap(post_num) {
		$.ajax({
			url: "scrap",
			data: { 'post_num' : post_num },
			type: "post",
		}).done(function (data) {
			if(data.flag == 'Y') {
				$('#heart-icon-' + post_num).addClass('active');
				$('#heart-icon-' + post_num).html('<i class=\"fas fa-heart\"></i>');
				$('#heart-icon-' + post_num).removeAttr('onclick');
				$('#heart-icon-' + post_num).attr('onclick', 'cancelScrap(' + post_num + ')');
				done = true;
			} else {
				$('#heart-icon-' + post_num).addClass('active');
				$('#heart-icon-' + post_num).html('<i class=\"fas fa-heart\"></i>');
				$('#heart-icon-' + post_num).removeAttr('onclick');
				$('#heart-icon-' + post_num).attr('onclick', 'cancelScrap(' + post_num + ')');
				done = true;
			}
		});
	}
	
	function cancelScrap(post_num) {
		$.ajax({
			url: "deleteScrap",
			data: { 'post_num' : post_num },
			type: "post",
		}).done(function (data) {
			if(data.flag == 'Y') {
				$('#heart-icon-' + post_num).removeClass('active');
				$('#heart-icon-' + post_num).html('<i class=\"far fa-heart\"></i>');
				$('#heart-icon-' + post_num).removeAttr('onclick');
				$('#heart-icon-' + post_num).attr('onclick', 'doScrap(' + post_num + ')');
				done = true;
			} else {
				$('#heart-icon-' + post_num).removeClass('active');
				$('#heart-icon-' + post_num).html('<i class=\"far fa-heart\"></i>');
				$('#heart-icon-' + post_num).removeAttr('onclick');
				$('#heart-icon-' + post_num).attr('onclick', 'doScrap(' + post_num + ')');
				done = true;
			}
		});
	}
  
var getParameter = function (param) {
    var returnValue;
    var url = location.href;
    var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
    for (var i = 0; i < parameters.length; i++) {
        var varName = parameters[i].split('=')[0];
        if (varName.toUpperCase() == param.toUpperCase()) {
            returnValue = parameters[i].split('=')[1];
            return decodeURIComponent(returnValue);
        }
    }
};

function getCookie(c_name)
{
	var i,x,y,ARRcookies=document.cookie.split(";");
	for (i=0;i<ARRcookies.length;i++)
	{
	  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
	  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
	  x=x.replace(/^\s+|\s+$/g,"");
	  if (x==c_name)
		{
		return unescape(y);
		}
	  }
}

if(getParameter('search') == 'on') {
	$('#searchModal').modal('show');
	if(getParameter('query') == 'on') {
		search(getCookie('query'))
	}
}

function searchForm() {
	var form = $('form');
	search(form.serialize());
}

function search(params) {
	alert(params)
	var stateObj = {foo : "bar"};
	history.pushState(stateObj, "", "?search=on&query=on");
	document.cookie = 'query=' + params;
    $.ajax({
        url: "https://travlan-extends.run.goorm.io/search",
        data: params,
        type: "POST",
    }).done(function (data) {
		alert("검색중...")
    }).fail(function() {
        alert("에러가 발생했습니다.");
    });
}
</script>