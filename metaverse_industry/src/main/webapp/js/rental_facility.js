window.onload = function () {
   document.getElementById("search_add2")?.addEventListener("click", function () {
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
let rental_type = "";
var dateFormat = "yy-mm-dd";
let disabledDates = [];

var today = new Date();
today.setHours(0, 0, 0, 0);

function initDatepicker() {
   $("#datepicker").datepicker({
       numberOfMonths: getNumberOfMonths(),
       dateFormat: dateFormat,
       showOtherMonths: true,
       selectOtherMonths: true,
       dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
       monthNames: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
       monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
       beforeShowDay: function (date) {
           var stringDate = $.datepicker.formatDate(dateFormat, date);
           var isDisabled = disabledDates.indexOf(stringDate) !== -1;
           var startDate = $("#datepicker").data("startDate");
           var endDate = $("#datepicker").data("endDate");

           var classes = [];
           if (isDisabled) {
               return [false, "user-disabled"];
           }
           if (date < today) {
               return [false, "past-date"];
           }
           if (startDate && endDate && date > startDate && date < endDate) {
               classes.push("selected-range");
           }
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

           if (!startDate || endDate) {
               $("#datepicker").data("startDate", selectedDate);
               $("#datepicker").data("endDate", null);
           }
           else if (selectedDate >= startDate) {
               if (isRangeValid(startDate, selectedDate)) {
                   $("#datepicker").data("endDate", selectedDate);
               } else {
                   alert("선택한 기간 내에 예약 불가능한 날짜가 포함되어 있습니다. 다시 선택해주세요.");
                   $("#datepicker").data("startDate", null);
                   $("#datepicker").data("endDate", null);
               }
           }
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

function getWeekDay(date) {
   const days = ['일', '월', '화', '수', '목', '금', '토'];
   return days[date.getUTCDay()];
}

function updateDateRangeInfo() {
   var startDate = $("#datepicker").data("startDate");
   var endDate = $("#datepicker").data("endDate");

   if (startDate && endDate) {
       const targetEquipment = document.querySelector(".equipList li.checked");
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

           selectedSuccessEquipment.innerHTML = `
               <div class="eqDate">
                   <div class="eq">
                       <p class="eqDateTitle">시설</p>
                       <p class="eqDateItem"><span>${targetName}</span></p>
                   </div>
                   <div class="datesWrapper">
                       <div class="dates">
                           <p class="eqDateTitle">대여일</p>
                           <p class="eqDateItem">${$.datepicker.formatDate("yy.mm.dd", startDate)}.${getWeekDay(startDate)}</p>
                       </div>
                       <img src="/img/user_img/date-arr.png" alt="">
                       <div class="dates">
                           <p class="eqDateTitle">반납일</p>
                           <p class="eqDateItem">${$.datepicker.formatDate("yy.mm.dd", endDate)}.${getWeekDay(endDate)}</p>
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
}

// 라디오 체크
$('input[name="option"]').change(function () {
   if ($(this).attr('id') === 'individual') {
       rental_type = "individual";
       $('.addIndiv').show();
       $('.addCompany').hide();
   } else if ($(this).attr('id') === 'company') {
       rental_type = "company";
       $('.addCompany').show();
       $('.addIndiv').hide();

       // 회사정보 입력 필드 동적 생성
       const companyForm = `
           <div class="bookingTitle">추가정보 입력</div>
           <div class="joinFormWrapper">
               <div class="inputContainer">
                   <p class="inputCaption">회사명</p>
                   <input type="text" name="company_nm" id="company_nm" placeholder="회사명을 입력하세요">
               </div>
               <div class="inputContainer">
                   <p class="inputCaption">사업자등록번호</p>
                   <input type="text" name="sa_eob_no" id="sa_eob_no" placeholder="사업자등록번호를 입력하세요">
               </div>
               <div class="inputContainer">
                   <p class="inputCaption">직책</p>
                   <input type="text" name="position" id="position" placeholder="직책을 입력하세요">
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
       `;

       // 기존 내용을 지우고 새로운 폼 추가
       $('.addCompany .bookingInner').html(companyForm);

       // 파일 입력 이벤트 다시 설정
       setupFileInput('file2', 'fileName2', 'deleteButton2');

       // 주소검색 이벤트 다시 설정
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
});

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
   initDatepicker();
});

document.querySelectorAll(".checkItem").forEach(el => {
   el.addEventListener("click", () => {
       resetCheckedEquip();
       el.parentElement.classList.add("checked");
       getEquipmentAvailableDate(el.parentElement.dataset.id);
   })
});

const resetCheckedEquip = () => {
   document.querySelectorAll(".equipList li").forEach(el => {
       el.classList.remove("checked");
   })
}

const getEquipmentAvailableDate = (id) => {
   const param = { id: id }
   $.ajax({
       url: '/api/checkFacilityAvailableDate.do',
       type: "POST",
       data: JSON.stringify(param),
       contentType: "application/json",
       dataType: "json",
       async: true,
       success: function (response) {
           if (response.msg === "ok") {
               const date_list = [];
               response.data.map(obj => date_list.push(obj.unavailable_date));
               disabledDates = date_list;
               $("#datepicker").data("startDate", null);
               $("#datepicker").data("endDate", null);
               $('#datepicker').datepicker('destroy');
               initDatepicker();
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

const resetSelectedDate = (e) => {
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

const bookingBtn = document.querySelector("#bookingButton");
bookingBtn.addEventListener("click", () => {
    if (selectedEquipment.length !== document.querySelectorAll(".equipList li.success").length || selectedEquipment.length === 0) {
        alert("대여할 날짜를 선택해주세요.");
        return;
    }

    if (!rental_type) {
        alert("대여 형태를 선택해주세요.");
        return;
    }

    if (rental_type === "individual") {
        if (document.querySelector(".equipment-plan").value === "") {
            alert("시설 사용 계획을 작성해주세요.");
            return;
        }
        if (!document.querySelector("#file1").files[0]) {
            alert("증빙서류를 첨부해주세요.");
            return;
        }
    } else if (rental_type === "company") {
        const company_nm = document.querySelector("#company_nm");
        const sa_eob_no = document.querySelector("#sa_eob_no");
        const position = document.querySelector("#position");
        const company_address1 = document.querySelector("#company_address1");
        
        if (!company_nm || company_nm.value === "") {
            alert("회사명을 입력해주세요.");
            return;
        }
        if (!sa_eob_no || sa_eob_no.value === "") {
            alert("사업자등록번호를 입력해주세요.");
            return;
        }
        if (!position || position.value === "") {
            alert("직책을 입력해주세요.");
            return;
        }
        if (!company_address1 || company_address1.value === "") {
            alert("사업장 주소를 입력해주세요.");
            return;
        }
        if (!document.querySelector("#file2").files[0]) {
            alert("증빙서류를 첨부해주세요.");
            return;
        }
    }

    // swiper-wrapper 초기화
    document.querySelector(".swiper-wrapper").innerHTML = '';
    
    // 슬라이드 추가
    selectedEquipment.forEach(equipment => {
        const slide = document.createElement("div");
        slide.classList.add("swiper-slide");
        
        // 각 장비별로 슬라이드 생성
        let slideHtml = `
            <ul class="bookingInfolists">
                <li>
                    <p>시설명</p>
                    <span>${equipment.name}</span>
                </li>
                <li>
                    <p>대여자명</p>
                    <span>${user_name}</span>
                </li>`;

        if (rental_type === "company") {
            slideHtml += `
                <li>
                    <p>대여형태</p>
                    <span>기업</span>
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
                    <span>${document.querySelector("#company_address1").value} ${document.querySelector("#company_address2")?.value || ''}</span>
                </li>`;
        } else {
            slideHtml += `
                <li>
                    <p>대여형태</p>
                    <span>개인</span>
                </li>`;
        }

        slideHtml += `
                <li>
                    <p>대여일</p>
                    <span>${equipment.rental_start_date}.${getWeekDay(equipment.original_rental_start_date)}</span>
                </li>
                <li>
                    <p>반납일</p>
                    <span>${equipment.rental_end_date}.${getWeekDay(equipment.original_rental_end_date)}</span>
                </li>
            </ul>`;

        slide.innerHTML = slideHtml;
        document.querySelector(".swiper-wrapper").appendChild(slide);
    });

    // 모달 표시
    $('#confirmModal').addClass('active');
    $('body').addClass("no-scroll");

    // Swiper 초기화
    if (window.confirmSwiper) {
        window.confirmSwiper.destroy(true, true);
    }

    window.confirmSwiper = new Swiper('.swiper', {
        speed: 500,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
            type: 'bullets',
        },
        slidesPerView: 1,
        spaceBetween: 30,
        centeredSlides: true,
        observer: true,
        observeParents: true
    });
});

// 요일 반환 함수
function getWeekDay(date) {
    const days = ['일', '월', '화', '수', '목', '금', '토'];
    return days[date.getUTCDay()];
}

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
    location.href = "/facility.do";
})




const callBookingApi = () => {
    const formData = new FormData();
    if (rental_type === "individual") {
        console.log("개인 예약");

        formData.append("rental_type", rental_type);
        formData.append("facility_list", JSON.stringify(selectedEquipment));
        formData.append("facility_plan", document.querySelector(".equipment-plan").value);
        formData.append("attach_file", document.querySelector("#file1").files[0]);
        console.log(formData);
    } else if (rental_type === "company") {
        console.log("법인 예약");
        formData.append("rental_type", rental_type);
        formData.append("facility_list", JSON.stringify(selectedEquipment));
        formData.append("company_nm", document.querySelector("#company_nm").value);
        formData.append("sa_eob_no", document.querySelector("#sa_eob_no").value);
        formData.append("position", document.querySelector("#position").value);
        formData.append("company_address1", document.querySelector("#company_address1").value);
        formData.append("company_address2", document.querySelector("#company_address2").value);
        formData.append("attach_file", document.querySelector("#file2").files[0]);
        console.log(formData);
    }
    $.ajax({
        url: '/api/booking_facility.do'
        , type: "POST"
        , data: formData
        , processData: false
        , contentType: false
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
                            <p>시설명</p>
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
                            <p>시설명</p>
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