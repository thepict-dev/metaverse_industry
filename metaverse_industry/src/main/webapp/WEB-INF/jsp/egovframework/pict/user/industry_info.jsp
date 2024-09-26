<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<meta charset="ko">
<%@ include file="./include/head.jsp" %>
<link rel="stylesheet" href="/css/user_css/industry-db-detail.css">
<body>
	<%@ include file="./include/header.jsp" %>
    <main class="container">
        <div class="content-header">
            <a href="/industry_db.do">
                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 40 40" fill="none">
                    <mask id="mask0_86_3625" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="40"
                        height="40">
                        <rect width="40" height="40" fill="#D9D9D9" />
                    </mask>
                    <g mask="url(#mask0_86_3625)">
                        <path
                            d="M12.2883 21.25L21.7821 30.7437L20 32.5L7.5 20L20 7.5L21.7821 9.25625L12.2883 18.75H32.5V21.25H12.2883Z"
                            fill="#1C1B1F" />
                    </g>
                </svg>
            </a>
            <div class="summary">
               <p>
                	<c:if test="${pictVO.scale eq '1'}">법인</c:if>
                	<c:if test="${pictVO.scale eq '2'}">개인</c:if>
                	<c:if test="${pictVO.scale eq '3'}">협동조합</c:if>
                </p>
                <h1>${pictVO.title}</h1>
            </div>
        </div>
        <ul class="navigator">
            <li>
                <a href="/industry_portfolio.do?idx=${pictVO.idx}">포트폴리오</a>
            </li>
            <li>
                <a class="active" href="/industry_info.do?idx=${pictVO.idx}">회사정보</a>
            </li>
        </ul>
        <div class="company-info-container">
            <div class="left-container">
                <div class="logo-container">
				    <div class="swiper mySwiper">
				        <div class="swiper-wrapper">
					        <c:if test="${pictVO.main_img_url ne '' && pictVO.main_img_url ne null && pictVO.main_img_url ne undefined}">
						        <div class="swiper-slide">
		                    		<img src="http://118.67.128.150${pictVO.main_img_url}" alt="" srcset="">
	                    		</div>
					        </c:if>
					        <c:if test="${pictVO.img_1 ne '' && pictVO.img_1 ne null && pictVO.img_1 ne undefined}">
						        <div class="swiper-slide">
		                    		<img src="http://118.67.128.150${pictVO.img_1}" alt="" srcset="">
	                    		</div>
					        </c:if>
					        <c:if test="${pictVO.img_2 ne '' && pictVO.img_2 ne null && pictVO.img_2 ne undefined}">
						        <div class="swiper-slide">
		                    		<img src="http://118.67.128.150${pictVO.img_2}" alt="" srcset="">
	                    		</div>
					        </c:if>
					        <c:if test="${pictVO.img_3 ne '' && pictVO.img_3 ne null && pictVO.img_3 ne undefined}">
						        <div class="swiper-slide">
		                    		<img src="http://118.67.128.150${pictVO.img_3}" alt="" srcset="">
	                    		</div>
					        </c:if>
                   		</div>
                	</div>
                </div>
                <a href="${pictVO.homepage_url}" target="_blank" class="active-form pc">
                    <span>홈페이지 이동하기</span>
                    <i>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <mask id="mask0_26_5709" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"
                                width="24" height="24">
                                <rect width="24" height="24" fill="#D9D9D9" />
                            </mask>
                            <g mask="url(#mask0_26_5709)">
                                <path
                                    d="M6.29425 17.6443L5.25 16.6L15.0905 6.75H6.14425V5.25H17.6443V16.75H16.1443V7.80375L6.29425 17.6443Z"
                                    fill="black" />
                            </g>
                        </svg>
                    </i>
                </a>
            </div>
            <div class="table">
                <div class="table-row">
                    <div class="table-head">업체명</div>
                    <div class="table-data">${pictVO.title}</div>
                </div>
                <div class="table-row">
                    <div class="table-head">대표자명</div>
                    <div class="table-data">${pictVO.ceo}</div>
                </div>
                <div class="table-row">
                    <div class="table-head">설립일</div>
                    <div class="table-data">${pictVO.establishment_date}</div>
                </div>
                <div class="table-row">
                    <div class="table-head">기업 형태</div>
                    <div class="table-data">
                    	<c:if test="${pictVO.scale eq '1'}">법인</c:if>
	                	<c:if test="${pictVO.scale eq '2'}">개인</c:if>
	                	<c:if test="${pictVO.scale eq '3'}">협동조합</c:if>
                    </div>
                </div>
                <div class="table-row">
                    <div class="table-head">회사 주소</div>
                    <div class="table-data">${pictVO.address}</div>
                </div>
                <div class="table-row">
                    <div class="table-head">주력 제품</div>
                    <div class="table-data">${pictVO.introduce}</div>
                </div>
                <div class="table-row">
                    <div class="table-head">인증 현황</div>
                    <div class="table-data">${pictVO.certificate}</div>
                </div>
                <div class="table-row">
                    <div class="table-head">연락처</div>
                    <div class="table-data">${pictVO.tel}</div>
                </div>
            </div>
            <a href="${pictVO.homepage_url}" target="_blank" class="active-form mobile">
                <span>홈페이지 이동하기</span>
                <i>
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                        <mask id="mask0_26_5709" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"
                            width="24" height="24">
                            <rect width="24" height="24" fill="#D9D9D9" />
                        </mask>
                        <g mask="url(#mask0_26_5709)">
                            <path
                                d="M6.29425 17.6443L5.25 16.6L15.0905 6.75H6.14425V5.25H17.6443V16.75H16.1443V7.80375L6.29425 17.6443Z"
                                fill="black" />
                        </g>
                    </svg>
                </i>
            </a>
        </div>
    </main>
	<%@ include file="./include/footer.jsp" %>
	<script src="/js/user_js/header.js"></script>
	<script src="/js/user_js/industry-db-detail.js"></script>
</body>
</html>