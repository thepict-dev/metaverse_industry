<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<header class="header">
    <a class="logo" href="/lending.do">
        <img src="/img/user_img/logo.png" alt="로고" srcset="">
    </a>
    <ul class="menu-depth">
        <li>
            <a href="#lnk">센터소개</a>
        </li>
        <li>
            <a href="#lnk">지원사업</a>
        </li>
        <li class="active-sub-depth">
            <a href="">콘텐츠DB</a>
            <ul class="sub-depth">
                <li><a href="/location_db_list.do">로케이션DB</a></li>
                <li><a href="/industry_db.do">산업체DB</a></li>
            </ul>
        </li>
        <li><a href="#lnk">센터소식</a></li>
    </ul>
    <button class="hamburger">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
            <mask id="mask0_85_3412" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="24"
                height="24">
                <rect width="24" height="24" fill="#D9D9D9" />
            </mask>
            <g mask="url(#mask0_85_3412)">
                <path
                    d="M3.5 17.6345V16.1348H20.5V17.6345H3.5ZM3.5 12.75V11.25H20.5V12.75H3.5ZM3.5 7.86526V6.36551H20.5V7.86526H3.5Z"
                    fill="#1C1B1F" />
            </g>
        </svg>
    </button>
    <div class="header-back"></div>

    <div class="mobile-menu">
        <div class="mobile-header">
            <a href="#" class="logo">
                <img src="/img/user_img/logo-white.png" alt="" srcset="">
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
                <a href="">센터소개</a>
            </li>
            <li>
                <a href="">지원사업</a>
            </li>
            <li class="use-depth">
                <span>콘텐츠DB</span>
                <ul class="sub-depth">
                    <li>
                        <a href="/location_db_list.do">로케이션DB</a>
                    </li>
                    <li>
                        <a href="/industry_db.do">산업체DB</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="">센터소식</a>
            </li>
        </ul>
    </div>
</header>