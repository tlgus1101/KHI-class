<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html lang="ko">
<head>
<title>시공사례</title>
</head>
<body>
	<%-- <style>
  table {
    width: 30%;
    border: 1px solid #444444;
  }
  tr, td {
    border: 1px solid #444444;
  }
</style> --%>
	<center>
		<div id="middleArea" align="center">
			<center>

				<aside id="contentInfoCon" class="area clearfix">
				<h3 class="content-tit">　　시공현장 작성　　</h3>

				<div class="location">
					<ul>
						<li><img
							src="http://hgwindow.co.kr/images/icon/location_home.gif" alt="">HOME</li>
						<li>시공현장</li>
					</ul>
				</div>
				</aside>
			</center>
			<center>

				<span style="line-height: 250%"> <s:if
						test="resultClass == NULL">
						<form action="winWriteAction.action" method="post"
							enctype="multipart/form-data">

							<s:if test="v_num != 0">
								<s:hidden name="v_num" value="%{v_num}" />
								<s:hidden name="v_date" value="%{v_date}" />
							</s:if>
					</s:if> <s:else>
						<form action="winModify.action" method="post"
							enctype="multipart/form-data">
							<s:hidden name="v_num" value="%{resultClass.v_num}" />
							<s:hidden name="currentPage" value="%{currentPage}" />
							<s:hidden name="old_file" value="%{resultClass.v_imagesv}" />
					</s:else>


					<table width="600" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="right" colspan="2"><font color="#FF0000">*</font>는
								필수 입력 사항입니다.</td>
						</tr>

						<tr bgcolor="#777777">
							<td height="1" colspan="2"></td>
						</tr>


						<tr>
							<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 장소</td>
							<td bgcolor="#FFFFFF"><s:if test="resultClass != NULL">
									<s:textarea name="v_location" theme="simple"
										value="%{resultClass.v_location}" cols="50" rows="0" />
								</s:if> <s:else>
									<s:textarea name="v_location" theme="simple"
										value="%{v_location}" cols="50" rows="0" />
								</s:else></td>
						</tr>
						<tr>
							<td>예약 날짜</td>
							<td><input name="q_dateStr" type="date" value="${q_dateStr}"></td>
						</tr>
						<tr>
							<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 내용</td>
							<td bgcolor="#FFFFFF"><s:textarea name="v_content"
									theme="simple" value="%{resultClass.v_content}" cols="50"
									rows="40" /></td>
						</tr>

						<tr bgcolor="#777777">
							<td height="1" colspan="2"></td>
						</tr>


						<tr>
							<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 옵션</td>
							<td bgcolor="#FFFFFF"><select name="v_option">
									<s:if test="resultClass != NULL">
										<option value="1">부분</option>
										<option value="2">전체</option>
									</s:if>
									<s:else>
										<s:if test="v_option == 1">
											<option value="1" selected="selected">부분</option>
											<option value="2">전체</option>
										</s:if>
										<s:else>
											<option value="1">부분</option>
											<option value="2" selected="selected">전체</option>
										</s:else>
									</s:else>
							</select></td>
						</tr>

						<tr bgcolor="#777777">
							<td height="1" colspan="2"></td>
						</tr>

						<tr>
							<td bgcolor="#F4F4F4">이미지</td>
							<td bgcolor="#FFFFFF"><s:file name="upload" theme="simple" />
								<s:if test="resultClass.v_image != null">
					 * <s:property value="resultClass.v_image" />파일이 등록 되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
					</s:if>

								<tr bgcolor="#777777">
									<td height="1" colspan="2"></td>
								</tr>




								<tr>
									<td align="right" colspan="2"><input name="submit"
										type="submit" value="작성완료" class="inputb"> <input
											name="list" type="button" value="목록" class="inputb"
											onClick="javascript:location.href='adminList.action?currentPage=<s:property value="currentPage" />'"></input>

									</input></td>

								</tr>
					</table>
					</form>
				</span>
			</center>
		</div>
	</center>
</body>
</html>