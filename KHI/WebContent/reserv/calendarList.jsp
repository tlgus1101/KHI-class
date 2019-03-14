<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<tiles:insertDefinition name="calendarList" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td bgcolor="#999999" width="350" height="80">
				<p align="center">
					<font size="12"><img src="./image/calendar1.png" width="50"
						height="50"> ${date }</font> <font size="5">일. 진행 현황</font>
				</p>
			</td>
		</tr>
		<tr>
			<td bgcolor="#999999" width="350" height="205"><s:iterator
					value="list" status="stat">
					<p align="center">
						<img src="./image/location1.png" width="20" height="30">&nbsp;&nbsp;&nbsp;<a
							href="winViewAction.action?v_num=${v_num }"><font size="3"
							color="#ffffff"><s:property value="r_location" /></font>
							&nbsp;&nbsp; <font color="#0000FFFF"><s:if
									test="r_option == 1">부분 </s:if> <s:else> 전체  </s:else> </font></a>
					</p>
					<br>
				</s:iterator>
		</tr>

	</table>
</body>
</html>