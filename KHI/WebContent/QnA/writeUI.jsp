<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function validation() {
	var frm = document.fff;

	if (frm.q_subject.value == "") {
		alert("제목 입력해 주세요 ");
		return false;
	} else if (frm.q_name.value == "") {
		alert("이름을 입력해 주세요 ");
		return false;
	} else if (frm.q_password.value == "") {
		alert("비밀번호를 입력해 주세요 ");
		return false;
	} else if (frm.q_content.value == "") {
		alert("내용을 입력해 주세요 ");
		return false;
	}
	
	return true;
}
</script>
<title>QnA 작성</title>
</head>
<body>
<div id="middleArea" align="center">
	<aside id="contentInfoCon" class="area clearfix">
		<h3 class="content-tit">　　QnA　　</h3>
		<div class="location">
			<ul>
				<li><img
					src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
				<li>문의사항</li>
				<li>QnA</li>


			</ul>
		</div>
	</aside>

	<section id="content" class="area">
		<s:if test="resultClass==NULL">
			<form action="QnAwriteAction.action" name="fff" method="post"
				enctype="multipart/form-data" onsubmit="return validation();" />
		</s:if>

		<s:elseif test="reply">
			<form action="QreplyAction.action" name="fff" method="post"
				enctype="multipart/form-data" onsubmit="return validation();" />
			<s:hidden name="checkre" value="%{resultClass.checkre}" />
			<s:hidden name="ref" value="%{resultClass.ref}" />
			<s:hidden name="re_step" value="%{resultClass.re_step}" />
		</s:elseif>

		<s:else>
			<form action="QnAmodifyAction.action" method="post"
				enctype="multipart/form-data" name="fff"
				onsubmit="return validation();" />
			<s:hidden name="q_num" value="%{resultClass.q_num}" />
			<s:hidden name="q_option" value="%{resultClass.q_option}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.file_savname}" />
		</s:else>

		<section class="bbs-write-con">
			<article class="bbs-write-tbl-box">
				<p class="inquiry-essential-txt">
					<span class="essential-icon">*</span> 표시는 필수 입력 항목입니다.
				</p>
				<table class="bbs-write-tbl">
					<caption>글 작성하는 리스트입니다.</caption>
					<colgroup>
						<col style="width: 20%;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span class="essential-icon">*</span> 제목</th>
							<td><s:textfield name="q_subject" theme="simple"
									value="%{resultClass.q_subject}" cssStyle="width:279px"
									maxlength="30" /></td>
						</tr>

						<tr>
							<th scope="row"><span class="essential-icon">*</span> 작성자</th>
							<td><s:textfield name="q_name" theme="simple"
									value="%{resultClass.q_name}" cssStyle="width:100px"
									maxlength="10" /></td>
						</tr>

						<tr>
							<th scope="row"><span class="essential-icon">*</span>비밀번호</th>
							<td><s:password name="q_password" theme="simple"
									value="%{resultClass.q_password}" cssStyle="width:100px"
									maxlength="10" /> <span class="write-sub-txt">글수정 및 삭제
									시 필요합니다. 꼭! 기억해주세요.</span></td>
						</tr>

						<tr>
							<th scope="row">이메일</th>
							<td><s:textfield name="q_email" theme="simple"
									value="%{resultClass.q_email}" cssStyle="width:279px"
									maxlength="30" /></td>
						</tr>

						<tr>
							<th scope="row"><span class="essential-icon">*</span>내용</th>
							<td><s:textarea name="q_content" theme="simple"
									value="%{resultClass.q_content}" cols="50" rows="10" /></td>
						</tr>

						<tr>
							<th scope="row">첨부파일</th>
							<td><s:file name="upload" theme="simple" /> <s:if
									test="resultClass.file_orgname!=NULL">&nbsp;<s:property
										value="resultClass.file_orgname" />기존파일 날아감</s:if></td>
							</td>
						</tr>

					</tbody>
				</table>

			</article>
			<br>
			<div class="cm-btn-controls">
				<button type="submit" class="btn-style01" name="submit">등록</button>
				<a
					href="javascript:location.href='QnAlistAction.action?currentPage=<s:property value="currentPage"/>'"
					class="btn-style02">목록으로</a>
			</div>

		</section>
	</section>
</div>
</body>
</html>