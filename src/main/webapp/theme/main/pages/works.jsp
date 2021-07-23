<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<!-- 메인 -->
    <div id="body">
        <div class="cont" id="p05">
            <div class="c01">
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

                      	
                    }, 
                    error : function(e1,e2,e3){
                        console.log(e1);console.log(e2);console.log(e3);
                    } 
                });
            }
            loadStudents();
            </script>
            <div class="c02">
                <div class="item-list" id="studentList">
                    
                    
                    
                    <!-- <div class="item">
                        <a href="">
                            <img src="/theme_main/img/profile_img.jpg" alt="">
                            <div class="name">
                                <div class="ko">김두두</div>
                                <div class="en">Kim do do</div>
                            </div>
                        </a>
                    </div> -->
                 
                    
                    
                </div>
            </div>
        </div>
    </div>
    
    
    
    <script>
    
    $(function(){
    	
    	// 학생 검색
        $('#input-search').focus(function(){
            $('.result').addClass('active');
            $('#overlay').addClass('active');
        });
        // $('#input-search').blur(function(){
        //     $('.result').removeClass('active');
        //     $('#overlay').removeClass('active');
        // });
        $('#overlay').on('click', function(){
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
    });
</script>

<script>
$("#sidebar .menu.menu_works").addClass("active");
$("#header .menu.menu_works").addClass("active");
</script>