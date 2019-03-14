<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="ko">
<head>
<meta charset="UTF-8">
<head>
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
<title>견적문의 작성</title>
</head>
<body>
<div id="middleArea" align="center">
	<aside id="contentInfoCon" class="area clearfix">
	<h3 class="content-tit">　　견적문의　　</h3>
	<div class="location">
		<ul>
			<li><img
				src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
			<li>문의사항</li>
			<li>견적문의</li>


		</ul>
	</div>
	</aside>

	<section id="content" class="area"> <s:if
		test="resultClass==NULL">
		<form action="CUSwriteAction.action" name="fff" method="post"
			enctype="multipart/form-data" onsubmit="return validation();" />
	</s:if>
	<s:else>
		<form action="CUSmodifyAction.action" method="post"
			enctype="multipart/form-data" name="fff"
			onsubmit="return validation();" />
		<s:hidden name="q_num" value="%{resultClass.q_num}" />
		<s:hidden name="q_option" value="%{resultClass.q_option}" />
		<s:hidden name="currentPage" value="%{currentPage}" />
		<s:hidden name="old_file" value="%{resultClass.file_savname}" />
	</s:else> <section class="bbs-write-con"> <article
		class="bbs-write-tbl-box">
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
				<th scope="row"><span class="essential-icon">*</span>작성자</th>
				<td><s:textfield name="q_name" theme="simple"
						value="%{resultClass.q_name}" cssStyle="width:100px"
						maxlength="10" /></td>
			</tr>

			<tr>
				<th scope="row"><span class="essential-icon">*</span>비밀번호</th>
				<td>
				<s:password name="q_password" theme="simple"
						value="%{resultClass.q_password}" cssStyle="width:100px"
						maxlength="10" />
						<span class="write-sub-txt">비밀번호는 숫자만 가능합니다. 글수정 및 삭제 시 필요합니다.</span></td>
			</tr>

			<tr>
				<th scope="row"><span class="essential-icon">*</span>연락처</th>
				<td><font>010&nbsp;-&nbsp;</font> <s:textfield name="q_phone1"
						theme="simple" value="%{resultClass.q_phone1}"
						cssStyle="width:100px" maxlength="4" /> <font>&nbsp;-&nbsp;</font>
					<s:textfield name="q_phone2" theme="simple"
						value="%{resultClass.q_phone2}" cssStyle="width:100px"
						maxlength="4" /></td>
			</tr>

			<tr>
				<th scope="row">이메일</th>
				<td><s:textfield name="q_email" theme="simple"
						value="%{resultClass.q_email}" cssStyle="width:279px"
						maxlength="30" /></td>
			</tr>

			<tr>
				<th scope="row"><span class="essential-icon">*</span>예약날짜</th>
				<td><s:textfield name="q_date" theme="simple"
						value="%{resultClass.q_date}" cssStyle="width:279px"
						maxlength="30" /> <font color="#FF0000"> ex) yyyy-mm-dd</font></td>
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

	</article> <br>
	<div class="cm-btn-controls">
		<button type="submit" class="btn-style01" name="submit">등록</button>
		<a
			href="javascript:location.href='CUSlistAction.action?currentPage=<s:property value="currentPage"/>'"
			class="btn-style02">목록으로</a>
	</div>

	</section> </section>
	</div>

</body>
</html>