<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>문의사항</title>
<script type="text/javascript">
	function open_win_search(url, name) {
		var oWin = window.open(url, name,
				"status=no, resizable=no, width=1500, height=1000");
	}
</script>

</head>
<body>
	<div id="middleArea">
	<aside id="contentInfoCon" class="area clearfix">
	<h3 class="content-tit">　　QnA　　</h3>
	<div class="location">
		<ul>
			<li><a href="javascript:admin_mainOpen()"><img
					src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
			<li>
				<li>견적문의</li>
		</ul>
	</div>

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
	<article class="bbs-list-con">
	<div class="bbs-list-tbl" align="center">
		<p class="bbs-list-head">
			<span style="width: 8%">번호</span> <span style="width: 50%">제목</span>
			<span style="width: 15%;">작성자</span> <span style="width: 15%;">등록일</span>
			<span style="width: 12%;">예약날짜</span> <span style="width: 15%;">답변상태</span>
		</p>
		<table>
			<s:iterator value="list" status="stat">
				<s:url id="viewURL" action="QminiviewAction">
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
						<a
							href='QminiviewAction.action?q_num=<s:property value="q_num"/>&currentPage=<s:property value="currentPage"/>'>
							<div class="bbs-subject-con">
								<strong class="bbs-subject-txt"><s:property
										value="q_subject" /></strong>
								<div class="bbs-subject-icons"></div>
							</div>
						</a>
					</div>

					<div class="column bbs-inline" data-label="작성자">
						<s:property value="q_name" />
					</div>
					<div class="column bbs-inline" data-label="예약날짜">
						<s:property value="q_date" />
					</div>
					<div class="column bbs-inline" data-label="등록일">
						<s:property value="regdate" />
					</div>
					<div class="column bbs-inline" data-label="답변상태">
						<s:if test="checkre == 1">
							<input name="list" type="button" value="답변하기" class="inputb"
								onclick="javascript:location.href='QreplyForm.action?q_num=<s:property value="q_num"/>&currentPage=<s:property value="currentPage"/>'">
						</s:if>
						<s:else>답변 완료</s:else>
						</td>
					</div>
					<div data-label="q_num"></div>
				</div>
			</s:iterator>
		</table>
	</div>
	</article>



	<tr align="right">


	</tr>

	<tr align="center">
		<td colspan="5">
			<div class="cm-btn-controls">
				<a
					href="javascript:open_win_search('QnAlistAction.action?currentPage=<s:property value="currentPage"/>','QnAlist')"
					class="btn-style01">더보기</a>
			</div>

			<div class="paging">
				<s:property value="pagingHtml" escape="false" />
			</div>
		</td>
	</tr>
	
	</div>
</body>
</html>