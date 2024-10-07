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
        <h2><a href="/equipment.do"><img src="/img/user_img/back-grey.png" alt=""></a>장비 예약</h2>
    </div>
    <div class="loginWrapper book">
        <form action="">
            <div class="bookingWrapper">
                <h3 class="subTitles"><span>01</span> 장비별 대여일/반납일을 선택해주세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner equip">
                        <div class="equipLists">
                            <p class="bookingTitle">제품 선택</p>
                            <ul class="equipList">
                                <li>
                                    <input type="checkbox" name="booking" id="booking_1">
                                    <label for="booking_1"></label>
                                    <span class="checkBox"></span>
                                    <div class="checkItem list">
                                        <div class="itemTitles">
                                            <span>정보없음</span>
                                            <p><span>이름이 진짜 긴 장비를 넣으면은 말줄임 표시해야돼 </span><span> / 1개</span></p>
                                        </div>
                                    </div>
                                    <a href="#lnk"><img src="/img/user_img/delete2.png" alt=""></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="bookingInner date">
                        <p class="bookingTitle">대여일/반납일 선택</p>
                        <div class="dateContainer">
                            <div id="datepicker"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bookingWrapper">
                <h3 class="subTitles"><span>02</span> 예약하신 장비 정보를 확인해주세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner">
                        <p class="bookingTitle">대여장비 확인</p>
                        <ul class="dateResultLists">
                            <li>
                                <div class="eqDate">
                                    <div class="eq">
                                        <p class="eqDateTitle">제품</p>
                                        <p class="eqDateItem"><span>Oculus Quest2 /</span><span> 1개</span></p>
                                    </div>
                                    <div class="datesWrapper">
                                        <div class="dates">
                                            <p class="eqDateTitle">대여일</p>
                                            <p class="eqDateItem">2024.8.13.화</p>
                                        </div>
                                        <img src="/img/user_img/date-arr.png" alt="">
                                        <div class="dates">
                                            <p class="eqDateTitle">반납일</p>
                                            <p class="eqDateItem">2024.8.13.화</p>
                                        </div>
                                    </div>
                                </div>
                                <a href="#lnk">다시 선택</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="bookingWrapper">
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
                                <p class="inputCaption">증빙서류 첨부</p>
                                <div class="flexInputs file">
                                    <p class="fileName1"></p>
                                    <label for="file1" id="attach_file1">파일추가</label>
                                    <input type="file" id="file1" style="display: none;">
                                    <button type="button" id="deleteButton1" style="display: none;"><img src="/img/user_img/del-file.png" alt=""></button>
                                </div>
                                <p class="fileSub">장비사용계획서를 제출하세요</p>
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
                            <div class="swiper-slide">
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
                            </div>
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
                    <ul class="bookingInfolists">
                        <li>
                            <p>장비명</p>
                            <span>Oculus Quest2 외 2건</span>
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
                            <p>대여일</p>
                            <span>2024.8.13.화</span>
                        </li>
                        <li>
                            <p>반납일</p>
                            <span>2024.8.13.화</span>
                        </li>
                    </ul>
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
                <a href="/mypage.do" class="bl">마이페이지</a>
            </div>
        </div>
    </div>

    <script>
        $(function() {
            var dateFormat = "yy-mm-dd";
            
            // 예약 불가 더미
            var disabledDates = [
                "2024-09-15",
            ];

            // 오늘 날짜를 기준으로 설정 (시간은 00:00:00으로 설정)
            var today = new Date();
            today.setHours(0, 0, 0, 0);

            function initDatepicker() {
                $("#datepicker").datepicker({
                    numberOfMonths: getNumberOfMonths(),
                    // numberOfMonths: [1, 2],  // 1행 2열로 달력 표시
                    dateFormat: dateFormat, 
                    showOtherMonths: true,   // 이전,다음 달 날짜 표시
                    selectOtherMonths: true, // 이전,다음 달 날짜 선택 가능
                    dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],  
                    monthNames: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"], 
                    monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
                    beforeShowDay: function(date) {
                        var stringDate = $.datepicker.formatDate(dateFormat, date);
                        var isDisabled = disabledDates.indexOf(stringDate) !== -1;
                        var startDate = $("#datepicker").data("startDate");
                        var endDate = $("#datepicker").data("endDate");
                        
                        var classes = [];
                        // 예약 불가능한 날짜
                        if (isDisabled) {
                            return [false, "user-disabled"];
                        }
                        
                        // 오늘 이전 날짜
                        if (date < today) {
                            return [false, "past-date"];
                        }
                        
                        // 선택된 날짜 범위 표시
                        if (startDate && endDate && date > startDate && date < endDate) {
                            classes.push("selected-range");
                        }
                        
                        // 시작일과 종료일 강조 표시
                        if (startDate && endDate && date >= startDate && date <= endDate) {
                            if (date.getTime() === startDate.getTime()) {
                                classes.push("dp-highlight-start");
                            } else if (date.getTime() === endDate.getTime()) {
                                classes.push("dp-highlight-end");
                            }
                        }
                        return [true, classes.join(" ")];
                    },
                    onSelect: function(dateText, inst) {
                        var selectedDate = $.datepicker.parseDate(dateFormat, dateText);
                        
                        var startDate = $("#datepicker").data("startDate");
                        var endDate = $("#datepicker").data("endDate");

                        // 시작일 선택 또는 새로운 범위 선택 시작
                        if (!startDate || endDate) {
                            $("#datepicker").data("startDate", selectedDate);
                            $("#datepicker").data("endDate", null);
                        } 
                        // 종료일 선택 (선택된 날짜가 시작일 이후인 경우)
                        else if (selectedDate >= startDate) {
                            if (isRangeValid(startDate, selectedDate)) {
                                $("#datepicker").data("endDate", selectedDate);
                            } else {
                                alert("선택한 기간 내에 예약 불가능한 날짜가 포함되어 있습니다. 다시 선택해주세요.");
                                $("#datepicker").data("startDate", null);
                                $("#datepicker").data("endDate", null);
                            }
                        } 
                        // 종료일 선택 (선택된 날짜가 시작일 이전인 경우 - 역순 선택)
                        else {
                            if (isRangeValid(selectedDate, startDate)) {
                                $("#datepicker").data("endDate", startDate);
                                $("#datepicker").data("startDate", selectedDate);
                            } else {
                                alert("선택한 기간 내에 예약 불가능한 날짜가 포함되어 있습니다. 다시 선택해주세요.");
                                $("#datepicker").data("startDate", null);
                                $("#datepicker").data("endDate", null);
                            }
                        }

                    updateDateRangeInfo();
                    $(this).datepicker("refresh");
                    }
                });
            }

                function getNumberOfMonths() {
                    return $(window).width() <= 1510 ? 1 : [1, 2];
                }

                initDatepicker();

                $(window).resize(function() {
                    $("#datepicker").datepicker("option", "numberOfMonths", getNumberOfMonths());
                });

            // 선택된 날짜 범위가 유효한지 확인 (예약 불가능한 날짜 포함 여부 체크)
            function isRangeValid(start, end) {
                var current = new Date(start);
                while (current <= end) {
                    var stringDate = $.datepicker.formatDate(dateFormat, current);
                    if (disabledDates.indexOf(stringDate) !== -1) {
                        return false;
                    }
                    current.setDate(current.getDate() + 1);
                }
                return true;
            }

            // 선택된 날짜 범위 정보를 업데이트하고 콘솔에 출력하는 함수
            function updateDateRangeInfo() {
                // datepicker에서 저장된 시작일과 종료일을 가져옴
                var startDate = $("#datepicker").data("startDate");
                var endDate = $("#datepicker").data("endDate");

                // 시작일과 종료일이 모두 선택된 경우
                if (startDate && endDate) {
                    // 선택된 날짜 확인!
                    console.log("선택된 기간: " + 
                        $.datepicker.formatDate(dateFormat, startDate) + " ~ " + 
                        $.datepicker.formatDate(dateFormat, endDate));
                } 
                // 시작일만 선택된 경우
                else if (startDate) {
                    // 시작일만 콘솔에 출력
                    console.log("시작일: " + 
                        $.datepicker.formatDate(dateFormat, startDate));
                }
                // 시작일도 선택되지 않은 경우에는 아무 것도 안나옴
            }
                // 페이지 로드 시 초기 날짜 범위 정보를 업데이트
                // 이는 페이지 새로고침 후에도 이전에 선택된 날짜 정보를 표시하기 위함
                updateDateRangeInfo();
            });

            // 라디오 체크
            $('input[name="option"]').change(function() {
                if ($(this).attr('id') === 'individual') {
                    $('.addIndiv').show();
                    $('.addCompany').hide();
                } if ($(this).attr('id') === 'company') {
                    $('.addCompany').show();
                    $('.addIndiv').hide();
                }
            });

            //파일첨부
            function setupFileInput(fileInputId, fileNameClass, deleteButtonId) {
            const fileInput = document.getElementById(fileInputId);
            const fileName = document.querySelector(`.${fileNameClass}`);
            const deleteButton = document.getElementById(deleteButtonId);

            fileInput.addEventListener('change', function() {
                if (this.files[0]) {
                    fileName.textContent = this.files[0].name;
                    deleteButton.style.display = 'inline-block';
                }
            });

            deleteButton.addEventListener('click', function() {
                fileInput.value = '';
                fileName.textContent = '';
                this.style.display = 'none';
            });
        }

        document.addEventListener('DOMContentLoaded', function() {
            setupFileInput('file1', 'fileName1', 'deleteButton1');
            setupFileInput('file2', 'fileName2', 'deleteButton2');
        });

        // 컨펌 스와이퍼
        const swiper = new Swiper('.swiper', {
            speed: 2000,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
        });

        //확인 모달 열고, 닫기
        $('#bookingButton').click(function(){
            $('#confirmModal').addClass('active');
            $('body').addClass("no-scroll");
        })
        $('#confirmModal button').click(function(){
            $('#confirmModal').removeClass('active');
            $('body').removeClass("no-scroll");
        })
        //최종 모달 열고, 닫기
        $('#setButton').click(function(){
            $('#confirmModal').removeClass('active');
            $('#checkModal').addClass('active');
            $('body').addClass("no-scroll");
        })
        $('#checkModal button').click(function(){
            $('#checkModal').removeClass('active');
            $('body').removeClass("no-scroll");
        })
    </script>
	
</body>
</html>