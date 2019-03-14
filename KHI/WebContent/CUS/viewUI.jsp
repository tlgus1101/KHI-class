<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="ko">
<head>
<meta charset="UTF-8">
	<script type="text/javascript">
		function open_win_noresizable(url, name) {
			var oWin = window
					.open(url, name,
							"scrollbars=no, status=no, resizable=no, width=300, height=150");
		}
	</script>

	<title>견적문의 상세보기</title>
</head>

<body>
	<s:url id="listCUS" action="CUSlistAction.action"></s:url>
	<s:url id="listQnA" action="QnAlistAction.action"></s:url>
	<div id="middleArea">
		<aside id="contentInfoCon" class="area clearfix">
		<h3 class="content-tit">
			<s:a href="%{listCUS}">
				<h5>견적문의</h5>
			</s:a>
		</h3>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h3 class="content-tit">
			<s:a href="%{listQnA}">
				<h5>Q & A</h5>
			</s:a>
		</h3>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </aside>
		<aside id="contentInfoCon" class="area clearfix">
		<h3 class="content-tit">견적문의</h3>
		<div class="location">
			<ul>
				<li><img
					src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
				<li>공지사항</li>
				<li>견적문의</li>


			</ul>
		</div>
		</aside>

		<section id="content" class="area"> <article
			class="bbs-view-con"> <aside class="bbs-view-top">

		<h3 class="bbs-tit">
			<s:property value="resultClass.q_subject" />
		</h3>
		<dl class="bbs-write-info">
			<dt>작성자</dt>
			<dd>
				<s:property value="resultClass.q_name" />
			</dd>
			<dt>연락처</dt>
			<dd>
				010-
				<s:property value="resultClass.q_phone1" />
				-
				<s:property value="resultClass.q_phone2" />
			</dd>
			<dt>이메일</dt>
			<dd>
				<s:property value="resultClass.q_email" />
			</dd>
			<dt>예약날짜</dt>
			<dd>
				<s:property value="resultClass.q_date" />
			</dd>
			<dt>작성일</dt>
			<dd>
				<s:property value="resultClass.regdate" />
			</dd>
			<dt>첨부파일</dt>
			<dd>
				<s:url id="download" action="fileDownloadAction">
					<s:param name="q_num">
						<s:property value="q_num" />
					</s:param>
				</s:url>
				<s:a href="%{download}">
					<s:property value="resultClass.file_orgname" />
				</s:a>
			</dd>
		</dl>
		</aside>

		<div class="bbs-view-content editor">
			<pre><s:property value="resultClass.q_content" /></pre>
		</div>




		<div class="cm-btn-controls">
			<div class="right-btn-controls">
				<a href="CUSmodifyForm.action?q_num=<s:property value="q_num" />&currentPage=<s:property value="currentPage" />">수정</a>
				<a
					href="CUSdeleteAction.action?q_num=<s:property value="q_num" />&currentPage=<s:property value="currentPage" />">삭제</a>
				<a href="CUSlistAction.action">목록</a>
			</div>
		</div>
		</article> </section>
	</div>
</body>
</html>