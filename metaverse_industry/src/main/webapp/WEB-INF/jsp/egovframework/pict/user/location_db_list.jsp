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
            <a href="/location_db_list.do" class="active">리스트형</a>
            <a href="/location_db_map.do">지도형</a>
        </div>
        <form action="" id="search_fm" name="search_fm" method="get" class="input-container">
            <div class="icon"></div>
           	<input type="text" class="search" id="search_text" name="search_text" placeholder="어떤 장소를 찾으세요?" onkeypress="if(event.keyCode == 13){search();}" value="${pictVO.search_text}">
        </form>
        <ul class="navigator">
            <li class="<c:if test="${pictVO.location_category eq '' || pictVO.location_category eq null || pictVO.location_category eq undefined}">active</c:if>">
                <a href="/location_db_list.do">전체보기</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '1'}">active</c:if>">
                <a href="/location_db_list.do?location_category=1">공공/기관</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '2'}">active</c:if>">
                <a href="/location_db_list.do?location_category=2">관광/공원/카페</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '3'}">active</c:if>">
                <a href="/location_db_list.do?location_category=3">도로/교통</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '7'}">active</c:if>">
                <a href="/location_db_list.do?location_category=7">종교/전통</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '4'}">active</c:if>">
                <a href="/location_db_list.do?location_category=4">숙박시설</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '6'}">active</c:if>">
                <a href="/location_db_list.do?location_category=6">유휴시설</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '5'}">active</c:if>">
                <a href="/location_db_list.do?location_category=5">야외스튜디오</a>
            </li>
            <li class="<c:if test="${pictVO.location_category eq '8'}">active</c:if>">
                <a href="/location_db_list.do?location_category=8">기타</a>
            </li>
        </ul>
        <div class="list-container active">
            <div class="location-container">
            	<c:forEach var="resultList" items="${resultList}" varStatus="status">
	                <a href="/location_view.do?idx=${resultList.idx}" class="location-item">
	                    <div class="img-container">
	                        <img src="http://118.67.128.150${resultList.img_thumb}" alt="" srcset="">
	                    </div>
	                    <span class="type">
	                    	<c:if test="${resultList.location_category eq '1'}">공공/기관</c:if>
	                    	<c:if test="${resultList.location_category eq '2'}">관광/공원/카페</c:if>
	                    	<c:if test="${resultList.location_category eq '3'}">도로/교통</c:if>
	                    	<c:if test="${resultList.location_category eq '4'}">숙박시설</c:if>
	                    	<c:if test="${resultList.location_category eq '5'}">야외 스튜디오</c:if>
	                    	<c:if test="${resultList.location_category eq '6'}">유휴시설</c:if>
	                    	<c:if test="${resultList.location_category eq '7'}">종교/전통</c:if>
	                    	<c:if test="${resultList.location_category eq '8'}">기타</c:if>
	                    </span>
	                    <h6>${resultList.title}</h6>
	                    <p class="hashtag">${resultList.keyword}</p>
	                    <p class="address">${resultList.address}</p>
	                    <p class="tel">${resultList.tel}</p>
	                </a>
                </c:forEach>
            </div>

            <div class="pagination">
                <c:if test="${pictVO.pageNumber ne 1}">
					<a class="first-page page-button" href="/location_db_list.do?search_text=${pictVO.search_text}&location_category=${pictVO.location_category}&pageNumber=1">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
	                        <path d="M11.7266 12L12.6666 11.06L9.61329 8L12.6666 4.94L11.7266 4L7.72663 8L11.7266 12Z"
	                            fill="#242A30" />
	                        <path d="M7.33332 12L8.27332 11.06L5.21998 8L8.27331 4.94L7.33331 4L3.33332 8L7.33332 12Z"
	                            fill="#242A30" />
	                    </svg>
					</a>
			
					<a class="prev-page page-button" href="/location_db_list.do?search_text=${pictVO.search_text}&location_category=${pictVO.location_category}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
	                        <path d="M10.06 12L11 11.06L7.94667 8L11 4.94L10.06 4L6.06 8L10.06 12Z" fill="#242A30" />
	                    </svg>
					</a>
				</c:if>	
					
				<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
					<c:if test="${i eq pictVO.pageNumber}">
						<a class="page-button active" href="/location_db_list.do?search_text=${pictVO.search_text}&location_category=${pictVO.location_category}&pageNumber=${i}" >${i}</a>
					</c:if>
					<c:if test="${i ne pictVO.pageNumber}">
						<a class="page-button" href="/location_db_list.do?search_text=${pictVO.search_text}&location_category=${pictVO.location_category}&pageNumber=${i}" >${i}</a>
					</c:if>
				</c:forEach>	
					
				
				<c:if test="${pictVO.lastPage ne pictVO.pageNumber}">
					<a class="next-page page-button" href="/location_db_list.do?search_text=${pictVO.search_text}&location_category=${pictVO.location_category}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                        <path d="M6.94 4L6 4.94L9.05333 8L6 11.06L6.94 12L10.94 8L6.94 4Z" fill="#242A30" />
                    </svg>
					</a>
					<a class="last-page page-button" href="/location_db_list.do?search_text=${pictVO.search_text}&location_category=${pictVO.location_category}&pageNumber=${pictVO.lastPage}">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
	                        <path d="M4.27325 4L3.33325 4.94L6.38659 8L3.33325 11.06L4.27325 12L8.27325 8L4.27325 4Z"
	                            fill="#242A30" />
	                        <path d="M8.66656 4L7.72656 4.94L10.7799 8L7.72656 11.06L8.66656 12L12.6666 8L8.66656 4Z"
	                            fill="#242A30" />
	                    </svg>
					</a>
				</c:if>

            </div>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script src="/js/user_js/header.js"></script>
	<script>

	

		function search(){
			$("#search_fm").attr("action", "/location_db_list.do");
			$("#search_fm").submit();
		}
	</script>
</body>
</html>