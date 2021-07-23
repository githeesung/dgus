<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="contents_wrapper">
	<div class="layer">

		<div class="headline">접속정보</div>

		<div class="paddingbox" style="padding-top: 20px;">

			<form id="inputfrm">

				<div class="clearfix"
					style="padding: 20px 0px 20px 0px; text-align: right;">

					<span style="float: left; line-height: 43px; font-size: 20px;"
						class="b_txt mblock">관리자 접속정보</span> <a class="btn white"
						style="cursor: pointer;" onclick="updateUser()"><i
						class="fa fa-check"></i> 저장하기</a>

				</div>

				<table class="table_style2 view">
					<tr>
						<td class="b w1 pc-open" style="width: 10px;">아이디</td>
						<td colspan="">
							<div class="m-open-block m_title">아이디</div> 
							<input name="email" placeholder="아이디" type="text" class="txtbox h43" style="margin-left: 15px; width: 250px;" value="${inf.userEmail}"/>
						</td>
					</tr>
					<tr>
						<td class="b w1 pc-open" style="width: 150px;">비밀번호</td>
						<td colspan="">
							<div class="m-open-block m_title">비밀번호</div> <input name="password"
							placeholder="비밀번호를 입력하세요." type="password" class="txtbox h43"
							style="margin-left: 15px; width: 250px;" value="" /> <span
							style="font-size: 14px;">＊특수문자를 조합하여 8자 이상을 사용을 권장 합니다.</span>
						</td>
					</tr>
				</table>


			</form>


		</div>

	</div>
</div>

<script>
function updateUser() {
	var data = $("#inputfrm").serializeObject();	
	console.log(data);
	$.ajax({ 
        type : "post",
        contentType : "application/json; charset=utf-8",
        data : JSON.stringify(data),
        url : "/admin/settings",	
		success: function() { 
			alert("접속정보가 변경되었습니다.");
		},
        error : function(e1,e2,e3){
        	console.log("Status Code : " + e1.status + ", Error Code(Msg) : " + e1.responseJSON.errorCode + "(" + e1.responseJSON.errorMsg + ")");
            alert(e1.responseJSON.errorMsg); 
        } 
    });
}
</script>