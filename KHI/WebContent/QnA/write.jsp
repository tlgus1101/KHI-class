<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>스트럿츠2 게시판</title>
<link rel="stylesheet" href="/_KHI/QnA/common/css/css.css"
	type="text/css">

	<script type="text/javascript">
		function validation() {
			var frm = document.fff;

			if (frm.q_subject.value == "") {
				alert("제목 입력해");
				return false;
			} else if (frm.q_name.value == "") {
				alert("name 입력해");
				return false;
			} else if (frm.q_password.value == "") {
				alert("password 입력해");
				return false;
			} else if (frm.q_content.value == "") {
				alert("content 입력해");
				return false;
			}
			return true;
		}
	</script>
</head>
<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>QnA</h2></td>
		</tr>
	</table>

	<s:if test="resultClass==NULL">
		<form action="QnAwriteAction.action" name="fff" method="post"
			enctype="multipart/form-data" onsubmit="return validation();" />
	</s:if>

	<s:elseif test="reply">
		<form action="replyAction.action" name="fff" method="post"
			enctype="multipart/form-data" onsubmit="return validation();" />
		<s:hidden name="checkre" value="%{resultClass.checkre}" />
		<s:hidden name="ref" value="%{resultClass.ref}" />
		<s:hidden name="re_step" value="%{resultClass.re_step}" />
	</s:elseif>

	<s:else>
		<form action="QnAmodifyAction.action" method="post"
			enctype="multipart/form-data" name="fff"
			onsubmit="return validation();" />
		<s:hidden name="q_num" value="%{resultClass.q_num}" />
		<s:hidden name="q_option" value="%{resultClass.q_option}" />
		<s:hidden name="currentPage" value="%{currentPage}" />
		<s:hidden name="old_file" value="%{resultClass.file_savname}" />
	</s:else>

	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000">*</font>는 필수
				입력사항입니다.</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="#F4F4F$"><font color="FF0000">*</font>제목</td>
			<td width="500" bgcolor="#FFFFFF"><s:textfield name="q_subject"
					theme="simple" value="%{resultClass.q_subject}"
					cssStyle="width:279px" maxlength="30" /></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$"><font color="FF0000">*</font>이름</td>
			<td bgcolor="#FFFFFF"><s:textfield name="q_name" theme="simple"
					value="%{resultClass.q_name}" cssStyle="width:100px" maxlength="10" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$"><font color="FF0000">*</font>비밀번호</td>
			<td bgcolor="#FFFFFF"><s:password name="q_password"
					theme="simple" value="%{resultClass.q_password}"
					cssStyle="width:100px" maxlength="10" /></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$"><font color="FF0000"></font>이메일</td>
			<td bgcolor="#FFFFFF"><s:textfield name="q_email" theme="simple"
					value="%{resultClass.q_email}" cssStyle="width:279px"
					maxlength="30" /></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$"><font color="FF0000">*</font>내용</td>
			<td bgcolor="#FFFFFF"><s:textarea name="q_content"
					theme="simple" value="%{resultClass.q_content}" cols="50" rows="10" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$">첨부파일</td>
			<td bgcolor="#FFFFFF"><s:file name="upload" theme="simple" /> <s:if
					test="resultClass.file_orgname!=NULL">&nbsp;<s:property
						value="resultClass.file_orgname" />기존파일 날아감</s:if></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td height="10" colspan="2"></td>
		</tr>

		<tr>
			<td align="right" colspan="2"><input name="submit" type="submit"
				value="작성완료" class="inputb"> <input name="list"
					type="button" value="목록" class="inputb"
					onclick="javascript:location.href='QnAlistAction.action?currentPage=<s:property value="currentPage"/>'"></td>
		</tr>
	</table>

</body>
</html>