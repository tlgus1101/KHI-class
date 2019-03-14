<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>달력</title>
<script language=javascript>
function totalDays(month,year)
{
  var tempDay = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
 
  if(((year %4 ==0) && (year%100!=0)) ||(year%400 ==0))
    tempDay[1] = 29;
  else
    tempDay[1] = 28;
   
  return tempDay[month];
}
function makeCalendar()
{
var today=new Date();
var year=today.getFullYear();
var month=today.getMonth()+1;
var date = today.getDate();
 
var t = 1;

var firstOfMonth = new Date(year,month,1);
var firstDay = firstOfMonth.getDay();
var lastDate = totalDays(month,year);
var text = "";
text +='<TABLE BORDER=2 BORDERCOLOR=gray style="BORDER-COLLAPSE:collapse">';
text += '<th colspan=7>' + year + '년' + (month+1) + '월' + '</th>'
text +='<tr align ="center" valign="center">'
text += '<td width=50><font color=red><b>SUN</b></font></td>'
text += '<td width=50><b>MON</b></td>'
text += '<td width=50><b>TUE</b></td>'
text += '<td width=50><b>WED</b></td>'
text += '<td width=50><b>THU</b></td>'
text += '<td width=50><b>FRI</b></td>'
text += '<td width=50><font color=blue><b>SAT</b></td></font></td>'
text +='</tr>'
var dayNum = 1
var curCol = 1

for (var i=1; i<=Math.ceil((lastDate + firstDay)/7);i++,j++)
{
  text += '<tr align = "left" valign="top" height=50>'
 
  for (var j=1; j<=7; j++)
  {
    if(dayNum >lastDate) {
    	dayNum="";
    	t=2;
    	}
   
    if(curCol <firstDay+1)
    {
      text += '<TD ></TD>';
      curCol++;
    }
else
{
   
	if (dayNum == date)
						text += '<td  align = "left" valign="top" height=50 style="background: skyblue;"><font size=1px>';
	else
						text += '<td><font  size=1px>';

	switch (j) {
					case 1:
						text += '<a style="color:black" href="/_KHI/NewFile.jsp?day=' + dayNum
								+ '">' + dayNum + '</a><br><br>'+123+'</font></td>';
						break;
					case 7:
						text += '<a style="color:black" href="/_KHI/NewFile.jsp?day=' + dayNum
						+ '">' + dayNum + '</a></font></td>';
						break;

					default:
						text += '<a style="color:black" href="/_KHI/NewFile.jsp?day=' + dayNum
						+ '">' + dayNum + '</a></td>';
					}
					if (t == 1)
						dayNum++;
				}
			}
			text += '</tr>'
		}
	text += '<table>'
		document.write(text)

	}
</script>
</head>
<body onLoad="makeCalendar();">

	<%
		out.print(request.getAttribute("day"));
	%>

</body>
</html>











<div aria-live="polite" class="slick-list draggable"><div class="slick-track" role="listbox" style="transform: translate3d(-5856px, 0px, 0px); width: 7320px; background-color: white;">
<div class="prd-item slick-slide slick-cloned" data-slick-index="-5" aria-hidden="true" tabindex="-1" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNTMmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">홍은동 벽산아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-12</span>
							<p class="prd-txt"><b>24</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide slick-cloned" data-slick-index="-4" aria-hidden="true" tabindex="-1" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNTImdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420666129.JPG" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">작전동 태양빌라</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-12</span>
							<p class="prd-txt"><b>3</b>층</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide slick-cloned" data-slick-index="-3" aria-hidden="true" tabindex="-1" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNDcmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420665559.JPG" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">평촌동 경원빌라</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-09</span>
							<p class="prd-txt"><b>3</b>층</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide slick-cloned" data-slick-index="-2" aria-hidden="true" tabindex="-1" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNDYmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420146529.JPG" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">정발산동 밤가시 건영아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-09</span>
							<p class="prd-txt"><b>33</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true" tabindex="-1" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNDUmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420146309.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">은행동 대우아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-09</span>
							<p class="prd-txt"><b>25</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="0" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwODMmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">산본동 삼성래미안아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-15</span>
							<p class="prd-txt"><b>25</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="1" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwODImdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">자양동 로얄동아아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-15</span>
							<p class="prd-txt"><b>23</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="2" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwODEmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">호계동 무궁화코오롱아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-15</span>
							<p class="prd-txt"><b>33</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="3" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwODAmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">장곡동 매꼴동양아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-15</span>
							<p class="prd-txt"><b>24</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="4" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNzEmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15422401939.JPG" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">호계동 효성한양아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-14</span>
							<p class="prd-txt"><b>18</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="5" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNzAmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15421584169.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">학익동 제운빌라</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-14</span>
							<p class="prd-txt"><b>1</b>층</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="6" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNjkmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15422401629.JPG" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">관양동 상가건물</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-14</span>
							<p class="prd-txt">2.3.4층</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="7" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNjgmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15421816059.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">등촌동 등촌주공아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-14</span>
							<p class="prd-txt"><b>24</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="8" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNjAmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15421580929.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">행신동 햇빛마을 주공아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-13</span>
							<p class="prd-txt"><b>33</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="9" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNTkmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420912709.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">봉담읍 상리 빌라</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-13</span>
							<p class="prd-txt"><b>2</b>층</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="10" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNTgmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">구미동 건영빌라</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-13</span>
							<p class="prd-txt"><b>4</b>층</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="11" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNTcmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">박달동 한라비발디아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-13</span>
							<p class="prd-txt"><b>25</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="12" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNTYmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420153449.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">화정동 옥빛주공아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-12</span>
							<p class="prd-txt"><b>33</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="13" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNTUmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420993079.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">교문동 덕현아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-12</span>
							<p class="prd-txt"><b>31</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="14" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNTQmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">화곡동 명성빌라</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-12</span>
							<p class="prd-txt"><b>2</b>층</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="15" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNTMmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">홍은동 벽산아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-12</span>
							<p class="prd-txt"><b>24</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="16" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNTImdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420666129.JPG" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">작전동 태양빌라</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-12</span>
							<p class="prd-txt"><b>3</b>층</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="17" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNDcmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420665559.JPG" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">평촌동 경원빌라</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-09</span>
							<p class="prd-txt"><b>3</b>층</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide" data-slick-index="18" aria-hidden="true" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNDYmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420146529.JPG" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">정발산동 밤가시 건영아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-09</span>
							<p class="prd-txt"><b>33</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide slick-current slick-active" data-slick-index="19" aria-hidden="false" tabindex="-1" role="option" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNDUmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="0">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15420146309.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">은행동 대우아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-09</span>
							<p class="prd-txt"><b>25</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide slick-cloned slick-active" data-slick-index="20" aria-hidden="false" tabindex="-1" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwODMmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="0">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">산본동 삼성래미안아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-15</span>
							<p class="prd-txt"><b>25</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide slick-cloned slick-active" data-slick-index="21" aria-hidden="false" tabindex="-1" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwODImdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="0">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">자양동 로얄동아아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-15</span>
							<p class="prd-txt"><b>23</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide slick-cloned slick-active" data-slick-index="22" aria-hidden="false" tabindex="-1" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwODEmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="0">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">호계동 무궁화코오롱아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-15</span>
							<p class="prd-txt"><b>33</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide slick-cloned slick-active" data-slick-index="23" aria-hidden="false" tabindex="-1" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwODAmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="0">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/photo2/sum_default.jpg" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">장곡동 매꼴동양아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-15</span>
							<p class="prd-txt"><b>24</b>평</p>
						</div>
					</a>
				</div><div class="prd-item slick-slide slick-cloned" data-slick-index="24" aria-hidden="true" tabindex="-1" style="width: 224px;">
					<a href="/kr/example/photo.php?bbs_data=aWR4PTcwNzEmdGFibGU9Y3NfYmJzX2RhdGEmY29kZT1waG90bw==||&amp;bgu=view" tabindex="-1">
						<div class="prd-thumb">
							<img src="http://hgwindow.co.kr/data/bbsData/15422401939.JPG" alt="">
							<span class="prd-detail-btn">자세히보기 <i class="material-icons"></i></span>
						</div>
						<div class="prd-info-con">
							<strong class="prd-name text-ellipsis">호계동 효성한양아파트</strong>
							<!-- <span class="prd-day">0000-00-00</span> -->
							<span class="prd-day">2018-11-14</span>
							<p class="prd-txt"><b>18</b>평</p>
						</div>
					</a>
				</div></div></div>




