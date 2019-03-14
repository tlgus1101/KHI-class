<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>KHI관리자 페이지</title>
</head>
<body>
	<div id="middleArea">
		<aside id="contentInfoCon" class="area clearfix">
			<h3 class="content-tit">관리자페이지</h3>
			<div class="location">
				<ul>
					<li><img
						src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
					<li>예약현황</li>



				</ul>
			</div>
		</aside>
		<!-- content -->
		<section id="content" class="area">



			<script type="text/javascript">
		function reservFormOpen() {
			var oWin = window
					.open("ReservFormAction.action", name,
							"scrollbars=no,status=no,resizable=no,width=700,height=600");
		}
		function reservListOpen() {
			location.href = "ReservListction.action";
		}
		
	</script>
			<!-----------------------------------------------------  게시판 리스트 시작 ------------------------------------------------------------------------------------------------------------------------------------->
			<center>
				<div class="cm-btn-controls" vertical-align="middle">
					<p>
						<a href="javascript:reservFormOpen()" />예약추가</a> <span
							style="font-size: 25" vertical-align="middle"> - ${year }년
							${ month+1 }월 ${date }일 예약 리스트 - </span> <a
							href="javascript:reservListOpen()">더보기</a>
					</p>
				</div>

			</center>
			<!-- 답변형/공지사항형 시작 -->
			<article class="bbs-list-con">
				<div class="bbs-list-tbl">
					<p class="bbs-list-head">
						<span style="width: 7%;">날짜</span> <span style="">위치</span> <span
							style="width: 12%;">전화번호</span> <span style="width: 12%;">예약상황</span>

					</p>

					<s:if test="reservList == null">
						<tr align="center">
							<td rowspan="5"></td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="reservList" status="stat">
							<!-- 공지사항 -->
							<table>
								<!-- bbs loop start -->
								<div class="bbs-list-row">
									<div class="column bbs-no-data">
										<s:property value="q_date" />
									</div>
									<div class="column bbs-title">
										<a
											href="/kr/notice/qna.php?bbs_view_secr=1&amp;bbs_data=aWR4PTY4NjQmc3RhcnRQYWdlPTAmbGlzdE5vPTMmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1xbmEmc2VhcmNoX2l0ZW09JnNlYXJjaF9vcmRlcj0=||&amp;bgu=pass">
											<div class="bbs-subject-con">
												<strong class="bbs-subject-txt"><a
													href="AdminReservView.action?r_no=<s:property value='r_no' />&main=1">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property
															value="r_location" />
												</a> </strong>
												<div class="bbs-subject-icons"></div>
											</div>
										</a>
									</div>
									<div class="column bbs-inline" data-label="전화번호">
										<s:property value="q_tell" />
									</div>
									<div class="column bbs-inline" data-label="예약상황">
										<s:if test="r_ok == 0">미확정</s:if>
										<s:else>확정</s:else>
									</div>

									</s:iterator>
									</s:else>
							</table>

							<!-- bbs loop end -->

							<!-- 답변형/공지사항형 종료 -->





							<!--  
<html>
<head>
<meta charset="UTF-8">
<title>KHI관리자 페이지</title>
</head>
<body>

	<script type="text/javascript">
		function reservFormOpen() {
			var oWin = window
					.open("ReservFormAction.action", name,
							"scrollbars=no,status=no,resizable=no,width=500,height=500");
		}
		function reservListOpen() {
			location.href = "ReservListction.action";
		}
		
	</script>

	<table>
		<tr>
			<td bgcolor="#000000" colspan="3"></td>
		</tr>

		<tr>

			<td><table width="450" border="0" cellspacing="0"
					cellpadding="2">
					<tr>
						<td colspan="4" bgcolor="#999999"></td>
					</tr>
					<tr>
						<td colspan="4" align="center"><input type="button"
							value="예약 추가" onclick="reservFormOpen()"> - ${year }년 ${ month+1 }월
							${date }일 예약 리스트 - <input type="button" value="더보기"
							onclick="reservListOpen()"></td>
					</tr>
					<tr>
						<td colspan="4" bgcolor="#999999"></td>
					</tr>
					<tr align="center" bgcolor="#F3F3F3">
						<td width="10"><strong>날짜</strong></td>
						<td><strong>위치</strong></td>
						<td><strong>전화번호</strong></td>
						<td><strong>예약 상황</strong></td>

					</tr>
					<s:if test="reservList == null">
						<tr align="center">
							<td rowspan="5"></td>
						</tr>
					</s:if>
					<s:else>
						<s:iterator value="reservList" status="stat">
							<tr align="center">
								<td><s:property value="q_date" /></td>
								<td><a
									href="AdminReservView.action?r_no=<s:property value='r_no' />"><s:property
											value="r_location" /></a></td>
								<td><s:property value="q_tell" /></td>
								<td><s:if test="r_ok == 0">미확정</s:if> <s:else>확정</s:else></td>
							</tr>
						</s:iterator>
					</s:else>
					<tr>
						<td colspan="3" align="center"><s:property value="pagingHtml"
								escape="false" /></td>
					</tr>
				</table></td>
		<tr>
	</table>
	-->
				</div>
			</article>
		</section>
	</div>
	<div class="paging">
		<s:property value="pagingHtml" escape="false" />
	</div>
</body>
</html>
