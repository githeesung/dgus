<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<!-- 메인 -->
<div id="body">
    <div class="cont" id="p03">
        <div class="c01">
            <div class="profile">
                <div class="img"><img src="/theme_main/img/송록영_학장님.png" alt=""></div>
                <div class="info">
                    <div class="say">축사</div>
                    <div class="pos">조형예술대학 학장</div>
                    <div class="name">송록영</div>
                </div>
            </div>
            <div class="greetings">
                <div class="p1">
                    "대구대학교 시각디자인학과 졸업생 여러분의<br> 졸업 전을 축하합니다."
                </div>
                <div class="p2">
                    올해는 코로나-19 사태로 인하여 학업 여건이 어려운 상황에서도 창의적인 졸업작품을 준비하느라 수고해 준 학생 여러분에게 격려와 응원의 박수를 보냅니다. 시각디자인 분야는 언텍트 시대에 맞서 생활에 필요한 정보나 지식을 넓히는 중요한 학문이라고 생각합니다.<br>
                    <br>
                    이번 전시 주제가 ‘EPIDEMIC’ 으로 유행병 ‘PANDEMIC’ 과 유사한 용어지만 코로나-19 의 전염병을 이겨내고 극복하고자 하는 열망을 디자인 대유행으로 해석하여 우리들의 성장이 담겨있는 디자인이 모두에게 끊임없이 확산되어 나아가는 것을 의미하는 것 같습니다. 
                    이런 노력에 걸맞게 시각디자인학과는 대구대학교에서 최고의 프로필을 쌓아가는 학과이며 지역을 넘어 전국적으로 경쟁력이 있는 학과라 생각합니다.<br>
                    <br>
                    이와 같은 성과는 우리 학생들을 열정과 사랑으로 지도해 주신 학과 교수님과 동문 선 후배의 끈끈한 애정과 관계에서 만들어진 결과라 생각합니다. 모두에게 격려와 감사의 인사를 드립니다.<br>
                    <br>
                    아울러 오늘 전시의 주인공은 우리 학생들이겠지만 숨은 주인공은 4년간 묵묵히 물심양면으로 자녀를 지원해 주신 학부모님들이라고 생각합니다. 이 자리를 빌려서 학부모님께도 머리 숙여 감사의 인사를 드립니다.<br>
                    <br>
                    다시 한번 졸업작품전을 위해 오랜 시간 자신과의 싸움을 이겨내 준 4학년 학생 여러분의 노력과 열정에 큰 박수를 보내며 여러분의 앞날에 큰 발전과 행운이 가득하길 기원합니다.
                </div>
                <div class="p3">
                    2020.12<br>
                    대구대학교 조형예술대학장<br>
                    <span class="em">송록영</span>
                </div>
            </div>
        </div>
    </div>

    <!-- 퀵메뉴 -->
        <div class="quick">
            <div class="pfs">
                <div class="pf">
                    <a href="/greetings/1">
                        <i class="xi-angle-up"></i>
                        <i class="xi-angle-left"></i>
                        <div class="info">
                            <div class="pos">조형예술<br>대학장</div>
                            <div class="name">송록영</div>
                        </div>
                    </a>
                </div>
                <div class="pf">
                    <a href="/greetings/2">
                        <div class="pos">학과장</div>
                        <div class="name">이해만</div>
                    </a>
                </div>
                <div class="pf">
                    <a href="/greetings/3">
                        <div class="info">
                            <div class="pos">졸업생대표</div>
                            <div class="name">황준석</div>
                        </div>
                        <i class="xi-angle-down"></i>
                        <i class="xi-angle-right"></i>
                    </a>
                </div>
            </div>
        </div>
</div>
<script>
$("#sidebar .menu.menu_greetings").addClass("active");
$("#header .menu.menu_greetings").addClass("active");
</script>