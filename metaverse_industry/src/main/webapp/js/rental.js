
 
 let selectedFiles = new Map(); // 선택된 파일들을 저장할 Map
 let selectedEquipment = [];
 let rental_type = "";
 
 
 
 var dateFormat = "yy-mm-dd";
 
 // 예약 불가 더미
 let disabledDates = [];
 
 // 오늘 날짜를 기준으로 설정 (시간은 00:00:00으로 설정)
 var today = new Date();
 today.setHours(0, 0, 0, 0);
 
 
 document.addEventListener('DOMContentLoaded', function () {
	 document.getElementById("search_add2")?.addEventListener("click", function () {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("company_address1").value = data.address;
                $('#company_address2').css("display", "block");
                document.getElementById("company_address2").focus();
            }
        }).open();
    });
    initDatepicker();
    
    const companydropZone = $('#dropZone.dropzone_company');
    const companyfileInput = $('#fileInput.fileInput_company');
    const companyfileList = $('#fileList.file_list_company');
    
    const MAX_FILES = 3; // 최대 파일 개수 제한

    // 드래그 앤 드롭 이벤트 처리
    companydropZone.on('dragover', function(e) {
        e.preventDefault();
       	console.log("파일 드롭")
        $(this).addClass('dragover');
    });

    companydropZone.on('dragleave', function(e) {
        e.preventDefault();
        $(this).removeClass('dragover');
    });

    companydropZone.on('drop', function(e) {
        e.preventDefault();
        $(this).removeClass('dragover');
        const files = e.originalEvent.dataTransfer.files;
		console.log("파일을 내려놓을 때");
        handleFiles(files);
    });

    companyfileInput.on('change', function(e) {
		console.log(e.target.files);
        const files = e.target.files;
        handleFiles(files);
    });

    function handleFiles(files) {
        // 현재 선택된 파일 수와 새로 추가할 파일 수 확인
        const remainingSlots = MAX_FILES - selectedFiles.size;
        const filesToAdd = Array.from(files).slice(0, remainingSlots);
        
        if (selectedFiles.size >= MAX_FILES) {
            alert(`최대 ${MAX_FILES}개의 파일만 업로드할 수 있습니다.`);
            return;
        }
        
        if (files.length > remainingSlots) {
            alert(`앞의 ${remainingSlots}개 파일만 추가됩니다. (최대 ${MAX_FILES}개)`);
        }
        
        filesToAdd.forEach(file => {
            // 파일을 Map에 추가하고 목록에 표시
            const fileId = Date.now() + Math.random(); // 고유 ID 생성
            selectedFiles.set(fileId, file);
            
            const fileItem = $(`
                <div class="file-item" data-file-id="${fileId}">
                    <p>${file.name} (${formatFileSize(file.size)})</p>
                    <span class="remove-file">×</span>
                </div>
            `);
            
            companyfileList.append(fileItem);
        });
        // 입력 필드 초기화 (같은 파일을 다시 선택할 수 있도록)
        companyfileInput.val('');
    }

    // 파일 크기 포맷팅 함수
    function formatFileSize(bytes) {
        if (bytes === 0) return '0 Bytes';
        const k = 1024;
        const sizes = ['Bytes', 'KB', 'MB', 'GB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    }

    // 파일 제거 이벤트
    companyfileList.on('click', '.remove-file', function() {
        const fileId = $(this).parent().data('file-id');
        selectedFiles.delete(fileId);
        $(this).parent().remove();
    });
    
    
    // 개인
    const individualdropZone = $('#dropZone.dropzone_individual');
    const individualfileInput = $('#fileInput.fileInput_individual');
    const individualfileList = $('#fileList.file_list_individual');
    
    

    // 드래그 앤 드롭 이벤트 처리
    individualdropZone.on('dragover', function(e) {
        e.preventDefault();
       	console.log("파일 드롭")
        $(this).addClass('dragover');
    });

    individualdropZone.on('dragleave', function(e) {
        e.preventDefault();
        $(this).removeClass('dragover');
    });

    individualdropZone.on('drop', function(e) {
        e.preventDefault();
        $(this).removeClass('dragover');
        const files = e.originalEvent.dataTransfer.files;
		console.log("파일을 내려놓을 때");
        handleFiles_indidual(files);
    });

    individualfileInput.on('change', function(e) {
		console.log(e.target.files);
        const files = e.target.files;
        handleFiles_indidual(files);
    });

    function handleFiles_indidual(files) {
        // 현재 선택된 파일 수와 새로 추가할 파일 수 확인
        const remainingSlots = MAX_FILES - selectedFiles.size;
        const filesToAdd = Array.from(files).slice(0, remainingSlots);
        
        if (selectedFiles.size >= MAX_FILES) {
            alert(`최대 ${MAX_FILES}개의 파일만 업로드할 수 있습니다.`);
            return;
        }
        
        if (files.length > remainingSlots) {
            alert(`앞의 ${remainingSlots}개 파일만 추가됩니다. (최대 ${MAX_FILES}개)`);
        }
        
        filesToAdd.forEach(file => {
            // 파일을 Map에 추가하고 목록에 표시
            const fileId = Date.now() + Math.random(); // 고유 ID 생성
            selectedFiles.set(fileId, file);
            
            const fileItem = $(`
                <div class="file-item" data-file-id="${fileId}">
                    <p>${file.name} (${formatFileSize(file.size)})</p>
                    <span class="remove-file">×</span>
                </div>
            `);
            
            individualfileList.append(fileItem);
        });
        // 입력 필드 초기화 (같은 파일을 다시 선택할 수 있도록)
        individualfileInput.val('');
    }

    // 파일 제거 이벤트
    individualfileList.on('click', '.remove-file', function() {
        const fileId = $(this).parent().data('file-id');
        selectedFiles.delete(fileId);
        $(this).parent().remove();
    });
    
    
 });
 
 
 
 
 
 function initDatepicker() {
     $("#datepicker").datepicker({
         numberOfMonths: getNumberOfMonths(),
         // numberOfMonths: [1, 2],  // 1행 2열로 달력 표시
         dateFormat: dateFormat,
         showOtherMonths: true,   // 이전,다음 달 날짜 표시
         selectOtherMonths: false, // 이전,다음 달 날짜 선택 가능
         dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
         monthNames: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
         monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
         beforeShowDay: function (date) {
             var stringDate = $.datepicker.formatDate(dateFormat, date);
             var isDisabled = disabledDates.indexOf(stringDate) !== -1;
             var startDate = $("#datepicker").data("startDate");
             var endDate = $("#datepicker").data("endDate");
			var classes = [];
 			// 현재 달이 아닌 날짜 체크
            var currentDate = new Date();
            if (date.getMonth() < currentDate.getMonth()) {
                return [false, "user-disabled"];
            }
 
 			// 오늘과 내일 날짜 체크
            var today = new Date();
            var tomorrow = new Date();
            tomorrow.setDate(today.getDate() + 1);
            
            // 한 달 후 날짜 계산
            var oneMonthLater = new Date();
            oneMonthLater.setDate(today.getDate());
            oneMonthLater.setMonth(today.getMonth() + 1);

            // 날짜 비교를 위해 시간 정보 제거
            today.setHours(0, 0, 0, 0);
            tomorrow.setHours(0, 0, 0, 0);
            date.setHours(0, 0, 0, 0);
            oneMonthLater.setHours(0, 0, 0, 0);

			// 오늘, 내일 날짜 체크
            if (date.getTime() === today.getTime() || date.getTime() === tomorrow.getTime()) {
                return [false, "user-disabled"];
            }
            
            // 한 달 이후 날짜 체크
            if (date > oneMonthLater) {
                return [false, "user-disabled"];
            }
            
            // 오늘 이전 날짜
            if (date < today) {
                return [false, "past-date"];
            }
 
 
             
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
				 // 15일 이내 체크
                var dayDiff = Math.ceil((selectedDate - startDate) / (1000 * 60 * 60 * 24));
                if (dayDiff > 15) {
					alert("최대 15일까지만 선택 가능합니다. 장기 대여의 경우 관리자에게 문의하세요.");
                    return;
                }
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
				 // 15일 이내 체크
                var dayDiff = Math.ceil((startDate - selectedDate) / (1000 * 60 * 60 * 24));
                if (dayDiff > 15) {
                    alert("최대 15일까지만 선택 가능합니다. 장기 대여의 경우 관리자에게 문의하세요.");
                    return;
                }
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
        selectedFiles = new Map(); // 선택된 파일들을 저장할 Map
        $(".file-item").remove()
    } else if ($(this).attr('id') === 'company') {
        rental_type = "company";
        $('.addCompany').show();
        $('.addIndiv').hide();
 		selectedFiles = new Map(); // 선택된 파일들을 저장할 Map
 		$(".file-item").remove()
    }
 });
 
 
 
 
 
 
 document.querySelectorAll(".checkItem").forEach(el => {
    el.addEventListener("click", () => {
        const facilityId = el.parentElement.dataset.id;
        const isAlreadySelected = selectedEquipment.some(equip => equip.id === facilityId);
        
        if (!isAlreadySelected) {
            resetCheckedEquip();
            el.parentElement.classList.add("checked");
            getEquipmentAvailableDate(facilityId);
        } else {
            alert("이미 선택된 시설입니다. 다른 시설을 선택해주세요.");
        }
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
         if (document.querySelector(".equipment-plan-individual").value === "") {
             alert("시설 사용 계획을 작성해주세요.");
             return;
         }
         if (selectedFiles.size === 0) {
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
             alert("직책을 입력주세요.");
             return;
         }
         if (document.querySelector(".equipment-plan-company").value === "") {
             alert("시설 사용 계획을 작성해주세요.");
             return;
         }
         if (!company_address1 || company_address1.value === "") {
             alert("사업장 주소를 입력해주세요.");
             return;
         }
         if (selectedFiles.size === 0) {
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
         
         let slideHtml = `
             <ul class="bookingInfolists">
                 <li>
                     <p>장비명</p>
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
     document.querySelector(".swiper-wrapper").innerHTML = '';
 });
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
 
 document.querySelector('label[for="agree"]').addEventListener('click', function(e) {
     e.preventDefault();
     $('#agreeModal').addClass('active');
     $('body').addClass("no-scroll");
 });
 
 // 모달 닫기 버튼
 document.querySelector('#agreeModal button').addEventListener('click', function() {
     $('#agreeModal').removeClass('active');
     $('body').removeClass("no-scroll");
 });
 
 // 동의하기 버튼
 document.getElementById('agreeButton').addEventListener('click', function() {
     document.getElementById('agree').checked = true;
     $('#agreeModal').removeClass('active');
     $('body').removeClass("no-scroll");
 });
 
 // 체크박스 직접 클릭 방지
 document.querySelector('#agree').addEventListener('click', function(e) {
     e.preventDefault();
     $('#agreeModal').addClass('active');
     $('body').addClass('no-scroll');
 });
 
 // 동의하기 버튼 클릭 시 체크박스 체크
 document.querySelector('#agreeButton').addEventListener('click', function() {
     document.querySelector('#agree').checked = true;
     $('#agreeModal').removeClass('active');
     $('body').removeClass('no-scroll');
 });
 
 
 
 const callBookingApi = () => {
     const formData = new FormData();
     if (rental_type === "individual") {
         console.log("개인 예약");
 
         formData.append("rental_type", rental_type);
         formData.append("equipment_list", JSON.stringify(selectedEquipment));
         formData.append("equipment_plan", document.querySelector(".equipment-plan-individual").value);
         let indexArray = [];
         selectedFiles.forEach((file, i) => {
			
			indexArray.push(file);
        });
        indexArray.map((file , i) => {
         formData.append(`attach_file${i + 1}`, file);
		})
     } else if (rental_type === "company") {
         console.log("법인 예약");
         formData.append("rental_type", rental_type);
         formData.append("equipment_list", JSON.stringify(selectedEquipment));
         formData.append("equipment_plan", document.querySelector(".equipment-plan-company").value);
         formData.append("company_nm", document.querySelector("#company_nm").value);
         formData.append("sa_eob_no", document.querySelector("#sa_eob_no").value);
         formData.append("position", document.querySelector("#position").value);
         formData.append("company_address1", document.querySelector("#company_address1").value);
         formData.append("company_address2", document.querySelector("#company_address2").value);
         let indexArray = [];
         selectedFiles.forEach((file, i) => {
			
			indexArray.push(file);
         });
         indexArray.map((file , i) => {
           formData.append(`attach_file${i + 1}`, file);
		 })
     }
     $.ajax({
         url: '/api/booking.do'
         , type: "POST"
         , data: formData
         , processData: false
         , contentType: false
         , async: true,
         success: function (response) {
             if (response.msg === "ok") {
				 selectedFiles = new Map();
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