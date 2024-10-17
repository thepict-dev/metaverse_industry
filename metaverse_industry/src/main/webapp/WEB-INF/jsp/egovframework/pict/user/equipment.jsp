<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html>
<meta charset="ko">
<%@ include file="./include/head.jsp" %>
<body>
	<%@ include file="./include/header_sub.jsp" %>
	<%
		String fullUrl = request.getRequestURL().toString();
		String queryString = request.getQueryString();
		pageContext.setAttribute("queryString", queryString);
	%>
	
	
	<!-- 쿼리스트링 파싱 및 'type' 파라미터 확인 -->
	<c:if test="${not empty queryString}">
	    <c:set var="params" value="${fn:split(queryString, '&')}" />
	    <c:forEach items="${params}" var="param">
	        <c:choose>
	                <c:when test="${fn:indexOf(queryString, 'hmd') ne -1}">
	                    <c:set var="isHmd" value="true" />
	                </c:when>
	                <c:when test="${fn:indexOf(queryString, 'ar') ne -1}">
	                    <c:set var="isAr" value="true" />
	                </c:when>
	                <c:when test="${fn:indexOf(queryString, 'motion') ne -1}">
	                    <c:set var="isMotion" value="true" />
	                </c:when>
	                <c:when test="${fn:indexOf(queryString, 'camera') ne -1}">
	                    <c:set var="isCamera" value="true" />
	                </c:when>
	                <c:when test="${fn:indexOf(queryString, 'scanner') ne -1}">
	                    <c:set var="isScanner" value="true" />
	                </c:when>
	                <c:when test="${fn:indexOf(queryString, 'else') ne -1}">
	                    <c:set var="isElse" value="true" />
	                </c:when>
	            </c:choose>
	    </c:forEach>
	</c:if>
	    <div class="subTop rental">
        <div class="subColor">
            <h2>장비대여</h2>
            <p>누구나 이용할 수 있는<br>장비 대여 서비스입니다</p>
        </div>
    </div>
    <div class="subContents rental">
        <div class="rentalCountContainer">
            <p class="rentalListTitle"><button type="button" class="mb"><img src="/img/user_img/list-back.png" alt=""></button>예약 목록</p>
            <div class="rentalSum">
                <p>
                    <span>총<span>4</span>개 기기가 선택되었습니다</span>
                    <span>/최대 4개 기기 선택 가능</span>
                </p>
                <div class="rentalSumButtons">
                    <button type="button" class="mb">상세 보기</button>
                    <button type="button">전체 삭제</button>
                </div>
            </div>
            <ul class="rentalItemsContainer">
                <li class="rentalCountItem">
                    <span><img src="/img/user_img/pro-eye.png" alt=""></span>
                    <div class="itemTexts">
                        <span>HMD</span>
                        <p>HTC Vive pro eye</p>
                        <div class="numInput">
                            <button type="button" class="pr" disabled><span></span></button>
                            <input type="number" name="count_equip" id="count_equip" value="1" min="1" max="4">
                            <button type="button" class="ne"><span></span></button>
                        </div>
                    </div>
                    <button type="button"><img src="/img/user_img/delete.png" alt=""></button>
                </li>
            </ul>
            <div class="rentalDesc">
                <p><span>•</span>기본 하루 대여</p>
                <p><span>•</span>승인완료 후 이용 가능</p>
                <p><span>•</span>이용시간은 09:00~18:00</p>
                <p><span>•</span>점심시간 12:00~13:00 이용불가</p>
            </div>
            <div class="fullButtonContainer rental">
                <a href="/equipment_rental.do" class="bl">예약하기</a>
            </div>
        </div>
        <div class="rentalListContainer">
            <ul class="tabNav rental">
            	
                <li class="<c:if test="${empty queryString}">active</c:if>">
                	<a href="/equipment.do">
	                	모두보기
                	</a>
               	</li>
                <li  class="<c:if test="${isHmd}">active</c:if>">
                	<a href="/equipment.do?type=hmd">
	                	HMD
                	</a>
                </li>
                <li class="<c:if test="${isAr}">active</c:if>">
                	<a href="/equipment.do?type=ar">
                		AR글래스
                	</a>
               	</li>
                <li class="<c:if test="${isMotion}">active</c:if>">
                	<a href="/equipment.do?type=motion">
                		모션캡처
                	</a>
               	</li>
                <li class="<c:if test="${isCamera}">active</c:if>">
                	<a href="/equipment.do?type=camera">
	                	360카메라
                	</a>
               	</li>
                <li class="<c:if test="${isScanner}">active</c:if>">
                	<a href="/equipment.do?type=scanner">
                		3D스캐너
                	</a>
                </li>
                <li class="<c:if test="${isElse}">active</c:if>">
                	<a href="/equipment.do?type=else">
                		기타
                	</a>
                </li>
            </ul>
            <div class="tabInner active">
                <ul class="rentalItemList">
			    <c:forEach var="item" items="${resultList}" varStatus="status">
			        <li>
			            <input type="checkbox" name="equip" id="equip_${item.idx}">
			            <label for="equip_${item.idx}"></label>
			            <div class="checkItem">
			                <div class="itemImg">
			                    <img src="${item.image_url}" alt="">
			                    <span></span>
			                    <a href="#lnk"><img src="/img/user_img/bag.png" alt=""></a>
			                </div>
			                <div class="itemTitles">
			                    <span>${item.type}</span>
			                    <p>${item.name}</p>
			                </div>
			                <p>${item.description}</p>
			            </div>
			        </li>
			    </c:forEach>
			</ul>
            </div>
            <div class="tabInner"></div>
            <div class="tabInner"></div>
            <div class="tabInner"></div>
            <div class="tabInner"></div>
            <div class="tabInner"></div>
            <div class="tabInner"></div>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
    <script>
        const rentalCountContainer = document.querySelector('.rentalCountContainer');
        const rentalListContainer = document.querySelector('.rentalListContainer');
        const checkboxes = document.querySelectorAll('.rentalItemList input[type="checkbox"]');
        const decreaseBtn = document.querySelector('.numInput .pr');
        const increaseBtn = document.querySelector('.numInput .ne');
        const input = document.querySelector('.numInput input');

        // 체크박스 선택 active
        const updateContainerClasses = () => {
            const isAnyChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
            [rentalCountContainer, rentalListContainer].forEach(container => {
                container.classList.toggle('active', isAnyChecked);
            });
        };

        // 수량 업뎃
        const updateButtonStates = () => {
            const value = parseInt(input.value);
            decreaseBtn.disabled = value <= parseInt(input.min);
            increaseBtn.disabled = value >= parseInt(input.max);
        };

        // 수량 변경
        const changeQuantity = (delta) => {
            const newValue = parseInt(input.value) + delta;
            if (newValue >= parseInt(input.min) && newValue <= parseInt(input.max)) {
                input.value = newValue;
                updateButtonStates();
            }
        };

        // 이벤트 리스너
        checkboxes.forEach(checkbox => checkbox.addEventListener('change', updateContainerClasses));
        decreaseBtn.addEventListener('click', () => changeQuantity(-1));
        increaseBtn.addEventListener('click', () => changeQuantity(1));
        input.addEventListener('input', updateButtonStates);

        // 초기화
        updateContainerClasses();
        updateButtonStates();

        // 상세 보기 버튼 클릭 이벤트
        const detailViewBtn = document.querySelector('.rentalSumButtons .mb');
        detailViewBtn.addEventListener('click', () => {
            rentalCountContainer.classList.add('show');
        });

        // 뒤로 가기 버튼 클릭 이벤트
        const backBtn = document.querySelector('.rentalListTitle .mb');
        backBtn.addEventListener('click', () => {
            rentalCountContainer.classList.remove('show');
        });

    </script>
    <script src="/js/sub.js"></script>
</body>
</html>