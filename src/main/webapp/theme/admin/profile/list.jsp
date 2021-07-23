<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
      
<c:set var="RESOURCES_VER"><spring:eval expression="@siteinfo['app.resource.ver']"></spring:eval></c:set>

<div class="contents_wrapper">
    <div class="layer">

        <div class="headline">학생프로필 관리</div>

        <div class="paddingbox">

            <div>
<!-- 
                <form id="searchfrm" action="" method="get" onsubmit="return false;">
                    <div class="normal_search_group clearfix" style="margin-top: 20px;">
                     
                        <input class="txtbox h43" type="text" name="query" placeholder="제목,작성자,내용으로 검색" value="" style="width: 300px; margin-right: 10px;"/>
                        <a class="btn" onclick="searchfrmKeyChange()" style="cursor: pointer;"><i class="fa fa-search" style="font-size: 15px;"></i> 검색</a>
                    </div>	
                </form>
                <script>
                
                </script> -->


                <div class="clearfix" style="padding: 20px 0px; text-align: right;">

                    <span class="b_txt" style="float: left;"><strong class="data_total"></strong>건</span>

                    <a href="/admin/pg/profile/list" class="btn white" style="margin-right: 5px; width: 122px;"><i class="fa fa-bars"></i>&nbsp;&nbsp;전체목록</a>
                    <a href="/admin/pg/profile/input" class="btn blue2" style="margin-right: 5px; width: 132px;">프로필 등록</a>
                    <a class="btn" style=" width: 122px;cursor: pointer; " onclick="deleteByCheckbox()">선택삭제</a>

                </div>

                <table class="table_style">
                    <thead>
                        <tr>
                            <th style="width: 40px;"><input class="chbox dims_checkbox all" type="checkbox"/></th>
                            <th class="pc-open" style="width: 50px;">번호</th>
                    		
                    		<th>프로필</th>
                            <th>이름</th>
                            <th>휴대폰번호</th>
                            <th>이메일</th>
                            <th>제목</th>
                            
                        </tr>
                    </thead>
                    <tbody id="list_target_1">

                    </tbody>
                </table>
                <div class="pg_wrapper">
                    <div class="pg clearfix">

                        <a class="numb" href="?page=1"><i class="fa fa-chevron-left"></i></a>
                        <a class="numb sel">1</a> 
                        <a class="numb ">2</a> 
                        <a class="numb ">3</a>      
                        <a class="numb ">4</a> 
                        <a class="numb ">5</a> 
                        <a class="numb" href="?page=2"><i class="fa fa-chevron-right"></i></a>

                    </div>
                </div>



            </div>



        </div>



    </div>
</div>	



<script>

var g_query = null;

function searchfrmKeyChange(i) {
	
	// query
	var query = $("#searchfrm input[name=query]").val();
	if(query.trim() == '') {g_query = null;}
	else { g_query = query; }
	
	// menuIdx
	var menuIdx = $("#searchfrm select[name=menuIdx]").val();
	if(menuIdx=='') {g_menuIdx = null;}
	else { g_menuIdx = menuIdx; }

	loadBoardList(1);
}
function searchfrmFilterChange(i) {
	
	var val = $(i).val();
	var nm = $(i).attr("name");
	if(val == '') { val =  null; }
	
	// menuIdx
	if(nm == "menuIdx") { g_menuIdx = val; }
	
	// query
	var query = $("#searchfrm input[name=query]").val();
	if(query.trim() == '') {g_query = null;}
	else { g_query = query; }
	
	loadBoardList(1);
}

    
// get BoardList    
function loadBoardList(page) {
	
    $.ajax({ 
        type : "GET",
        dataType : "json",
        data : {
            "page" : page,
            "q" : g_query
        },
        url : "/api/profile",	           
        success : function(data){           
            var c = "";
            console.log(data.list);
            
            var l  ='';
            $(data.list).each(function(i,d){
                c += '<tr>';
                c += '<td><input type="checkbox" name="seq" class="chbox dims_checkbox item_dims_checkbox" value="'+d.idx+'"/></td>';
                c += '<td>'+(i+1)+'</td>';
                c += '<td style="padding: 5px 0px 0px 0px !important; "><span style="display: inline-block; width: 70px; height: 70px; background-image: url('+(d.img_profile)+'); background-size:cover; background-position: cneter;"></span></td>';
                c += '<td><a href="./input/'+d.idx+'">'+d.name+' <i style="color: #959595;" class="far fa-window-restore"></i></a></td>';
                c += '<td>'+d.phonenm+'</td>';
                c += '<td>'+d.email+'</td>';
                c += '<td style="text-align: left;">'+d.title+'</td>';
                
                
                
                l += "insert into hs_profile_info (idx, name, nameEng, phonenm, email, title, awardList, activeOut, certificate, img_profile,";
        		l += "img_branding,img_graphic,img_poster,img_character,img_infographic,img_edit,img_package,img_uiux,img_kiosk,img_video,";
        		l += "video_branding,video_graphic,video_poster,video_character,video_infographic,video_edit,video_package,video_uiux,video_kiosk,video_video,";
        		l += "txt_branding,txt_graphic,txt_poster,txt_character,txt_infographic,txt_edit,txt_package,txt_uiux,txt_kiosk,txt_video";
        		l += ") ";
        		l += "values(";
        		l += " '"+d.idx+"', '"+d.name+"', '"+d.nameEng+"', '"+d.phonenm+"', '"+d.email+"', '"+d.title+"', '"+d.awardList+"', '"+d.activeOut+"', '"+d.certificate+"', '"+d.img_profile+"', ";
        		l += " '"+d.img_branding+"', '"+d.img_graphic+"', '"+d.img_poster+"', '"+d.img_character+"', '"+d.img_infographic+"', '"+d.img_edit+"', '"+d.img_package+"', '"+d.img_uiux+"', '"+d.img_kiosk+"', '"+d.img_video+"',";
        		l += " '"+d.video_branding+"', '"+d.video_graphic+"', '"+d.video_poster+"', '"+d.video_character+"', '"+d.video_infographic+"', '"+d.video_edit+"', '"+d.video_package+"', '"+d.video_uiux+"', '"+d.video_kiosk+"', '"+d.video_video+"',";
        		l += " '"+d.txt_branding+"', '"+d.txt_graphic+"', '"+d.txt_poster+"', '"+d.txt_character+"', '"+d.txt_infographic+"', '"+d.txt_edit+"', '"+d.txt_package+"', '"+d.txt_uiux+"', '"+d.txt_kiosk+"', '"+d.txt_video+"'";
        		
        		l += "); \r\n\r\n";
        	
            });
            $("#list_target_1").html(c);
            
            console.log(l); 
            
            c = "";
            console.log(data.pageNav);
            var pn = data.pageNav;
            $(".data_total").text(pn.totalRowCount);
            if(pn.startPageNum > pn.pageBlockCount) {
            	c += '<a class="numb" onclick="loadBoardList('+(1)+')"><i class="fa fa-chevron-left"></i></a>';
            	c += '<a class="numb" onclick="loadBoardList('+(pn.startPageNum-1)+')"><i class="fa fa-chevron-left"></i></a>';
            }
            for(var i=pn.startPageNum;i<=pn.endPageNum;i++) {
            	c += '<a class="numb '+(i==pn.pageNum?"sel":"")+'" onclick="loadBoardList('+i+')">'+i+'</a>';
            }
            if(pn.endPageNum < pn.totalPageCount) {
            	c += '<a class="numb" onclick="loadBoardList('+(pn.endPageNum+1)+')"><i class="fa fa-chevron-left"></i></a>';
            	c += '<a class="numb" onclick="loadBoardList('+(pn.totalPageCount)+')"><i class="fa fa-chevron-left"></i></a>';
            }
            $(".pg_wrapper > .pg").html(c);
            
            
            initSubNaviHeight();
          	
        }, 
        error : function(e1,e2,e3){
            console.log(e1);console.log(e2);console.log(e3);
        } 
    });	
}    
loadBoardList(1);    
 
$(".dims_checkbox.all").on("click",function(){
    var state = $(this).prop('checked');	
    $(".dims_checkbox").prop('checked', state);
});

function deleteByCheckbox() {
    if($(".item_dims_checkbox:checked").length==0){
        alert("삭제할 항목을 선택해주세요.");
        return;
    }

    var count = $(".item_dims_checkbox:checked").length;
    if(window.confirm('선택된 '+count+'개의 항목을 삭제하시겠습니까?','')){
    	var arr = new Array();
        $.each($(".item_dims_checkbox:checked"), function(idx,val){
        	arr.push($(val).val());
        });
        $.ajax({ 
            type : "DELETE",
            contentType : "application/json; charset=utf-8",
            data : JSON.stringify(arr),
            url : "/api/profile",           
            error : function(e1,e2,e3){
                console.log(e1);console.log(e2);console.log(e3);
            },
            success : function(){
            	$(".dims_checkbox.all").prop('checked', false);
                loadBoardList(1, null);
            }  
        });	
    }
}
</script>






