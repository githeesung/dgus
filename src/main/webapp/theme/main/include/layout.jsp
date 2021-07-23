<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="RESOURCES_VER"><spring:eval expression="@siteinfo['app.resource.ver']"></spring:eval></c:set>

<!DOCTYPE html>
<html>
<head>
    
    <meta charset="UTF-8"> 
	<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width"/> 
	<meta name="author" content="">
	<meta name="description" content="제 36회 2020년 대구대학교 시각디자인학과 졸업전시회">
	<meta name="keywords" content="">
	<title>대구대학교 시각디자인학과 졸업전시회</title>
	
	<link rel="shortcut icon" href="/theme_main/img/logo.png" type="image/x-icon"/> 
	
	<!-- CSS -->
	<link rel="stylesheet" href="/theme_main/css/reset.css">
	<link rel="stylesheet" href="/theme_main/css/style.css">
	<link rel="stylesheet" href="/theme_main/css/custom.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	
	
	<!-- JS -->
	<script src="/theme_main/js/jquery-3.3.1.min.js"></script>
	<script src="/theme_main/js/custom.js"></script>
	<script src="/theme_main/js/canvas.js"></script>
	<!-- xeicon -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	
	
	<style>
	.clearfix:after {display: block;visibility: hidden;height: 0;font-size: 0;clear: both; content: '';}
	</style>
</head>  
<body>
	
	<div id="wrap">
		
		<!-- 오버레이 처리 -->
	    <div id="overlay"></div>
	
	    <!-- 사이드바 -->
	    <div id="sidebar">
		    <div class="cont">
		    	<div class="sidebar">
			        <div class="nav">
			            <div class="menu menu_intro"><a href="/intro">학과소개</a></div>
			            <div class="menu menu_greetings"><a href="/greetings/1">인사말</a></div>
			            <div class="menu menu_display"><a href="/display">전시소개</a></div>
			            <div class="menu menu_works"><a href="/works">졸업작품</a></div>
			            <div class="menu menu_visitors"><a href="/visitors">방명록</a></div>
			        </div>
			    </div>
			</div>
		</div>
	    
	    <script>
		    $(function(){
		        // 초기화
		        $('#footer_service-wrap').load("/html/layout/footer_service.html");
		
		        // 닫기 버튼 클릭시 사이드바 제거
		        $('#btn-close_sidebar').on('click', function(){
		            $('#overlay').removeClass('active');
		            $('.sidebar').removeClass('active');
		        });
		
		        // 오버레이 클릭시 사이드바 제거
		        $('#overlay').on('click', function(){
		            if($('.sidebar').hasClass('active')){
		                $('#overlay').removeClass('active');
		                $('.sidebar').removeClass('active');
		            }
		        });
		    });
		</script>
		
		<!-- 헤더 -->
		<div id="header">
			<div class="cont">
			    <div class="header">
			        <div class="logo">
			            <a href="/">
			                <div class="img">
			                    <img src="/theme_main/img/logo.png" alt="">
			                </div>
			                <div class="title">
							    <div class="ko">제 36회 2020 대구대학교<br>시각디자인학과 졸업전시회</div>
							    <div class="en">Visual communication design dept. Daegu University<br>Graduate Exbition</div>
							</div>
			            </a>
			        </div>
			        <div class="nav">
			            <div class="menu menu_intro"><a href="/intro">학과소개</a></div>
			            <div class="menu menu_greetings"><a href="/greetings/1">인사말</a></div>
			            <div class="menu menu_display"><a href="/display">전시소개</a></div>
			            <div class="menu menu_works"><a href="/works">졸업작품</a></div>
			            <div class="menu menu_visitors"><a href="/visitors">방명록</a></div>
			        </div>
			        <div class="btn-sidebar"><i class="xi-bars"></i></div>
			    </div>
			</div>
		</div>
	    <script>
		    $(function () {
		        $('.btn-sidebar').on('click', openSidebar);
		    });
		    
		    // 사이드바 오픈
		    function openSidebar(){
		        $('#overlay').addClass('full');
		        $('#overlay').addClass('active');
		        $('.sidebar').addClass('active');
		    }
		</script>
	
	
	</div>
	
	
	<tiles:insertAttribute name="wrap_content" />
	
</body>
</html>  