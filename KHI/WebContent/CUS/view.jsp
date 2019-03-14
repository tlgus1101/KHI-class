<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>문의사항</title>
<link rel="stylesheet" href="/_KHI/QnA/common/css/css.css" type="text/css">
<script type="text/javascript">
	function open_win_noresizable(url, name) {
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=300, height=150");
	}
</script>
</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>문의사항</h2></td>
	</tr>
	
	<tr>
		<td height="20"></td>
	</tr>
</table>

<table width="600" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4">번호</td>
		<td bgcolor="#FFFFFF">
			&nbsp;&nbsp;<s:property value="resultClass.q_num"/> 
		</td>
	</tr>
	
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4">제목</td>
		<td bgcolor="#FFFFFF">
			&nbsp;&nbsp;<s:property value="resultClass.q_subject"/> 
		</td>
	</tr>
	
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4">작성자</td>
		<td bgcolor="#FFFFFF">
			&nbsp;&nbsp;<s:property value="resultClass.q_name"/> 
		</td>
	</tr>
	
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4">전화번호</td>
		<td bgcolor="#FFFFFF">
			&nbsp;&nbsp;010&nbsp;&nbsp;-
			&nbsp;&nbsp;<s:property value="resultClass.q_phone1"/>
			&nbsp;&nbsp;-
			&nbsp;&nbsp;<s:property value="resultClass.q_phone1"/> 
		</td>
	</tr>
	
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4">이메일</td>
		<td bgcolor="#FFFFFF">
			&nbsp;&nbsp;<s:property value="resultClass.q_email"/> 
		</td>
	</tr>
	
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4">예약날짜</td>
		<td bgcolor="#FFFFFF">
			&nbsp;&nbsp;<s:property value="resultClass.q_date"/> 
		</td>
	</tr>
	
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4">내용</td>
		<td bgcolor="#FFFFFF">
			&nbsp;&nbsp;<s:property value="resultClass.q_content"/> 
		</td>
	</tr>
	
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4">등록일</td>
		<td bgcolor="#FFFFFF">
			&nbsp;&nbsp;<s:property value="resultClass.regdate"/> 
		</td>
	</tr>
	
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td bgcolor="#F4F4F4">첨부파일</td>
		<td bgcolor="#FFFFFF">
			&nbsp;&nbsp;<s:url id="download" action="fileDownloadAction">
				<s:param name="q_num">
					<s:property value="q_num"/>
				</s:param> 
			</s:url>
			<s:a href="%{download}"><s:property value="resultClass.file_orgname"/></s:a>
		</td>
	</tr>
	
	<tr bgcolor="#777777">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr>
		<td height="10" colspan="2"></td>
	</tr>
	
	<tr>
		<td align="right" colspan="2">
			<s:url id="modifyURL" action="CUSmodifyForm">
				<s:param name="q_num">
					<s:property value="q_num"/>
				</s:param>
			</s:url>
			<s:url id="deleteURL" action="CUSdeleteAction">
				<s:param name="q_num">
					<s:property value="q_num"/>
				</s:param>
			</s:url>
			<input name="list" type="button" value="수정" class="inputb" 
			onclick="javascript:open_win_noresizable('checkForm.action?q_num=<s:property value="resultClass.q_num"/>&currentPage=<s:property value="currentPage"/>','CUSmodify')">
			<input name="list" type="button" value="삭제" class="inputb" 
			onclick="javascript:open_win_noresizable('checkForm.action?q_num=<s:property value="resultClass.q_num"/>&currentPage=<s:property value="currentPage"/>','CUSdelete')">
			<input name="list" type="button" value="목록" class="inputb" 
			onclick="javascript:location.href='CUSlistAction.action?currentPage=<s:property value="currentPage"/>'">
		</td>
	</tr>
	
</table>

</body>
</html>