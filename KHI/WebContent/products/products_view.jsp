<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>제품소개</title>
</head>
<body>
	<s:url id="listBal" action="products_list_bal"></s:url>
	<s:url id="listMy" action="products_list_my"></s:url>
	<s:url id="listAcc" action="products_list_acc"></s:url>
<div id="middleArea">
			<aside id="contentInfoCon" class="area clearfix">
				<h3 class="content-tit">
																		제품소개															</h3>
				<div class="location">
					<ul>
						<li><img src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
						<li>제품소개</li>
													<li>발코니 창호</li>
												
						
					</ul>
				</div>
			</aside>
			<aside id="contentInfoCon" class="area clearfix">
				<h3 class="content-tit"><s:a href="%{listBal}"><h5>　　　　　　　　　발코니 창호</h5></s:a></h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h3 class="content-tit"><s:a href="%{listMy}"><h5>　　　　　　　　　　내 창/방</h5></s:a></h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h3 class="content-tit"><s:a href="%{listAcc}"><h5>　　　　　　　　　　악세사리　</h5></s:a></h3>		
			</aside>


  		<!-- content -->
<center>
<aside class="bbs-view-top">
<table width="600" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td align="center" colspan="3">
		<h1 class="bbs-tit">
			상품이름:
			<s:property value="resultClass.p_name" />
		</h1>
		
		</td>
	</tr>
	
	<table width="300" border="0">
	<div style='line-height:200%'>
	<tr style="line-height:150%">
		<td><b>구분 </b></td>
		<td colspan="2">
		<s:if test="p_type=1">&nbsp;&nbsp; 발코니
		</s:if>
		<s:elseif test="p_type=2">&nbsp;&nbsp; 내 창
		</s:elseif>
		<s:elseif test="p_type=3">&nbsp;&nbsp; 악세서리
		</s:elseif>
		</td>
	</tr>

	<tr style="line-height:250%">
		<td><b>가격 </b></td>
		<td colspan="2">&nbsp;&nbsp;
		<s:property value="resultClass.p_price" />&nbsp;원
		</td>
	</tr>
	
	<tr style="line-height:250%">
		<td><b>제조사 </b></td>
		<td colspan="2">&nbsp;&nbsp;
		<s:property value="resultClass.p_mf" />
		</td>
	</tr>
	
	<tr style="line-height:250%">
		<td><b>원산지 </b></td>
		<td colspan="2">&nbsp;&nbsp;
				<s:property value="resultClass.p_org" />
		</td>
	</tr>
	
	<tr style="line-height:250%">
		<td><b>창틀폭 </b></td>
		<td colspan="2">&nbsp;&nbsp;
		<s:property value="resultClass.p_frame" />
		</td>
	</tr>
	
	<tr style="line-height:250%">
		<td><b>유리적용 </b></td>
		<td colspan="2">&nbsp;&nbsp;
		<s:property value="resultClass.p_sash" />
		</td>
	</tr>
	<tr style="line-height:250%">
		<td><b>상세내용 </b></td>
		<td colspan="2">&nbsp;&nbsp;
		<pre>
		<s:property value="resultClass.p_detail" escape="flase" /></pre>
		</td>
		</td>
	</tr>
	</div>
	</table>
</aside>	
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<tr style="line-height:250%">
		<td></td>
		<td colspan="2">&nbsp;&nbsp;&nbsp;
	<img src="../imageFIle/<s:property value="resultClass.p_imagesv"/>"width="400" height="500"><br />
	</tr>
	<br />
	<br />
	<br />
	<br />
	<br />

	
</table>
<div class="cm-btn-controls">
				<div class="right-btn-controls">
			<a href="http://localhost:8080/_KHI/products/products_list_bal.action" class="btn-style01">목록</a>
		</div>
</div>
</a>
</center>

			<!-- //content -->
		</div>
 </body>
</html>