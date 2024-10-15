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
	    <div class="subTop support">
        <div class="subColor">
            <h2>이용안내</h2>
            <p>강원메타버스지원센터,<br>모두에게 열린 창의와 혁신의 공간입니다.</p>
        </div>
    </div>
    <div class="subContents etcTab">
        <ul class="tabNav">
            <li class="active"><span>콘텐츠 제작 지원</span></li>
            <li><span>전문인력 양성</span></li>
            <li><span>인프라 지원</span></li>
        </ul>
        <div class="tabInner subContentsInner active">
            <h3 class="subTextTitle">콘텐츠 제작 지원</h3>
            <div class="textsContentWrapper">
                <div class="subTextContents">
                    <h4 class="textTitle">사업목적</h4>
                    <div class="textsContent">
                        <p><span>도내 메타버스 관련 기업을 지원하여 높은 완성도를 가진 콘텐츠 제작</span></p>
                    </div>
                </div>
                <div class="subTextContents">
                    <h4 class="textTitle">공모분야</h4>
                    <div class="textsContent">
                        <p><span>레저·휴양 : 메타버스 기술을 활용한 축제, 콘텐츠, 관광, 교육, 재난훈련 등</span></p>
                        <p><span>의 료 : 메타버스 기술을 활용한 버추얼 병원, 의료교육, 디지털 치료제 등</span></p>
                    </div>
                </div>
                <div class="subTextContents">
                    <h4 class="textTitle">지원대상</h4>
                    <div class="textsContent">
                        <p><span>메타버스 기술 또는 서비스를 보유한 강원특별자치도 소재 기업(컨소시엄 가능)</span></p>
                    </div>
                </div>
                <div class="subTextContents">
                    <h4 class="textTitle">사업내용</h4>
                    <div class="textsContent">
                        <p><span>메타버스 융합 콘텐츠 상용화를 위한 개발</span></p>
                        <p><span>서비스 검증 비용 지급</span></p>
                        <p><span>메타버스 융합 콘텐츠 사업화를 위한 개발비용 지급</span></p>
                    </div>
                </div>
                <div class="subTextContents">
                    <h4 class="textTitle">추진절차</h4>
                    <ul class="boxContent">
                        <li>
                            <p class="pc">메타버스 콘텐츠<br>제작 지원 사업</p>
                            <p class="mb">메타버스 콘텐츠 제작 지원 사업</p>
                        </li>
                        <li>
                            <p class="pc">협약 체결<br>및 사업수행</p>
                            <p class="mb">협약 체결 및 사업수행</p>
                        </li>
                        <li>중간평가</li>
                        <li>
                            <p class="pc">최종평가<br>(결과보고 및 정산)</p>
                            <p class="mb">최종평가 (결과보고 및 정산)</p>
                        </li>
                    </ul>
                </div>
            </div>
            <a href="#lnk">사업 공고 바로가기 <img src="/img/user_img/arrow-right.png" alt=""></a>
        </div>
        <div class="tabInner subContentsInner">
            <h3 class="subTextTitle">전문인력 양성</h3>
            <div class="textsContentWrapper">
                <div class="subTextContents">
                    <h4 class="textTitle">사업목적</h4>
                    <div class="textsContent">
                        <p><span>강원지역 메타버스 관련 산업 요구사항을 반영한 메타버스 실무형 교육을 통해 산업 종사자 및 취업 희망자들의 직무능력향상 및 인재 발굴</span></p>
                    </div>
                </div>
                <div class="subTextContents">
                    <h4 class="textTitle">사업내용</h4>
                    <div class="textsContent">
                        <p><span>미취업자 및 대학생 대상 교육을 통해 도내 기업의 인력수요 해결 및 4차 산업 대응 신규 일자리 창출</span></p>
                        <p><span>재직자 대상 메타버스 관련 심화 교육을 통한 직무 능력 향상 지원</span></p>
                    </div>
                </div>
            </div>
            <a href="#lnk">사업 공고 바로가기 <img src="/img/user_img/arrow-right.png" alt=""></a>
        </div>
        <div class="tabInner subContentsInner">
            <h3 class="subTextTitle">인프라 지원</h3>
            <div class="textsContentWrapper">
                <div class="subTextContents">
                    <h4 class="textTitle">사업목적</h4>
                    <div class="textsContent">
                        <p><span>메타버스 콘텐츠 제작에 필요한 인프라시설·장비 지원</span></p>
                    </div>
                </div>
                <div class="subTextContents">
                    <h4 class="textTitle"></h4>
                    <div class="textsContent">
                        <p><span>평일(월~금) 10:00 ~ 17:00</span><span class="captions">※ 주말 및 공휴일 제외</span></p>
                    </div>
                </div>
                <div class="subTextContents">
                    <h4 class="textTitle"></h4>
                    <div class="textsContent">
                        <p><span>홈페이지를 통한 예약신청 후 방문</span></p>
                    </div>
                </div>
                <div class="subTextContents">
                    <h4 class="textTitle"></h4>
                    <div class="textsContent">
                        <p><span>강원특별자치도 메타버스 관련 기업, 유관기관 임직원</span></p>
                        <p><span>강원특별자치도에 거주하는 메타버스 관련 창·취업 준비자</span></p>
                    </div>
                </div>
                <div class="subTextContents">
                    <h4 class="textTitle"></h4>
                    <div class="textsContent">
                        <p><span>모션캡처룸</span></p>
                        <p><span>브이튜버룸</span></p>
                        <p><span>테스트베드룸</span></p>
                        <p><span>랩실(2인, 6인)</span></p>
                    </div>
                </div>
                <div class="subTextContents">
                    <h4 class="textTitle">추진절차</h4>
                    <ul class="boxContent">
                        <li>홈페이지 로그인</li>
                        <li>온라인 예약신청</li>
                        <li>
                            <p class="pc">예약 승인<br>(관리자)</p>
                            <p class="mb">예약 승인(관리자)</p>
                        </li>
                        <li>
                            <p class="pc">최종평가<br>(결과보고 및 정산)</p>
                            <p class="mb">최종평가(결과보고 및 정산)</p>
                        </li>
                    </ul>
                </div>
            </div>
            <a href="#lnk">사업 공고 바로가기 <img src="/img/user_img/arrow-right.png" alt=""></a>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script src="/js/sub.js"></script>
</body>
</html>