<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>검색 결과</title>
<link rel="stylesheet" href="/_KHI/QnA/common/css/css.css"
	type="text/css">
</head>
<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>찾은 글 목록</h2></td>
		</tr>

		<tr>
			<td height="20"></td>
		</tr>
	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="50"><strong>번호</strong></td>
			<td width="350"><strong>제목</strong></td>
			<td width="70"><strong>글쓴이</strong></td>
			<td width="80"><strong>날짜</strong></td>
			<td width="50"><strong>조회</strong></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>

		<s:iterator value="list" status="stat">
			<s:url id="viewURL1" action="QnAviewAction">
				<s:param name="q_num">
					<s:property value="q_num" />
				</s:param>

				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<s:url id="viewURL2" action="CUSviewAction">
				<s:param name="q_num">
					<s:property value="q_num" />
				</s:param>

				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr bgcolor="#FFFFFF" align="center">
				<td><s:property value="q_num" /></td>
				<td align="left">&nbsp;<s:if test="q_option == 1">
						<s:a href="%{viewURL1}">
							<s:property value="q_subject" />
						</s:a>
					</s:if> <s:else>
						<s:a href="%{viewURL2}">
							<s:property value="q_subject" />
						</s:a>
					</s:else>
				</td>
				<td align="center"><s:property value="q_name" /></td>
				<td align="center"><s:property value="regdate" /></td>
				<td><s:property value="checkre" /></td>
			</tr>

			<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr>
		</s:iterator>

		<s:if test="list.size()<=0">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="5">등록된 게시물이 없습니다...</td>
			</tr>

			<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr>
		</s:if>

		<tr align="center">
			<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
		</tr>
		<tr>
			<td align="right" colspan="5"><input name="list" type="button"
				value="목록" class="inputb"
				onclick="javascript:location.href='QnAlistAction.action?currentPage=<s:property value="currentPage"/>'"></td>
		</tr>
	</table>

</body>
</html>