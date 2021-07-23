<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div id="body">
	<div class="cont" id="p08">
		<div class="c00">
			<div class="search">
	            <input id="input-search" type="text" placeholder="학생 이름을 입력해주세요.">
	            <div class="btn-search">Search</div>
            </div>
            <div class="result">
            	<div class="btn-close_result"><i class="xi-close"></i></div>
                <div class="cont">
                    <div class="item-list" id="search_list_stud">
                        
                    </div>
                </div>
            </div>
		</div>
		
		
		<script>
            function loadStudents() {
            	
            	$.ajax({ 
                    type : "GET",
                    dataType : "json",
                    data : {
                        "page" : 1
                    },
                    url : "/api/profile",	           
                    success : function(data){           
                        var c = "";
                        var c2 = '';
                        console.log(data.list);
                        $("#search_list_stud").html('');
                        $(data.list).each(function(i,d){
                           
                            
                            c += '<div class="item">';
                            c += '<a href="/works/'+d.idx+'">';
                            c += '<img src="'+d.img_profile+'" alt="">';
                            c += '<div class="name">';
                            c += '<div class="ko">'+d.name+'</div>';
                            c += '<div class="en">'+d.nameEng+'</div>';
                            c += '</div>';
                            c += '</a>';
                            c += '</div>';
                            
                            c2 = '<div class="item"><a href="/works/'+d.idx+'">'+d.name+'</a></div>';
                            $("#search_list_stud").append(c2);
                         
                        });
                        $("#studentList").html(c);
                        
                        $('#input-search').focus(function(){
                            $('.result').addClass('active');
                            $('#overlay').addClass('active');
                        });

                        $('.btn-close_result').on('click', function(){
                            if($('.result').hasClass('active')){
                                $('.result').removeClass('active');
                                $('#overlay').removeClass('active');
                            }
                        });
                        
                        $("#input-search").keyup(function(key){
                            var str = $('#input-search').val();
                            var item;

                            if(str.length >= 3){
                                item = $(".result .item:contains('" + str + "')");
                                item.addClass('active');
                            }
                            else{
                                $(".result .item").removeClass('active');
                            }
                        });

                      	
                    }, 
                    error : function(e1,e2,e3){
                        console.log(e1);console.log(e2);console.log(e3);
                    } 
                });
            }
            loadStudents();
            </script>
		
		<div class="c01">
			
			<div class="title">${info.title}</div>
			<div class="profile">
				<div class="pf-img">
					<img src="${info.img_profile}" alt="">
				</div>
				<div class="pf-info">
					<div class="pi-name_ko">${info.name}</div>
					<div class="pi-name_en">${info.nameEng}</div>
					<div class="pi-email">${info.email}</div>
					<div class="pi-tel">${info.phonenm}</div>
				</div>
				<c:if test='${info.certificate!=null&&info.certificate!=""}'>
					<div class="item certify">
						<div class="item_tit">자격증</div>
						<div class="item_content">
							<c:forEach items='${info.certificate.split(":")}' var="item" varStatus="idx">	
								<div class="desc">${item}</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test='${info.activeOut!=null&&info.activeOut!=""}'>
					<div class="item act1">
						<div class="item_tit">교외활동</div>
						<div class="item_content">
							<c:forEach items='${info.activeOut.split(":")}' var="item" varStatus="idx">	
								<div class="desc">${item}</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
				<c:if test='${info.awardList!=null&&info.awardList!=""}'>
					<div class="item act2">
						<div class="item_tit">수상경력</div>
						<div class="item_content">
							<c:forEach items='${info.awardList.split(":")}' var="item" varStatus="idx">	
								<div class="desc">
									<span class="detail">${item.split("_")[0]}</span> 
									<span class="awards">${item.split("_")[1]}</span>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<div class="c02">
			<div class="tag-list">
			
				<!-- <div class="tag-item" id="tag-branding">
					<div class="tag_name">원본</div>
					<div class="tag_content" style="text-align: center;">
						<div class="tag_desc"></div>
						<img src="https://i.imgur.com/pvVCp6l.gif" alt="" style="width: auto; margin-left: auto; margin-right: auto;"/>			
						<img src="https://i.imgur.com/vpgUgUy.gif" alt="" style="width: auto; margin-left: auto; margin-right: auto;" />
					</div>
				</div>
				<div class="tag-item" id="tag-branding">
					<div class="tag_name">100%</div>
					<div class="tag_content">
						<div class="tag_desc"></div>
						<img src="https://i.imgur.com/pvVCp6l.gif" alt="" style="width: 100%;"/>			
						<img src="https://i.imgur.com/vpgUgUy.gif" alt="" style="width: 100%;" />
					</div>
				</div> -->
				  
				<c:if test='${info.img_branding!=null && info.img_branding!=""}'>
					<div class="tag-item" id="tag-branding">
						<div class="tag_name">Branding</div>
						<div class="tag_content">
							<div class="tag_desc">${info.txt_branding}</div>
							<c:forEach items='${info.img_branding.split(",")}' var="item" varStatus="idx">
								<img src="${item}" alt="">
							</c:forEach>
							<c:if test='${info.video_branding!=""}'>
								<c:forEach items='${info.video_branding.split(",")}' var="item" varStatus="idx">	
									<div class="tag_video">
										<iframe src="${item}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</c:if>
				
				<c:if test='${info.img_graphic!=null && info.img_graphic!=""}'>
					<div class="tag-item" id="tag-graphic">
						<div class="tag_name">Graphic</div>
						<div class="tag_content">
							<div class="tag_desc">${info.txt_graphic}</div>
							<c:forEach items='${info.img_graphic.split(",")}' var="item" varStatus="idx">	
								<img src="${item}" alt="">
							</c:forEach>
							<c:if test='${info.video_graphic!=""}'>
								<c:forEach items='${info.video_graphic.split(",")}' var="item" varStatus="idx">	
									<div class="tag_video">
										<iframe src="${item}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</c:if>
				
				<c:if test='${info.img_poster!=null && info.img_poster!=""}'>
					<div class="tag-item" id="tag-poster">
						<div class="tag_name">Poster</div>
						<div class="tag_content">
							<div class="tag_desc">${info.txt_poster}</div>
							<c:forEach items='${info.img_poster.split(",")}' var="item" varStatus="idx">	
								<img src="${item}" alt="">
							</c:forEach>
							<c:if test='${info.video_poster!=""}'>
								<c:forEach items='${info.video_poster.split(",")}' var="item" varStatus="idx">	
									<div class="tag_video">
										<iframe src="${item}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</c:if>
				
				<c:if test='${info.img_character!=null && info.img_character!=""}'>
					<div class="tag-item" id="tag-character">
						<div class="tag_name">Character</div>
						<div class="tag_content">
							<div class="tag_desc">${info.txt_character}</div>
							<c:forEach items='${info.img_character.split(",")}' var="item" varStatus="idx">	
								<img src="${item}" alt="">
							</c:forEach>
							<c:if test='${info.video_character!=""}'>
								<c:forEach items='${info.video_character.split(",")}' var="item" varStatus="idx">	
									<div class="tag_video">
										<iframe src="${item}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</c:if>
				
				<c:if test='${info.img_infographic!=null && info.img_infographic!="" || info.video_infographic!=null && info.video_infographic!=""}'>
					<div class="tag-item" id="tag-infographic">
						<div class="tag_name">Infographic</div>
						<div class="tag_content">
							<div class="tag_desc">${info.txt_infographic}</div>
							
							
							<c:set var="isN" value="false"></c:set>
							
							<c:if test="${info.idx == 39}">  
								
								<div style="overflow: hidden">
									<div style="width: calc(50% - 5px); float: left;">
										<a target="_blank" href="${info.img_infographic.split(",")[0]}"><img src="${info.img_infographic.split(",")[0]}" style="max-width: 100%; "></a>
									</div>
									<div style="width: calc(50% - 5px); float: right;">
										<a target="_blank" href="${info.img_infographic.split(",")[1]}"><img src="${info.img_infographic.split(",")[1]}" style="max-width: 100%; "></a>
									</div>
								</div>
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							
							<c:if test="${info.idx == 30}">  
								
								<div style="overflow: hidden">
									<div style="width: calc(50% - 5px); float: left;">
										<a target="_blank" href="${info.img_infographic.split(",")[0]}"><img src="${info.img_infographic.split(",")[0]}" style="max-width: 100%; "></a>
									</div>
									<div style="width: calc(50% - 5px); float: right;">
										<a target="_blank" href="${info.img_infographic.split(",")[1]}"><img src="${info.img_infographic.split(",")[1]}" style="max-width: 100%; "></a>
									</div>
								</div>
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							<c:if test="${isN == false}">
								<c:if test='${info.img_infographic!=null && info.img_infographic!=""}'>
									<c:forEach items='${info.img_infographic.split(",")}' var="item" varStatus="idx">	
										<img src="${item}" alt="">
									</c:forEach>
								</c:if>
								<c:if test='${info.video_infographic!=""}'>
									<c:forEach items='${info.video_infographic.split(",")}' var="item" varStatus="idx">	
										<div class="tag_video">
											<iframe src="${item}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
									</c:forEach>
								</c:if>
							</c:if>
							
						</div>
					</div>
				</c:if>
				
				<c:if test='${info.img_edit!=null && info.img_edit!="" || info.video_edit!=null && info.video_edit!=""}'>
					<div class="tag-item" id="tag-edit">
						<div class="tag_name">Edit</div>
						<div class="tag_content">
							<div class="tag_desc">${info.txt_edit}</div>
							
							
							<c:set var="isN" value="false"></c:set>
							
							
							<c:if test="${info.idx == 29}">
								
								<img src="${info.img_edit.split(",")[0]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_edit.split(",")[0]}?autoplay=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								<img src="${info.img_edit.split(",")[1]}" alt="">   
								  
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							
							<c:if test="${isN == false}">
								<c:if test='${info.img_edit!=null && info.img_edit!=""}'>
									<c:forEach items='${info.img_edit.split(",")}' var="item" varStatus="idx">	
										<img src="${item}" alt="">
									</c:forEach>
								</c:if>
								<c:if test='${info.video_edit!=""}'>
									<c:forEach items='${info.video_edit.split(",")}' var="item" varStatus="idx">	
										<div class="tag_video">
											<iframe src="${item}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
									</c:forEach>
								</c:if>
							</c:if>
							
							
							
							
							
						</div>
					</div>
				</c:if>
				
				<c:if test='${info.img_package!=null && info.img_package!=""}'>
					<div class="tag-item" id="tag-package">
						<div class="tag_name">Package</div>
						<div class="tag_content">
							<div class="tag_desc">${info.txt_package}</div>
							<c:forEach items='${info.img_package.split(",")}' var="item" varStatus="idx">	
								<img src="${item}" alt="">
							</c:forEach>
							<c:if test='${info.video_package!=""}'>
								<c:forEach items='${info.video_package.split(",")}' var="item" varStatus="idx">	
									<div class="tag_video">
										<iframe src="${item}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</c:if>
				
				<c:if test='${info.img_uiux!=null && info.img_uiux!=""}'>
					<div class="tag-item" id="tag-uiux">
						<div class="tag_name">UIUX</div>
						<div class="tag_content">
							<div class="tag_desc">${info.txt_uiux}</div>
							
							<c:set var="isN" value="false"></c:set>
							
							
							<c:if test="${info.idx == 6}">
								
								<img src="${info.img_uiux.split(",")[0]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[0]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								<img src="${info.img_uiux.split(",")[1]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[1]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								<img src="${info.img_uiux.split(",")[2]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[2]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							<c:if test="${info.idx == 4}">
								
								<img src="${info.img_uiux.split(",")[0]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[0]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								<img src="${info.img_uiux.split(",")[1]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[1]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							<c:if test="${info.idx == 46}">
								
								<img src="${info.img_uiux.split(",")[0]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[0]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								<img src="${info.img_uiux.split(",")[1]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[1]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							<c:if test="${info.idx == 45}">
								
								<img src="${info.img_uiux.split(",")[0]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[0]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								<img src="${info.img_uiux.split(",")[1]}" alt="">
								
								
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							
							<c:if test="${info.idx == 9}">
								
								<img src="${info.img_uiux.split(",")[0]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[0]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								<img src="${info.img_uiux.split(",")[1]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[1]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							<c:if test="${info.idx == 15}">
								
								<img src="${info.img_uiux.split(",")[0]}" alt="">
								<img src="${info.img_uiux.split(",")[1]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[0]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div> 
								<img src="${info.img_uiux.split(",")[2]}" alt="">
								
								
								
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							
							<c:if test="${info.idx == 29}">
								
								<img src="${info.img_uiux.split(",")[0]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[0]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								<img src="${info.img_uiux.split(",")[1]}" alt="">
								<div class="tag_video">
									<iframe src="${info.video_uiux.split(",")[1]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								<img src="${info.img_uiux.split(",")[2]}" alt="">
								
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							<%-- <c:if test="${info.idx == 39}">  
								
								<div style="overflow: hidden">
									<c:forEach items='${info.img_uiux.split(",")}' var="item" varStatus="idx">	
										<div style="width: 50%; float: left;">
											<img src="${item}" style="max-width: 100%; ">
										</div>
									</c:forEach>
								</div>
								<c:set var="isN" value="true"></c:set>
							</c:if> --%>
							
							<c:if test="${isN == false}">
								<c:forEach items='${info.img_uiux.split(",")}' var="item" varStatus="idx">	
									<img src="${item}" alt="">
								</c:forEach>
								<c:if test='${info.video_uiux!=""}'>
									<c:forEach items='${info.video_uiux.split(",")}' var="item" varStatus="idx">	
										<div class="tag_video">
											<iframe src="${item}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
									</c:forEach>
								</c:if>
							</c:if>
							
						</div>
					</div>
				</c:if>
				
				<c:if test='${info.img_kiosk!=null && info.img_kiosk!=""}'>
					<div class="tag-item" id="tag-kiosk">
						<div class="tag_name">Kiosk</div>
						<div class="tag_content">
							<div class="tag_desc">${info.txt_kiosk}</div>
							<c:forEach items='${info.img_kiosk.split(",")}' var="item" varStatus="idx">	
								<img src="${item}" alt="">
							</c:forEach>
							<c:if test='${info.video_kiosk!=""}'>
								<c:forEach items='${info.video_kiosk.split(",")}' var="item" varStatus="idx">	
									<div class="tag_video">
										<iframe src="${item}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</c:if>
				
				<c:if test='${info.img_video!=null && info.img_video!="" || info.video_video!=null && info.video_video!=""}'>
					<div class="tag-item" id="tag-video">
						<div class="tag_name">Video</div>
						<div class="tag_content">
							<div class="tag_desc">${info.txt_video}</div>
							
							
							
							
							<c:set var="isN" value="false"></c:set>
							
							
							<c:if test="${info.idx == 6}">
								
								<div class="tag_video">
									<iframe src="${info.video_video.split(",")[0]}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
								<img src="${info.img_video.split(",")[0]}" alt="">
								
								
								<c:set var="isN" value="true"></c:set>
							</c:if>
							
							
							<c:if test="${isN == false}">
								
								<c:if test='${info.img_video!=null && info.img_video!=""}'>
									<c:forEach items='${info.img_video.split(",")}' var="item" varStatus="idx">	
										<img src="${item}" alt="">
									</c:forEach>
								</c:if>
								<c:if test='${info.video_video!=""}'>
									<c:forEach items='${info.video_video.split(",")}' var="item" varStatus="idx">	
										<div class="tag_video">
											<iframe src="${item}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
										</div>
									</c:forEach>
								</c:if>
								
							</c:if>
							
							
							
							
						</div>
					</div>
				</c:if>
				
				
			</div>
		</div>
		<div class="c03">
			
			
			<c:if test="${info.idx == 13}">
				<a href="11"><i class="xi-angle-left-min"></i><span>Back</span></a> 
			</c:if>
			<c:if test="${info.idx != 13}">
				<a href="${info.idx-1}"><i class="xi-angle-left-min"></i><span>Back</span></a> 
			</c:if>
			
			
			<c:if test="${info.idx == 11}">
				<a href="13"><span>Next</span><i class="xi-angle-right-min"></i></a>
			</c:if>
			<c:if test="${info.idx != 11}">
				<a href="${info.idx+1}"><span>Next</span><i class="xi-angle-right-min"></i></a>
			</c:if>
			
			
		</div>
	</div>
	
	
	<!-- 퀵메뉴 -->
    <div class="quick-menu">
        <div class="tag_list">
        
        	<c:if test='${info.img_video!=null && info.img_video!=""|| info.video_video!=null && info.video_video!=""}'>
	            <div class="tag_item btn-move_vi">
	                <a class="minify" onclick="mlw('tag-video','Vi',0)"><span class="extend">Video</span>Vi</a>
	            </div>
            </c:if>
            <c:if test='${info.img_kiosk!=null && info.img_kiosk!=""}'>
	            <div class="tag_item btn-move_ki">
	                <a class="minify" onclick="mlw('tag-kiosk','Ki',0)"><span class="extend">Kiosk</span>Ki</a>
	            </div>
	        </c:if>
	        <c:if test='${info.img_uiux!=null && info.img_uiux!=""}'>
	            <div class="tag_item btn-move_ui">
	                <a class="minify" onclick="mlw('tag-uiux','Ui',0)"><span class="extend">UIUX&Web</span>Ui</a>
	            </div>
            </c:if>
            <c:if test='${info.img_package!=null && info.img_package!=""}'>
	            <div class="tag_item btn-move_pa">
	                <a class="minify" onclick="mlw('tag-package','Pa',0)"><span class="extend">Package</span>Pa</a> 
	            </div>
            </c:if>
            <c:if test='${info.img_edit!=null && info.img_edit!="" || info.video_edit!=null && info.video_edit!=""}'>
	            <div class="tag_item btn-move_ed">
	                <a class="minify" onclick="mlw('tag-edit','Ed',0)"><span class="extend">Edit</span>Ed</a>
	            </div>
            </c:if>
            <c:if test='${info.img_infographic!=null && info.img_infographic!="" || info.video_infographic!=null && info.video_infographic!=""}'>
	            <div class="tag_item btn-move_in">
	                <a class="minify" onclick="mlw('tag-infographic','In',0)"><span class="extend">Infographic</span>In</a>
	            </div>
            </c:if>
            <c:if test='${info.img_character!=null && info.img_character!=""}'>
	            <div class="tag_item btn-move_ch">
	                <a class="minify" onclick="mlw('tag-character','Ch',0)"><span class="extend">Character</span>Ch</a>
	            </div>
            </c:if>
            <c:if test='${info.img_poster!=null && info.img_poster!=""}'>
	            <div class="tag_item btn-move_po">
	                <a class="minify" onclick="mlw('tag-poster','Po',0)"><span class="extend">Poster</span>Po</a>
	            </div>
            </c:if>
            <c:if test='${info.img_graphic!=null && info.img_graphic!=""}'>
	            <div class="tag_item btn-move_gr">
	                <a class="minify"  onclick="mlw('tag-graphic','Gr',0)"><span class="extend">Graphic</span>Gr</a>
	            </div>
            </c:if>
            <c:if test='${info.img_branding!=null && info.img_branding!=""}'>
	            <div class="tag_item btn-move_br">
	                <a class="minify" onclick="mlw('tag-branding','Br',0)"><span class="extend">Branding</span>Br</a>
	            </div>
            </c:if>
            <a class="tag_item btn-move_top" onclick="scrollTopLine()">TOP</a>
        </div>
        <div class="btn-move_prev"><i class="xi-angle-up-min"></i></div>
        <div class="btn-open_tags">
            <span class="current_tag" id="currTag">Br</span>
            <span class="btn-close"><i class="xi-close"></i></span>
        </div>
        <div class="btn-move_next"><i class="xi-angle-down-min"></i></div>
    </div>
</div>



<script>
function mlw(idName, t, h) {
	
	location.href = "#"+idName;
	$("#currTag").text(t);
	
// 	var scrollPosition = $("#"+idName).offset().top + window.height;
// 	console.log($("#"+idName).offset().top); 
// 	$("html, body").animate({scrollTop: scrollPosition}, 150);   
}

function scrollTopLine() {
	$('html,body').animate({scrollTop : 0}); 
}

function calcHeight() {
	//find the height of the internal page

	var the_height = document.getElementById('the_iframe').contentWindow.document.body.scrollHeight;

	//change the height of the iframe
	document.getElementById('the_iframe').height = the_height;

	//document.getElementById('the_iframe').scrolling = "no";
	document.getElementById('the_iframe').style.overflow = "hidden";
}
	
	
$('.btn-open_tags').on('click', function(e){
	var target = $(e.currentTarget).parent();
	target.toggleClass('active');
	console.log(target);
}); 
</script>


<script>
	$("#sidebar .menu.menu_works").addClass("active");
	$("#header .menu.menu_works").addClass("active");
</script>

