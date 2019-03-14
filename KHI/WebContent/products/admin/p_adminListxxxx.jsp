<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>재고관리</title>

</head>
<body>
 
	<script type="text/javascript">
		function admin_mainOpen() {
			location.href = "AdminMainAction.action";
		}
	</script>

	<script type="text/javascript">
		function admin_finishSale() {
			location.href = "p_adminFinishSale.action";
		}
	</script>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>재고관리</h2></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td colspan="5" align="right"><input type="button" value="홈 "
				onclick="admin_mainOpen()"> <input type="button"
					value="판매종료 " onclick="admin_finishSale()"></td>
		</tr>
		<tr align="center" bgcolor="#F3F3F3">
			<td width="50"><strong>번호</strong></td>
			<td width="350"><strong>상품이름</strong></td>
			<td width="150"><strong>등록일</strong></td>
			<td width="200"><strong> <a
					href="p_adminList.action?sortByQuan=2">▲</a> 재고수량 <a
					href="p_adminList.action?sortByQuan=1">▼</a>
			</strong></td>
			<td width="200"><strong> <a
					href="p_adminList.action?sortByOption=2">▲</a> 판매정보 <a
					href="p_adminList.action?sortByOption=1">▼</a>
			</strong></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>

		<s:iterator value="list" status="stat">
			<s:url id="viewURL" action="p_adminView">
				<s:param name="p_no">
					<s:property value="p_no" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>

			<tr bgcolor="#FFFFFF" align="center">
				<td><s:property value="p_no" /></td>
				<td align="left">&nbsp;<s:a href="%{viewURL}">
						<s:property value="p_name" />
					</s:a></td>
				<td align="center"><s:property value="p_regDate" /></td>
				<td align="center"><s:property value="p_quan" /></td>
				<td><s:if test="p_option==1">판매중
			</s:if> <s:elseif test="p_option==2">재고없음
			</s:elseif></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr>
		</s:iterator>

		<s:if test="list.size() le 0">
			<tr align="center">
				<td colspan="5">등록된 제품이 없습니다.</td>
			</tr>
			<tr>
				<td height="1" colspan="5"></td>
			</tr>
		</s:if>


		<tr>
			<td colspan="5" align="right"><input type="button" value="글쓰기"
				class="inputb"
				onClick="javascript:location.href='p_writeForm.action?currentPage=<s:property value="currentPage" />';" />
			</td>
		</tr>

		<tr align="center">
			<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
		</tr>
	</table>

	<br />
	<br />






	<form>
		검색 &nbsp;&nbsp;&nbsp; <select name="searchNum">
			<option value="0">이름</option>
			<option value="1">번호</option>
		</select>
		<s:textfield name="searchKeyword" theme="simple" value=""
			cssStyle="width:160px" maxlength="100" />
		<input name="searchPd" type="submit" value="검색" class="inputb" />
	</form>


</body>
</html>