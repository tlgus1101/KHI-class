<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>   
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
    
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>시공사례</title>
</head>
<body>


	
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
				
						
						


	


		      <section id="photoListCon">
	<article class="product-list-box clearfix">
	
			<s:iterator value="list" status="stat">
	<s:url id="viewURL" action="winViewAction"> <%-- URL를 만들어준다. --%>
		<s:param name="v_num">
		<s:property value="v_num"/> <%-- 바로 접근 가능 --%>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>
		</s:param>

		
		</s:url>
		
		<table border="0">
		<div class="prd-item">
		
		
		<s:a href="%{viewURL}">
		
		
			<div class="prd-thumb" style="border:1px solid gray;">
			
				<img src="./images/<s:property value="v_imagesv"/>"width="200" height="200"></s:a>
				<!--<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>-->
			</div>
			<div class="prd-info-con" style="border:1px solid gray;">
				<strong class="prd-name text-ellipsis"><s:property value="v_location"/></strong>
				<span class="prd-day"><s:property value="v_date"/></span>
				<p class="prd-txt">
		<s:if test="v_option == 1"> 
			부분
				</s:if>
				<s:else>
			전체
				</s:else>
			</p>				
			</div>
		
	
		</s:iterator>

		</table>
		</article>
	</section>


    <%--    	
        		 <td align="left"> &nbsp;<s:a href="%{viewURL}"><img src="./images/<s:property value="v_imagesv"/>"width="200" height="200"></s:a>
			
			<s:property value="v_location"/>
			<s:if test="v_option == 1"> 
			부분
				</s:if>
				<s:else>
				전체
				</s:else>
			<s:property value="v_date"/>
			 --%>

	
		<s:if test="list.size() <= 0">
		
		<tr bgcolor="#FFFFFF" align="center">
		<td colspan="5">등록된 게시물이 없습니다.</td>
		</tr>
		<tr bgcolor="#777777">
		<td height="1" colspan="5"></td>
		</tr>
		</s:if>
		
		<div class="paging">
		 <s:property value="pagingHtml" escape="false"/></div>
		
		<form name="bbs_search_form">
				<div class="board-search-box">
					<select name="searchNum">
						<option value="0">장소</option>
						<option value="1">내용</option>
					</select>
					<!-- 
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
				<input name="submit" type="submit" value="검색" class="inputb"> 
				-->
					<input placeholder="검색어를 입력해주세요" type="search" name="searchKeyword"
						class="search-word" value="">
						<button type="submit" title="검색">
							<i class="material-icons"></i>
						</button>
				</div>
			</form>
			
			<!-- <form>
				<select name="searchNum">
					<option value="0">장소</option>
					<option value="1">내용</option>
				</select>
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20"/>
				<input name="submit" type="submit" value="검색" class="inputb"></input>
			</form>
		</td>
		</tr>
		 -->
	</table>

</body>
</html>