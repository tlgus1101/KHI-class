<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="ko">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link rel="stylesheet" href="http://hgwindow.co.kr/css/reset.css">
			<link rel="stylesheet" href="http://hgwindow.co.kr/css/common.css">
				<link rel="stylesheet" href="http://hgwindow.co.kr/css/editor.css">
					<link rel="stylesheet" href="http://hgwindow.co.kr/css/layout.css">
						<link rel="stylesheet"
							href="http://hgwindow.co.kr/css/content.css">
							<link rel="stylesheet" href="http://hgwindow.co.kr/css/main.css">
								<link rel="stylesheet"
									href="http://hgwindow.co.kr/css/board.css">
									<!-- 게시판 제작시 사용 -->
									<!-- <link rel="stylesheet" href="http://hgwindow.co.kr/css/board_responsive.css"> -->
									<!-- 게시판(반응형, 모바일) 제작시 사용 -->
									<!-- <link rel="stylesheet" href="http://hgwindow.co.kr/css/member.css"> -->
									<!-- 회원관련 폼 제작시 사용 -->
									<!-- <link rel="stylesheet" href="http://hgwindow.co.kr/css/member_responsive.css"> -->
									<!-- 회원관련 폼(반응형, 모바일) 제작시 사용 -->

									<script async=""
										src="//fs.bizspring.net/fs4/logger.v4.1.min.js"></script>
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
												kakaoPixel(
														"4529330218572558620")
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
											<script type="text/javascript"
												src="http://hgwindow.co.kr/js/nav.js"></script>
											<script type="text/javascript"
												src="http://hgwindow.co.kr/js/sub.js"></script>
</head>


<body>
	<tr>


		<div id="middleArea">
			<aside id="contentInfoCon" class="area clearfix">
			<h3 class="content-tit">　　재고관리(판매종료)　　</h3>
			<div class="location">
				<ul>
					<li><img
						src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
					<li>재고관리(판매종료)</li>
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
			</script> <!-----------------------------------------------------  게시판 리스트 시작 ------------------------------------------------------------------------------------------------------------------------------------->

			<!-- 답변형/공지사항형 시작 --> <article class="bbs-list-con">
			<p class="total-list-con"></p>

			<div class="bbs-list-tbl">
				<p class="bbs-list-head">
					<span style="width: 8%;">번호</span> <span style="width: 50%;">상품이름</span>
					<span style="width: 10%;">등록일</span> <span style="width: 17%;">
						재고수량 </span> <span style="width: 20%;"> 판매정보 </span>
				</p>
				<!-- 공지사항 -->

				<!-- bbs loop start -->
				<table>
					<s:iterator value="list" status="stat">
						<s:url id="viewURL" action="p_adminView">
							<s:param name="p_no">
								<s:property value="p_no" />
							</s:param>
							<s:param name="currentPage">
								<s:property value="currentPage" />
							</s:param>
						</s:url>

						<div class="bbs-list-row">
							<div class="column bbs-no-data">
								<s:property value="p_no" />
							</div>
							<div class="column bbs-title">

								<a
									href='p_adminView.action?&p_no=<s:property value="p_no" />&currentPage=<s:property value="currentPage" />'>
									<div class="bbs-subject-con">
										<s:property value="p_name" />
										<strong class="bbs-subject-txt"> </strong>
									</div>
								</a>
							</div>
							<div class="column bbs-inline" data-label="등록일">
								<s:property value="p_regDate" />
							</div>
							<div class="column bbs-inline" data-label="재고수량">
								<s:property value="p_quan" />
							</div>
							<div class="column bbs-inline" data-label="판매정보">
								<s:if test="p_option==0">판매종료
				</s:if>
							</div>
						</div>

					</s:iterator>

				</table>


			</div>

			<!-- bbs loop end --> <!-- 답변형/공지사항형 종료 -->
			<div class="cm-btn-controls">
				<a href="javascript:location.href='p_adminList.action?currentPage=<s:property value="currentPage" />';" />재고관리</a>
			</div>

			<div class="paging">
				<s:property value="pagingHtml" escape="false" />
			</div>

			<form name="bbs_search_form">

				<div class="board-search-box">
					<select name="searchNum">
						<option value="0">이름</option>
						<option value="1">번호</option>
					</select> <input placeholder="검색어를 입력해주세요" type="search"
						name="searchKeyword" class="search-word" value="">
						<button type="submit" class="bbs-search-btn" title="검색">
							<i class="material-icons"></i>
						</button>
				</div>
			</form>

			</article> </section>
			<!-- //content -->
		</div>
</body>
</html>
