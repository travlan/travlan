<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><tiles:getAsString name="title"/></title>
  <tiles:insertAttribute name="style"/>
</head>
<body>
  <tiles:insertAttribute name="topnav"/>
  <tiles:insertAttribute name="body"/>
  <tiles:insertAttribute name="footer"/>
</body>
</html>