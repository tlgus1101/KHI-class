<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>문의사항</title>
<link rel="stylesheet" href="/_KHI/QnA/common/css/css.css"
	type="text/css">
	<script type="text/javascript">
		function open_win_search(url, name) {
			var oWin = window.open(url, name,
					"status=no, resizable=no, width=700, height=850");
		}
	</script>
</head>
<body>

	<table>
		<tr>
			<td bgcolor="#000000" colspan="3"></td>
		</tr>
		<tr>
			<td><table width="450" border="0">
					<tr>
						<td colspan="4" bgcolor="#999999"></td>
					</tr>
					<tr align="right">
						<td colspan="4"><input type="button" value="더보기"
							class="inputb"
							onclick="javascript:open_win_search('QnAlistAction.action?currentPage=<s:property value="currentPage"/>','QnAlist')" />
					</tr>
					<tr>
						<td colspan="4" bgcolor="#999999"></td>
					</tr>
					<tr align="center" bgcolor="#F3F3F3">
						<td width="350"><strong>제목</strong></td>
						<td width="70"><strong>작성자</strong></td>
						<td width="80"><strong>등록일</strong></td>
					</tr>
					<s:iterator value="list" status="stat">
						<s:url id="viewURL" action="QminiviewAction">
							<s:param name="q_num">
								<s:property value="q_num" />
							</s:param>

							<s:param name="currentPage">
								<s:property value="currentPage" />
							</s:param>
						</s:url>

						<tr align="center">
							<td align="center">&nbsp;<s:a href="%{viewURL}">
									<s:property value="q_subject" />
								</s:a></td>
							<td align="center"><s:property value="q_name" /></td>
							<td align="center"><s:property value="regdate" /></td>
						</tr>

						<tr bgcolor="v">
							<td height="1" colspan="4"></td>
						</tr>
					</s:iterator>
					<s:if test="list.size()<=0">
						<tr align="center">
							<td colspan="4">등록된 게시물이 없습니다...</td>
						</tr>

						<tr>
							<td height="1" colspan="4"></td>
						</tr>
					</s:if>

					<tr align="center">
						<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
					</tr>
				</table></td>

			<tr>
	</table>

</body>
</html>