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
    <div class="loginTitle">
        <h2>마이페이지</h2>
    </div>
    <ul class="tabNav">
        <li class="active"><a href="/mypage_account.do">계정 관리</a></li>
        <li><a href="/mypage_equip.do">장비 예약정보</a></li>
        <li><a href="/mypage_facil.do">시설 예약정보</a></li>
        <li><a href="/mypage_bag.do">장바구니</a></li>
    </ul>
    <div class="tabInner loginWrapper active">
        <form action="">
            <div class="joinContainer">
                <p class="joinTitle">기본 정보</p>
                <div class="joinFormWrapper">
                    <div class="inputContainer">
                        <p class="inputCaption">이름*</p>
                        <span class="bindingText">한지현</span>
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">연락처*</p>
                        <span class="bindingText">010-9409-0699</span>
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">이메일*</p>
                        <span class="bindingText">korpaper@pict.kr</span>
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">생년월일*</p>
                        <span class="bindingText">1994-09-24</span>
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">주소*</p>
                        <span class="bindingText">강원특별자치도 춘천시</span>
                    </div>
                </div>
            </div>
            <div class="fullButtonContainer my">
                <a href="#lnk" class="wt normal" id="basicModeButton">수정하기</a>
            </div>
            <div class="joinContainer">
                <div class="joinContainer">
                    <div class="titleTooltip">
                        <p class="joinTitle">근무지 정보</p>
                    </div>
                    <div class="joinFormWrapper">
                        <div class="inputContainer">
                            <p class="inputCaption">회사명</p>
                            <span class="bindingText">더픽트</span>
                        </div>
                        <div class="inputContainer">
                            <p class="inputCaption">사업자등록번호</p>
                            <span class="bindingText">151-56-00271</span>
                        </div>
                        <div class="inputContainer">
                            <p class="inputCaption">직책</p>
                            <span class="bindingText">사장</span>
                        </div>
                        <div class="inputContainer">
                            <p class="inputCaption">사업장주소*</p>
                            <span class="bindingText">픽트스퀘어</span>
                        </div>
                        <div class="inputContainer">
                            <p class="inputCaption">증빙서류 첨부</p>
                            <span class="fileText">픽트스퀘어.pdf</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fullButtonContainer">
                <a href="#lnk" class="wt normal" id="addModeButton">수정하기</a>
            </div>
        </form>
    </div>
    <div class="modalContainer" id="modifyBasic">
        <div class="myModalInner">
            <div class="modalTop">
                <p>기본 정보 수정하기</p>
                <button type="button"><img src="/img/user_img/close-modal2.png" alt=""></button>
            </div>
            <div class="modalBottom">
                <div class="joinFormWrapper">
                    <div class="inputContainer">
                        <p class="inputCaption">이름*</p>
                        <input type="text" name="" id="" placeholder="이름을 입력하세요">
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">연락처*</p>
                        <input type="text" name="" id="" placeholder="연락처를 입력하세요">
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">이메일*</p>
                        <input type="text" name="" id="" placeholder="이메일을 입력하세요">
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">생년월일*</p>
                        <input type="text" name="" id="" placeholder="생년월일을 입력하세요">
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">주소*</p>
                        <div class="flexInputs">
                            <input type="text" name="user_address1" id="user_address1" readonly placeholder="주소를 입력하세요">
                            <a href="#lnk" id="search_add1">주소검색</a>
                        </div>
                        <input type="text" name="user_address2" id="user_address2">
                    </div>
                </div>
                <div class="fullButtonContainer my">
                    <a href="#lnk" class="wt normal">수정하기</a>
                </div>
            </div>
        </div>
    </div>
    <div class="modalContainer" id="modefyAdd">
        <div class="myModalInner">
            <div class="modalTop">
                <p>추가 정보 수정하기</p>
                <button type="button"><img src="/img/user_img/close-modal2.png" alt=""></button>
            </div>
            <div class="modalBottom">
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
                            <p class="fileName"></p>
                            <label for="file" id="attach_file">파일추가</label>
                            <input type="file" id="file" style="display: none;">
                            <button type="button" id="deleteButton" style="display: none;"><img src="/img/user_img/del-file.png" alt=""></button>
                        </div>
                    </div>
                </div>
                <div class="fullButtonContainer my">
                    <a href="#lnk" class="wt normal">수정하기</a>
                </div>
            </div>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
</body>
</html>