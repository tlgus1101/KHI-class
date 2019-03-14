<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품정보</title>
</head>
<body>

<table width="600" border="0" cellpadding="2" cellspacing="0">
	<tr>
		<td align="center"><h2>발코니 창호</h2></td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>

	<s:iterator value="list" status="stat">
		<s:url id="viewURL" action="viewAction">
			<s:param name="no">
				<s:property value="no"/>
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage"/>
			</s:param>
		</s:url>
		<tr>
			<td><s:property value="no"/></td>
			<td align="left">
				<s:a href="%{viewURL}"><s:property value="p_image"/></s:a>
			</td>
		</tr>
		
	<tr bgcolor="#777777">
		<td height="1" colspan="5"></td>
	</tr>
	</s:iterator>



</body>
</html>