<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>검색</title>
<link rel="stylesheet" href="/_KHI/QnA/common/css/css.css"
	type="text/css">
	<script type="text/javascript">
		function locationURL() {
			var search = document.search.q_name.value;
			if (window.name == 'search')
				window.opener.parent.location.href = "searchlistAction.action?q_name="+search;
			window.close();
		}
	</script>
</head>
<body style="background-color:#FFFFFF">

	<h2><span style="color:black">내 글 찾기</span></h2>
<form name="search" >
	<table width="385" height="70" border="1" cellspacing="2" cellpadding="1">
	<tr bgcolor="#FF0000">
			<td height="3.2" colspan="2"></td>
		</tr>
		
		<tr>
			<td width="120" bgcolor="#0e388a">&nbsp;&nbsp;&nbsp;<span style="color:white" ><font size="3">이름 입력</font></span></td>
			<td width="200" bgcolor="#0e388a">&nbsp;&nbsp;&nbsp; 
			<input type="text" name="q_name" theme="simple" cssStyle="width:170px" maxlength="20" />
		</tr>
		
		<tr bgcolor="#FF0000">
			<td height="3.2" colspan="2"></td>
		</tr>
		
	</table>
	<font color="#FF0000">*</font><font size="1">글 작성시 입력한 작성자입니다.</font>
	<br />
	<div align="right">
		<td colspan="5"><input type="button" value="검색" class="inputb"
			onclick="locationURL()"/>
	</div>

</form>
</body>
</html>