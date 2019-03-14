<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>한길창호</title>
<meta name="Title" content="한길창호">
<meta name="Subject" content="한길창호">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta name="Robots" content="INDEX,FOLLOW">
<meta property="og:type" content="website">
<meta property="og:title" content="한길창호">
<meta property="og:description" content="">
<meta property="og:image"
	content="http://localhost:8080/_KHI/image/logo.png">
<meta property="og:url" content="http://hgwindow.co.kr/kr/index.php">
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="한길창호">
<meta name="twitter:description" content="">
<meta name="twitter:image"
	content="http://localhost:8080/_KHI/image/logo.png">
<meta name="twitter:domain" content="http://hgwindow.co.kr/kr/index.php">
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
<!-- <link rel="stylesheet" type="text/css" href="main.css"> -->
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
<!--[if lt IE 9]>
	<script src="http://hgwindow.co.kr/js/ie8_popup.js"></script>
<![endif]-->

<script>
	$(function() {
		dep1 = 0, dep2 = 0;
	})
</script>
<script type="text/javascript" src="http://hgwindow.co.kr/js/nav.js"></script>
<script type="text/javascript" src="http://hgwindow.co.kr/js/main.js"></script>
</head>

<body>
	<!--[if lt IE 7]>
<p class="cm-alert-ie">현재 웹브라우저에서는 사이트가 정상적으로 표시되지 않을 수 있습니다. <strong><a href="http://browsehappy.com/" target="_blank">여기를 클릭</a></strong>하여 웹브라우저를 업그레이드 하세요.</p>
<![endif]-->
	<!-- accessibility -->

	<!-- //accessibility -->

	<!-- code -->
	<div id="wrap">
		<!-- header -->
		<header id="header">
			<div id="headerInner" class="area">
				<!-- 로고 이미지를 적용할 시 글을 지우고 이미지를 넣어주시면 됩니다. <img src="/kr/이미지 경로" alt=""> -->
				<h1 class="logo">
					<a href="http://localhost:8080/_KHI/CalendarAction.action"><img
						src="http://localhost:8080/_KHI/image/logo.png" alt=""></a>
				</h1>
				<div class="header-util clearfix">
					<p class="header-tel">
						<img src="" alt="031. 404. 4045 수  Am. 9:00 ~ PM. 12:00">
					</p>
					<!-- img src 부분에 이미지 경로 넣기   -->
				</div>
			</div>
			<nav id="gnb">
				<ul class="clearfix area">

					<li class="gnb1"><a
						href="http://localhost:8080/_KHI/products/products_list_bal.action">제품소개</a>
						<!-- 2dep가 있을 때 넣어주시면 됩니다. -->
						<div class="gnb-2dep">
							<ul class="area">
								<li><a
									href="http://localhost:8080/_KHI/products/products_list_bal.action">발코니
										창호</a></li>
								<li><a
									href="http://localhost:8080/_KHI/products/products_list_my.action">내창/방
										창호</a></li>
								<li><a
									href="http://localhost:8080/_KHI/products/products_list_acc.action">악세서리</a></li>
							</ul>
						</div> <!-- // 2dep가 있을 때 넣어주시면 됩니다. --></li>
					<li class="gnb2"><a
						href="http://localhost:8080/_KHI/winListAction.action">시공사례</a>
						<div class="gnb-2dep">
							<ul class="area">
								<li><a
									href="http://localhost:8080/_KHI/winListAction.action">시공현장
										사진</a></li>
							</ul>
						</div></li>
					<li class="gnb3"><a
						href="http://localhost:8080/_KHI/yh/CUSlistAction.action">문의사항</a>
						<div class="gnb-2dep">
							<ul class="area">
								<li><a href="http://localhost:8080/_KHI/yh/CUSlistAction.action">견적문의</a></li>
								<li><a
									href="http://localhost:8080/_KHI/yh/QnAlistAction.action">Q/A</a></li>
							</ul>
						</div></li>
					<li class="gnb4"><a
						href="http://localhost:8080/_KHI/notice/noticeListAction.action">공지사항</a>
						<div class="gnb-2dep">
							<ul class="area">
								<li><a
									href="http://localhost:8080/_KHI/notice/noticeListAction.action">공지사항</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</header>
		<div id="mainContainer">
			<!-- visual -->
			<section id="mainVisual">
				<div class="main-visual-txt area active">
					<p class="visual-txt1">
						<p class="visual-txt1"><font size="32"><b>KHI 창호 </b></font></p>
					</p>
					<p class="visual-txt2">
						<img src="./images/main_tit_02.png" alt="모든 부자재 KCC정품 취급">
					</p>
					<p class="visual-txt3">
						<img src="./images/main_tit_03.png" alt="합리적인 가격으로 최상의 품질을 보장합니다.">
					</p>
				</div>
				<!-- <div class="main-visual slick-initialized slick-slider" style="background:url(http://hgwindow.co.kr/images/main/main_visual_01.jpg) no-repeat 50% 0%;"> -->
				<div class="main-visual slick-slider "
					style="background: url(http://hgwindow.co.kr/images/main/main_visual_01.jpg) no-repeat 50% 0%;">

					<button type="button" data-role="none"
						class="slick-prev slick-arrow" aria-label="Prev" role="button"
						style="display: block;">
						<img src="/images/button/main_visual_prev.png" alt="">
					</button>
					<div aria-live="polite" class="slick-list draggable">
						<div class="slick-track" role="listbox"
							style="opacity: 1; width: 5436px;">
							<div
								class="main-visual-inner slick-slide slick-current slick-active"
								style="background: url(&quot;http://hgwindow.co.kr/images/main/main_visual_01.jpg&quot;) 50% 0% no-repeat; width: 1359px; position: relative; left: 0px; top: 0px; z-index: 2; opacity: 1;"
								data-slick-index="0" aria-hidden="false" tabindex="-1"
								role="option"></div>
							<div class="main-visual-inner slick-slide"
								style="background: url(&quot;http://hgwindow.co.kr/images/layout/sub_visual_06.jpgg&quot;) 50% 0% no-repeat; width: 1359px; position: relative; left: -1359px; top: 0px; z-index: 1; opacity: 0; transition: opacity 500ms ease 0s;"
								data-slick-index="1" aria-hidden="true" tabindex="-1"
								role="option"></div>
							<div class="main-visual-inner slick-slide"
								style="background: url(&quot;http://hgwindow.co.kr/images/layout/sub_visual_06.jpg&quot;) 50% 0% no-repeat; width: 1359px; position: relative; left: -2718px; top: 0px; z-index: 1; opacity: 0; transition: opacity 500ms ease 0s;"
								data-slick-index="2" aria-hidden="true" tabindex="-1"
								role="option"></div>
							<div class="main-visual-inner slick-slide"
								style="background: url(&quot;http://hgwindow.co.kr/images/layout/sub_visual_06.jpgquot;) 50% 0% no-repeat; width: 1359px; position: relative; left: -4077px; top: 0px; z-index: 1; opacity: 0; transition: opacity 500ms ease 0s;"
								data-slick-index="3" aria-hidden="true" tabindex="-1"
								role="option"></div>
						</div>
					</div>



					<button type="button" data-role="none"
						class="slick-next slick-arrow" aria-label="Next" role="button"
						style="display: block;">
						<img src="/images/button/main_visual_next.png" alt="">
					</button>
				</div>
			</section>