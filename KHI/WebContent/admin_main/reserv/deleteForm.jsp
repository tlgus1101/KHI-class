<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function cancle() {
			window.close();
		}
		function deleteOpen() {
			window.open.location.href = "ReservDeleteAction.action?r_no="+${r_no};
			this.close();
		}
	</script>

	<form action="ReservDeleteOkAction.action">
			<table border="1">
				<tr>
					<td>삭제 하시겠습니까?<input type="hidden" value="${r_no}" name="r_no">
					</td>

				</tr>
				<tr>
					<td><input type="button" value="삭제 " onclick="deleteOpen()"><input
						type="button" value="취소 " onclick="cancle()"></td>
				</tr>
			</table>
	</form>
</body>
</html>