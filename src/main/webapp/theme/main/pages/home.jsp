<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<!-- 팝업 광고 -->
<div class="popup" style="z-index: 100;">
    <div class="btn-close_popup"><i class="xi-close"></i></div>
    <a href="https://us02web.zoom.us/j/4937505797?pwd=U1RVekg1WllhT0tmOU41WXRMQzZDQT09"><img src="https://sugy12.cdn3.cafe24.com/pop.jpg" alt=""></a>
</div>

<!-- 메인 -->
<div id="body">
    <div class="cont" id="p01">  
	    <div class="c01">
	        <div class="symbol">
	            <img src="https://i.imgur.com/yPpk8Tg.gif" alt="">
	        </div>
	    </div>
	</div>  
	
	
</div>


<script>

//팝업 닫기
$('.btn-close_popup').on('click', function(e){
	$('.popup').css('display', 'none');
});
</script>
    



