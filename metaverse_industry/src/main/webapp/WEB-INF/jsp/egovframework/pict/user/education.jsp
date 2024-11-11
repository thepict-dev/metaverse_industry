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
	<%@ include file="./include/header_sub.jsp" %>
    <div class="subTop meta">
        <div class="subColor">
            <h2>현장체험교육</h2>
            <p> 메타버스 산업의 이해를 높이기 위한<br>무료 체험 교육입니다</p>
           	<div class="scroll">Scroll Down<img src="/img/user_img/down.png" alt=""></div>
        </div>
    </div>
    <div class="subContents">
        <h3 class="subTextTitle">메타버스 현장체험교육</h3>
        <div class="textsContentWrapper">
            <div class="subTextContents">
                <h4 class="textTitle">사용자 범위</h4>
                <div class="textsContent">
                    <!-- <p class="textsContentTitle">누구나 신청가능(보호자1인+아동1인, 2인1조로 체험)</p> -->
                    <p class="textsContentTitle">강원지역 초·중·고등학생(초등학생 4학년 이상 가능)</p>
                </div>
            </div>
            <div class="subTextContents">
                <h4 class="textTitle">교육 내용</h4>
                <div class="textsContent">
                	<p><span>시설·장비 시연 (1시간)</span></p>
                    <p><span>버츄얼유튜버 체험 (2시간)</span></p>
                    <p><span>모션캡쳐 체험 (2시간)</span></p>
                </div>
            </div>
            <div class="subTextContents">
                <h4 class="textTitle">운영시간</h4>
                <div class="textsContent">
                    <p class="textsContentTitle">교육기관을 통한 일정협의</p>
                </div>
            </div>
            <div class="subTextContents">
                <h4 class="textTitle">장소</h4>
                <div class="textsContent">
                    <p class="textsContentTitle">강원 메타버스 지원 센터(강원특별자치도 춘천시 서면 박사로 854 창작발전소(뒷 건물) 1층)</p>
                </div>
            </div>
            <div class="subTextContents">
                <h4 class="textTitle">추진절차</h4>
                <ul class="boxContent meta">
                    <li>온라인신청</li>
                    <li>승인대기</li>
                    <li>승인완료</li>
                </ul>
            </div>
            <div class="subTextContents">
                <h4 class="textTitle">사업내용</h4>
                <div class="textsContent">
                    <!-- <p><span>2인 1조(보호자1명 + 아이1명)으로 버츄얼유튜버 혹은 모션캡쳐 체험을 하실 수 있습니다.</span></p> -->
                    <p><span>체험 비용 무료 (회당 최대 12명)</span></p>
                    <p><span>문의사항은 033-245-6315로 연락바랍니다.</span></p>
                </div>
            </div>
        </div>
        <a href="#lnk" class="openModalBtn">신청하러가기 <img src="/img/user_img/arrow-right.png" alt=""></a>
    </div>
    <div class="modalContainer" id="eduModal">
        <div class="myModalInner">
            <div class="modalTop">
                <p>강원 메타버스 지원센터 현장체험교육 참가신청서</p>
                <button type="button" class="closeModalBtn"><img src="/img/user_img/close-modal2.png" alt=""></button>
            </div>
            <div class="modalBottom">
                <div class="joinFormWrapper">
                    <div class="inputContainer">
                        <p class="inputCaption">단체명</p>
                        <input type="text" name="team" id="team" placeholder="단체명을 입력하세요">
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">주소</p>
                        <div class="flexInputs">
                            <input type="text" name="address1" id="address1" readonly placeholder="주소를 입력하세요">
                            <a href="#lnk" id="search_add1">주소검색</a>
                        </div>
                        <input type="text" name="address2" id="address2" style="display : none;">
                    </div>
                    <div class="flexInputs deoble">
	                    <div class="inputContainer">
	                        <p class="inputCaption">연락처</p>
	                        <input type="text" name="tel" id="tel" placeholder="연락처를 입력하세요">
	                    </div>
	                    <div class="inputContainer">
	                        <p class="inputCaption">직책</p>
	                        <input type="text" name="position" id="position" placeholder="직책을 입력하세요">
	                    </div>
                    </div>
                    <div class="flexInputs deoble">
	                    <div class="inputContainer">
	                        <p class="inputCaption">전화번호</p>
	                        <input type="text" name="mobile" id="mobile" placeholder="전화번호를 입력하세요">
	                    </div>
	                    <div class="inputContainer">
	                        <p class="inputCaption">이메일</p>
	                        <input type="text" name="email" id="email" placeholder="이메일을 입력하세요">
	                    </div>
                    </div>
                    <div class="flexInputs deoble">
	                    <div class="inputContainer">
	                        <p class="inputCaption">신청교육</p>
							
                            <div class="radio-container">
                                <label class="custom" for="type_1">
                                    <input type="radio" id="type_1" name="type" value="1">
                                    <div class="custom-radio"></div>
                                    <span>견학형</span>
                                </label>
                                <label class="custom" for="type_2">
                                    <input type="radio" id="type_2" name="type" value="2">
                                    <div class="custom-radio"></div>
                                    <span>실습형-버츄얼 유튜버</span>
                                </label>
                                <label class="custom" for="type_3">
                                    <input type="radio" id="type_3" name="type" value="3">
                                    <div class="custom-radio"></div>
                                    <span>실습형-모션캡처</span>
                                </label>
                            </div>
	                    </div>
	                    <div class="inputContainer">
	                        <p class="inputCaption">참여인원</p>
                    		<div class="flexInputs sm">
	                        	<input type="text" name="totalCnt" id="totalCnt" placeholder="회당 12명 기준">
								<span>명</span>
							</div>
	                    </div>
                    </div>
                    <div class="flexInputs deoble">
	                    <div class="inputContainer">
	                        <p class="inputCaption">희망일시</p>
                    		<div class="flexInputs">
	                        	<input type="date" name="visit_date" id="visit_date">
							</div>
                        </div>
	                    <div class="inputContainer">
	                        <p class="inputCaption">교육생</p>
                    		<div class="flexInputs">
	                    		<div class="flexInputs xsm">
		                        	<input type="text" name="school" id="school" placeholder="학교명을 입력하세요.">
									<span>학교</span>
								</div>
	                    		<div class="flexInputs xsm">
		                        	<input type="text" name="grade" id="grade" placeholder="학년을 입력하세요.">
									<span>학년</span>
								</div>
							</div>
	                    </div>
                    </div>
                </div>
                <div class="checkConfirm edu1">
                    <input type="checkbox" name="agree1" id="agree1" class="checkOnly" />
                    <label for="agree1">고유식별정보, 개인식별정보 등 수집 동의</label>
                </div>
                <div class="checkConfirm edu2">
                    <input type="checkbox" name="agree2" id="agree2" class="checkOnly" />
                    <label for="agree2">제3자 정보제공 동의</label>
                </div>
                <div class="fullButtonContainer edu">
                    <a href="#lnk" class="wt normal closeModalBtn">신청취소</a>
                    <a href="#lnk" class="gd normal submit-form">신청하기</a>
                </div>
            </div>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/js/sub.js"></script>
	<script>
		const isLogin = <%= session.getAttribute("id") != null %>;
	    const eduModal = document.querySelector('#eduModal');  // 모달 요소
	    const openModalBtn = document.querySelector('.openModalBtn');  // 모달을 여는 버튼
	    const closeModalBtns = document.querySelectorAll('.closeModalBtn');  // 모달을 닫는 버튼들
	
	    // 모달 열기
	    openModalBtn.addEventListener('click', () => {
	    	if (!isLogin) {
	    		return window.alert("로그인 후 이용가능한 서비스입니다.");
	    	}
	        eduModal.classList.add('active');
	        document.body.classList.add('no-scroll');  // body에 no-scroll 클래스 추가
	        lenis.stop();  // Lenis 비활성화
	    });
	
	    // 모달 닫기
	    closeModalBtns.forEach(btn => {
	        btn.addEventListener('click', () => {
	            eduModal.classList.remove('active');
	            document.body.classList.remove('no-scroll');  // body에서 no-scroll 클래스 제거
	            lenis.start();  // Lenis 활성화
	        });
	    });
	
	    // 모달 내부 스크롤 처리
	    eduModal.addEventListener('wheel', (e) => {
	        e.stopPropagation();
	    }, { passive: false });
	
	    // 모달이 열려있을 때 body 스크롤 방지
	    document.body.addEventListener('wheel', (e) => {
	        if (eduModal.classList.contains('active')) {
	            e.preventDefault();
	        }
	    }, { passive: false });
	</script>
	<script src="/js/education.js"></script>
</body>
</html>