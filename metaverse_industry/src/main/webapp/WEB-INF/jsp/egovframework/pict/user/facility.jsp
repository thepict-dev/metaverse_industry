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
<style>
.add_bag.active {
    border: 2px solid #03B635;
	background: rgba(3, 182, 53, 0.10);
}
</style>
<body>
	<%@ include file="./include/header_sub.jsp" %>
    <div class="subContents rental facil">
        <div class="rentalCountContainer">
            <p class="rentalListTitle"><button type="button" class="mb"><img src="/img/user_img/list-back.webp" alt=""></button>예약 목록</p>
            <div class="rentalSum">
                <p>
                    <span>총<span class="selectedCnt">4</span>곳의 시설이 선택되었습니다</span>
                    <span>/최대 2곳 선택 가능</span>
                </p>
                <div class="rentalSumButtons">
                    <button type="button" class="mb">상세 보기</button>
                    <button class="removeAll" type="button">전체 삭제</button>
                </div>
            </div>
            <ul class="rentalItemsContainer">
            </ul>
            <div class="rentalDesc">
                <p><span>•</span>기본 하루 대여</p>
                <p><span>•</span>승인완료 후 이용 가능</p>
                <p><span>•</span>이용시간은 09:00~18:00</p>
                <p><span>•</span>점심시간 12:00~13:00 이용불가</p>
            </div>
            <div class="fullButtonContainer rental">
                <button class="bl rentalSubmit">예약하기</button>
            </div>
        </div>
        <div class="rentalListContainer facil">
            <div class="tabInner active">
                <ul class="rentalItemList fa">
			    <c:forEach var="item" items="${resultList}" varStatus="status">
			        <li data-id="${item.id}" data-cnt="${item.avaliable_equipment_cnt}">
			            <input type="checkbox" name="equip" id="equip_${item.idx}">
			            <label for="equip_${item.idx}"></label>
			            <div class="checkItem">
			                <div class="itemImg">
			                    <img src="${item.image_url}" alt="">
			                    <span></span>
			                    <a href="#lnk" data-id="${item.id}" class="add_bag <c:if test="${item.isLike eq '1'}">active</c:if>"><img src="/img/user_img/bag.webp" alt=""></a>
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
        </div>
    </div>
	<input type="hidden" name="role" value="${role}">
	<script>
		$( document ).ready(function() {
		    if($('input[name=role]').val() == 'ADMIN') {
			    if (window.confirm("현재 관리자로 로그인 중입니다. 로그아웃 하시겠습니까?")) {
		        	location.href = "/user_logout.do";
			    } else {
			        window.alert('취소 버튼을 클릭했습니다.');
			    }
		    }
		});
	</script>
	<%@ include file="./include/footer.jsp" %>
	<script src="/js/facility.js"></script>
    <script src="/js/sub.js"></script>
</body>
</html>