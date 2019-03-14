<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>공지사항</title>

</head>

<body>
	<section id="content" class="area"> <script
		type="text/javascript">
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
</script> <!-- <b>글목록 (전체 글 : <s:property value="totalCount" />) -->

<br>
	<p class="total-list-con">
		TOTAL : <b><s:property value="totalCount" /></b> 개
	</p>
	<article class="bbs-list-con">
	<div class="bbs-list-tbl">
		<p class="bbs-list-head">
			<span style="width:8%">번호</span> 
			<span style="width:50%">제목</span>
			 <span style="width: 15%;">작성자</span>
			 <span style="width: 15%;">등록일</span>
			<span style="width: 12%;">조회수</span>
		</p>
		<!-- 공지사항 -->

		<!-- bbs loop start -->
<table>
		<s:iterator value="list" status="stat">
			<s:url id="viewURL" action="noticeViewAction">
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
						href='noticeViewAction.action?n_no=<s:property value="n_no"/>&currentPage=<s:property value="currentPage"/>'>
						<div class="bbs-subject-con">
							<strong class="bbs-subject-txt"><s:property
									value="n_subject" /> </strong>
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




	<!-- 
		<tr align="center">
			<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
		</tr>
 -->

	<tr align="right">


	</tr>

	<tr align="center">
		<td colspan="5">
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
		</td>
	</tr>

</body>
</html>
