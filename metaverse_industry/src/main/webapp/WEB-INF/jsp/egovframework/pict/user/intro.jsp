<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<meta charset="ko">
<%@ include file="./include/head.jsp" %>
<body>
	<%@ include file="./include/header_sub.jsp" %>
    <div class="subTop intro">
       <div class="subColor">
           <h2>센터소개</h2>
           <p>온택트시대의 메타버스 콘텐츠,<br>강원 메타버스 지원센터가 그 중심이 되겠습니다.</p>
       </div>
    </div>
    <div class="subContents intro">
        <div class="subContentsInner">
            <div class="cardContainer">
                <h3 class="subSecTitle">센터소개</h3>
                <p class="subSecDesc">강원 메타버스 지원센터는 메타버스 콘텐츠 개발에 필요한 장비, 공간을 제공하고 콘텐츠 제작 전 과정을 지원합니다.</p>
                <div class="cardInner">
                    <ul class="cardLists">
                        <li class="active">
                            <span><img src="/img/user_img/intro1.png" alt=""></span>
                            <div class="cardContents">
                                <span class="cardSub">콘텐츠 제작 지원</span>
                                <p>메타버스 융합콘텐츠<br>제작 지원 사업</p>
                                <span class="cardDesc">강원도 내 메타버스 관련 기업을 지원하여 레저·휴양과 의료 분야의 혁신적 콘텐츠 제작을 목표로 하는 사업입니다. 지원 대상은 메타버스 기술 또는 서비스를 보유한 강원특별자치도 소재 기업으로, 자세한 내용은 홈페이지를 참고하세요.</span>
                                <a href="#lnk" class="linkButton blk">보러가기<img src="img/user_img/list-link.png" alt=""></a>
                            </div>
                        </li>
                        <li>
                            <span><img src="/img/user_img/intro2.png" alt=""></span>
                            <div class="cardContents">
                                <span class="cardSub">전문인력 양성</span>
                                <p>메타버스 전문인력<br>양성 교육 사업</p>
                                <span class="cardDesc">강원지역 메타버스 산업의 요구사항을 반영한 실무형 교육을 통해 산업 종사자 및 취업 희망자의 직무 능력을 향상시키고 인재를 발굴하는 사업입니다. 지원 대상은 강원 소재 기업 재직자, 미취업자, 대학생으로, 교육장소는 추후 공지됩니다. 자세한 내용은 사업공고일에 확인하세요.</span>
                                <a href="#lnk" class="linkButton blk">보러가기<img src="img/user_img/list-link.png" alt=""></a>
                            </div>
                        </li>
                        <li>
                            <span><img src="/img/user_img/intro3.png" alt=""></span>
                            <div class="cardContents">
                                <span class="cardSub">인프라 지원</span>
                                <p>강원 메타버스 지원센터<br>인프라(시설·장비) 지원</p>
                                <span class="cardDesc">메타버스 콘텐츠 제작에 필요한 인프라(시설·장비)를 강원특별자치도 내 메타버스 기업 및 유관기관에 지원합니다. 사용 방법은 홈페이지를 통한 예약신청 후 방문입니다. 지원대상은 강원특별자치도의 메타버스 관련 기업, 유관기관 임직원 및 메타버스 관련 창업·취업 준비자입니다.</span>
                                <a href="#lnk" class="linkButton blk">보러가기<img src="img/user_img/list-link.png" alt=""></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="mapContainer">
                <h3 class="subSecTitle">오시는 길</h3>
                <p class="subSecDesc location">강원 메타버스 지원센터는 메타버스 창작자에게 언제나 열려있습니다.</p>
                <div class="mapInner"></div>
                <ul class="locationInfo">
                    <li>
                        <p><img src="/img/user_img/location.png" alt="">주소</p>
                        <p>강원특별자치도 춘천시 서면 박사로 854 강원정보문화산업진흥원 문화지원센터</p>
                    </li>
                    <li>
                        <p><img src="/img/user_img/call.png" alt="">대표전화</p>
                        <p>033-245-6313</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script src="/js/sub.js"></script>
</body>
</html>