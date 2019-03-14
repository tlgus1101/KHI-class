<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta charset="UTF-8">
<title>공지사항 상세보기</title>

</head>

<body>

<section id="content" class="area">
<article class="bbs-view-con">
	<aside class="bbs-view-top">
		<!-- 필요할 경우만 삽입 -->
		<!-- <dl class="event-date"><dt><i class="material-icons">&#xE878;</i> 이벤트기간</dt><dd>2017-07-14 ~ 2017-07-31</dd></dl> -->
		<!-- <p class="reply-state"><span>답변대기</span></p><p class="reply-state reply-state-finish"><span>답변완료</span></p> -->
		<!-- <span class="bbs-category">[카테고리 있을때 쓰세요]</span> -->
		<!-- // -->
		<h1 class="bbs-tit"><s:property
					value="resultClass.n_subject" /></h1>
		<dl class="bbs-write-info">
			<dt>작성자</dt>
			<dd>관리자</dd>
						<dt>작성일</dt>
			<dd><s:property
					value="resultClass.n_regdate" /></dd>
						<dt>조회수</dt>
			<dd><s:property
					value="resultClass.n_readhit" /></dd>
		</dl>
	</aside>
	
	
	<div class="bbs-view-content editor">
		<pre><s:property value="resultClass.n_content" /><br></br>
		</pre>
		 &nbsp;&nbsp; <s:if test="resultClass.n_file_savname!=null"> 
        <img src="../images/<s:property value="resultClass.n_file_savname" />"width="500" height="500"> 
      </s:if>
      <s:else>
      </s:else>
	</div>

	


	<div class="cm-btn-controls">
				<div class="left-btn-controls">
						
			
					</div>
				<div class="right-btn-controls">
			<a href="noticeListAction.action?currentPage=<s:property value="currentPage" />">목록</a>
		</div>
	</div>
	
	

</body>
</html>
