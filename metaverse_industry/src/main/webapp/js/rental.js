window.onload = function () {
    document.getElementById("search_add2").addEventListener("click", function () {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("company_address1").value = data.address;
                $('#company_address2').css("display", "block");
                document.getElementById("company_address2").focus();
            }
        }).open();
    });
}


let selectedEquipment = [];
const user_name = "이유리";
let rental_type = "";



var dateFormat = "yy-mm-dd";

// 예약 불가 더미
let disabledDates = [];

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
        beforeShowDay: function (date) {
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
        onSelect: function (dateText, inst) {
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

$(window).resize(function () {
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
        const targetEquipment = document.querySelector(".equipList li.checked");
        console.log($.datepicker.formatDate("yy-mm-dd", startDate));
        console.log($.datepicker.formatDate("yy-mm-dd", endDate));
        if (targetEquipment) {
            let id = targetEquipment.dataset.id;
            let cnt = targetEquipment.dataset.cnt;
            const equipment = {
                id: id,
                name: targetEquipment.querySelector(".itemTitles > p > span:first-child").textContent,
                cnt: cnt,
                original_rental_start_date: startDate,
                original_rental_end_date: endDate,
                rental_start_date: $.datepicker.formatDate("yy.mm.dd", startDate),
                rental_end_date: $.datepicker.formatDate("yy.mm.dd", endDate),
            }
            selectedEquipment.push(equipment);
            targetEquipment.classList.remove("checked");
            targetEquipment.classList.add("success");
            const targetName = targetEquipment.querySelector(".itemTitles > p > span:first-child").textContent;
            const selectedSuccessEquipment = document.createElement("li");
            selectedSuccessEquipment.dataset.id = targetEquipment.dataset.id;

            let startDay = '';
            switch (startDate.getUTCDay()) {
                case 0:
                    startDay = '일';
                    break;
                case 1:
                    startDay = '월';
                    break;
                case 2:
                    startDay = '화';
                    break;
                case 3:
                    startDay = '수';
                    break;
                case 4:
                    startDay = '목';
                    break;
                case 5:
                    startDay = '금';
                    break;
                case 6:
                    startDay = '토';
                    break;
            }
            let endDay = '';
            switch (endDate.getUTCDay()) {
                case 0:
                    endDay = '일';
                    break;
                case 1:
                    endDay = '월';
                    break;
                case 2:
                    endDay = '화';
                    break;
                case 3:
                    endDay = '수';
                    break;
                case 4:
                    endDay = '목';
                    break;
                case 5:
                    endDay = '금';
                    break;
                case 6:
                    endDay = '토';
                    break;
            }

            selectedSuccessEquipment.innerHTML = `
                <div class="eqDate">
                    <div class="eq">
                        <p class="eqDateTitle">제품</p>
                        <p class="eqDateItem"><span>${targetName}
                                /</span><span> ${cnt}</span></p>
                    </div>
                    <div class="datesWrapper">
                        <div class="dates">
                            <p class="eqDateTitle">대여일</p>
                            <p class="eqDateItem">${$.datepicker.formatDate("yy.mm.dd", startDate)}.${startDay}</p>
                        </div>
                        <img src="/img/user_img/date-arr.png" alt="">
                        <div class="dates">
                            <p class="eqDateTitle">반납일</p>
                            <p class="eqDateItem">${$.datepicker.formatDate("yy.mm.dd", endDate)}.${endDay}</p>
                        </div>
                    </div>
                </div>
                <button class="resetSelectedDate">다시 선택</button>      
            `
            document.querySelector(".step-02").classList.remove("blind");
            document.querySelector(".step-03").classList.remove("blind");
            document.querySelector(".dateResultLists").appendChild(selectedSuccessEquipment);
            selectedSuccessEquipment.querySelector(".resetSelectedDate").addEventListener("click", resetSelectedDate);
        }
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
//updateDateRangeInfo();


// 라디오 체크
$('input[name="option"]').change(function () {
    if ($(this).attr('id') === 'individual') {
        rental_type = "individual";
        $('.addIndiv').show();
        $('.addCompany').hide();
    } if ($(this).attr('id') === 'company') {
        rental_type = "company";
        $('.addCompany').show();
        $('.addIndiv').hide();
    }
});

//파일첨부
function setupFileInput(fileInputId, fileNameClass, deleteButtonId) {
    const fileInput = document.getElementById(fileInputId);
    const fileName = document.querySelector("." + fileNameClass);
    const deleteButton = document.getElementById(deleteButtonId);

    fileInput.addEventListener('change', function () {
        if (this.files[0]) {
            fileName.textContent = this.files[0].name;
            deleteButton.style.display = 'inline-block';
        }
    });

    deleteButton.addEventListener('click', function () {
        fileInput.value = '';
        fileName.textContent = '';
        this.style.display = 'none';
    });
}

document.addEventListener('DOMContentLoaded', function () {
    setupFileInput('file1', 'fileName1', 'deleteButton1');
    setupFileInput('file2', 'fileName2', 'deleteButton2');
});







document.querySelectorAll(".checkItem").forEach(el => {
    el.addEventListener("click", () => {

        resetCheckedEquip();
        el.parentElement.classList.add("checked");
        getEquipmentAvailableDate(el.parentElement.dataset.id);
    })
})

const resetCheckedEquip = () => {
    document.querySelectorAll(".equipList li").forEach(el => {
        el.classList.remove("checked");
    })
}
/**
 * 장비 대여 가능 날짜 조회
 * @param {String} id 장비 아이디
 */
const getEquipmentAvailableDate = (id) => {

    const param = {
        id: id
    }
    $.ajax({
        url: '/api/checkEquipmentAvailableDate.do' // Replace with your actual endpoint
        , type: "POST"
        , data: JSON.stringify(param)
        , contentType: "application/json"
        , dataType: "json"
        , async: true,
        success: function (response) {
            if (response.msg === "ok") {
                const date_list = [];
                response.data.map(obj => date_list.push(obj.unavailable_date));
                disabledDates = date_list;
                // datepicker 제거
                $("#datepicker").data("startDate", null);
                $("#datepicker").data("endDate", null);
                $('#datepicker').datepicker('destroy');
                // datepicker 다시 초기화
                initDatepicker();
                // 블러처리 삭
                if (document.querySelector(".disable-calendar")) {
                    document.querySelector(".disable-calendar").style.display = "none";
                }

            }

        },
        error: function (e) {
            console.log(e);
        }
    });
}


/**
 * 다시 선택하기
 */
const resetSelectedDate = (e) => {
    console.log("다시 선택 클릭!!!")
    const li = e.target.parentElement;
    let id = li.dataset.id;
    const selectedEquipmentEl = document.querySelector(`.equipList li[data-id="${id}"]`);
    selectedEquipmentEl.classList.remove("success");
    selectedEquipment = selectedEquipment.filter(equipment => equipment.id !== id);
    if (selectedEquipment.length === 0) {
        if (document.querySelector(".disable-calendar")) {
            document.querySelector(".disable-calendar").style.display = "flex";
        }
        document.querySelector(".step-02").classList.add("blind");
        document.querySelector(".step-03").classList.add("blind");
    }
    li.remove();
}

// 예약하기
const bookingBtn = document.querySelector("#bookingButton");
bookingBtn.addEventListener("click", () => {
    if (selectedEquipment.length !== document.querySelectorAll(".equipList li.success").length || selectedEquipment.length === 0) {
        alert("대여할 날짜를 선택해주세요.");
        return;
    }
    if (rental_type === "individual") {
        if (document.querySelector(".equipment-plan").value === "") {
            alert("장비 사용 계획을 작성해주세요.");
            return;
        }
        if (document.querySelector("#file1").files[0] === "") {
            alert("증빙서류를 첨부해주세요.");
            return;
        }
    } else if (rental_type === "company") {
        if (document.querySelector("#company_nm").value === "") {
            alert("회사명을 입력해주세요.");
            return;
        }
        if (document.querySelector("#sa_eob_no").value === "") {
            alert("사업자등록번호를 입력해주세요.");
            return;
        }
        if (document.querySelector("#position").value === "") {
            alert("직책을 입력해주세요.");
            return;
        }
        if (document.querySelector("#company_address1").value === "") {
            alert("사업장 주소를 입력해주세요.");
            return;
        }
        if (document.querySelector("#file2").files[0] === "") {
            alert("증빙서류를 첨부해주세요.");
            return;
        }
    }
    selectedEquipment.forEach(equipment => {
        let startDay = '';
        switch (equipment.original_rental_start_date.getUTCDay()) {
            case 0:
                startDay = '일';
                break;
            case 1:
                startDay = '월';
                break;
            case 2:
                startDay = '화';
                break;
            case 3:
                startDay = '수';
                break;
            case 4:
                startDay = '목';
                break;
            case 5:
                startDay = '금';
                break;
            case 6:
                startDay = '토';
                break;
        }
        let endDay = '';
        switch (equipment.original_rental_end_date.getUTCDay()) {
            case 0:
                endDay = '일';
                break;
            case 1:
                endDay = '월';
                break;
            case 2:
                endDay = '화';
                break;
            case 3:
                endDay = '수';
                break;
            case 4:
                endDay = '목';
                break;
            case 5:
                endDay = '금';
                break;
            case 6:
                endDay = '토';
                break;
        }
        const slide = document.createElement("div");
        slide.classList.add("swiper-slide");
        if (rental_type === "company") {
            slide.innerHTML = `
            <ul class="bookingInfolists">
                <li>
                    <p>장비명</p>
                    <span>${equipment.name} / ${equipment.cnt}대</span>
                </li>
                <li>
                    <p>대여자명</p>
                    <span>${user_name}</span>
                </li>
                <li>
                    <p>대여형태</p>
                    <span>
                        ${rental_type === "individual" ? "개인" : "기업"}
                    </span>
                </li>
                <li>
                    <p>회사명</p>
                    <span>${document.querySelector("#company_nm").value}</span>
                </li>
                <li>
                    <p>사업자등록번호</p>
                    <span>${document.querySelector("#sa_eob_no").value}</span>
                </li>
                <li>
                    <p>직책</p>
                    <span>${document.querySelector("#position").value}</span>
                </li>
                <li>
                    <p>주소</p>
                    <span>${document.querySelector("#company_address1").value} ${document.querySelector("#company_address2").value}</span>
                </li>
                <li>
                    <p>대여일</p>
                    <span>${equipment.rental_start_date}.${startDay}</span>
                </li>
                <li>
                    <p>반납일</p>
                    <span>${equipment.rental_end_date}.${endDay}</span>
                </li>
            </ul>
            `
        } else if (rental_type === "individual") {
            slide.innerHTML = `
            <ul class="bookingInfolists">
                <li>
                    <p>장비명</p>
                    <span>${equipment.name} / ${equipment.cnt}대</span>
                </li>
                <li>
                    <p>대여자명</p>
                    <span>${user_name}</span>
                </li>
                <li>
                    <p>대여형태</p>
                    <span>개인</span>
                </li>
                <li>
                    <p>대여일</p>
                    <span>${equipment.rental_start_date}.${startDay}</span>
                </li>
                <li>
                    <p>반납일</p>
                    <span>${equipment.rental_end_date}.${endDay}</span>
                </li>
            </ul>
            `
        }
        document.querySelector(".swiper").appendChild(slide);
    })
    // 컨펌 스와이퍼
    const swiper = new Swiper('.swiper', {
        speed: 2000,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
    $('#confirmModal').addClass('active');

    $('body').addClass("no-scroll");

})

//확인 모달 닫기
$('#confirmModal button').click(function () {
    $('#confirmModal').removeClass('active');
    $('body').removeClass("no-scroll");
})
//최종 모달 열고, 닫기
$('#setButton').click(function () {
    if ($("#agree").is(":checked")) {
        // api 호출
        callBookingApi();
    } else {
        alert("시설∙장비 사용 안내 및 유의사항에 동의해주세요.");
        return;
    }
})
// 최종 예약 확인 모달 닫기
// equipment.do 페이지로 이동
$("#checkModal button").click(function () {
    $('#checkModal').removeClass('active');
    $('body').removeClass("no-scroll");
    location.href = "/equipment.do";
})




const callBookingApi = () => {
    let param = {};
    if (rental_type === "individual") {
        console.log("개인 예약");
        param = {
            rental_type: rental_type,
            equipment_list: selectedEquipment,
            equipment_plan: document.querySelector(".equipment-plan").value,
            attach_file: document.querySelector("#file1").files[0]
        }
        console.log(param);
    } else if (rental_type === "company") {
        console.log("법인 예약");
        param = {
            rental_type: rental_type,
            equipment_list: selectedEquipment,
            company_nm: document.querySelector("#company_nm").value,
            sa_eob_no: document.querySelector("#sa_eob_no").value,
            position: document.querySelector("#position").value,
            company_address1: document.querySelector("#company_address1").value,
            company_address2: document.querySelector("#company_address2").value,
            attach_file: document.querySelector("#file2").files[0]
        }
        console.log(param);
    }
    $.ajax({
        url: '/api/booking.do'
        , type: "POST"
        , data: JSON.stringify(param)
        , contentType: "application/json"
        , dataType: "json"
        , async: true,
        success: function (response) {
            console.log(response);
            if (response.msg === "ok") {
                const lastModal = document.querySelector("#checkModal");
                const slide = lastModal.querySelector(".infoSlides");
                let totalCnt = selectedEquipment.length;

                let startDay = '';
                let endDay = '';
                switch (selectedEquipment[0].original_rental_start_date.getUTCDay()) {
                    case 0:
                        startDay = '일';
                        break;
                    case 1:
                        startDay = '월';
                        break;
                    case 2:
                        startDay = '화';
                        break;
                    case 3:
                        startDay = '수';
                        break;
                    case 4:
                        startDay = '목';
                        break;
                    case 5:
                        startDay = '금';
                        break;
                    case 6:
                        startDay = '토';
                        break;
                }
                switch (selectedEquipment[0].original_rental_end_date.getUTCDay()) {
                    case 0:
                        endDay = '일';
                        break;
                    case 1:
                        endDay = '월';
                        break;
                    case 2:
                        endDay = '화';
                        break;
                    case 3:
                        endDay = '수';
                        break;
                    case 4:
                        endDay = '목';
                        break;
                    case 5:
                        endDay = '금';
                        break;
                    case 6:
                        endDay = '토';
                        break;
                }
                if (rental_type === "individual") {
                    slide.innerHTML = `
                    <ul class="bookingInfolists">
                        <li>
                            <p>장비명</p>
                            <span>${selectedEquipment[0].name} 외 ${totalCnt - 1}건</span>
                        </li>
                        <li>
                            <p>대여자명</p>
                            <span>${user_name}</span>
                        </li>
                        <li>
                            <p>대여형태</p>
                            <span>개인</span>
                        </li>
                        <li>
                            <p>대여일</p>
                            <span>${selectedEquipment[0].rental_start_date}.${startDay}</span>
                        </li>
                        <li>
                            <p>반납일</p>
                            <span>${selectedEquipment[0].rental_end_date}.${endDay}</span>
                        </li>
                    </ul>
                    `;
                } else if (rental_type === "company") {
                    slide.innerHTML = `
                    <ul class="bookingInfolists">
                        <li>
                            <p>장비명</p>
                            <span>${selectedEquipment[0].name} 외 ${totalCnt - 1}건</span>
                        </li>
                        <li>
                            <p>대여자명</p>
                            <span>${user_name}</span>
                        </li>
                        <li>
                            <p>대여형태</p>
                            <span>${rental_type === "individual" ? "개인" : "기업"}</span>
                        </li>
                        <li>
                            <p>회사명</p>
                            <span>${document.querySelector("#company_nm").value}</span>
                        </li>
                        <li>
                            <p>대여일</p>
                            <span>${selectedEquipment[0].rental_start_date}.${startDay}</span>
                        </li>
                        <li>
                            <p>반납일</p>
                            <span>${selectedEquipment[0].rental_end_date}.${endDay}</span>
                        </li>
                    </ul>
                `;
                }

                $('#checkModal').addClass('active');
                $('body').addClass("no-scroll");
                $('#confirmModal').removeClass('active');
            } else {
                alert("예약 신청 중 에러가 발생했습니다. 다시 시도해주세요.");
                $('#checkModal').removeClass('active');
                $('body').removeClass("no-scroll");
                selectedEquipment = [];
                disabledDates = [];
                $("#datepicker").data("startDate", null);
                $("#datepicker").data("endDate", null);
                $('#datepicker').datepicker('destroy');
                initDatepicker();
            }
        },
        error: function (e) {
            console.log(e);
        }
    })
}