<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<div id="body">
        <div class="cont" id="p03">
            <div class="c01">
                <div class="profile">
                    <div class="img"><img src="/theme_main/img/이해만교수님.png" alt=""></div>
                    <div class="info">
                        <div class="say">인사말씀</div>
                        <div class="pos">조형예술대학 시각디자인학과장</div>
                        <div class="name">이해만</div>
                    </div>
                </div>
                <div class="greetings">
                    <div class="p1">
                        "일취월장하여 대구대 시각인의 명성과 영광이 있기를 바랍니다."
                    </div>
                    <div class="p2">
                        안녕하세요?<br>
                        금년에는 전대미문의 코로나19 PANDEMIC 사태로 인해 모든 분야에서 힘든 과정을 격고 극복해가고 있습니다. 국내외 디자인 산업과 교육도 뉴노멀 디자인 시대에 대처하고 새로운 환경을 경험하고 있습니다. 이러한 상황 속에서 금번 우리 학과의 제 36회 졸업작품전 개최도 처음으로 온라인 전시회로 전환해서 개최하게 되었습니다. 전시회 관람을 위해 특별히 전용 홈페이지를 방문하여 주신 여러분께 진심으로 환영하며 감사를 드립니다!<br>
                        <br>
                        우리 대구대학교 시각디자인학과는 시대와 산업에 적합한 전문인재를 양성하기 위하여 지속적인 실무교육과정 중심의 콘텐츠 개발과 실무디자인 기반의 현장밀착형 전공교육을 추진해오고 있습니다. 또한 전공인턴 제도를 통한 실무대처능력을 함양하고, 팀활동과 전공동아리활동을 통한 조직적응 및 인성교육의 중요성을 체험하고 있습니다. 이러한 교내외 활동을 통해서 국내외 공모전에서 우수한 수상성과와 만족한 취업으로 인정받고 있습니다.<br>
                        <br>
                        이번 전시회가 있기까지 어려운 여건 속에서도 비대면 수업과 함께 밤낮으로 졸업 프로젝트를 꾸준히 진행하고, 처음으로 추진해온 온라인 전시까지를 잘 수행해준 졸업예정자 여러분, 그리고 졸업준비위원장과 준비위원의 많은 노고 과정을 크게 치하하며 축하합니다. 아울러 그 어느 때보다도 힘든 지도과정을 통해 오늘의 성과로 맺어준 지도교수님 여러분께 감사를 드립니다. 또한 4년간 우리대학을 믿고 자녀를 맡겨주시고 물심양면으로 지원을 아끼지 않으신 학부모님께 깊은 감사의 말씀을 올립니다.<br>
                        <br>
                        이제 졸업예정자 여러분은 새로운 무한경쟁의 사회로 진출하게 되는 전문인으로서 그 동안 전공공부를 기반으로 새로운 변화의 길을 두려워하지 말고, 그 길에서 자기계발과 지속적인 도전으로 인정받는 디자이너가 되어주길 바랍니다. 성공의 길을 위하여 지도교수님들도 뒤에서 늘 관심을 가지고 동행하겠습니다. 또한 사회 및 동문 선후배들과도 적극적인 교류와 협력으로 함께 일취월장하는 대구대 시각인의 명성과 영광이 있기를 기원합니다. 감사합니다.<br>
                    </div>
                    <div class="p3">
                        2020.12<br>
                        대구대학교 조형예술대학 시각디자인학과장<br>
                        <span class="em">이해만</span>
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