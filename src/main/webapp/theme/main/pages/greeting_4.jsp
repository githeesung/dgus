<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!-- 메인 -->
<div id="body">
    <div class="cont" id="p06">
        <div class="c01">
            <div class="search">
                <input id="input-search" type="text" placeholder="학생 이름을 입력해주세요.">
                <div class="btn-search">Search</div>
            </div>
            <div class="result">
                <div class="cont">
                    <div class="item-list">
                        <div class="item active"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                        <div class="item"><a href="">김두두</a></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="c02">
            <div class="title">visitor's comment</div>
            <div class="send"></div>
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
        $('#input-search').blur(function(){
            $('.result').removeClass('active');
            $('#overlay').removeClass('active');
        });
    });
</script>