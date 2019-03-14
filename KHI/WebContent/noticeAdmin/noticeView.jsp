<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><meta charset="UTF-8">
<title>공지사항 상세보기</title>

</head>

<body>
<div id="middleArea">

	<aside id="contentInfoCon" class="area clearfix">
	<h3 class="content-tit">　　공지사항　　</h3>
	<div class="location">
		<ul>
			<li><img
				src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
			<li>공지사항　　</li>
		</ul>
	</div>
	</aside>
	<section id="content" class="area"> <article
		class="bbs-view-con"> <aside class="bbs-view-top"> 

	<h1 class="bbs-tit">
		<s:property value="resultClass.n_subject" />
	</h1>
	<dl class="bbs-write-info">
		<dt>작성자</dt>
		<dd>관리자</dd>
		<dt>작성일</dt>
		<dd>
			<s:property value="resultClass.n_regdate" />
		</dd>
		<dt>조회수</dt>
		<dd>
			<s:property value="resultClass.n_readhit" />
		</dd>
	</dl>
	</aside>


   <div class="bbs-view-content editor">
		<pre><s:property value="resultClass.n_content" escape="flase" /><br></br></pre>
       &nbsp;&nbsp; <s:if test="resultClass.n_file_savname!=null"> 
        <img src="../images/<s:property value="resultClass.n_file_savname" />"width="500" height="500"> 
      </s:if>
      <s:else>
      </s:else>
   </div>




		<div class="cm-btn-controls">
			<div class="right-btn-controls">
				<a href="javascript:location.href='noticeAModifyForm.action?n_no=<s:property value="n_no" />&currentPage=<s:property value="currentPage" />'">수정</a>
				<a href="javascript:location.href='checkForm.action?n_no=<s:property value="resultClass.n_no" />&currentPage=<s:property value="currentPage" />'" >삭제</a>
				<a href="noticeAListAction.action?currentPage=<s:property value="currentPage" />">목록</a>
			</div>
		</div>
</body>
</html>
