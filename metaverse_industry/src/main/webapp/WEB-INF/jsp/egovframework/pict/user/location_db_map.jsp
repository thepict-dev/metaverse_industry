<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<meta charset="ko">
<%@ include file="./include/head.jsp" %>
<link rel="stylesheet" href="/css/user_css/location-db.css">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d776bb34a08483e971b1a5e18e0b065&libraries=services"></script>
<body>
	<%@ include file="./include/header.jsp" %>
    <div class="visual-section">
        <div class="opacity-back"></div>
        <div class="content">
            <h2>로케이션DB</h2>
            <h1>누구나 쉽게 장소를 섭외할 수 있도록<br />제작자의 입장에서 엄선한 로케이션입니다</h1>
        </div>
    </div>
    <div class="main-section">
        <div class="toggle-container">
            <a href="location_db_list.do">리스트형</a>
            <a href="location_db_map.do" class="active">지도형</a>
        </div>
        <ul class="navigator">
            <li class="<c:if test="${pictVO.location_category eq '' || pictVO.location_category eq null || pictVO.location_category eq undefined}">active</c:if>">
                <a href="/location_db_map.do">전체보기</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '1'}">active</c:if>">
                <a href="/location_db_map.do?location_category=1">공공/기관</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '2'}">active</c:if>">
                <a href="/location_db_map.do?location_category=2">관광/공원/카페</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '3'}">active</c:if>">
                <a href="/location_db_map.do?location_category=3">도로/교통</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '7'}">active</c:if>">
                <a href="/location_db_map.do?location_category=7">종교/전통</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '4'}">active</c:if>">
                <a href="/location_db_map.do?location_category=4">숙박시설</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '6'}">active</c:if>">
                <a href="/location_db_map.do?location_category=6">유휴시설</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '5'}">active</c:if>">
                <a href="/location_db_map.do?location_category=5">야외스튜디오</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '8'}">active</c:if>">
                <a href="/location_db_map.do?location_category=8">기타</a>
            </li>
        </ul>
        <div class="map-container">
            <div class="map"></div>
        </div>
    </div>
    
	<%@ include file="./include/footer.jsp" %>
	<script src="/js/user_js/header.js"></script>
	<script>

		$.getScript("/js/user_js/location-db.js", function() {
			
			var arr = '${jsonArr}'
			
	        globalVar = JSON.parse(arr)
        	logGlobalVar()
	        
	    }).fail(function (a,b,c){
	    	console.log(a)
	    	console.log(b)
	    	console.log(c)
	    })
		
	</script>
	
</body>
</html>