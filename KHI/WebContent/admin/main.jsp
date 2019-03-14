<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
<head>
<title><tiles:getAsString name="title" /></title>
</head>
<body>

<tr>
	<td>
		<tiles:insertAttribute name="header" />
	</td>
</tr>
<tr>
	<td>
		<tiles:insertAttribute name="body" />
	</td>
</tr>
		


</body>
</html>
