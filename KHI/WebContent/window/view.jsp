<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>시공사례</title> 
</head>
<body>
	<!-- <table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>시공현장</h2></td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	</table>-->

			
			<!-- //content -->
		<div id="middleArea">
			<aside id="contentInfoCon" class="area clearfix">
				<h3 class="content-tit">
																		시공현장 사진															</h3>
				<div class="location">
					<ul>
						<li><img src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
						<li>시공사례</li>
													<li>시공현장 사진</li>
												
						
					</ul>
				</div>
			</aside>
			<!-- content -->
			<section id="content" class="area">
				
						
						
<article class="bbs-view-con">
	<aside class="bbs-view-top">
		<!-- 필요할 경우만 삽입 -->
		<!-- <dl class="event-date"><dt><i class="material-icons">&#xE878;</i> 이벤트기간</dt><dd>2017-07-14 ~ 2017-07-31</dd></dl> -->
		<!-- <p class="reply-state"><span>답변대기</span></p><p class="reply-state reply-state-finish"><span>답변완료</span></p> -->
		<!-- <span class="bbs-category">[카테고리 있을때 쓰세요]</span> -->
		<!-- // -->
		<h1 class="bbs-tit"><s:property value="resultClass.v_location" /></h1>
		<dl class="bbs-write-info">
						<dt>시공일</dt>
			<!-- <dd>0000-00-00</dd> -->
			<dd><s:property value="resultClass.v_date"/></dd>
			<dt>옵션</dt>
			<dd><s:if test="v_option == 1"> 
			부분
				</s:if>
				<s:else>
				전체
				</s:else></dd>

						<dt>조회수</dt>
			<dd><s:property value="resultClass.v_read"/></dd>
		</dl>
	</aside>
	
	<br><br>
	&nbsp;&nbsp;<img src="./images/<s:property value="resultClass.v_imagesv"/>"width="600" height="800">
	<br>
	&nbsp;&nbsp;<h1><pre><s:property value="resultClass.v_content"/><pre></h1>
	</br>
	<table width="1200" border="0" cellspacing="0" cellpadding="2">
	<tr bgcolor="#777777">
	<td height="1" colspan="2"></td>
	</tr>

	</table>
	
	<div class="cm-btn-controls">
		<div class="right-btn-controls">
				<a href="javascript:location.href='winListAction.action?currentPage=<s:property value="currentPage" />'">목록</a>
		</div>
	</div>

<!-- 코멘트 시작 -->



</article>						
			</section>	
			
			<!-- //content -->
		</div></div>



</body>
</html>