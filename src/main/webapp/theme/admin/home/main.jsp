<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<script>
$(".sub_navi_wrapper").detach();
$(".righttopnav").detach(); 
$("body, html").css("background","#fff"); 
</script>  

<style>
.userProcessLayer {  
	
}
.userProcessLayer .title {
	margin: 0px 0px 70px;
	font-size: 26px;
	font-weight: 900;
	font-stretch: normal;
	font-style: normal;
	line-height: 1.54;
	letter-spacing: normal;
	text-align: center;
	color: #343339;
}
.userProcessLayer .fname {
	color: #343339;
	font-size: 14px;
	line-height: 18px;
	margin-bottom: 6px;
}
.userProcessLayer .fput {
	display: block;
	width: 100%;
	height: 54px;
	padding: 14px 15px 14px 15px;
	border-radius: 4px;
	border: solid 1px #ebebeb;
	background-color: #ffffff;
	box-sizing: border-box;
	font-size: 14px;
	font-weight: 500;
	line-height: 1.54;    
	color: #343339;
/* 	margin-bottom: 16px; */
}
.userProcessLayer .fput::placeholder {font-size: 14px;}
.userProcessLayer .fselect {
	display: block;
	width: 100%;
	height: 48px;
	padding: 14px 15px 14px 15px;
	border-radius: 4px;
	border: solid 1px #ebebeb;
	background-color: #ffffff;
	box-sizing: border-box;
	font-size: 13px;
	font-weight: 500;
	line-height: 1.54;    
	color: #343339;
/* 	margin-bottom: 16px; */
}
.userProcessLayer .fselect option:first {
	color: #cdcdcd;
}
.userProcessLayer .fbtns {
	display: block;
	width: 100%;
	height: 48px;
	border-radius: 4px;
	border: solid 1px #ebebeb; 
	background-color: #ffffff;
	box-sizing: border-box;
	text-align: center;
}
.userProcessLayer .fbtns > a {
	float: left; width: 50%;
	font-size: 13px;
	font-weight: 500;
	line-height: 1.54;    
	color: #343339;
	line-height: 46px;
	box-sizing: border-box;
	border-radius: 4px;
}
.userProcessLayer .fbtns > a:first-child {border-right: 1px solid #ebebeb; border-radius: 4px 0px 0px 4px;}
.userProcessLayer .fbtns > a:nth-child(2) {border-radius: 0px 4px 4px 0px;}

.userProcessLayer .fbtns > a.sel {
	background: #ff7063;
	color: #fff;
}

.userProcessLayer .fimg {
	text-align: center;
	margin-bottom: 31px;
}
.userProcessLayer .fimg .img {
	display: inline-block;
	background-color: #f3f3f4;
	width: 80px; height: 80px;
	border-radius: 50%;
	background-image: url('/theme_mall/img/ic-plus-grey-24.png');
	background-repeat: no-repeat;
	background-position: center;
}

.ferr {
	text-align: right;
	color: #ff7063;	
	margin: 0px 0px 20px 0px;
}
.ferr > span {display: inline-block; margin-top: 6px; font-size: 12px; line-height: 1.5;}
.fput.err {
	border: solid 1px #ff7063;
	background-color: #fff4f2;
}

.fput_wapper {
	position: relative;
}
.fput_wapper .fput {
	
}
.fput_wapper .txt {
	font-size: 13px;
	position: absolute;
	top: 0; bottom: 0; line-height: 24px; height: 24px;
	right: 15px; margin: auto; font-weight: 500;
}

.userProcessLayer .fput.nomargin {
	margin: 0px;
}
.userProcessLayer .fput::placeholder {
	color: #cdcdcd;
	font-size: 13px;
	font-weight: 500;
	line-height: 1.54;
}
.userProcessLayer .fsub {
	margin-top: 12px;
	font-size: 12px;
	line-height: 1.5;
	letter-spacing: normal;
	text-align: right;
	color: #cdcdcd;
	margin-bottom: 60px;
}
.userProcessLayer .fsub > * {
	font-size: 12px;
	line-height: 1.5;
	letter-spacing: normal;
	color: #cdcdcd;
}
.userProcessLayer .fsub2 {
	margin-top: 12px;
	text-align: center;
}
.userProcessLayer .fsub2 > a {
	font-size: 12px;
	line-height: 1.5;
	letter-spacing: normal;
	color: #ff7063;
	text-decoration: underline;
}
.btn {
	display: block;  
	height: 60px;
	margin: 30px 0px 8px 0px;
	border-radius: 4px;
	box-sizing: border-box;
	line-height: 60px;
	font-size: 16px; font-weight: 500;
	text-align: center;  
	position: relative;
	font-weight: 800;
}
.btn.login {
	background: #324c98;
	color: #fff;
}
</style>



<div class="vcenterbox">
	<div class="userProcessLayer" style="width: 400px; margin: 0px auto;">
		<h1 class="title">로그인</h1>
		<form id="signinFrm">
			<div class="fname">아이디</div>
			<input class="fput" type="text" name="email" placeholder="ID"/>
			<div class="ferr email"></div>
			<div class="fname" style="margin-top: 16px;">비밀번호</div>
			<input class="fput nomargin" type="password" name="password" placeholder="PASSWORD"/>
			<div class="ferr password"></div>
			<div>
				<a class="btn login" id="signinAction">로그인</a>
			</div>
			
		</form>
	</div>
</div>
<script>
$("#signinAction").click(function(){
	var data = $("#signinFrm").serializeObject();	
	console.log(data);
	
	var isGo = true;  
	
	data.email=data.email.trim();
	data.password=data.password.trim();
	
	if(!check.isNotNull(data.email)) {
		$(".fput[name=email]").addClass("err");
		$(".ferr.email").html('<span>아이디를 입력하세요.</span>');
		isGo = false;
	}else{
		$(".fput[name=email]").removeClass("err");
		$(".ferr.email").html('');
	}
	
	if(!check.isNotNull(data.password)) { 
		$(".fput[name=password]").addClass("err");
		$(".ferr.password").html('<span>비밀번호를 입력하세요.</span>');
		$(".ferr.password").css("margin-bottom", "20px");
		isGo = false;
	}else{
		$(".fput[name=password]").removeClass("err");
		$(".ferr.password").html('');
	}
	
	
	if(isGo) {
		$.ajax({ 
	        type : "post",
	        dataType : "json",
	        contentType : "application/json; charset=utf-8",
	        data : JSON.stringify(data),
	        url : "/api/account/signin",	
			success: function(res, status, xhr) { 
				location.href = '/admin/pg/profile/list';
			},
	        error : function(e1,e2,e3){
	        	console.log("Status Code : " + e1.status + ", Error Code(Msg) : " + e1.responseJSON.errorCode + "(" + e1.responseJSON.errorMsg + ")");
	            alert(e1.responseJSON.errorMsg); 
	        } 
	    });
	}
});
</script>


<!-- 

<form id="test_login" class="frm">  
	<h1>로그인</h1>
	<p class="pp">[POST] /api/account/signin</p>
	<div>
		email : <input type="text" name="email" placeholder="Email" value="qlcskfgml78@naver.com"/><br/>
		password : <input type="password" name="password" placeholder="Password" value="1234"/><br/>
		<div class="notice">
			<strong>성공(Response header data)</strong><br/>
			Authorization: JWT
		</div><br/>  
		<a class="btn" onclick="signin()">로그인</a><br/>
	</div>
</form>
<script>
function signin() {
	var data = $("#test_login").serializeObject();	
	console.log(data);
	$.ajax({ 
        type : "post",
        dataType : "json",
        contentType : "application/json; charset=utf-8",
        data : JSON.stringify(data),
        url : "/api/account/signin",	
		success: function(res, status, xhr) { 
			location.href = '/admin/pg/profile/list';
		},
        error : function(e1,e2,e3){
        	console.log("Status Code : " + e1.status + ", Error Code(Msg) : " + e1.responseJSON.errorCode + "(" + e1.responseJSON.errorMsg + ")");
            alert(e1.responseJSON.errorMsg); 
        } 
    });
}

</script> -->




	




