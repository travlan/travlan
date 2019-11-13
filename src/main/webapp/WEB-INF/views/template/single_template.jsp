<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title><tiles:getAsString name="title" /></title>
	<link rel="stylesheet" href="https://static.blex.kr/assets/library/bootstrap.css">
	<link rel="stylesheet" href="https://baejino.com/baealex.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap">
	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
</head>
<body>
	<tiles:insertAttribute name="body" />
	<script src="https://static.blex.kr/assets/library/jquery.js"></script>
	<script src="https://static.blex.kr/assets/library/bootstrap.js"></script>
</body>
</html>