<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>삭제 확인</title>
<script type="text/javascript">
var del = confirm("삭제하시겠습니까?")
if(del ==true)
		location.href="noticeADeleteAction.action?n_no=<s:property value="n_no" />&currentPage=<s:property value="currentPage" />";
		else
		history.go(-1);
</script>
</head>
<body>


</body>
</html>