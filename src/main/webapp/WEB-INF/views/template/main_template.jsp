<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title><tiles:getAsString name="title" /></title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://baejino.com/baealex.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/main.v2.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
	<script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.js"></script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>
<body>
	<tiles:insertAttribute name="topnav" />
	<div class="nav-back"></div>
	<div class="content">
		<tiles:insertAttribute name="body"/>
	</div>
	<tiles:insertAttribute name="footer" />
	<script>
  		AOS.init();
	</script>
	<style>
	.notify-list {
		list-style: none;
		padding-left: 0;
	}
	.notify-list li {
		
	}
	.notify-list li > a {
		color: #000;
		text-decoration: none;
	}
	</style>
	<script>
		$(document).ready(function () {
			$(window).scroll(function () {
				screenPosition = $(this).scrollTop();
				if (screenPosition < 1) {
					$('#top-main-nav').css("position", "absolute");
					$('#top-main-nav').css("padding", "50px 10px 50px 10px");
				} else {
					$('#top-main-nav').css("position", "fixed");
					$('#top-main-nav').css("padding", "10px 10px 10px 10px");
				}
			});
		});
		
		$.ajax({
		    url: "user/notify",
		    type: "get",
		}).done(function(data) {
			if(data.count > 0) {
				$('#notify-count').text(data.count);
				result = ''
				data.content.forEach(function(element) {
				 	result += notifyRender(element);
				});
				$('#notify-content').html(result);
			}
		});
		
		var notifyRender = function(element) {
			return "\
			<div class=\"\">\
			  <div class=\"card-body\">\
			    <blockquote class=\"mb-0\">\
			      <p><a class=\"immutable\" href=\"post_read?num="+ element.post +"\" onclick=\"deleteNotify("+ element.num +")\">"+ element.detail +"</a></p>\
			      <footer class=\"blockquote-footer\">"+ element.date +"</footer>\
			    </blockquote>\
			  </div>\
			</div>\
			"
		}
		
		function deleteNotify(num) {
			$.ajax({
			    url: "user/notify/delete",
			    type: "post",
			    data: {"num": num},
			});
		}
	</script>
</body>
</html>