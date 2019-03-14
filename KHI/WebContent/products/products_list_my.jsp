<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<?xml version="1.0" encoding="EUC-KR" ?>
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
													<li>내 창/방 창호</li>
												
						
					</ul>
				</div>
			</aside>
			<aside id="contentInfoCon" class="area clearfix">
				<h3 class="content-tit"><s:a href="%{listBal}"><h5>　　　　　　　　　발코니 창호</h5></s:a></h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h3 class="content-tit"><s:a href="%{listMy}"><h5>　　　　　　　　　　내 창/방</h5></s:a></h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h3 class="content-tit"><s:a href="%{listAcc}"><h5>　　　　　　　　　　악세사리　</h5></s:a></h3>		
			</aside>
			
		<!-- content -->
		<section id="content" class="area prd-content">
		
<script type="text/javascript">
$(document).ready(function  () {
	$(".faq-list-con .faq-item > dt").click(function  () {
		var $faqCon = $(this).siblings();
		
		if ($faqCon.css("display") == "block") {
			$(this).siblings().slideUp();
			$(".faq-item").removeClass("open");
			
		}else {
			$(".faq-item > dd:visible").slideUp();
			$(".faq-item").removeClass("open");
			$(this).parent("dl").addClass("open");
			$faqCon.slideDown();	
		}
	});
});
</script>
		<table border="0">
	
		<section id="prdListContent">
		<c:set var="count" value="0"/> 
		<s:iterator value="list" status="stat">
	
		<c:set var="count"  value="${count+1 }"/>
		
	 
				<td><ul class="prd-list-con">
					<li>
						<a href="products_view_my.action?p_no=<s:property value="p_no" />&currentPage=<s:property value="currentPage" />">
							<span class="prd-thumb">
							<img src="../imageFIle/<s:property value='p_imagesv'/>" width="300" height="300" alt="">
							</span>
							<p class="prd-title-con">
						
								<strong class="prd-tit"><s:property value="p_name" /></strong>
							</p>
						</a>
					</li>
				</ul></td>
				<c:if test="${count ==4 }">
				<c:set var="count" value="0"/> 
				<tr>
        	<td height="1" colspan="5"></td>
      	</tr>
				</c:if>
			</s:iterator>
			
			</table>
			</section>
			</section>
			<!-- //content -->
		</div>



</body>
</html>