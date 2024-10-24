<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<meta charset="ko">
<%@ include file="./include/head.jsp" %>
<body>
	<%@ include file="./include/header.jsp" %>
    <div class="loginTitle book">
        <h2><a href="/facility.do"><img src="/img/user_img/back-grey.png" alt=""></a>시설 예약</h2>
    </div>
    <div class="loginWrapper book">
        <form action="">
            <div class="bookingWrapper">
                <h3 class="subTitles"><span>01</span> 시설 대여일/반납일을 선택해주세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner equip">
                        <div class="equipLists">
                            <p class="bookingTitle">시설 목록</p>
                            <ul class="equipList">
                                <c:forEach var="equipment" items="${resultList}"
                                   varStatus="status">
                                   <li data-id="${equipment.id}"
                                       data-cnt="${equipment.count}">
                                       <!-- <input type="checkbox" name="booking" id="booking_${equipment.id}" class="booking-checkbox"> -->
                                       <!-- <div class="equipment-status"></div> -->
                                       <span class="checkBox"></span>
                                       <div class="checkItem list">
                                           <div class="itemTitles">
                                               <p><span>${equipment.name}</span></p>
                                           </div>
                                       </div>
                                       <a href="#lnk"><img src="/img/user_img/delete2.png"
                                               alt=""></a>
                                   </li>
                               </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="bookingInner date">
                    	<div class="disable-calendar">
                          <p>좌측 시설을 선택하고<br /> 대여일/반납일을 선택해주세요</p>
                       	</div>
                        <p class="bookingTitle">대여일/반납일 선택</p>
                        <div class="dateContainer">
                            <div id="datepicker"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bookingWrapper step-02 blind">
                <h3 class="subTitles"><span>02</span> 예약하신 시설 정보를 확인해주세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner">
                        <p class="bookingTitle">대여시설 확인</p>
                        <ul class="dateResultLists">
                            
                        </ul>
                    </div>
                </div>
            </div>
            <div class="bookingWrapper step-03 blind">
                <h3 class="subTitles"><span>03</span> 대여 형태를 선택해주세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner">
                        <p class="bookingTitle">대여형태 선택</p>
                        <div class="radioWrapper">
                            <input type="radio" name="option" id="individual">
                            <label for="individual">
                                개인
                            </label>
                            <input type="radio" name="option" id="company">
                            <label for="company">
                                기업
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bookingWrapper addIndiv" style="display: none;">
                <h3 class="subTitles"><span>04</span> 추가 정보를 입력하세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner">
                        <p class="bookingTitle">추가정보 입력</p>
                        <div class="joinFormWrapper">
                        	<div class="inputContainer">
                                <p class="inputCaption">시설사용계획</p>
                                <textarea class="equipment-plan" name="" id=""
                                    placeholder="시설 사용 계획을 상세히 적어주세요."></textarea>
                            </div>
                            <div class="inputContainer">
                                <p class="inputCaption">증빙서류 첨부</p>
                                <div class="flexInputs file">
                                    <p class="fileName1"></p>
                                    <label for="file1" id="attach_file1">파일추가</label>
                                    <input type="file" id="file1" style="display: none;">
                                    <button type="button" id="deleteButton1" style="display: none;"><img src="/img/user_img/del-file.png" alt=""></button>
                                </div>
                                <!-- <p class="fileSub">장비사용계획서를 제출하세요</p> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bookingWrapper addCompany" style="display: none;">
                <h3 class="subTitles"><span>04</span> 추가 정보를 입력하세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner">
                        <p class="bookingTitle">추가정보 입력</p>
                        <div class="joinFormWrapper">
                            <div class="inputContainer">
                                <p class="inputCaption">회사명</p>
                                <input type="text" name="" id="" placeholder="회사명을 입력하세요">
                            </div>
                            <div class="inputContainer">
                                <p class="inputCaption">사업자등록번호</p>
                                <input type="text" name="" id="" placeholder="사업자등록번호를 입력하세요">
                            </div>
                            <div class="inputContainer">
                                <p class="inputCaption">직책</p>
                                <input type="text" name="" id="" placeholder="직책을 입력하세요">
                            </div>
                            <div class="inputContainer">
                                <p class="inputCaption">사업장주소*</p>
                                <div class="flexInputs">
                                    <input type="text" name="company_address1" id="company_address1" readonly placeholder="주소를 입력하세요">
                                    <a href="#lnk" id="search_add2">주소검색</a>
                                </div>
                                <input type="text" name="company_address2" id="company_address2">
                            </div>
                            <div class="inputContainer">
                                <p class="inputCaption">증빙서류 첨부</p>
                                <div class="flexInputs file">
                                    <p class="fileName2"></p>
                                    <label for="file2" id="attach_file2">파일추가</label>
                                    <input type="file" id="file2" style="display: none;">
                                    <button type="button" id="deleteButton2" style="display: none;"><img src="/img/user_img/del-file.png" alt=""></button>
                                </div>
                                <p class="fileSub">사업자등록증을 제출하세요</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fullButtonContainer">
                <a href="#lnk" class="wt normal booking" id="bookingButton">예약하기</a>
            </div>
        </form>
    </div>
	<%@ include file="./include/footer.jsp" %>
    <div class="modalContainer" id="confirmModal">
        <div class="modalInner">
            <button type="button"><img src="/img/user_img/close-modal.png" alt=""></button>
            <div class="modalContents">
                <div class="modalTitles">
                    <p>예약하시겠습니까?</p>
                    <span>아래 예약 정보를 확인하시고<br>‘예약하기’ 버튼을 눌러주세요</span>
                </div>
                <div class="infoSlides">
                    <div class="swiper">
                        <div class="swiper-wrapper">
                            <!-- <div class="swiper-slide">
                                <ul class="bookingInfolists">
                                    <li>
                                        <p>장비명</p>
                                        <span>Oculus Quest2 / 1대</span>
                                    </li>
                                    <li>
                                        <p>대여자명</p>
                                        <span>이유리</span>
                                    </li>
                                    <li>
                                        <p>대여형태</p>
                                        <span>기업</span>
                                    </li>
                                    <li>
                                        <p>회사명</p>
                                        <span>주식회사 더픽트</span>
                                    </li>
                                    <li>
                                        <p>사업자등록번호</p>
                                        <span>779-86-00871</span>
                                    </li>
                                    <li>
                                        <p>직책</p>
                                        <span>팀장</span>
                                    </li>
                                    <li>
                                        <p>주소</p>
                                        <span>강원특별자치도 춘천시 효자로 144 픽트</span>
                                    </li>
                                    <li>
                                        <p>대여일</p>
                                        <span>2024.8.13.화</span>
                                    </li>
                                    <li>
                                        <p>반납일</p>
                                        <span>2024.8.13.화</span>
                                    </li>
                                </ul>
                            </div> -->
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                <ul class="modalDesc">
                    <li>
                        <span>•</span>
                        <p>제출서류 확인 필수</p>
                    </li>
                    <li>
                        <span>•</span>
                        <p>현장방문 시 대여자 본인 신분증 지참 필수</p>
                    </li>
                    <li>
                        <span>•</span>
                        <p>장비 대여 및 반납시 방문전 033-245-6313으로 연락 부탁드립니다.</p>
                    </li>
                </ul>
                <div class="checkConfirm">
                    <input type="checkbox" name="agree" id="agree" class="checkOnly">
                    <label for="agree">시설·장비 사용 안내 및 유의사항을 확인하였습니다</label>
                </div>
            </div>
            <div class="fullButtonContainer conirmBtn">
                <a href="#lnk" class="bl" id="setButton">예약하기</a>
            </div>
        </div>
    </div>
    <div class="modalContainer" id="checkModal">
        <div class="modalInner">
            <button type="button"><img src="/img/user_img/close-modal.png" alt=""></button>
            <div class="modalContents">
                <div class="modalTitles">
                    <p>예약이 완료되었습니다.</p>
                    <span>신청하신 대여/반납일에 <span>방문하시어</span><br>장비를 대여/반납하시기 바랍니다</span>
                </div>
                <div class="infoSlides">
                    
                </div>
                <ul class="modalDesc">
                    <li>
                        <span>•</span>
                        <p>제출서류 확인 필수</p>
                    </li>
                    <li>
                        <span>•</span>
                        <p>현장방문 시 대여자 본인 신분증 지참 필수</p>
                    </li>
                    <li>
                        <span>•</span>
                        <p>장비 대여 및 반납시 방문전 033-245-6313으로 연락 부탁드립니다.</p>
                    </li>
                </ul>
            </div>
            <div class="fullButtonContainer conirmBtn">
                <a href="/mypage_facil.do" class="bl">마이페이지</a>
            </div>
        </div>
    </div>

    <script>

	    const user_name = "<%=session.getAttribute("name")%>";
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="/js/rental_facility.js"></script>
</body>
</html>