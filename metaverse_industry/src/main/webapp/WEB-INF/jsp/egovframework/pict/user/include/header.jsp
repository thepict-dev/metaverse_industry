<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<header>
    <div class="headerInner">
        <div class="gnb">
            <h1><a href="/"><img src="/img/user_img/logo.png" alt=""></a></h1>
            <ul class="nav">
                <li>
                    <a href="/intro.do">센터소개</a>
                </li>
                <li>
                    <a href="/support.do">지원사업</a>
                </li>
                <li>
                    <a href="#lnk">시설·장비</a>
                    <ul class="gnbNav">
                        <li><a href="/equipment.do">장비대여</a></li>
                        <li><a href="/facility.do">시설예약</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/education.do">현장체험교육</a>
                </li>
                <li>
                    <a href="#lnk">알림마당</a>
                    <ul class="gnbNav">
                        <li><a href="notice.do">공지사항</a></li>
                        <li><a href="biz_post.do">사업공고</a></li>
                    </ul>
                </li>
            </ul>
            <div class="gnbBack"></div>
        </div>
        <div class="sideButtons">
            <a href="/user_login.do">로그인</a>
            <!-- <a href="#lnk">마이페이지</a>
            <a href="#lnk">로그아웃</a> -->
        </div>
        <button type="button" class="mbMenuBtn"><img src="/img/user_img/menu.png" alt=""></button>
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
                            <a href="/equipment.do">장비대여</a>
                        </li>
                        <li>
                        	<a href="/facility.do">시설예약</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="">현장체험교육</a>
                </li>
                <li>
                    <a href="">알림마당</a>
                    <ul class="sub-depth">
                        <li>
                        	<a href="notice.do">공지사항</a>
                        </li>
                        <li>
                        	<a href="biz_post.do">사업공고</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</header>