<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String url = request.getRequestURL().toString();
	pageContext.setAttribute("url", url);	
	pageContext.setAttribute("name", session.getAttribute("name"));
%>

<c:set var="intro" value="${fn:indexOf(url, 'intro')}"/>
<c:set var="support" value="${fn:indexOf(url, 'support')}"/>
<c:set var="equipment" value="${fn:indexOf(url, 'equipment')}"/>
<c:set var="facility" value="${fn:indexOf(url, 'facility')}"/>
<c:set var="education" value="${fn:indexOf(url, 'education')}"/>
<c:set var="notice" value="${fn:indexOf(url, 'notice')}"/>
<c:set var="biz_post" value="${fn:indexOf(url, 'biz_post')}"/>

<header class="subHeader">
    <div class="headerInner">
        <div class="gnb">
            <h1>
            	<a href="/">
            		<img src="/img/user_img/logo-sub.png" alt="">
            		<img src="/img/user_img/logo.png" alt="" class="subLogo">
            	</a>
           	</h1>
            <ul class="nav">
                <li <c:if test="${intro ne -1}">class="active"</c:if>>
                    <a href="/intro.do">센터소개</a>
                </li>
                <li <c:if test="${support ne -1}">class="active"</c:if>>
                    <a href="/support.do">지원사업</a>
                </li>
                <li <c:if test="${equipment ne -1 || facility ne -1}">class="active"</c:if>>
                    <a href="/equipment.do">시설·장비</a>
                    <ul class="gnbNav">
                        <li><a href="/equipment.do">장비사용</a></li>
                        <li><a href="/facility.do">시설사용</a></li>
                    </ul>
                </li>
                <li <c:if test="${education ne -1}">class="active"</c:if>>
                    <a href="/education.do">현장체험교육</a>
                </li>
                <li <c:if test="${notice ne -1 || biz_post ne -1}">class="active"</c:if>>
                    <a href="/notice.do">알림마당</a>
                    <ul class="gnbNav">
                        <li><a href="/notice.do">공지사항</a></li>
                        <li><a href="/biz_post.do">사업공고</a></li>
                    </ul>
                </li>
            </ul>
            <div class="gnbBack"></div>
        </div>
        <div class="sideButtons">
        <c:choose>
        	<c:when test="${name ne '' && name ne null && name ne undefined}">
	            <a href="/mypage_bag.do?type=equipment" class="bag">
	            	<img src="/img/user_img/bag-icon.png" alt="장바구니 바로가기" class="bkBag">
	            	<img src="/img/user_img/bag-icon-wt.png" alt="장바구니 바로가기" class="wtBag">
            	</a>
	            <a href="/mypage_account.do">마이페이지</a>
	            <a href="/user_logout.do">로그아웃</a> 
            </c:when>
            <c:otherwise>
            	<a href="/user_login.do">로그인</a>
            </c:otherwise>
        </c:choose>
        </div>
        <button type="button" class="mbMenuBtn">
		<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
			<mask id="mask0_940_18342" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
				<rect width="24" height="24" fill="#D9D9D9"/>
			</mask>
			<g mask="url(#mask0_940_18342)">
				<path d="M3.5 17.6347V16.135H20.5V17.6347H3.5ZM3.5 12.7502V11.2502H20.5V12.7502H3.5ZM3.5 7.86547V6.36572H20.5V7.86547H3.5Z" fill="white"/>
			</g>
		</svg>
		</button>
        <div class="mobile-menu">
            <div class="mobile-header">
                <a href="#" class="logo">
                    <img src="/img/user_img/logo-sub.png" alt="" srcset="">
                </a>
                <button class="menu-close">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                        <mask id="mask0_85_6857" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0"
                            width="24" height="24">
                            <rect width="24" height="24" fill="#D9D9D9" />
                        </mask>
                        <g mask="url(#mask0_85_6857)">
                            <path
                                d="M6.39994 18.6538L5.34619 17.6L10.9462 12L5.34619 6.4L6.39994 5.34625L11.9999 10.9463L17.5999 5.34625L18.6537 6.4L13.0537 12L18.6537 17.6L17.5999 18.6538L11.9999 13.0538L6.39994 18.6538Z"
                                fill="white" />
                        </g>
                    </svg>
                </button>
            </div>
            <ul class="depth">
                <li>
                    <a href="/intro.do">센터소개</a>
                </li>
                <li>
                    <a href="/support.do">지원사업</a>
                </li>
                <li class="use-depth">
                    <span>시설•장비</span>
                    <ul class="sub-depth">
                        <li>
                            <a href="/equipment.do">장비사용</a>
                        </li>
                        <li>
                        	<a href="/facility.do">시설사용</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="/education.do">현장체험교육</a>
                </li>
                <li>
                    <span>알림마당</span>
                    <ul class="sub-depth">
                        <li>
                        	<a href="/notice.do">공지사항</a>
                        </li>
                        <li>
                        	<a href="/biz_post.do">사업공고</a>
                        </li>
                    </ul>
                </li>
	        	<li>	
			        <c:choose>
			        	<c:when test="${name ne '' && name ne null && name ne undefined}">
				            <a href="/mypage_bag.do?type=equipment" class="bag"><img src="/img/user_img/bag-icon-wt.png" alt="장바구니 바로가기"></a>
				            <a href="/mypage_account.do">마이페이지</a>
				            <a href="/user_logout.do">로그아웃</a> 
			            </c:when>
			            <c:otherwise>
			            	<a href="/user_login.do">로그인</a>
			            </c:otherwise>
			        </c:choose>
            	</li>
            </ul>
        </div>
    </div>
</header>