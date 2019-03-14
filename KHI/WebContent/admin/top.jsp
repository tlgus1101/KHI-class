<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko"><head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>한길창호 - 관리자</title>
<!-- <link rel="Shortcut Icon" href="http://hgwindow.co.kr/favicon.ico">
<link rel="apple-touch-icon-precomposed" href="http://hgwindow.co.kr/apple-touch-icon.png"> -->	<!-- 파비콘 사용시 주석해제 -->
<meta name="Title" content="한길창호-관리자 ">
<meta name="Subject" content="관리자">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta name="Robots" content="INDEX,FOLLOW">
<meta name="viewport" content="width=1100">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> --><!-- 모바일사이트, 반응형사이트 제작시 사용 -->
<link rel="stylesheet" href="http://hgwindow.co.kr/css/reset.css">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/common.css">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/editor.css">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/layout.css">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/content.css">
<link rel="stylesheet" href="/_KHI/top/AMain.css">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/board.css"> <!-- 게시판 제작시 사용 -->
<!-- <link rel="stylesheet" href="http://hgwindow.co.kr/css/board_responsive.css"> --> <!-- 게시판(반응형, 모바일) 제작시 사용 -->
<!-- <link rel="stylesheet" href="http://hgwindow.co.kr/css/member.css"> --><!-- 회원관련 폼 제작시 사용 -->
<!-- <link rel="stylesheet" href="http://hgwindow.co.kr/css/member_responsive.css"> --><!-- 회원관련 폼(반응형, 모바일) 제작시 사용 -->

<script async="" src="//fs.bizspring.net/fs4/logger.v4.1.min.js"></script><script async="" src="//fs.bizspring.net/fs4/bstrk.1.min.js"></script><script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="http://hgwindow.co.kr/js/vendor/jquery-1.8.3.min.js"><\/script>')</script>

<!--[if lt IE 9]>
	<script src="http://hgwindow.co.kr/js/vendor/html5shiv.js"></script>
	<script src="http://hgwindow.co.kr/js/vendor/respond.min.js"></script>
	<link rel="stylesheet" href="http://hgwindow.co.kr/css/ie8.css">
<![endif]-->

<script src="http://hgwindow.co.kr/js/vendor/jquery.easing.1.3.js"></script>
<script src="http://hgwindow.co.kr/js/common.js"></script>
<script src="http://hgwindow.co.kr/js/layer_popup.js"></script>

<!-- 아이콘폰트 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- 메인비주얼 플러그인 -->
<link rel="stylesheet" type="text/css" href="http://hgwindow.co.kr/css/plugin/slick.css">
<script src="http://hgwindow.co.kr/js/plugin/slick.js"></script>



</script>
<script>
	$(function  () {
		dep1 = 05,
		dep2 = 01;

		// sub2_num 변수가 있을때 ( 3차메뉴 )
						dep3 = "";
		
	})
</script>
<script type="text/javascript" src="http://hgwindow.co.kr/js/nav.js"></script>
<script type="text/javascript" src="http://hgwindow.co.kr/js/sub.js"></script>
</head>



<body>

 <script type="text/javascript">
   
      /* for(var i =0;i<6;i++) */

      function ProductsOpen() {
         location.href = "/_KHI/products/p_adminList.action?tap=1";
      }
      function NoticeListOpen() {
         location.href = "/_KHI/notice/noticeAListAction.action?tap=2";
      }
      function WindowListOpen() {
         location.href = "/_KHI/adminList.action?tap=3";
      }
      function reservMinOpen() {
         location.href = "/_KHI/AdminMainAction.action?tap=4";
      }
      function CMMinOpen() {
         location.href = "/_KHI/yh/CminiAction.action?tap=5";
      }

      function QnAMinOpen() {
         location.href = "/_KHI/yh/QminiAction.action?tap=6";
      }
   </script>
<!--[if lt IE 7]>
<p class="cm-alert-ie">현재 웹브라우저에서는 사이트가 정상적으로 표시되지 않을 수 있습니다. <strong><a href="http://browsehappy.com/" target="_blank">여기를 클릭</a></strong>하여 웹브라우저를 업그레이드 하세요.</p>
<![endif]-->
<!-- accessibility -->
<div class="cm-accessibility">
	<a href="#container">본문바로가기</a>
</div>
<!-- //accessibility -->

<!-- code -->
<div id="wrap" class="sub-page">
	<!-- header -->
	<header>
		
		</div>
		<nav id="gnb">
			<ul class="clearfix area">
				<li class="gnb1"><a href="javascript:ProductsOpen();">재고관리</a>
				
				</li>
				<li class="gnb2"><a href="javascript:NoticeListOpen();">공지사항</a>
				</li>
				<li class="gnb3"><a href="javascript:WindowListOpen()">시공게시판</a>
				</li>
				<li class="gnb4">
					<a href="javascript:reservMinOpen()">예약현황</a>
				</li>
				<li class="gnb5"><a href="javascript:CMMinOpen()">견적문의</a>
				</li>
				<li class="gnb6"><a href="javascript: QnAMinOpen()">Q&A</a>				
				</li>
			</ul>
		</nav>
	</header>
	<!-- //header -->
	<!-- container -->
	<div id="container">
		<!-- visual -->
		
	
			</div>
		
      

	<!--    <table>

		<tr>
			<td colspan="3" align="right"><input type="button" value="재고관리 " id="1" 
				onclick="ProductsOpen()"
				style="width: 75; font-family: 돋움; background-color: #eff7f9; border: 1 solid #A0DBE4">
				<input type="button" value="공지사항 " id="2"  onclick="NoticeListOpen()"
				style="width: 75; font-family: 돋움; background-color: #eff7f9; border: 1 solid #A0DBE4">
				<input type="button" value="시공게시판 " id="3"  onclick="WindowListOpen()"
				style="width: 75; font-family: 돋움; background-color: #eff7f9; border: 1 solid #A0DBE4"></td>




			<td><input type="button" value="예약 현황" id="4" 
				onclick="reservMinOpen() "
				style="width: 75; font-family: 돋움; background-color: #eff7f9; border: 1 solid #A0DBE4">
				<input type="button" value="견적문의" onclick="CMMinOpen()" id="5" 
				style="width: 75; font-family: 돋움; background-color: #eff7f9; border: 1 solid #A0DBE4">
				<input type="button" value="QnA" onclick="QnAMinOpen()" id="6" 
				style="width: 75; font-family: 돋움; background-color: #eff7f9; border: 1 solid #A0DBE4"></td>
		</tr>
	</table>
	-->
</body>
</html>