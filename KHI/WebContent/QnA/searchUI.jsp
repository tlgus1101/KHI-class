<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
		function open_win_search(url, name) {
			var oWin = window
					.open(url, name,
							"scrollbars=no, status=no, resizable=no, width=300, height=150");
		}
	</script>
<title>내 글 찾기</title>

</head>

<body>
	<s:url id="listCUS" action="CUSlistAction.action"></s:url>
	<s:url id="listQnA" action="QnAlistAction.action"></s:url>
	<div id="middleArea">
			<aside id="contentInfoCon" class="area clearfix">
				<h3 class="content-tit"><s:a href="%{listCUS}"><h5>　　　　　　　　　　　　　　　　　견적문의</h5></s:a></h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h3 class="content-tit"><s:a href="%{listQnA}"><h5>　　　　　　　　　　Q & A</h5></s:a></h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
			</aside>
	<section id="content" class="area"> <script
		type="text/javascript">
		$(document).ready(function() {
			$(".faq-list-con .faq-item > dt").click(function() {
				var $faqCon = $(this).siblings();

				if ($faqCon.css("display") == "block") {
					$(this).siblings().slideUp();
					$(".faq-item").removeClass("open");

				} else {
					$(".faq-item > dd:visible").slideUp();
					$(".faq-item").removeClass("open");
					$(this).parent("dl").addClass("open");
					$faqCon.slideDown();
				}
			});
		});
	</script> 
	
	
	
	<p class="total-list-con">
		TOTAL : <b><s:property value="totalCount" /></b> 개
	</p>
	<article class="bbs-list-con">
	<div class="bbs-list-tbl">
		<p class="bbs-list-head">
			<span style="width: 8%">번호</span> <span style="width: 50%">제목</span>
			<span style="width: 15%;">작성자</span> <span style="width: 15%;">등록일</span>
		</p>

		<table>
			<s:iterator value="list" status="stat">
				<s:url id="viewURL1" action="QnAviewAction">
					<s:param name="q_num">
						<s:property value="q_num" />
					</s:param>
					<s:param name="currentPage">
						<s:property value="currentPage" />
					</s:param>
				</s:url>
				
				<s:url id="viewURL2" action="CUSviewAction">
					<s:param name="q_num">
						<s:property value="q_num" />
					</s:param>
					<s:param name="currentPage">
						<s:property value="currentPage" />
					</s:param>
				</s:url>
				
				<div class="bbs-list-row">

					<div class="column bbs-no-data">
						<s:property value="q_num" />
					</div>
					<div class="column bbs-title">
					<s:if test="q_option == 1">
						<s:a href="%{viewURL1}">
							<div class="bbs-subject-con">
								<strong class="bbs-subject-txt"><s:property
										value="q_subject" /> </strong>
								<div class="bbs-subject-icons"></div>
							</div>
						</s:a>
					</s:if>
					<s:else>
						<s:a href="%{viewURL2}">
							<div class="bbs-subject-con">
								<strong class="bbs-subject-txt"><s:property
										value="q_subject" /> </strong>
								<div class="bbs-subject-icons"></div>
							</div>
						</s:a>
					</s:else>
					</div>
					<div class="column bbs-inline" data-label="작성자">
						<s:property value="q_name" />
					</div>
					<div class="column bbs-inline" data-label="등록일">
						<s:property value="regdate" />
					</div>
					<div data-label="q_num"></div>
				</div>
			</s:iterator>
		</table>
	</div>
	<br/>
	<br/>
		<s:if test="list.size()<=0">
			<div bgcolor="#FFFFFF" align="center" >
				<font size="5">등록된 게시물이 없습니다...</font>
			</div>
		</s:if>
	

	<tr align="center">
		<td colspan="5">
			<div class="cm-btn-controls">
				<a href="javascript:open_win_search('searchFormAction.action?currentPage=<s:property value="currentPage"/>','search')"
					class="btn-style01">검색</a>
			</div>
			
			<div class="paging">
				<s:property value="pagingHtml" escape="false" />
			</div>
		</td>
	</tr>
	</article>
	</section>
	</div>
</body>
</html>
