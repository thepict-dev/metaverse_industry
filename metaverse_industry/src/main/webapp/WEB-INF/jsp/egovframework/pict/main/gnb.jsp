<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"	   uri="http://java.sun.com/jsp/jstl/functions"%>



<%
	String url = request.getRequestURL().toString();
	pageContext.setAttribute("url", url);
	
%>



<c:set var="gnb" value="${fn:indexOf(url, 'gnb')}"/>
<c:set var="intro" value="${fn:indexOf(url, 'intro')}"/>


<c:set var="board" value="${fn:indexOf(url, 'board')}"/>
<c:set var="board_list" value="${fn:indexOf(url, 'board_list')}"/>
<c:set var="board_register" value="${fn:indexOf(url, 'board_register')}"/>

<c:set var="user" value="${fn:indexOf(url, 'user_')}"/>
<c:set var="user_list" value="${fn:indexOf(url, 'user_list')}"/>
<c:set var="user_register" value="${fn:indexOf(url, 'user_register')}"/>

<c:set var="pemtour" value="${fn:indexOf(url, 'pemtour')}"/>

<c:set var="event" value="${fn:indexOf(url, 'event')}"/>
<c:set var="event_list" value="${fn:indexOf(url, 'event_list')}"/>
<c:set var="event_register" value="${fn:indexOf(url, 'event_register')}"/>

<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
        	<%
				pageContext.setAttribute("sessionid", session.getAttribute("id"));
			%>
			          
			<!-- 게시판 -->
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts3" aria-expanded="true" aria-controls="collapseLayouts3">
				팸투어 배너
            </a>
            <div class="collapse <c:if test="${pemtour ne -1}">show</c:if>" id="collapseLayouts3" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${pemtour ne -1}">active</c:if>" href="/pemtour/pemtour_register.do">팸투어 링크 변경</a>
                </nav>
            </div>
            
           
	            
            <!-- 게시판 -->
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="true" aria-controls="collapseLayouts1">
				공지사항
            </a>
            <div class="collapse <c:if test="${board ne -1}">show</c:if>" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${board_register ne -1}">active</c:if>" href="/board/board_register.do">공지사항 등록</a>
                </nav>
            </div>
            
            <div class="collapse <c:if test="${board ne -1}">show</c:if>" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${board_list ne -1}">active</c:if>" href="/board/board_list.do">공지사항 리스트</a>
                </nav>
            </div>
            
             <!-- 이벤트 -->
            <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts4" aria-expanded="true" aria-controls="collapseLayouts4">
				이벤트
            </a>
            <div class="collapse <c:if test="${event ne -1}">show</c:if>" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${event_register ne -1}">active</c:if>" href="/event/event_register.do">이벤트 등록</a>
                </nav>
            </div>
            
            <div class="collapse <c:if test="${board ne -1}">show</c:if>" id="collapseLayouts4" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                <nav class="sb-sidenav-menu-nested nav">
                    <a class="nav-link <c:if test="${event_list ne -1}">active</c:if>" href="/event/event_list.do">이벤트 리스트</a>
                </nav>
            </div>
            
            
            
       		<c:if test="${sessionid eq 'pict' || sessionid eq 'finecom' || sessionid eq 'admin'}">
				<!-- 유저 영역  -->
				<a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="true" aria-controls="collapseLayouts2">
					관리자 정보
	            </a>
	            <div class="collapse <c:if test="${user_register ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link <c:if test="${user_register ne -1}">active</c:if>" href="/user_register.do">관리자 등록</a>
	                </nav>
	            </div>
	            
	            <div class="collapse <c:if test="${user_list ne -1}">show</c:if>" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
	                <nav class="sb-sidenav-menu-nested nav">
	                    <a class="nav-link <c:if test="${user_list ne -1}">active</c:if>" href="/user_list.do">관리자 리스트</a>
	                </nav>
	            </div>
            </c:if>
		</div>
	</div>
</nav>
<script>
	function tttt() {
		alert("준비중입니다.")
	}
</script>

<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/scripts.js"></script>
<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>