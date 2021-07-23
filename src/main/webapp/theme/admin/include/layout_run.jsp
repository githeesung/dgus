<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="RESOURCES_VER"><spring:eval expression="@siteinfo['app.resource.ver']"></spring:eval></c:set>

<!DOCTYPE html>
<html>
<head>
    
	<meta charset="UTF-8"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	
	<!-- 검색봇 차단 -->
	<meta name="robots" content="noindex">
	<meta name="googlebot" content="noindex">
	
	<title>대구대학교 시각디자인학과 졸업전시회</title> 
	
	<link rel="shortcut icon" href="/resources/favicon.ico" type="image/x-icon"/> 

	<!-- normalize -->
	<link type="text/css" rel="stylesheet" href="/theme_admin/normalize.css"/>
	
	<script type="text/javascript" src="/resources/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.form.js"></script>
	
	<!-- fontawesome -->
	<link rel="stylesheet" href="/resources/fontawesome/css/all.min.css"/>
    <script src="/resources/fontawesome/js/fontawesome.min.js"></script> 
    
	<script type="text/javascript" src="/resources/js/Chart.js"></script>
	
	<!-- global -->
	<link type="text/css" rel="stylesheet" href="/theme_admin/global.css"/>
	<script type="text/javascript" src="/theme_admin/global.js"></script>
	
</head>  
<body>
	<div id="global_navi"></div>
		
	<section id="wrapper">
		
		<header class="header clearfix" style="height: 68px;">
					
			<a href="/admin/pg/profile/list">
				
				<strong class="logo" style="font-size: 26px; font-weight: 800; line-height: 70px;">
					<img src="/theme_main/img/logo.png" style="width: 40px;"/>
					대구대학교 시각디자인학과 졸업전시회
				</strong>
			</a>
			
			<div class=" righttopnav pc-open" style="margin-top: 15px;">   
				
				<span class="bar" style="vertical-align: middle;">&nbsp;</span>
				<a href="javascript:signout()" class="b" style="vertical-align: middle;">Logout</a>
				<span class="bar" style="vertical-align: middle;">&nbsp;</span>
				<a href="/" class="b" style="vertical-align: middle;">Home</a>
				
			</div>
			<div class="m-open-block">
				<a class="ico" id="navi1"><i class="fa fa-bars"></i></a>
				<a class="ico none_hover" id="navi2"><i class="fa fa-ellipsis-h"></i></a>
			</div>
			
		</header>
		<script>
		function signout() {
			$.ajax({ 
		        type : "get",
		        contentType : "application/json; charset=utf-8",
		        url : "/api/account/signout",	
				success: function(res, status, xhr) { 
					location.href = '/admin';
				}
		    });
		}
		</script>	
		
		<!-- #####################################################################[컨테이너 시작] -->
		<section class="container clearfix">	
			
            <div class="sub_navi_wrapper">
				<div class="box" style="height: 100%;">
					<h2>Dashboard</h2>
					<ul class="sub_navi">
						
						<li><a href="/admin/pg/settings">접속정보</a></li>
						
						<li><a href="/admin/pg/guest_book/list">방명록 관리</a></li>
						
						
						<li><a href="/admin/pg/profile/list">학생프로필 관리</a></li>
						
					</ul>
				</div>
			</div>  
			
            <tiles:insertAttribute name="wrap_content" />
            
			
			<footer class="footer">
				Copyright ⓒ 대구대학교 시각디자인학과 졸업전시회 2020.All rights reserved.
			</footer>	
		</section>
		<!-- #####################################################################[컨테이너 끝] -->
	</section>
    
</body>
</html>  