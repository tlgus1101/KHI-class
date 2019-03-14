<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<title>예약현황</title>
</head>
<body>
	<center>
		<div id="middleArea">
			<aside id="contentInfoCon" class="area clearfix" align="center">
			<h3 class="content-tit" align="center">　　예약현황　　</h3>
			<div class="location">
				<ul>
					<li><img
						src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
					<li>예약현황　　</li>
				</ul>
			</div>

			</aside>
			<!-- content -->
			<section id="content" class="area"> <script>
				type = "text/javascript" > $(document).ready(function() {
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
			</script> <script type="text/javascript">
		function reservFormOpen() {
			var oWin = window
					.open("ReservFormAction.action?r_List=1", name,
							"scrollbars=no,status=no,resizable=no,width=500,height=500");
		}

		function admin_mainOpen() {
			location.href = "AdminMainAction.action";
		}
	</script>
			<center>				
							<div class="cm-btn-controls">
								<a
									href="javascript:reservFormOpen()" />예약추가</a>

								<a href="javascript:admin_mainOpen()">홈</a>

							</div>

				<article class="bbs-list-con">
				<p class="total-list-con"></p>

				<div class="bbs-list-tbl">
					<p class="bbs-list-head">
						<span style="width: 5%;">글번호</span> <span style="width: 15%;">날짜</span>
						<span style="width: 50%;">위치</span> <span style="width: 15%;">전화번호</span>
						<span style="width: 10%;">옵션</span> <span style="width: 10%;">예약현황</span>
					</p>

					<table>
						<s:if test="reservList == null">
							<tr align="center">
								<td rowspan="6"></td>
							</tr>
						</s:if>
						<s:else>
							<s:iterator value="reservList" status="stat">
								<div class="bbs-list-row">
									<div class="column bbs-no-data">
										<s:property value="r_no" />
									</div>
									<div class="column bbs-no-data">
										<s:property value="q_date" />
									</div>
									<div class="column bbs-title">
										<a
											href="AdminReservView.action?r_no=<s:property value='r_no' />">
											<div class="bbs-subject-con">
												<s:property value="r_location" />
												<strong class="bbs-subject-txt"> </strong>
											</div>
										</a>
									</div>
									<div class="column bbs-inline" data-label="전화번호">
										<s:property value="q_tell" />
									</div>
									<div class="column bbs-inline" data-label="옵션">
										<s:if test="r_option == 1">부분</s:if>
										<s:else>전체</s:else>
									</div>
									<div class="column bbs-inline" data-label="예약현황">
										<s:if test="r_ok == 0">미확정</s:if>
										<s:else>확정</s:else>
									</div>
								</div>
							</s:iterator>
						</s:else>


					</table>
				</div>

				<div class="paging">
					<td colspan="6" align="center"><s:property value="pagingHtml"
							escape="false" />
				</div>

				</article>
			</center>
			</section>
		</div>
	</center>
</body>
</html>