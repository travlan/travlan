<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><tiles:getAsString name="title"/></title>
	<link rel="stylesheet" href="https://baejino.com/baealex.css">
	<link rel="stylesheet" href="../assets/css/bootstrap.css">
	<link rel="stylesheet" href="../assets/css/main.v2.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
	<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
	<script src="../assets/js/jquery.js"></script>
	<script src="../assets/js/bootstrap.js"></script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <style>
		
    </style>
</head>
<body>
	<tiles:insertAttribute name="body"/>
</body>
</html>