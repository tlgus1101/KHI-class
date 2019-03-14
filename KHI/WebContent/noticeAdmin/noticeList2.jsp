<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>공지사항</title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css"
	type="text/css">
</head>

<body>
<script type="text/javascript">
		function admin_mainOpen() {
			location.href = "/KHI/AdminMainAction.action";
		}
	</script>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>공지사항</h2></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	
	</table>
	


	<b>글목록 (전체 글 : <s:property value="totalCount" />)
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr><td colspan="5" align="right"><input type="button" value="홈 " onclick="admin_mainOpen()"></td></tr>
	<tr align="center">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="50"><strong>번호</strong></td>
			<td width="350"><strong>제목</strong></td>
			
			<td width="70"><strong>등록일</strong></td>
			<td width="60"><strong>조회수</strong></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>

		<s:iterator value="list" status="stat">


		<s:url id="viewURL" action="noticeAViewAction">
			<s:param name="n_no">
					<s:property value="n_no" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			
     	      <tr bgcolor="#FFFFFF" align="center">
				<td><s:property value="n_no" /></td>
				<td align="center">&nbsp;<s:a href="%{viewURL}">
						<s:property value="n_subject" />
					</s:a></td> 
				<!-- <td align="center"><s:property value="name" /></td>  -->
				<td align="center"><s:property value="n_regdate" /></td>
				<td><s:property value="n_readhit" /></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr>

		</s:iterator>

		<s:if test="list.size() <= 0">

			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="5">등록된 게시물이 없습니다.</td> 

			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr>

		</s:if>

		<tr align="center">
			<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
		</tr>

		<tr align="right">
			<td colspan="5"><input type="button" value="글쓰기" class="inputb"
				onClick="javascript:location.href='noticeAWriteForm.action?currentPage=<s:property value="currentPage" />';">
			</td>
		</tr>
		<tr align="center">
		<td colspan="5">
			<form>
				<select name="searchNum" >
					<option value="0">제목</option>
					<option value="1">내용</option>
				</select>
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
				<input name="submit" type="submit" value="검색" class="inputb">
			</form>
		</td>
	</tr>
	</table>
</body>
</html>
