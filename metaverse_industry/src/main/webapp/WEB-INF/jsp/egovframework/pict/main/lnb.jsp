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


<!--  장비 등록 -->
<c:set var="equipment_list" value="${fn:indexOf(url, 'equipment_list')}"/>
<c:set var="equipment_register" value="${fn:indexOf(url, 'equipment_register')}"/>
<c:set var="equipment_cnt_register" value="${fn:indexOf(url, 'equipment_cnt_register')}"/>
<c:set var="equipment_history" value="${fn:indexOf(url, 'history/history_list')}"/>
<c:set var="manage_rental" value="${fn:indexOf(url, 'manage_rental')}"/>
<c:set var="facility_list" value="${fn:indexOf(url, 'facility_list')}"/>
<c:set var="facility_register" value="${fn:indexOf(url, 'facility_register')}"/>
<c:set var="facility_history_list" value="${fn:indexOf(url, 'facility_history_list')}"/>
<c:set var="board_list" value="${fn:indexOf(url, 'board_list')}"/>
<c:set var="board_register" value="${fn:indexOf(url, 'board_register')}"/>

<c:set var="manage_education" value="${fn:indexOf(url, 'manage_education')}"/>
<c:set var="manage_education_detail" value="${fn:indexOf(url, 'manage_education_detail')}"/>

<c:set var="user_list" value="${fn:indexOf(url, 'user_list')}"/>
<c:set var="popup_list" value="${fn:indexOf(url, 'popup_list')}"/>

<c:set var="popup_form" value="${fn:indexOf(url, 'popup_form')}"/>
<c:set var="settings" value="${fn:indexOf(url, 'settings')}"/>

<c:set var="biz_list" value="${fn:indexOf(url, 'biz_list')}"/>
<c:set var="biz_register" value="${fn:indexOf(url, 'biz_register')}"/>

<div class="lnb">
    <nav>
        <div class="nav">
            <div class="depth1 <c:if test="${equipment_list ne -1 || equipment_register ne -1 || equipment_cnt_register ne -1 || equipment_history ne -1 || manage_rental ne -1 || facility_list ne -1 || facility_register ne -1 || facility_history_list ne -1 || manage_education ne -1 || manage_education_detail ne -1}">active</c:if>">
               <span><img src="/img/admin/lnb_icons/lnb-category.png" alt=""></span>
               <a href="#lnk">자산 관리<span><img src="/img/admin/lnb_icons/lnb-arr.png" alt=""></span></a>
           </div>
           <ul class="depth2">
               <li><span>장비 관리</span></li>
               <li class="<c:if test="${equipment_list ne -1}">active</c:if>"><a href="/equipment/equipment_list.do">- 장비 목록</a></li>
               <li class="<c:if test="${equipment_history ne -1}">active</c:if>"><a href="/history/history_list.do">- 장비대여 관리대장</a></li>
               <li class="<c:if test="${manage_rental ne -1}">active</c:if>"><a href="/manage/manage_rental.do">- 대여/반납처리</a></li>
               <li><span>시설 관리</span></li>
               <li class="<c:if test="${facility_list ne -1}">active</c:if>"><a href="/facility/facility_list.do">- 시설 목록</a></li>
               <li class="<c:if test="${facility_history_list ne -1}">active</c:if>"><a href="/facility/facility_history_list.do">- 시설대여 관리대장</a></li>
          	   <li><span>교육 관리</span></li>
               <li class="<c:if test="${manage_education ne -1}">active</c:if>"><a href="/education/manage_education.do">- 신청 목록</a></li>
           </ul>
        	<div class="depth1 <c:if test="${user_list ne -1}">active</c:if>">
               <span><img src="/img/admin/lnb_icons/user.png" alt=""></span>
               <a href="#lnk">사용자<span><img src="/img/admin/lnb_icons/lnb-arr.png" alt=""></span></a>
           </div>
           <ul class="depth2">
          	   <li><span>사용자 관리</span></li>
               <li class="<c:if test="${user_list ne -1}">active</c:if>"><a href="/user_list/user_list.do">- 사용자 목록</a></li>
           </ul>
            
        	<div class="depth1 <c:if test="${popup_list ne -1 || popup_form ne -1}">active</c:if>">
               <span><img src="/img/admin/lnb_icons/lnb-popup.png" alt=""></span>
               <a href="#lnk">팝업존<span><img src="/img/admin/lnb_icons/lnb-arr.png" alt=""></span></a>
           </div>
           <ul class="depth2">
          	   <li><span>팝업 관리</span></li>
               <li class="<c:if test="${popup_list ne -1 || popup_form ne -1}">active</c:if>"><a href="/popup/popup_list.do">- 팝업 리스트</a></li>
           </ul>
           
            
        	
            
        	<div class="depth1 <c:if test="${board_list ne -1 || board_register ne -1 || biz_list ne -1 || biz_register ne -1}">active</c:if>">
               <span><img src="/img/admin/lnb_icons/board.png" alt=""></span>
               <a href="#lnk">게시물<span><img src="/img/admin/lnb_icons/lnb-arr.png" alt=""></span></a>
           </div>
           <ul class="depth2">
          	   <li><span>알림마당</span></li>
               <li class="<c:if test="${board_list ne -1}">active</c:if>"><a href="/board/board_list.do">- 공지사항</a></li>
               <li class="<c:if test="${biz_list ne -1}">active</c:if>"><a href="/biz_post/biz_list.do">- 사업공고</a></li>
           </ul>
           
           <div class="depth1 <c:if test="${settings ne -1}">active</c:if>">
               <span><img src="/img/admin/lnb_icons/lnb-filter.png" alt=""></span>
               <a href="#lnk">설정<span><img src="/img/admin/lnb_icons/lnb-arr.png" alt=""></span></a>
           </div>
           <ul class="depth2">
          	   <li><span>홈페이지</span></li>
               <li class="<c:if test="${settings ne -1}">active</c:if>"><a href="/setting/settings.do">- 링크설정</a></li>
           </ul>
           
            <%-- <div class="depth1 <c:if test="${event_list ne -1 || event_register ne -1}">active</c:if>">
                <span><img src="/img/admin/lnb_icons/lnb-event.png" alt=""></span>
                <a href="#lnk">행사 관리<span><img src="/img/admin/lnb_icons/lnb-arr.png" alt=""></span></a>
            </div>
            <ul class="depth2">
                <li class="<c:if test="${event_list ne -1}">active</c:if>"><a href="/event/event_list.do">행사 리스트</a></li>
                <li class="<c:if test="${event_register ne -1}">active</c:if>"><a href="/event/event_register.do">행사 등록</a></li>
            </ul>
            
            <div class="depth1 <c:if test="${course_list ne -1 || course_register ne -1}">active</c:if>">
                <span><img src="/img/admin/lnb_icons/lnb-coarse.png" alt=""></span>
                <a href="#lnk">코스 관리<span><img src="/img/admin/lnb_icons/lnb-arr.png" alt=""></span></a>
            </div>
            <ul class="depth2">
                <li class="<c:if test="${course_list ne -1}">active</c:if>"><a href="/course/course_list.do">코스 리스트</a></li>
                <li class="<c:if test="${course_register ne -1}">active</c:if>"><a href="/course/course_register.do">코스 등록</a></li>
            </ul> --%>
        </div>
    </nav>
</div>

<script>
	function tttt() {
		alert("준비중입니다.")
	}
</script>

<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/scripts.js"></script>
<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>