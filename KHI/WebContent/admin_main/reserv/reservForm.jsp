<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<link rel="stylesheet" href="http://hgwindow.co.kr/css/reset.css">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/common.css">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/editor.css">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/layout.css">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/content.css">
<!-- <link rel="stylesheet" type="text/css" href="main.css"> -->
<link rel="stylesheet" href="http://hgwindow.co.kr/css/main.css">
<link rel="stylesheet" href="http://hgwindow.co.kr/css/board.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="ko">

<head>
<title>예약하기</title>
</head>
<body>
	<div id="middleArea" align="center">
		<center>

			<aside id="contentInfoCon" class="area clearfix">
			<h3 class="content-tit">예약하기</h3>

			</aside>
		</center>

		<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js">
</script>

		<script language="javascript">

	function zipCheck()
	{
		  new daum.Postcode({
		        oncomplete: function(data) {
		         	document.reservForm.r_location.value = data.sigungu+" "+data.bname;
		         	
		}
			}).open();
	}
	
	function count_change(temp ){
		   var test=document.reservForm.count.value;
		   if(temp==0){
		      test++;
		   }else if(temp==1){
		      if(test> 1) test--;
		   }
		   
		   document.reservForm.count.value=test;
		}

	
		 //var trName = 0;
		 
		 	function productsAuto(name,count,size) {
			var trName = document.reservForm.trName.value;
			
			var p_noList = count.split(",");
			var p_nameList = name.split(",");

			
			var p_no = document.reservForm.p_no.value;
			var p_name = document.reservForm.p_name.value;
			
			
			for (var i = 0; i < size; i++) {
				p_no += p_noList[i]+","
				p_name +=  p_nameList[i]+"," 
			
			var newItem = document.createElement("div");//div 값을 생성해서 넣어줌 
			newItem.setAttribute("id", trName);//div 값을 셋팅함 div id 값을 카운트 값으로 설정 
			
			var html = "상품이름 :<font color='blue'>"+p_nameList[i]
			+ "</font> /  개수 : <font color='blue'>"
			+ p_noList[i]
			+ "</font>&nbsp;&nbsp;&nbsp;<input class='delButton' type='button' name='"
			+ trName + "' value='x' onclick='productsDel("+trName+")'>"; //디아이브이에 넣을 코드를 설정함 
			newItem.innerHTML = html; // 입력 해줌 
			
			trName++;
			var itemListNode = document.getElementById('itemList'); // itemList 라는 이름을 가진 값을 불러와서 넣어줌 
			itemListNode.appendChild(newItem);//아이템 리스트에 새로 저장된 아이ㅊ탬을 추가해서 밑에  
			                                  //디아이브이 이름 같은대에 뜰수있게 
			}            
			
			document.reservForm.p_no.value =   p_no;
			document.reservForm.p_name.value = p_name;
			document.reservForm.trName.value = trName;

		}
		 
		 
		 // 추가하기버튼을 누르면 이쪽 함수로 넘어오고 
		function productsStr() {

			var name = document.reservForm.name.value;
			var count = document.reservForm.count.value;
			var trName = document.reservForm.trName.value;
	
			var p_no = document.reservForm.p_no.value;
			p_no += count+","
			var p_name = document.reservForm.p_name.value;
			p_name +=  name+"," 
			
			var newItem = document.createElement("div");//div 값을 생성해서 넣어줌 
			newItem.setAttribute("id", trName);//div 값을 셋팅함 div id 값을 카운트 값으로 설정 
			
			var html = "상품이름 :<font color='blue'>"+name
			+ "</font> /  개수 : <font color='blue'>"
			+ count
			+ "</font>&nbsp;&nbsp;&nbsp;<input class='delButton' type='button' name='"
			+ trName + "' value='x' onclick='productsDel("+trName+")'>"; //디아이브이에 넣을 코드를 설정함 
			newItem.innerHTML = html; // 입력 해줌 
			
			trName++;
			var itemListNode = document.getElementById('itemList'); // itemList 라는 이름을 가진 값을 불러와서 넣어줌 
			itemListNode.appendChild(newItem);//아이템 리스트에 새로 저장된 아이ㅊ탬을 추가해서 밑에  
			                                  //디아이브이 이름 같은대에 뜰수있게 
			                                  
			document.reservForm.p_no.value =   p_no;
			document.reservForm.p_name.value = p_name;
			document.reservForm.trName.value = trName;

		}

		function productsDel(idx) {
			var trName = document.reservForm.trName.value;
			var item = document.getElementById(idx);

			var p_no = document.reservForm.p_no.value;
			var p_name = document.reservForm.p_name.value;

			
			var p_noList = p_no.split(",");
			var p_nameList = p_name.split(",");

			p_name = "";
			p_no = "";
			for (var i = 0; i < trName; i++) {
				if (i != (idx)) {
					p_no += p_noList[i] + ",";
					p_name += p_nameList[i] + ",";
				
				}
			}
		 	//삭제 할때도 아이디 값을 그 카운트로 넣었으니까 그걸로 불러와서 삭제 해버림 
			if (item != null) {
				item.parentNode.removeChild(item);
			}
 
			document.reservForm.p_no.value = p_no;
			document.reservForm.p_name.value = p_name;
		}

		function ReservAction() {
			//opener.location.href = "AdminMainAction.action";
			
			var q_num= ${q_num}+"";
				if(q_num!="")
					{
						window.close();
					}
				else{
				opener.location.href = "AdminMainAction.action"
				window.close();
				}
		}

		function ReservActionToList() {
			//opener.location.href = "ReservListction.action";
		
			
					opener.location.href = "ReservListction.action";
					window.close();
	
			}
		
		function ReservViewAction(r_no) {
			location.href = "AdminReservView.action?r_no="+r_no;
			//window.close();
		}
	</script>
		<center>
			<s:if test="r_no != 0">
				<form name="reservForm"
					action="ReservUpdateAction.action?r_no=${r_no }" method="post">
			</s:if>
			<s:else>
				<s:if test="r_List == 1">
					<br>
					<form name="reservForm" action="ReservActionToList.action?r_List=2"
						method="post">
				</s:if>
				<s:else>
					<form name="reservForm" action="ReservAction.action?r_List=3"
						method="post">
				</s:else>
			</s:else>

			<s:if test="r_List == 2">
				<script type="text/javascript">
	ReservActionToList();
	</script>
			</s:if>
			<s:if test="r_List == 3">
				<script type="text/javascript">
	ReservAction();
	</script>
			</s:if>

			<table border="1" id="reservTable">

				<tr>
					<td width="200">예약 날짜</td>
					<td width="400"><input name="q_dateStr" type="date"
						value="${q_dateStr}"></td>
				</tr>
				<tr>
					<td>시공 장소</td>
					<td><input name="r_location" type="text" value="${r_location}">
						<input type="button" value="위치 찾기 " onclick="zipCheck()"></td>
				</tr>
				<tr>
					<td>부분/전체 시공</td>
					<td><select name="r_option">
							<s:if test="r_option==1">
								<option value="1" selected="selected">부분</option>
								<option value="2">전체</option>
							</s:if>
							<s:else>
								<option value="1">부분</option>
								<option value="2" selected="selected">전체</option>
							</s:else>
					</select></td>
				</tr>
				<tr>
					<td>사용할 제품</td>
					<td><input type="hidden" value="0" name="trName"> <input
						type="hidden" value="" name="p_no"> <input type="hidden"
						value="" name="p_name"> <input type="hidden" value=""
						name="${q_file_orgname }"> <select name="name">
							<s:iterator value="list" status="stat">
								<option value="${p_name }">${p_name }-${p_quan }</option>
							</s:iterator>
					</select> <input type="button" value="-" onclick='count_change(1)'>
						<input size="5" name="count" type="text" value="1"> <input
						type="button" onclick="count_change(0)" value="+"> <input
						type="button" value="추가 " onclick="productsStr()"> <%-- 	<s:property value="productsHtml" escape="false"/> --%></td>
				</tr>

				<tr>
					<td></td>
					<td><div id="itemList"></div></td>
				</tr>
				<!-- div  이름을 설정 해 놓고 요기에 값 추가하기   -->
				<s:if test="name!=null">
					<script type="text/javascript">
						productsAuto("${name}", "${count}", "${size}");
					</script>
				</s:if>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" cols="40" name="q_content"><s:property
								value="q_content" /></textarea></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="q_tell" value="${q_tell }"></td>
				</tr>

				<tr align="center">
					<td colspan="2"><s:if test="r_no != 0">
							<input width="50" type="submit" value="수정 ">
							<input width="50" type="button" value="취 소"
								onclick="ReservViewAction(<s:property value='r_no'/>)">

						</s:if> <s:else>
							<input width="50" type="submit" value="예 약">
							<input type="reset" value="다시 작성">
							<s:if test="r_List == 1">
								<input type="button" value="취소" onclick="ReservActionToList()">
							</s:if>
							<s:else>
								<input type="button" value="취소" onclick="ReservAction()">
							</s:else>

						</s:else> &nbsp;&nbsp;&nbsp;</td>
				</tr>

			</table>
			</form>
		</center>
	</div>
</body>
</html>