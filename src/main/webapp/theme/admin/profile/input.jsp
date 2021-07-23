<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<style>
#inputfrm .btn.blue2 {
	font-size: 12px;
	width: 170px !important;  
}
#inputfrm .btn.blue2 i {font-size: 12px;}
</style>

<div class="contents_wrapper">
    <div class="layer">
        <div class="headline">학생 프로필 등록</div>
        <div class="paddingbox">
        <!-- SSS -->
        <form id="inputfrm">
        
        	<c:if test='${info.idx!=null}'>
        		<input type="hidden" name="idx" value="${info.idx}"/>
        	</c:if> 
            
            <div style="text-align: right; padding-bottom: 15px;" class="clearfix">
                <span style="float: left;line-height: 43px;" class="b_txt">학생 프로필 등록 </span>
                <a class="btn blue" onclick="uploadProfile()" style="cursor: pointer;"><i class="fa fa-check"></i> 저장</a>
                <a class="btn" href="/admin/pg/profile/list"><i class="fa fa-ban"></i> 취소</a>
            </div>

            <div>
				
                <div class="frm_style bd clearfix">
                    <div class="r tit"><div class="desc_name">이름(한글명)</div></div>
                    <div class="r cont">
                        <input class="txtbox" type="text" name="name" style="width: 100%;" placeholder="150자 이내" value="${info.name}"/>
                    </div>
                </div>	
                <div class="frm_style bd clearfix">
                    <div class="r tit"><div class="desc_name">이름(영문명)</div></div>
                    <div class="r cont">
                        <input class="txtbox" type="text" name="nameEng" style="width: 100%;" placeholder="150자 이내" value="${info.nameEng}"/>
                    </div>
                </div>	
                <div class="frm_style bd clearfix">
                	<div class="r tit"><div class="desc_name">학생 프로필</div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="profile"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_profile" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_profile!=null&&info.img_profile!=""}'>
									<img src="${info.img_profile}" alt="">
								</c:if>
							</span>
							<input type="hidden" name="img_profile" value="${info.img_profile}"/>
						</div>
					</div>
				</div>	
                <div class="frm_style bd clearfix">
                    <div class="r tit"><div class="desc_name">휴대폰번호</div></div>
                    <div class="r cont">
                        <input class="txtbox" type="text" name="phonenm" style="width: 100%;" placeholder="150자 이내" value="${info.phonenm}"/>
                    </div>
                </div>	
                <div class="frm_style bd clearfix">
                    <div class="r tit"><div class="desc_name">이메일주소</div></div>
                    <div class="r cont">
                        <input class="txtbox" type="text" name="email" style="width: 100%;" placeholder="150자 이내" value="${info.email}"/>
                    </div>
                </div>	
                <div class="frm_style bd clearfix">
                    <div class="r tit"><div class="desc_name">제목</div></div>
                    <div class="r cont">
                        <input class="txtbox" type="text" name="title" style="width: 100%;" placeholder="150자 이내" value="${info.title}"/>
                    </div>
                </div>	
               	<div class="frm_style bd clearfix">
                    <div class="r tit"><div class="desc_name">수상경력</div></div>
                    <div class="r cont">
                        <input class="txtbox" type="text" name="awardList" style="width: 100%;" placeholder="복수 수상경력이 있을 시 :(콜론)으로 구분해서 입력" value="${info.awardList}"/>
                    </div>
                </div>	
          		<div class="frm_style bd clearfix">
                    <div class="r tit"><div class="desc_name">교내활동</div></div>
                    <div class="r cont">
                        <input class="txtbox" type="text" name="activeIn" style="width: 100%;" placeholder="복수 활동 있을 시 :(콜론)으로 구분해서 입력" value="${info.activeIn}"/>
                    </div>
                </div>	
                <div class="frm_style bd clearfix">
                    <div class="r tit"><div class="desc_name">교외활동</div></div>
                    <div class="r cont">
                        <input class="txtbox" type="text" name="activeOut" style="width: 100%;" placeholder="복수 활동 있을 시 :(콜론)으로 구분해서 입력" value="${info.activeOut}"/>
                    </div>
                </div>	
                <div class="frm_style bd clearfix">
                    <div class="r tit"><div class="desc_name">자격증</div></div>
                    <div class="r cont">
                        <input class="txtbox" type="text" name="certificate" style="width: 100%;" placeholder="복수 자격 있을 시 :(콜론)으로 구분해서 입력" value="${info.certificate}"/>
                    </div>
                </div>	
                
                <!-- 1. 총매체 10개
				Branding, , Poster, Character, Infographic, Edit, Package, UIUX, Kiosk, Video

				2. 이미지, gif, mp4(영상매체) 다 들어가요. -->
                
                <style>
                .frm_style .btn.blue2 {cursor: pointer; vertical-align: middle;}
                .frm_style .btn.blue2 .fa-file {font-size: 15px;}
                .img_put {margin-top: 10px; width: 100%; border: solid 1px #ff7063 !important; background-color: #fff4f2; font-size: 12px !important;}
                </style>    
                <script>
                function openPicFd() {
                	$("input.img_put").attr("type", "text"); 
                }
                
                $(document).ready(function(){
                	//openPicFd(); 
                });
                
                </script>
                  
                <div class="frm_style bd clearfix">
                	<div class="r tit"><div class="desc_name">Branding<br/><a onclick="openPicFd()" class="btn blue2 small" style="width: 120px !important">사진필드열기</a></div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="branding"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_branding" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_branding!=null&&info.img_branding!=""}'>
									<c:forEach items='${info.img_branding.split(",")}' var="item" varStatus="idx">	
										<img style="max-width: 400px;" src="${item}" alt="">
									</c:forEach>
								</c:if>
							</span>
							
						</div>
						
						<div>
							<input type="hidden" class="txtbox img_put" name="img_branding" value="${info.img_branding}" placeholder="복수 사진 있을 시 ,(콤마)로 구분해서 입력"/>
						</div>
						
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="video_branding" style="width: 100%;" placeholder="복수 영상 있을 시 ,(콤마)로 구분해서 입력" value="${info.video_branding}"/>
						</div>
						
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="txt_branding" style="width: 100%;" placeholder="branding tag's description" value="${info.txt_branding}"/>
						</div>
					</div>
				</div>	
                
				<div class="frm_style bd clearfix">
					<div class="r tit"><div class="desc_name">Graphic</div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="graphic"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_graphic" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_graphic!=null&&info.img_graphic!=""}'>
									<c:forEach items='${info.img_graphic.split(",")}' var="item" varStatus="idx">	
										<img style="max-width: 400px;" src="${item}" alt="">
									</c:forEach>
								</c:if>
							</span>
<%-- 							<input type="hidden" name="img_graphic" value="${info.img_graphic}"/> --%>
						</div>
						<div>
							<input type="hidden" class="txtbox img_put" name="img_graphic" value="${info.img_graphic}" placeholder="복수 사진 있을 시 ,(콤마)로 구분해서 입력"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="video_graphic" style="width: 100%;" placeholder="복수 영상 있을 시 ,(콤마)로 구분해서 입력" value="${info.video_graphic}"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="txt_graphic" style="width: 100%;" placeholder="graphic tag's description" value="${info.txt_graphic}"/>
						</div>
					</div>
				</div>	
                
                <!-- <div class="frm_style bd clearfix"> -->
				
				<div class="frm_style bd clearfix">
					<div class="r tit"><div class="desc_name">Poster</div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="poster"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_poster" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_poster!=null&&info.img_poster!=""}'>
									<c:forEach items='${info.img_poster.split(",")}' var="item" varStatus="idx">	
										<img style="max-width: 400px;" src="${item}" alt="">
									</c:forEach>
								</c:if>
							</span>
<%-- 							<input type="hidden" name="img_poster" value="${info.img_poster}"/> --%>
						</div>
						<div>
							<input type="hidden" class="txtbox img_put" name="img_poster" value="${info.img_poster}" placeholder="복수 사진 있을 시 ,(콤마)로 구분해서 입력"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="video_poster" style="width: 100%;" placeholder="복수 영상 있을 시 ,(콤마)로 구분해서 입력" value="${info.video_poster}"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="txt_poster" style="width: 100%;" placeholder="poster tag's description" value="${info.txt_poster}"/>
						</div>
					</div>
				</div>	
				<div class="frm_style bd clearfix">
					<div class="r tit"><div class="desc_name">Character</div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="character"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_character" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_character!=null&&info.img_character!=""}'>
									<c:forEach items='${info.img_character.split(",")}' var="item" varStatus="idx">	
										<img style="max-width: 400px;" src="${item}" alt="">
									</c:forEach>
								</c:if>
							</span>
<%-- 							<input type="hidden" name="img_character" value="${info.img_character}"/> --%>
						</div>
						<div>
							<input type="hidden" class="txtbox img_put" name="img_character" value="${info.img_character}" placeholder="복수 사진 있을 시 ,(콤마)로 구분해서 입력"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="video_character" style="width: 100%;" placeholder="복수 영상 있을 시 ,(콤마)로 구분해서 입력" value="${info.video_character}"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="txt_character" style="width: 100%;" placeholder="character tag's description" value="${info.txt_character}"/>
						</div>
					</div>
				</div>	
				<div class="frm_style bd clearfix">
					<div class="r tit"><div class="desc_name">Infographic</div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="infographic"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_infographic" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_infographic!=null&&info.img_infographic!=""}'>
									<c:forEach items='${info.img_infographic.split(",")}' var="item" varStatus="idx">	
										<img style="max-width: 400px;" src="${item}" alt="">
									</c:forEach>
								</c:if>
							</span>
<%-- 							<input type="hidden" name="img_infographic" value="${info.img_infographic}"/> --%>
						</div>
						<div>
							<input type="hidden" class="txtbox img_put" name="img_infographic" value="${info.img_infographic}" placeholder="복수 사진 있을 시 ,(콤마)로 구분해서 입력"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="video_infographic" style="width: 100%;" placeholder="복수 영상 있을 시 ,(콤마)로 구분해서 입력" value="${info.video_infographic}"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="txt_infographic" style="width: 100%;" placeholder="infographic tag's description" value="${info.txt_infographic}"/>
						</div>
					</div>
				</div>	
				<div class="frm_style bd clearfix">
					<div class="r tit"><div class="desc_name">Edit</div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="edit"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_edit" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_edit!=null&&info.img_edit!=""}'>
									<c:forEach items='${info.img_edit.split(",")}' var="item" varStatus="idx">	
										<img style="max-width: 400px;" src="${item}" alt="">
									</c:forEach>
								</c:if>
							</span>
<%-- 							<input type="hidden" name="img_edit" value="${info.img_edit}"/> --%>
						</div>
						<div>
							<input type="hidden" class="txtbox img_put" name="img_edit" value="${info.img_edit}" placeholder="복수 사진 있을 시 ,(콤마)로 구분해서 입력"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="video_edit" style="width: 100%;" placeholder="복수 영상 있을 시 ,(콤마)로 구분해서 입력" value="${info.video_edit}"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="txt_edit" style="width: 100%;" placeholder="edit tag's description" value="${info.txt_edit}"/>
						</div>
					</div>
				</div>	
				<div class="frm_style bd clearfix">
					<div class="r tit"><div class="desc_name">Package</div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="package"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_package" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_package!=null&&info.img_package!=""}'>
									<c:forEach items='${info.img_package.split(",")}' var="item" varStatus="idx">	
										<img style="max-width: 400px;" src="${item}" alt="">
									</c:forEach>
								</c:if>
							</span>
<%-- 							<input type="hidden" name="img_package" value="${info.img_package}"/> --%>
						</div>
						<div>
							<input type="hidden" class="txtbox img_put" name="img_package" value="${info.img_package}" placeholder="복수 사진 있을 시 ,(콤마)로 구분해서 입력"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="video_package" style="width: 100%;" placeholder="복수 영상 있을 시 ,(콤마)로 구분해서 입력" value="${info.video_package}"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="txt_package" style="width: 100%;" placeholder="package tag's description" value="${info.txt_package}"/>
						</div>
					</div>
				</div>	
				<div class="frm_style bd clearfix">
					<div class="r tit"><div class="desc_name">UIUX</div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="uiux"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_uiux" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_uiux!=null&&info.img_uiux!=""}'>
									<c:forEach items='${info.img_uiux.split(",")}' var="item" varStatus="idx">	
										<img style="max-width: 400px;" src="${item}" alt="">
									</c:forEach>
								</c:if>
							</span>
<%-- 							<input type="hidden" name="img_uiux" value="${info.img_uiux}"/> --%>
						</div>
						<div>
							<input type="hidden" class="txtbox img_put" name="img_uiux" value="${info.img_uiux}" placeholder="복수 사진 있을 시 ,(콤마)로 구분해서 입력"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="video_uiux" style="width: 100%;" placeholder="복수 영상 있을 시 ,(콤마)로 구분해서 입력" value="${info.video_uiux}"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="txt_uiux" style="width: 100%;" placeholder="uiux tag's description" value="${info.txt_uiux}"/>
						</div>
					</div>
				</div>	
				<div class="frm_style bd clearfix">
					<div class="r tit"><div class="desc_name">Kiosk</div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="kiosk"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_kioskg" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_kiosk!=null&&info.img_kiosk!=""}'>
									<c:forEach items='${info.img_kiosk.split(",")}' var="item" varStatus="idx">	
										<img style="max-width: 400px;" src="${item}" alt="">
									</c:forEach>
								</c:if>
							</span>
<%-- 							<input type="hidden" name="img_kiosk" value="${info.img_kiosk}"/> --%>
						</div>
						<div>
							<input type="hidden" class="txtbox img_put" name="img_kiosk" value="${info.img_kiosk}" placeholder="복수 사진 있을 시 ,(콤마)로 구분해서 입력"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="video_kiosk" style="width: 100%;" placeholder="복수 영상 있을 시 ,(콤마)로 구분해서 입력" value="${info.video_kiosk}"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="txt_kiosk" style="width: 100%;" placeholder="kiosk tag's description" value="${info.txt_kiosk}"/>
						</div>
					</div>
				</div>	
				<div class="frm_style bd clearfix">
					<div class="r tit"><div class="desc_name">Video</div></div>
					<div class="r cont">
						<div class="clearfix" style="margin-bottom: 10px;">
							<a style="width: 130px; float: left;" class="btn blue2 upload_btn_image" data-attr="video"><i class="fa fa-file"></i> 사진 선택(1MB 미만)</a>
							<span class="img_ment_video" style="float: right; width: calc(100% - 190px); line-height: 43px;">
								<c:if test='${info.img_video!=null&&info.img_video!=""}'>
									<c:forEach items='${info.img_video.split(",")}' var="item" varStatus="idx">	
										<img style="max-width: 400px;" src="${item}" alt="">
									</c:forEach>  
								</c:if>
							</span>
<%-- 							<input type="hidden" name="img_video" value="${info.img_video}"/> --%>
						</div>
						<div>
							<input type="hidden" class="txtbox img_put" name="img_video" value="${info.img_video}" placeholder="복수 사진 있을 시 ,(콤마)로 구분해서 입력"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="video_video" style="width: 100%;" placeholder="복수 영상 있을 시 ,(콤마)로 구분해서 입력" value="${info.video_video}"/>
						</div>
						<div style="margin-top: 10px;">
							<input class="txtbox" type="text" name="txt_video" style="width: 100%;" placeholder="video tag's description" value="${info.txt_video}"/>
						</div>
					</div>
				</div>	
                
                   
                
                           

                <div style="text-align: right;">
                    <a class="btn blue inputfrmsm" onclick="uploadProfile()" style="cursor:pointer;"><i class="fa fa-check"></i> 저장</a>
                    <a class="btn" href="/admin/pg/profile/list"><i class="fa fa-ban"></i> 취소</a>
                </div>

            </div>
            
            
        </form>
        <!-- EEE -->       
        </div>
    </div>
</div>	


<c:if test='${info.idx!=null}'>

	<script>
	function uploadProfile() {
		var data = $("#inputfrm").serializeObject();	
		$.ajax({ 
	        type : "post",
	        contentType : "application/json; charset=utf-8",
	        data : JSON.stringify(data),
	        url : "/api/profile",	           
	        success : function(data){
	            location.href="./${info.idx}";
	        }, 
	        error : function(e1,e2,e3){
	            console.log(e1);console.log(e2);console.log(e3);
	        } 
	    });
	}
	</script>

</c:if>
<c:if test='${info.idx==null}'>
	
	<script>
	function uploadProfile() {
		var data = $("#inputfrm").serializeObject();	
		$.ajax({ 
	        type : "post",
	        contentType : "application/json; charset=utf-8",
	        data : JSON.stringify(data),
	        url : "/api/profile",	           
	        success : function(data){
	            location.href="./list";
	        }, 
	        error : function(e1,e2,e3){
	            console.log(e1);console.log(e2);console.log(e3);
	        } 
	    });
	}
	</script>
	
</c:if>























<form id="filefrm" enctype="multipart/form-data" method="post" style="display: none !important;">
	<input type="file" multiple/>
	<input type="hidden" name="target"/>
</form>
<form id="filefrm2" enctype="multipart/form-data" method="post" style="display: none !important;">
	<input type="file" multiple/>
	<input type="hidden" name="target"/>
</form>

<input type="hidden" id="idx" value="${info.idx}"/>

<script>
$(document).ready(function(){
	
	$(".upload_btn_video").click(function(){
		$("#filefrm2 input[type=file]").click();
		var tmp = $(this).attr("data-attr");
		$("#filefrm2 input[type=hidden]").val(tmp);
	}); 
	$("#filefrm2 input[type=file]").change(function(){
		form = new FormData();
		for(var i=0;i<this.files.length;i++) {
			form.append('image'+i, this.files[i]); 
		}
		$.ajax({					
			xhr: function(){
				var xhr = new window.XMLHttpRequest();
				//Upload progress
				xhr.upload.addEventListener("progress", function(evt){
					if (evt.lengthComputable) {								
						var p = parseInt( (evt.loaded / evt.total * 100), 10)+"%";
						console.log("upload:"+p);
					}
				}, false);  
				//Download progress
				xhr.addEventListener("progress", function(evt){
					if (evt.lengthComputable) {	
						var d = parseInt( (evt.loaded / evt.total * 100), 10)+"%";
						console.log("download:"+d);
					} 
				}, false);
				return xhr;
			},  					
			url: '/api/files/upload',				
			//headers: { Authorization: IMGUR_CLIENT_ID },				
			type: 'POST',				
			data: form,				
			cache: false,					
			contentType: false, 					
			processData: false					
		}).always(function(data){
			var tmp = $("#filefrm2 input[type=hidden]").val();
			$("input[name=video_"+tmp+"]").val(data);
			$(".video_ment_"+tmp).html('');
			for ( var i in data ) {
				$(".video_ment_"+tmp).append(data[i]+'<br/>');
			}
		}); 
	});
	
	
	
	
	$(".upload_btn_image").click(function(){
		$("#filefrm input[type=file]").click();
		var tmp = $(this).attr("data-attr");
		$("#filefrm input[type=hidden]").val(tmp);
	});  
	$("#filefrm input[type=file]").change(function(){
		form = new FormData();
		var tmpValue = $("#idx").val();
		form.append('numb', tmpValue); 
		for(var i=0;i<this.files.length;i++) {
			form.append('image'+i, this.files[i]); 
		} 
		$.ajax({					
			xhr: function(){
				var xhr = new window.XMLHttpRequest();
				//Upload progress
				xhr.upload.addEventListener("progress", function(evt){
					if (evt.lengthComputable) {								
						var p = parseInt( (evt.loaded / evt.total * 100), 10)+"%";
						console.log("upload:"+p);
					}
				}, false);  
				//Download progress
				xhr.addEventListener("progress", function(evt){
					if (evt.lengthComputable) {	
						var d = parseInt( (evt.loaded / evt.total * 100), 10)+"%";
						console.log("download:"+d);
					} 
				}, false);
				return xhr;
			},  					
			url: '/api/files/upload',				
			//headers: { Authorization: IMGUR_CLIENT_ID },				
			type: 'POST',				
			data: form,				
			cache: false,					
			contentType: false, 					
			processData: false					
		}).always(function(data){
			var tmp = $("#filefrm input[type=hidden]").val();
			$("input[name=img_"+tmp+"]").val(data);
			$(".img_ment_"+tmp).html('');
			for ( var i in data ) {
				$(".img_ment_"+tmp).append('<img style="max-width: 400px; max-height: 400px;" src="http://localhost:8080'+data[i]+'"/>');
			}
			initSubNaviHeight(); 
		}); 
	});
	
	
	
	
});
</script>









