<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀글 확인</title>
</head>
<body>
	<div id="middleArea">
		<aside id="contentInfoCon" class="area clearfix">
			<h3 class="content-tit">견적문의</h3>
			<div class="location">
				<ul>
					<li><img
						src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
					<li>견적문의</li>


				</ul>
			</div>
		</aside>
		<!-- content -->
		<section id="content" class="area">



			<script type="text/javascript">
				function send() {
					var form = document.bbs_passwd_form;
					if (form.pwd.value == "") {
						alert("비밀번호를 입력해 주세요.");
						form.pwd.focus();
					} else {
						form.submit();
					}
				}
			</script>
			<form name="bbs_passwd_form" action="checkAction.action"
				method="post">
				<s:hidden name="q_num" value="%{resultClass.q_num}" />
				<s:hidden name="currentPage" value="%{currentPage}" />
				<input type="hidden" name="bbs_view_secr" value="1">
				<div class="bbs-password-input-con">
					<p class="password-input-tit">
						해당글은 비밀글입니다. <br> <b>글 작성 시 입력하신 비밀번호</b>를 입력해주세요.
					</p>
					<div class="bbs-password-input-box">
						<i class="material-icons"></i> <label for="pwdInput">비밀번호
							입력</label>
						<s:password name="q_password" theme="simple"
							cssStyle="width:150px" maxlength="20" />
					</div>
					<div class="cm-btn-controls">
						<button type="submit">
							확 인</a>
					</div>
				</div>

			</form>
		</section>
		<!-- //content -->
	</div>
</body>
</html>