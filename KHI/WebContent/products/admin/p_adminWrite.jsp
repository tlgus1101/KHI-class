<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="ko">
<head>
<script type="text/javascript">
		function validation() {
		
			var frm = document.products;
			
			if(frm.p_name.value == "") {
				alert("상품이름을 입력해주세요.");
				return false;
			} 
			
			else if(frm.p_type.value == "") {
				alert("상품타입을 입력해주세요.");
				return false;
			}
			
			else if(frm.p_price.value == "") {
				alert("가격을 입력해주세요.");
				return false;
			}
			
			else if(frm.p_org.value == "") {
				alert("원산지를 입력해주세요.");
				return false;			
			}
			
			else if(frm.p_mf.value == "") {
				alert("제조사를 입력해주세요.");
				return false;			
			} 
			
			else if(frm.p_frame.value == "") {
				alert("창틀폭을 입력해주세요.");
				return false;			
			} 
			
			else if(frm.p_sash.value == "") {
				alert("유리적용을 입력해주세요.");
				return false;			
			} 
			
			else if(frm.p_detail.value == "") {
				alert("상세내용이 없다면 '.'를 입력해주세요.");
				return false;			
			} 
			
			else if(frm.p_quan.value == "") {
				alert("수량을 입력해주세요.");
				return false;			
			} 
			
			else if(frm.p_option.value == "") {
				alert("판매정보 입력해주세요.");
				return false;			
			} 
			
			else if(frm.p_image.value == "") {
				alert("이미지를 입력해주세요.");
				return false;			
			} 
			
			return true;
		}
	</script>
<title>재고관리</title>
</head>


<body>
<div id="middleArea" align="center">
			<center>
			
			<aside id="contentInfoCon" class="area clearfix">
			<h3 class="content-tit">　　재고등록　　</h3>
			
			<div class="location">
				<ul>
					<li><img
						src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
					<li>재고등록　　</li>
				</ul>
			</div>
			</aside>
			
			<script>
				type="text/javascript">
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
			
			</center>
	<center>

		<span style="line-height:250%">
		<s:if test="resultClass == null">
			<form name="products" action="p_adminWrite.action" method="post"
				enctype="multipart/form-data" onsubmit="return validation">
		</s:if>

		<s:else>
			<form name="products" action="p_adminModify.action" method="post"
				enctype="multipart/form-data" onsubmit="return validation">
				<s:hidden name="p_no" value="%{resultClass.p_no}" />
				<s:hidden name="currentPage" value="%{currentPage}" />
				<s:hidden name="p_image" value="%{resultClass.p_image}" />
		</s:else>

		<table width="600" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="right" colspan="2"><font color="#FF0000">*</font>는
					필수 입력사항입니다.</td>
			</tr>

			<tr>
				<td width="200"><font color="#FF0000">*</font><b> 상품이름</b></td>
				<td width="500"><s:textfield name="p_name" theme="simple"
						value="%{resultClass.p_name}" cssStyle="width:370px"
						maxlength="150" /></td>
			
			</tr>
			
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>

			<tr>
				<td><font color="#FF0000">*</font> 상품종류</td>
				<td><select name="p_type">
						<option value="1">발코니</option>
						<option value="2">내창</option>
						<option value="3">악세서리</option>
				</select></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>

			<tr>
				<td><font color="#FF0000">*</font> 가격</td>
				<td><s:textfield name="p_price" theme="simple"
						value="%{resultClass.p_price}" cssStyle="width:100px"
						maxlength="100" /></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>

			<tr>
				<td><font color="#FF0000">*</font> 원산지</td>
				<td><s:textfield name="p_org" theme="simple"
						value="%{resultClass.p_org}" cssStyle="width:100px"
						maxlength="100" /></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>

			<tr>
				<td><font color="#FF0000">*</font> 제조사</td>
				<td><s:textfield name="p_mf" theme="simple"
						value="%{resultClass.p_mf}" cssStyle="width:100px" maxlength="100" />
				</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>

			<tr>
				<td><font color="#FF0000"></font> 창틀폭</td>
				<td><s:textfield name="p_frame" theme="simple"
						value="%{resultClass.p_frame}" cssStyle="width:100px"
						maxlength="100" /></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>

			<tr>
				<td><font color="#FF0000"></font>유리적용</td>
				<td><s:textfield name="p_sash" theme="simple"
						value="%{resultClass.p_sash}" cssStyle="width:100px"
						maxlength="100" /></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>


			<tr>
				<td><font color="#FF0000"></font> 내용</td>
				<td><s:textarea name="p_detail" theme="simple"
						value="%{resultClass.p_detail}" cols="50" rows="10" /></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>

			<tr>
				<td><font color="#FF0000">*</font> 수량</td>
				<td><s:textfield name="p_quan" theme="simple"
						value="%{resultClass.p_quan}" cssStyle="width:100px"
						maxlength="100" /></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>

			<tr>
				<td><font color="#FF0000">*</font> 판매정보</td>
				<td><select name="p_option">
						<option value="1">판매중</option>
						<option value="2">재고없음</option>
						<option value="0">판매종료</option>
				</select></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>

			<tr>
				<td bgcolor="#F4F4F4"><font color="#FF0000">* </font>첨부파일</td>
				<td bgcolor="#FFFFFF"><s:file name="upload" theme="simple" /> <s:if
						test="resultClass.p_image != NULL">
		&nbsp; * <s:property value="resultClass.p_image" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
	</s:if></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>

			<tr>
				<td height="10" colspan="2"></td>
			</tr>


			<tr>
				<td align="right" colspan="2"><input name="reset" type="reset"
					value="다시작성" class="inputb"> <input name="submit"
						type="submit" value="등록" class="inputb"> <input
							name="list" type="button" value="목록" class="inputb"
							onClick="javascript:location.href='p_adminList.action?currentPage=<s:property value="currentPage" />'"></td>
			</tr>



		</table>
		</form>
		</span>
		</center>
		</div>
</body>
</html>