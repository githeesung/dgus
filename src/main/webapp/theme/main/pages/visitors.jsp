<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<div id="body">
        <div class="cont" id="p06">
            <div class="c01">
                <div class="search">
                    <input id="input-search" type="text" placeholder="학생 이름을 입력해주세요.">
                    <div class="btn-search">Search</div>
                </div>
                <div class="result">
                	<div class="btn-close_result"><i class="xi-close"></i></div>
                    <div class="cont">
                        <div class="item-list" id="search_list_stud"">
                            
                        </div>
                    </div>
                </div>
            </div>
			<form id="inputfrm">
				
				<div class="c02">
	                <div class="title">visitor's comment</div>
	                <div class="send-bar">
	                    <div class="to">
	                        <span>To.</span>
	                        <select name="toName" id="toNameSelect">
	                            <option>모두에게</option>
								
	                        </select>
	                    </div>
	                    <div class="message">
	                        <input type="text" name="note" placeholder="축하 메세지를 남겨주세요!">
	                    </div>
	                    <div class="from">
	                        <span>From.</span>
	                        <input type="text" name="fromName">
	                    </div>
	                    <div class="btn-send">
	                        <a onclick="writeCmmt()" style="cursor: pointer;">send</a>
	                    </div>
	                </div>
	            </div>
				
			</form>
            

            <div class="c03">
                <div class="item-list">
                    
                   
                    
                   
                    
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
    // 코멘트 댓글달기 클릭
    $('.comment').on('click', function(e){
        var target = $(e.currentTarget).parent().find('.reply-input');
        target.addClass('active');
    });

    // 코멘트 댓글달기 확인 클릭
    $('.btn-submit').on('click', function(e){
        var target = $(e.currentTarget).parent();
        target.removeClass('active');
    });
});
</script>

<script>
$("#sidebar .menu.menu_visitors").addClass("active");
$("#header .menu.menu_visitors").addClass("active");
</script>


<script>


function writeCmmt() {
	var data = $("#inputfrm").serializeObject();	
	
	if(data.note==null||data.note.trim()=="") {
		alert("내용을 입력하세요.");
		return; 
	}
	if(data.fromName==null||data.fromName.trim()=="") {
		alert("From을 입력하세요.");
		return; 
	}
	
	$.ajax({ 
        type : "post",
        //dataType : "json",
        contentType : "application/json; charset=utf-8",
        data : JSON.stringify(data),
        url : "/api/guestbook",	           
        success : function(data){
        	$("#inputfrm input[name=note]").val('');
            loadBoardList(1);
        }, 
        error : function(e1,e2,e3){
            console.log(e1);console.log(e2);console.log(e3);
        } 
    });
}
function writeCmmt2(i) {
	
	var data = $(i).parents("form").serializeObject();	
	$.ajax({ 
        type : "post",
        //dataType : "json",
        contentType : "application/json; charset=utf-8",
        data : JSON.stringify(data),
        url : "/api/guestbook",	           
        success : function(data){
            loadBoardList(1);
        }, 
        error : function(e1,e2,e3){
            console.log(e1);console.log(e2);console.log(e3);
        } 
    });
	
	
}

function loadBoardList(page) {
	
    $.ajax({ 
        type : "GET",
        dataType : "json",
        data : { "page" : page },
        url : "/api/guestbook",	           
        success : function(data){           
            var c = "";            
            $(".c03 .item-list").html('');

            $(data.list).each(function(i,d){

				var c = '';		
				if(d.dept == 0) {
					// 처음 
					c += '<div class="item cmt_'+d.numb+'">';
		                c += '<div class="to">';
		              	  c += '<span>To.</span><span>'+d.toName+'</span>';
		                c += '</div>';
		                c += '<div class="msg">';
		                	c += '<div class="content">'+d.note+'</div>';
		                
			                c += '<div class="reply-list">';
			                	//c += '<div class="reply-item">야 길동아 고맙다~~~~~~~^^</div>';
			                	//c += '<div class="reply-item">야 길동아 고맙다~~~~~~~^^</div>';
			                c += '</div>';
			                c += '<form class="frm">';
			                c += '<div class="reply-input">';
			                	
				                c += '<input type="text" name="note">';
				                c += '<input type="hidden" name="toName" value="'+d.toName+'"/>';
				                c += '<input type="hidden" name="fromName" value="'+d.toName+'"/>';
				                c += '<input type="hidden" name="numb" value="'+d.numb+'"/>';
				                c += '<div class="btn-submit" onclick="writeCmmt2(this)">확인</div>';
				                
			                c += '</div>';
			                c += '</form>';
		                c += '</div>';
		                c += '<div class="from">';
		                	c += '<span>From.</span><span>'+d.fromName+'</span>';
		                c += '</div>';
		                c += '<div class="comment">댓글달기</div>';
		                c += '<div class="date">'+d.regdate+'</div>';
	                c += '</div>';
	                $(".c03 .item-list").append(c);
				}
				else {
					// 같은 댓글 
					c = '<div class="reply-item">'+d.note+'</div>';
					$(".cmt_"+d.numb+" .reply-list").append(c);
				}
                
            });
           
            
			// 코멘트 댓글달기 클릭
			$('.comment').on('click', function(e){
			    var target = $(e.currentTarget).parent().find('.reply-input');
			    target.addClass('active');
			});
			// 코멘트 댓글달기 확인 클릭
			$('.btn-submit').on('click', function(e){
			    var target = $(e.currentTarget).parent();
			    target.removeClass('active');
			});
           
        }, 
        error : function(e1,e2,e3){
            console.log(e1);console.log(e2);console.log(e3);
        } 
    });	
}    
loadBoardList(1);    











function loadStudents() {
	
	$.ajax({ 
        type : "GET",
        dataType : "json",
        data : {"page" : 1},
        url : "/api/profile",	           
        success : function(data){           
            var c2 = '';
            console.log(data.list);
            $("#search_list_stud").html('');
            $(data.list).each(function(i,d){
                c2 = '<div class="item"><a href="/works/'+d.idx+'">'+d.name+'</a></div>';
                $("#search_list_stud").append(c2);  
                $("#inputfrm #toNameSelect").append('<option>'+d.name+'</option>');
            });   
            
            
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
        }
    });
}
loadStudents();
</script>