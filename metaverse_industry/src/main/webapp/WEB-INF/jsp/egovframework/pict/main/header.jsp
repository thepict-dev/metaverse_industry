<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
		pageContext.setAttribute("name", session.getAttribute("name"));
		pageContext.setAttribute("depart", session.getAttribute("depart"));

		
	%>
<div class="header">
    <div class="headerTop">
        <h1 class="active"><a href="/"></a></h1>
        <div class="headerInner">
            <p class="proTitle">강원 메타버스 지원센터 관리자 페이지</p>
            <div class="profileWrap">
                <div class="profile">
                    <div class="profileTexts">
                        <p>${name}</p>
                        <!-- <span>클라이언트명<span>•</span>관리자</span> -->
                        <span>${depart }</span>
                    </div>
                </div>
                <div class="topBtns">
                    <a href="#lnk" onclick="fn_logout()"><img src="/img/admin/logout.png" alt="">로그아웃</a>
                    <!-- <a href="">홈페이지 바로가기</a> -->
                </div>
            </div>
        </div>
    </div>
    <div class="breadCrumb">
        <ul class="crumb">
            <li>${param.title}</li>
            <li>${param.subtitle}</li>
        </ul>
    </div>
</div>


<script>
	function fn_logout() {
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="/logout.do"
		}
	}
</script>