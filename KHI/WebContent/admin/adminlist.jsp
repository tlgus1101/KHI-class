<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  <head>
<title>시공사례</title>
</head>
<body>



	<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>시공현장</h2></td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
	</table>
	
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	
	<tr align="center" bgcolor="#F3F3F3">
		<td width="50"><strong>번호</strong></td>
		<td width="60"><strong>사진</strong></td>
		<td width="200"><strong>장소</strong></td>
		<td width="70"><strong>옵션</strong></td>
		<td width="80"><strong>날짜</strong></td>

	</tr>
	<tr bgcolor="#777777">
	<td height="1" colspan="5"></td>
	</tr>

	<s:iterator value="list" status="stat">
	<s:url id="adminURL" action="adminView"> <%-- URL를 만들어준다. --%>
		<s:param name="v_num">
		<s:property value="v_num"/> <%-- 바로 접근 가능 --%>
		</s:param>
		<s:param name="currentPage">
			<s:property value="currentPage"/>
		</s:param>
		</s:url>
			      <tr>
			      <td align="center"><s:property value="v_num" /></td>
        	
        		 <td align="center"> &nbsp;<img src="./images/<s:property value="v_imagesv"/>"width="60" height="60"></td>
			
		<td align="center"><s:a href="%{adminURL}"><s:property value="v_location"/></s:a></td>
		<td align="center"><s:if test="v_option == 1"> 
			부분
				</s:if>
				<s:else>
				전체
				</s:else></td>
			<td align="center"><s:property value="v_date"/></td>
			
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
		
		<table>
		<tr align="center">
		<td colspan="5"><s:property value="pagingHtml" escape="false"/></td>
		</tr>
		</table>
		
		<tr align="center">
		<td colspan="5">
			
			<form>
				<select name="searchNum">
					<option value="0">장소</option>
					<option value="1">옵션</option>
				</select>
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20"/>
				<input name="submit" type="submit" value="검색" class="inputb"></input>		<input type="button" value="글쓰기" class="inputb" onClick="javascript:location.href='writeForm.action?currentPage=<s:property value="currentPage" />';">
			</form>
		</td>
		</tr>
		
	</table>
	
	-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 모바일사이트, 반응형사이트 제작시 사용 -->
<link rel="stylesheet" href="http://hgwindow.co.kr/css/reset.css">
	<link rel="stylesheet" href="http://hgwindow.co.kr/css/common.css">
		<link rel="stylesheet" href="http://hgwindow.co.kr/css/editor.css">
			<link rel="stylesheet" href="http://hgwindow.co.kr/css/layout.css">
				<link rel="stylesheet" href="http://hgwindow.co.kr/css/content.css">
					<link rel="stylesheet" href="http://hgwindow.co.kr/css/main.css">
						<link rel="stylesheet" href="http://hgwindow.co.kr/css/board.css">
							<head>
<title>시공게시판</title>

							</head>
							<body>

								<div id="middleArea">
									<aside id="contentInfoCon" class="area clearfix">
									<h3 class="content-tit">　　시공게시판　　</h3>
									<div class="location">
										<ul>
											<li><a href="javascript:admin_mainOpen()"><img
													src="http://hgwindow.co.kr/images/icon/location_home.gif"
													alt="">HOME</li>
											<li>
												<li>시공게시판</li>
										</ul>
									</div>

									</aside>
									<!-- content -->

									<section id="content" class="area"> <script
										type="text/javascript">
										$(document)
												.ready(
														function() {
															$(
																	".faq-list-con .faq-item > dt")
																	.click(
																			function() {
																				var $faqCon = $(
																						this)
																						.siblings();

																				if ($faqCon
																						.css("display") == "block") {
																					$(
																							this)
																							.siblings()
																							.slideUp();
																					$(
																							".faq-item")
																							.removeClass(
																									"open");

																				} else {
																					$(
																							".faq-item > dd:visible")
																							.slideUp();
																					$(
																							".faq-item")
																							.removeClass(
																									"open");
																					$(
																							this)
																							.parent(
																									"dl")
																							.addClass(
																									"open");
																					$faqCon
																							.slideDown();
																				}
																			});
														});
										
									</script> <!-- //sideMenu --> <!-- middleArea --> <!-----------------------------------------------------  게시판 리스트 시작 ------------------------------------------------------------------------------------------------------------------------------------->

									<!-- 답변형/공지사항형 시작 --> <article class="bbs-list-con">
									<div class="bbs-list-tbl">
										<p class="bbs-list-head">
											<span style="width: 8%">번호</span> <span style="width: 50%">장소</span>
											<span style="width: 15%;">이미지</span> <span
												style="width: 15%;">옵션</span> <span style="width: 12%;">날짜</span>
										</p>

										<!-- 공지사항 -->

										<!-- bbs loop start -->

										<table>
											<s:iterator value="list" status="stat">
												<s:url id="viewURL" action="adminView">
													<%-- URL를 만들어준다. --%>
													<s:param name="v_num">
														<s:property value="v_num" />
														<%-- 바로 접근 가능 --%>
													</s:param>
													<s:param name="currentPage">
														<s:property value="currentPage" />
													</s:param>


												</s:url>


												<div class="bbs-list-row">
													<div class="column bbs-no-data">
														<s:property value="v_num" />
													</div>
													<div class="column bbs-title">
														<div class="bbs-subject-con">
															<strong class="bbs-subject-txt"><s:a
																	href="%{viewURL}">
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="v_location" />
																</s:a></strong>
															<div class="bbs-subject-icons"></div>
														</div>
														</a>
													</div>

													<div class="column bbs-inline" data-label="이미지">
														<img src="./images/<s:property value="v_imagesv"/>"
															width="60" height="60">
													</div>
													<div class="column bbs-inline" data-label="옵션">
														<s:if test="v_option == 1"> 
														부분
													</s:if>
														<s:else>
														전체
														</s:else>
													</div>
													<div class="column bbs-inline" data-label="날짜">
														<s:property value="v_date" />
													</div>
													
												</div>
											</s:iterator>
										</table>

									</div>
									</article> <!-- bbs loop end --> <!-- 답변형/공지사항형 종료 -->



								

								
											<div class="cm-btn-controls">
												<a
													href="javascript:location.href='writeForm.action?currentPage=<s:property value="currentPage" />';">글쓰기</a>
											</div>
											<div class="paging">
												<s:property value="pagingHtml" escape="false" />
											</div>
				<form name="bbs_search_form">
				<div class="board-search-box">
					<select name="searchNum">
						<option value="0">제목</option>
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
									
							</body>
</html>