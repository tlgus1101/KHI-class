<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko"><head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>한길창호 - 공지사항</title>
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
</table>
				<div style="width:500;  height: 200;"></div>
				
					<h3 class="main-prd-tit">
						시공현장 <b>공개</b>
					</h3>
					<p class="main-prd-sub-tit">이유있는 선택, 한길창호는 언제나 고객의 만족을 위해 끊임없이
						노력합니다.</p>
				

					<section id="photoListCon">

						<article class="product-list-box clearfix">

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
										</div>
									</s:a>
									<!--<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>-->

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
								</div>
							</s:iterator>

						</article>
					</section>




					<%-- <h3 class="main-prd-tit">
							시공현장 <b>공개</b>
						</h3>
						<p class="main-prd-sub-tit">이유있는 선택, 한길창호는 언제나 고객의 만족을 위해 끊임없이
							노력합니다.</p>
						
						<div class="product-list-box clearfix slick-initialized slick-slider">
							<button type="button" data-role="none"
								class="slick-prev slick-arrow" aria-label="Previous"
								role="button" style="display: block;">Previous</button>
							<div aria-live="polite" class="slick-list draggable">
								<div class="slick-track" role="listbox">
									<!-- style="opacity: 1; width: 7320px; transform: translate3d(-1708px, 0px, 0px); transition: transform 500ms ease 0s;">  transition: transform 500ms ease 0s;-->
							<% int i=-5; %>
							<s:iterator value="winlist" status="stat">
									<div class="prd-item slick-slide slick-current slick-active"
										data-slick-index="<%=i %>" name ="<%=i %>"  tabindex="-1"
										style="width: 224px;">
										<%i++; %>
								
									<div class="prd-thumb">
											<a href='winViewAction.action?v_num=<s:property value='v_num'/>' tabindex="-1">
													<img
														src="./images/<s:property value="v_imagesv"/>"width="200" height="200"
														alt=""> <span class="prd-detail-btn">자세히보기 <i
														class="material-icons"></i></span>
												</a></div>
												<div class="prd-info-con">
													<strong class="prd-name text-ellipsis"><s:property
															value="v_location"></s:property></strong> <span class="prd-day"><s:property
															value="v_date"></s:property></span>
													<p class="prd-txt">
														<s:if test="v_option == 1"> 부분</s:if>
														<s:else>전체</s:else>
										</div></div> </s:iterator>

								</div> 
							</div>

						 <button type="button" data-role="none" 
							class="slick-next slick-arrow" aria-label="Next" role="button"
							style="display: block;">Next</button> --%>
		


			
		
		</center>
</body>

</html>
