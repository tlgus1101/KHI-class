<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
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
							<link
								href="https://fonts.googleapis.com/icon?family=Material+Icons"
								rel="stylesheet">
							<head>
<title>공지사항</title>

							</head>
							<body>

								<div id="middleArea">
									<aside id="contentInfoCon" class="area clearfix">
									<h3 class="content-tit">　　공지사항　　</h3>
									<div class="location">
										<ul>
											<li><img
													src="http://hgwindow.co.kr/images/icon/location_home.gif"
													alt="">HOME</li>
												<li>공지사항</li>
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
											<span style="width: 8%">번호</span> <span style="width: 50%">제목</span>
											<span style="width: 15%;">작성자</span> <span
												style="width: 15%;">등록일</span> <span style="width: 12%;">조회수</span>
										</p>

										<!-- 공지사항 -->

										<!-- bbs loop start -->

										<table>
											<s:iterator value="list" status="stat">
												<s:url id="viewURL" action="noticeAViewAction">
													<s:param name="n_no">
														<s:property value="n_no" />
													</s:param>
													<s:param name="currentPage">
														<s:property value="currentPage" />
													</s:param>
												</s:url>


												<div class="bbs-list-row">
													<div class="column bbs-no-data">
														<s:property value="n_no" />
													</div>
													<div class="column bbs-title">
														<a
															href='noticeAViewAction.action?n_no=<s:property value="n_no"/>&currentPage=<s:property value="currentPage"/>'>
															<div class="bbs-subject-con">
																<strong class="bbs-subject-txt"><s:property
																		value="n_subject" /></strong>
																<div class="bbs-subject-icons"></div>
															</div>
														</a>
													</div>

													<div class="column bbs-inline" data-label="작성자">관리자</div>
													<div class="column bbs-inline" data-label="등록일">
														<s:property value="n_regdate" />
													</div>
													<div class="column bbs-inline" data-label="조회수">
														<s:property value="n_readhit" />
													</div>
													<div data-label="n_no"></div>
												</div>
											</s:iterator>
										</table>

									</div>
									</article> <!-- bbs loop end --> <!-- 답변형/공지사항형 종료 -->



									<tr align="right">


									</tr>

									<tr align="center">
										<td colspan="5">
											<div class="cm-btn-controls">
												<a
													href="javascript:location.href='noticeAWriteForm.action?currentPage=<s:property value="currentPage" />';">글쓰기</a>
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
													<input placeholder="검색어를 입력해주세요" type="search"
														name="searchKeyword" class="search-word" value="">
														<button type="submit" class="bbs-search-btn" title="검색">
															<i class="material-icons"></i>
														</button>
												</div>
											</form>
										</td>
									</tr>
							</body>
</html>