<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>비밀번호 확인</title>
<link rel="stylesheet" href="/_KHI/QnA/common/css/css.css"
	type="text/css">
	<script type="text/javascript">
		function locationURL() {
			if (window.name == 'QnAmodify')
				window.opener.parent.location.href = 'QminimodifyForm.action?q_num=<s:property value="q_num" />&currentPage=<s:property value="currentPage" />';
			else if (window.name == 'CUSmodify') {
				window.opener.parent.location.href = 'CminimodifyForm.action?q_num=<s:property value="q_num" />&currentPage=<s:property value="currentPage" />';
			} else if (window.name == 'QnAdelete') {
				alert("삭제되었습니다.");
				window.opener.parent.location.href = 'QminideleteAction.action?q_num=<s:property value="q_num" />&currentPage=<s:property value="currentPage" />';
			} else if (window.name == 'CUSdelete') {
				alert("삭제되었습니다.");
				window.opener.parent.location.href = 'CminideleteAction.action?q_num=<s:property value="q_num" />&currentPage=<s:property value="currentPage" />';
			}
			window.close();
		}
	</script>
</head>
<body>

	<script>
		locationURL()
	</script>

</body>
</html>