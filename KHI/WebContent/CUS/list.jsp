<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>QnA</title>
<link rel="stylesheet" href="/_KHI/QnA/common/css/css.css"
	type="text/css">
	<script type="text/javascript">
		function open_win_search(url, name) {
			var oWin = window
					.open(url, name,
							"scrollbars=no, status=no, resizable=no, width=300, height=150");
		}
	</script>
</head>
<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>문의사항</h2></td>
		</tr>

		<tr>
			<td align="right"><h3>Home > 견적문의</h3></td>
		</tr>

	</table>

	<tr>
		<td align="center" colspan="2"><input name="list" type="button"
			value="QnA" class="inputb"
			onclick="javascript:location.href='QnAlistAction.action?currentPage=<s:property value="currentPage"/>'" />
			<input name="list" type="button" value="견적문의" class="inputb"
			onclick="javascript:location.href='CUSlistAction.action?currentPage=<s:property value="currentPage"/>'" />
		</td>
	</tr>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="50"><strong>번호</strong></td>
			<td width="350"><strong>제목</strong></td>
			<td width="70"><strong>작성자</strong></td>
			<td width="80"><strong>등록일</strong></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>

		<s:iterator value="list" status="stat">
			<s:url id="viewURL" action="CUSviewAction">
				<s:param name="q_num">
					<s:property value="q_num" />
				</s:param>

				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr bgcolor="#FFFFFF" align="center">
				<td><s:property value="q_num" /></td>
				<td align="left">&nbsp;<s:a href="%{viewURL}">
						<s:property value="q_subject" />
					</s:a></td>
				<td align="center"><s:property value="q_name" /></td>
				<td align="center"><s:property value="regdate" /></td>
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

		<tr align="right">
			<td colspan="5"><input type="button" value="검색" class="inputb"
				onclick="javascript:open_win_search('searchFormAction.action?currentPage=<s:property value="currentPage"/>','search')"/>
				<input type="button" value="글쓰기" class="inputb"
				onclick="javascript:location.href='CUSwriteForm.action?currentPage=<s:property value="currentPage"/>';" />
			</td>
		</tr>

	</table>

</body>
</html>