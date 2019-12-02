<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><tiles:getAsString name="title"/></title>
    <style>
        body {
            padding: 0;
            margin: 0;
        }
        form {
            width: 300px;
            border: 1px solid #ccc;
        }
        form > * {
            box-sizing: border-box;
            display: block;
            width: 100%;
        }
        form > textarea {
            min-height: 500px;
        }
    </style>
</head>
<body>
	<tiles:insertAttribute name="body"/>
</body>
</html>