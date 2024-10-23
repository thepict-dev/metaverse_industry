//이용상태 모달 열고, 닫기
$('.infos').click(function () {
    $('.stateModal').addClass('active');
    $('body').addClass("no-scroll");
})
$('.stateModal button').click(function () {
    $('.stateModal').removeClass('active');
    $('body').removeClass("no-scroll");
})

//서류보완 모달 열고, 닫기
$('.docAdd').click(function () {
	const id = $(this).data('id');
	console.log("id @@@@@@@@@@@",id);
    $('#docAddModal').addClass('active');
    const reject_msg = $(this).parent().find('.reject_msg').val();
    console.log(reject_msg);
    $('.reject_msg_ui').text(reject_msg);
    $('#retryForm').find('#id').val(id);
    
    $('body').addClass("no-scroll");
})
$('#docAddModal button').click(function () {
    $('#docAddModal').removeClass('active');
    $('body').removeClass("no-scroll");
})

//승인거절 모달 열고, 닫기
$('.reject').click(function () {
    $('#rejectModal').addClass('active');

    $('body').addClass("no-scroll");
})
$('#rejectModal button, #closeReject').click(function () {
    $('#rejectModal').removeClass('active');
    $('body').removeClass("no-scroll");
})

//정보보기 모달 열고, 닫기
$('.check').click(function () {
    const container = document.querySelector("#bookingInfoModal .infoSlides");
    const row = $(this).closest('tr');
    console.log(row);
    const equip_name = row.find('.equip_name > p').text();
    const user_name = row.find('.user_name > p').text();
    const user_type = row.find('.user_type > p').text();
    const rental_start_date = row.find('.rental_start_date > p').text();
    const rental_end_date = row.find('.rental_end_date > p').text();
    const company_nm = row.find('.company_nm').val();
    console.log(equip_name, user_name, user_type, rental_start_date, rental_end_date, company_nm);
    if (user_type === '개인') {
        container.innerHTML = `
            <ul class="bookingInfolists">
                <li>
                    <p>장비명</p>
                    <span>${equip_name}</span>
                </li>
                <li>
                    <p>대여자명</p>
                    <span>${user_name}</span>
                </li>
                <li>
                    <p>대여형태</p>
                    <span>${user_type}</span>
                </li>
                <li>
                    <p>대여일</p>
                    <span>${rental_start_date}</span>
                </li>
                <li>
                    <p>반납일</p>
                    <span>${rental_end_date}</span>
                </li>
            </ul>
        `;
    } else {
        container.innerHTML = `
            <ul class="bookingInfolists">
                <li>
                    <p>장비명</p>
                    <span>${equip_name}</span>
                </li>
                <li>
                    <p>대여자명</p>
                    <span>${user_name}</span>
                </li>
                <li>
                    <p>대여형태</p>
                    <span>${user_type}</span>
                </li>
                <li>
                    <p>회사명</p>
                    <span>${company_nm}</span>
                </li>
                <li>
                    <p>대여일</p>
                    <span>${rental_start_date}</span>
                </li>
                <li>
                    <p>반납일</p>
                    <span>${rental_end_date}</span>
                </li>
            </ul>
        `;
    }
    $('#bookingInfoModal').addClass('active');
    $('body').addClass("no-scroll");
})
$('#bookingInfoModal button, .closeCheck').click(function () {
    $('#bookingInfoModal').removeClass('active');
    $('body').removeClass("no-scroll");
})

const fileInput = document.getElementById('document_file');
const fileName = document.querySelector('.fileName');
const deleteButton = document.getElementById('deleteButton');

fileInput.addEventListener('change', function (e) {
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


$('.cancel_request').click(function () {
    if (!confirm('예약을 취소하시겠습니까?')) {
        return;
    }
    const id = $(this).data('id');
    const param = {
        id: id,
        request_status: 'cancelled'
    }
    $.ajax({
        url: '/api/update_facility_request.do' // Replace with your actual endpoint
        , type: "POST"
        , data: JSON.stringify(param)
        , contentType: "application/json"
        , dataType: "json"
        , async: true,
        success: function (response) {
            if (response.rst) {
                window.alert('예약이 취소되었습니다.');
                window.location.reload();
            }

        },
        error: function (e) {
            console.log(e);
        }
    });
})

$(".retryButton").click(function(){
	const files = document.querySelector("#document_file").files;
	console.log(files);
	if (files[0]) {
		
		$("#retryForm").attr("action", "/retry_facility_request.do");
		$("#retryForm").submit();
	} else {
		return window.alert("증빙서류를 업로드해주세요.");
	}
});