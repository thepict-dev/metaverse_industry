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
	    <div class="subTop rental">
        <div class="subColor">
            <h2>시설대여</h2>
            <p>누구나 이용할 수 있는<br>시설 대여 서비스입니다</p>
        </div>
    </div>
    <div class="subContents rental">
        <div class="rentalCountContainer">
            <p class="rentalListTitle fa"><button type="button" class="mb"><img src="/img/user_img/list-back.png" alt=""></button>시설 예약</p>
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
                </li>
            </ul>
            <div class="fullButtonContainer rental">
                <a href="/facility_rental.do" class="bl">예약하기</a>
            </div>
        </div>
        <div class="rentalListContainer">
            <div class="tabInner active">
                <ul class="rentalItemList fa">
                    <li>
                        <input type="radio" name="equip" id="equip_1" disabled>
                        <label for="equip_1"></label>
                        <div class="checkItem">
                            <div class="itemImg">
                                <img src="/img/user_img/pro-eye.png" alt="">
                                <span></span>
                                <a href="#lnk"><img src="/img/user_img/bag.png" alt=""></a>
                            </div>
                            <div class="itemTitles">
                                <span>시설</span>
                                <p>브이튜버룸</p>
                            </div>
                            <p>최신 장비와 시스템을 갖춘 브이튜버 전용 스튜디오로, 누구나 쉽게 아바타를 이용한 콘텐츠 제작 및 방송을 할 수 있는 공간입니다.</p>
                        </div>
                    </li> 
                    <li>
                        <input type="radio" name="equip" id="equip_2">
                        <label for="equip_2"></label>
                        <div class="checkItem">
                            <div class="itemImg">
                                <img src="/img/user_img/pro-eye.png" alt="">
                                <span></span>
                                <a href="#lnk"><img src="/img/user_img/bag.png" alt=""></a>
                            </div>
                            <div class="itemTitles">
                                <span>시설</span>
                                <p>브이튜버룸</p>
                            </div>
                            <p>최신 장비와 시스템을 갖춘 브이튜버 전용 스튜디오로, 누구나 쉽게 아바타를 이용한 콘텐츠 제작 및 방송을 할 수 있는 공간입니다.</p>
                        </div>
                    </li> 
                </ul>
            </div>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
    <script>
        const rentalCountContainer = document.querySelector('.rentalCountContainer');
        const rentalListContainer = document.querySelector('.rentalListContainer');
        const checkboxes = document.querySelectorAll('.rentalItemList input[type="radio"]');
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