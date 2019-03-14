<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>예약 상세보기 </title>
</head>
<body>
<script type="text/javascript">
	function deleteOpen() {
		var Del = confirm("삭제 하시겠습니까?");
		if (Del == true) {
			alert("삭제 되었습니다.");
			var main=${param.main}+"";
			if(main!="")
				location.href = "ReservDeleteAction.action?r_no="+${r_no};
			else
				location.href = "ReservDeleteOkAction.action?r_no="+${r_no};
			
		} else {
			alert("취소 되었습니다.");
		}
	}
</script>
	<script type="text/javascript">

		function modifyOpen(r_no) {
			location.href = "ReservModifyAction.action?r_no="+r_no;
		}
		
		function admin_mainOpen() {
			location.href = "AdminMainAction.action";
		}
		/* function deleteOpen() {
			var oWin = window
			.open("ReservDeleteOkAction.action?r_no="+${r_no}, name,
					"scrollbars=no,status=no,resizable=no,width=100,height=100");
		} */
		function reservListOpen() {
			location.href = "ReservListction.action";
		}
		
		function reservOkOpen() {
			location.href = "writeForm.action?r_no="+${r_no};
		}
		
		
	</script>
	
<div id="middleArea">

	<aside id="contentInfoCon" class="area clearfix">
	<h3 class="content-tit">　　예약현황　　</h3>
	<div class="location">
		<ul>
			<li><img
				src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
			<li>예약현황　　</li>
		</ul>
	</div>
	</aside>
	
	<s:iterator value="reservVO" status="stat">
	<section id="content" class="area">
	<article class="bbs-view-con">
	<aside class="bbs-view-top"> 

	<h1 class="bbs-tit">
		<s:property value="r_location" />
	</h1>
	
	<dl class="bbs-write-info">
		<dt>예약날짜</dt>
		<dd>
			<s:property value="q_date" />
		</dd>
		<dt>전화번호</dt>
		<dd>
			<s:property value="q_tell" />
		</dd>
		<dt>부분/전체: </dt>
		<dd>
			<s:if test="r_option==1">부분</s:if>
			<s:else>전체 </s:else>
		</dd>

		<dt>사용할 제품</dt>
		<dd>
			<s:property value="productsHtml" escape="false" />
		</dd>
	</dl>
	</aside>
	
	   <div class="bbs-view-content editor" >
	   <pre><s:property value="q_content" /></pre>
   </div>
   
	</s:iterator>
	
	</article>

		<div class="cm-btn-controls">
			<div class="right-btn-controls">
				<a href="javascript:reservOkOpen()" class="btn-style02">예약확정</a>
				<a href="javascript:modifyOpen(<s:property value='r_no'/>)">수정</a>
				<a href="javascript:deleteOpen()">삭제</a>
				<a href="javascript:reservListOpen()">목록</a>
			</div>
		</div>
		</div>


</body>
</html>