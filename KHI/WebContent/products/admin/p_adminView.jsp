<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function deleteCheck() {
		var Del = confirm("삭제 하시겠습니까?")
		if (Del == true) {
			alert("삭제 되었습니다.")
			location.href = "p_adminDelete.action?p_no=<s:property value="resultClass.p_no" />&currentPage=<s:property value="currentPage" />"
		} else {
			alert("취소 되었습니다.")
		}
	}
</script>

<title>재고 관리</title>

</head>

<body>
<div id="middleArea">
	<aside id="contentInfoCon" class="area clearfix">
	<h3 class="content-tit">　　재고관리　　</h3>
	<div class="location">
		<ul>
			<li><img
				src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
			<li>재고관리　　</li>
		</ul>
	</div>
	</aside>

	<section id="content" class="area"> <article
		class="bbs-view-con"> <aside class="bbs-view-top">
	<h3 class="bbs-tit">
		<s:property value="resultClass.p_subject" />
	</h3>
	<dl class="bbs-write-info">
		<dt>상품 번호</dt>
		<dd>
			<s:property value="resultClass.p_no" />
		</dd>

		<dt>상품 이름</dt>
		<dd>
			<s:property value="resultClass.p_name" />
		</dd>

		<dt>작성일</dt>
		<dd>
			<s:property value="resultClass.p_regdate" />
		</dd>
	</dl>
	&nbsp;
	<dl class="bbs-write-info">
		<dt>구분</dt>
		<dd>
			<td colspan="2"><s:if test="p_type==1">&nbsp;&nbsp; 발코니
		</s:if> <s:elseif test="p_type==2">&nbsp;&nbsp; 내 창
		</s:elseif> <s:else>&nbsp;&nbsp; 악세서리
		</s:else></td>
		</dd>
	</dl>
	&nbsp;
	<dl class="bbs-write-info">
		<dt>제조사</dt>
		<dd>
			<s:property value="resultClass.p_mf" />
		</dd>
	</dl>
	&nbsp;
	<dl class="bbs-write-info">
		<dt>원산지</dt>
		<dd>
			<s:property value="resultClass.p_org" />
		</dd>
	</dl>
	&nbsp;
	<dl class="bbs-write-info">
		<dt>창틀폭</dt>
		<dd>
			<s:property value="resultClass.p_frame" />
		</dd>
	</dl>
	&nbsp;
	<dl class="bbs-write-info">
		<dt>유리적용</dt>
		<dd>
			<s:property value="resultClass.p_sash" />
		</dd>
	</dl>
	
	</aside>

	<div class="bbs-view-content editor" >
		<pre>
      <s:property value="resultClass.p_detail" escape="flase" />
		</pre>
      <br></br>
       &nbsp;&nbsp; <s:if test="resultClass.p_imagesv != null"> 
        <img src="../imageFIle/<s:property value="resultClass.p_imagesv" />"width="500" height="500"> 
      </s:if>
      <s:else>
      </s:else>
	</div>
	
	
	<div class="cm-btn-controls">
	<div class="right-btn-controls">
		<a href="javascript:location.href='p_modifyForm.action?p_no=<s:property value="resultClass.p_no" />&currentPage=<s:property value="currentPage" />'">수정</a>
		<a href="javascript:deleteCheck()">삭제</a>
		<a href="javascript:location.href='p_adminList.action?currentPage=<s:property value="currentPage" />'">목록</a>
	</div>
	</div>
</article>
</section>
</div>
</body>
</html>
