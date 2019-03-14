<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/reset.css">
	<link rel="stylesheet" href="http://hgwindow.co.kr/css/common.css">
		<link rel="stylesheet" href="http://hgwindow.co.kr/css/editor.css">
			<link rel="stylesheet" href="http://hgwindow.co.kr/css/layout.css">
				<link rel="stylesheet" href="http://hgwindow.co.kr/css/content.css">
					<link rel="stylesheet" href="http://hgwindow.co.kr/css/main.css">
						<link rel="stylesheet" href="http://hgwindow.co.kr/css/board.css">
							<!-- 게시판 제작시 사용 -->
							<!-- <link rel="stylesheet" href="http://hgwindow.co.kr/css/board_responsive.css"> -->
							<!-- 게시판(반응형, 모바일) 제작시 사용 -->
							<!-- <link rel="stylesheet" href="http://hgwindow.co.kr/css/member.css"> -->
							<!-- 회원관련 폼 제작시 사용 -->
							<!-- <link rel="stylesheet" href="http://hgwindow.co.kr/css/member_responsive.css"> -->
							<!-- 회원관련 폼(반응형, 모바일) 제작시 사용 -->

							<script async="" src="//fs.bizspring.net/fs4/logger.v4.1.min.js"></script>
							<script async="" src="//fs.bizspring.net/fs4/bstrk.1.min.js"></script>
							<script
								src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
							<script>
								window.jQuery
										|| document
												.write('<script src="http://hgwindow.co.kr/js/vendor/jquery-1.8.3.min.js"><\/script>')
							</script>

							<!--[if lt IE 9]>
	<script src="http://hgwindow.co.kr/js/vendor/html5shiv.js"></script>
	<script src="http://hgwindow.co.kr/js/vendor/respond.min.js"></script>
	<link rel="stylesheet" href="http://hgwindow.co.kr/css/ie8.css">
<![endif]-->

							<script
								src="http://hgwindow.co.kr/js/vendor/jquery.easing.1.3.js"></script>
							<script src="http://hgwindow.co.kr/js/common.js"></script>
							<script src="http://hgwindow.co.kr/js/layer_popup.js"></script>

							<!-- 아이콘폰트 -->
							<link
								href="https://fonts.googleapis.com/icon?family=Material+Icons"
								rel="stylesheet">

								<!-- 메인비주얼 플러그인 -->
								<link rel="stylesheet" type="text/css"
									href="http://hgwindow.co.kr/css/plugin/slick.css">
									<script src="http://hgwindow.co.kr/js/plugin/slick.js"></script>


									<!-- 카카오 픽셀 공통 스크립트 START 2018.07.09 -->
									<script type="text/javascript" charset="UTF-8"
										src="//t1.daumcdn.net/adfit/static/kp.js"></script>
									<script type="text/javascript">
										kakaoPixel("4529330218572558620")
												.pageView();
									</script>
									<!-- 카카오 픽셀 공통 스크립트 END 2018.07.09 -->


									<script type="text/javascript">
										function admin_finishSale() {
											location.href = "p_adminFinishSale.action";
										}
									</script>
<script>
	$(function() {
		dep1 = 06, dep2 = 02;

		// sub2_num 변수가 있을때 ( 3차메뉴 )
		dep3 = "";

	})
</script>
<script type="text/javascript" src="http://hgwindow.co.kr/js/nav.js"></script>
<script type="text/javascript" src="http://hgwindow.co.kr/js/sub.js"></script>
	<script type="text/javascript">
		function validation() {
			var frm = document.fff;

			if (frm.q_subject.value == "") {
				alert("제목 입력해 주세요 ");
				return false;
			} else if (frm.q_name.value == "") {
				alert("이름을 입력해 주세요 ");
				return false;
			} /* else if (frm.q_password.value == "") {
				alert("비밀번호를 입력해 주세요 ");
				return false;
			} */ else if (frm.q_phone1.value == "") {
				alert("폰번호 입력해 주세요");
				return false;
			} else if (frm.q_phone2.value == "") {
				alert("폰번호 입력해 주세요 ");
				return false;
			}else if (frm.q_content.value == "") {
				alert("내용을 입력해 주세요 ");
				return false;
			}
			
			return true;
		}
	</script>
</head>
<body>
<div id="middleArea" align="center">
			<center>
			
			<aside id="contentInfoCon" class="area clearfix">
			<h3 class="content-tit">　　견적문의　　</h3>
			
			<div class="location">
				<ul> 
					<li><img
						src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
					<li>견적문의　　</li>
				</ul>
			</div>
			</aside>
			
			<script>
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
			
			</center>
	<center>

		<span style="line-height:250%">

	<s:if test="resultClass==NULL">
		<form action="CUSwriteAction.action" name="fff" method="post"
			enctype="multipart/form-data" onsubmit="return validation();" />
	</s:if>

	<s:elseif test="reply">
		<form action="CreplyAction.action" name="fff" method="post"
			enctype="multipart/form-data" onsubmit="return validation();" />
			<s:hidden name="q_password" value="%{resultClass.q_password}" />
		<s:hidden name="ref" value="%{resultClass.ref}" />
		<s:hidden name="re_level" value="%{resultClass.re_level}" />
		<s:hidden name="re_step" value="%{resultClass.re_step}" />
	</s:elseif>

	<s:else>
		<form action="CminimodifyAction.action" method="post"
			enctype="multipart/form-data" name="fff"
			onsubmit="return validation();" />
		<s:hidden name="q_num" value="%{resultClass.q_num}" />
		<s:hidden name="q_option" value="%{resultClass.q_option}" />
		<s:hidden name="currentPage" value="%{currentPage}" />
		<s:hidden name="old_file" value="%{resultClass.file_savname}" />
	</s:else>

	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000">*</font>는 필수
				입력사항입니다.</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="#F4F4F$"><font color="FF0000">*</font>제목</td>
			<td width="500" bgcolor="#FFFFFF"><s:textfield name="q_subject"
					theme="simple" value="%{resultClass.q_subject}"
					cssStyle="width:279px" maxlength="30" /></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$"><font color="FF0000">*</font>이름</td>
			<td bgcolor="#FFFFFF"><s:textfield name="q_name" theme="simple"
					value="%{resultClass.q_name}" cssStyle="width:100px" maxlength="10" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<%-- <tr>
			<td bgcolor="#F4F4F$"><font color="FF0000">*</font>비밀번호</td>
			<td bgcolor="#FFFFFF"><s:password name="q_password"
					theme="simple" value="%{resultClass.q_password}"
					cssStyle="width:100px" maxlength="10" /></td>
		</tr> --%>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$"><font color="FF0000">*</font>폰번호</td>
			<td bgcolor="#FFFFFF"><font>010&nbsp;-&nbsp;</font> <s:textfield
					name="q_phone1" theme="simple" value="%{resultClass.q_phone1}"
					cssStyle="width:100px" maxlength="4" /> <font>&nbsp;-&nbsp;</font>
				<s:textfield name="q_phone2" theme="simple"
					value="%{resultClass.q_phone2}" cssStyle="width:100px"
					maxlength="4" /></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$"><font color="FF0000"></font>이메일</td>
			<td bgcolor="#FFFFFF"><s:textfield name="q_email" theme="simple"
					value="%{resultClass.q_email}" cssStyle="width:279px"
					maxlength="30" /> <font></font></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$"><font color="FF0000"></font>예약날짜</td>
			<td bgcolor="#FFFFFF">
			<s:textfield name="q_date" theme="simple"
					value="%{resultClass.q_date}" cssStyle="width:279px" maxlength="30" />
				<font></font></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$"><font color="FF0000">*</font>내용</td>
			<td bgcolor="#FFFFFF"><s:if test="reply">
					<textarea name="q_content" cols="50" rows="10">질문 : ${resultClass.q_content}
[답변] </textarea>
				</s:if> <s:else>
					<textarea name="q_content" cols="50" rows="10"> </textarea>
				</s:else></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F$">첨부파일</td>
			<td bgcolor="#FFFFFF"><s:file name="upload" theme="simple" /> <s:if
					test="resultClass.file_orgname!=NULL">&nbsp;<s:property
						value="resultClass.file_orgname" />기존파일 날아감</s:if></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td height="10" colspan="2"></td>
		</tr>

		<tr>
			<td align="right" colspan="2"><input name="submit" type="submit"
				value="작성완료" class="inputb"> <input name="list"
					type="button" value="목록" class="inputb"
					onclick="javascript:winopen.location.href='CminiAction.action?currentPage=<s:property value="currentPage"/>'"></td>
		</tr>
	</table>
	
	</span>
	</center>
	</div>
</body>
</html>