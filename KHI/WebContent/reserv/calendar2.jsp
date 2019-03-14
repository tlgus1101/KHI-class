<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>한길창호 - 공지사항</title>
<!-- <link rel="Shortcut Icon" href="http://hgwindow.co.kr/favicon.ico">
<link rel="apple-touch-icon-precomposed" href="http://hgwindow.co.kr/apple-touch-icon.png"> -->
<!-- 파비콘 사용시 주석해제 -->
<meta name="Title" content="한길창호 - 공지사항">
<meta name="Subject" content="공지사항">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta name="Robots" content="INDEX,FOLLOW">
<meta property="og:type" content="website">
<meta property="og:title" content="한길창호 - 공지사항">
<meta property="og:description" content="">
<meta property="og:image"
	content="http://hgwindow.co.kr/images/common/logo.png">
<meta property="og:url"
	content="http://hgwindow.co.kr/kr/notice/notice.php">
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="한길창호 - 공지사항">
<meta name="twitter:description" content="">
<meta name="twitter:image"
	content="http://hgwindow.co.kr/images/common/logo.png">
<meta name="twitter:domain"
	content="http://hgwindow.co.kr/kr/notice/notice.php">
<meta name="google-site-verification" content="">
<meta name="naver-site-verification" content="">
<meta name="viewport" content="width=1100">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- 모바일사이트, 반응형사이트 제작시 사용 -->
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

<script src="http://hgwindow.co.kr/js/vendor/jquery.easing.1.3.js"></script>
<script src="http://hgwindow.co.kr/js/common.js"></script>
<script src="http://hgwindow.co.kr/js/layer_popup.js"></script>

<!-- 아이콘폰트 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- 메인비주얼 플러그인 -->
<link rel="stylesheet" type="text/css"
	href="http://hgwindow.co.kr/css/plugin/slick.css">
<script src="http://hgwindow.co.kr/js/plugin/slick.js"></script>


<!-- 카카오 픽셀 공통 스크립트 START 2018.07.09 -->
<script type="text/javascript" charset="UTF-8"
	src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
	kakaoPixel("4529330218572558620").pageView();
</script>
<!-- 카카오 픽셀 공통 스크립트 END 2018.07.09 -->
<script>
	<script>
	$(function() {
		dep1 = 06, dep2 = 01;

		// sub2_num 변수가 있을때 ( 3차메뉴 )
		dep3 = "";

	})
</script>
<script type="text/javascript" src="http://hgwindow.co.kr/js/nav.js"></script>
<script type="text/javascript" src="http://hgwindow.co.kr/js/sub.js"></script>
</head>


<body>
	<article class="main-top-content area clearfix">


		<center>

			<table>
				<tr>
					<td><table>
							<s:property value="calendHtml" escape="false" />
						</table></td>
					<td><br>
						<div align="center"
							style="float: left; width: 350px; height: 357px; background: url(./image/bgcolor.png)"
							id="calendar-right-con">
							<meta charset="utf-8">

							<p class="calendar-today-state">
								<i class="material-icons"><img src="./image/calendar.png"
									width="50" height="50"></i> <strong><b>${date }</b>일.</strong>
								진행현황
							</p>
							<table>
								<div class="calendar-today-list-con ">
									<ul>
										<li></li>
										<s:iterator value="list" status="stat">


											<li><a href="winViewAction.action?v_num=${v_num }"><span><i
														class="material-icons"><img src="./image/location.png"
															width="15" height="20"></i> <s:property
															value="r_location" /></span><strong> <s:if
															test="r_option == 1">부분 </s:if> <s:else> 전체  </s:else>
												</strong></a></li>
											<br>
										</s:iterator>
								</div>
								</ul>
								</div>
							</table>
							</article></td>
				</tr>

				<tr>


					<td>
						<div id="middleArea">
							<!-- content -->


							<section id="photoListCon">

								<article class="product-list-box clearfix">
									<div aria-live="polite" class="slick-list draggable">
										<div class="slick-track" role="listbox"
											style="opacity: 1; width: 7320px; transform: translate3d(-1708px, 0px, 0px);">
											<!-- transition: transform 500ms ease 0s; -->

											<s:iterator value="winlist" status="stat">

												<s:url id="viewURL" action="winViewAction">
													<%-- URL를 만들어준다. --%>
													<s:param name="v_num">
														<s:property value="v_num" />
														<%-- 바로 접근 가능 --%>
													</s:param>
													<s:param name="currentPage">
														<s:property value="currentPage" />
													</s:param>
												</s:url>

												<div class="prd-item">
													<s:a href="%{viewURL}">
														<div class="prd-thumb" style="border: 1px solid gray;">

															<img src="./images/<s:property value="v_imagesv"/>"
																width="200" height="200">
													</s:a>
													<!--<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>-->
												</div>
												<div class="prd-info-con" style="border: 1px solid gray;">
													<strong class="prd-name text-ellipsis"><s:property
															value="v_location" /></strong> <span class="prd-day"><s:property
															value="v_date" /></span>
													<p class="prd-txt">
														<s:if test="v_option == 1"> 
			부분
				</s:if>
														<s:else>
			전체
				</s:else>
													</p>
												</div>

											</s:iterator>
								</article>
							</section>
						</div>
						</div>
						</div>
					</td>
				</tr>


			</table>
		</center>
</body>

<script type="text/javascript">
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
</html>


