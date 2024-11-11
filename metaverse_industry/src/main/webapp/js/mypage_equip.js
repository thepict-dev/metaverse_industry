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
    const file_list = $("#docAddModal .file_list")[0];
    $(".file_list").empty()
    
    const file_path1 = $(this).parent().find('#document_url1').val();
    
    const file_path2 = $(this).parent().find('#document_url2').val();
    const file_path3 = $(this).parent().find('#document_url3').val();
    
    const fileItem1 = document.createElement("div");
	fileItem1.classList.add("flexInputs")
	fileItem1.classList.add("file")
	fileItem1.innerHTML = `
        <p class="fileName file_name_01">${file_path1? file_path1 : "업로드한 파일이 존재하지 않습니다."}</p>
        <label for="document_file1" id="attach_file">${file_path1 ? "파일변경" : "파일추가"}</label>
        <input type="file" name="document_file1" id="document_file1" style="display: none;">
        <button type="button" id="deleteButton" class="delete_01" style="display: none;"><img src="/img/user_img/del-file.png" alt=""></button>
	`
	const fileItem2 = document.createElement("div");
	fileItem2.classList.add("flexInputs")
	fileItem2.classList.add("file")
	fileItem2.innerHTML = `
        <p class="fileName file_name_02">${file_path2 ? file_path2 : "업로드한 파일이 존재하지 않습니다."}</p>
        <label for="document_file2" id="attach_file">${file_path2 ? "파일변경" : "파일추가"}</label>
        <input type="file" name="document_file2" id="document_file2" style="display: none;">
        <button type="button" id="deleteButton" class="delete_02" style="display: none;"><img src="/img/user_img/del-file.png" alt=""></button>
		`
	const fileItem3 = document.createElement("div");
	fileItem3.classList.add("flexInputs")
	fileItem3.classList.add("file")
	fileItem3.innerHTML = `
        <p class="fileName file_name_03">${file_path3 ? file_path3 : "업로드한 파일이 존재하지 않습니다."}</p>
        <label for="document_file3" id="attach_file">${file_path3 ? "파일변경" : "파일추가"}</label>
        <input type="file" name="document_file3" id="document_file3" style="display: none;">
        <button type="button" id="deleteButton" class="delete_03" style="display: none;"><img src="/img/user_img/del-file.png" alt=""></button>
	`
	file_list.appendChild(fileItem1)
	file_list.appendChild(fileItem2)
	file_list.appendChild(fileItem3)
	
	
	const fileInput1 = document.getElementById('document_file1');
	const fileName1 = document.querySelector('.fileName.file_name_01');
	const deleteButton1 = document.querySelector('.delete_01');
	
	fileInput1.addEventListener('change', function (e) {
	    if (this.files[0]) {
	        fileName1.textContent = this.files[0].name;
	        deleteButton1.style.display = 'inline-block';
	    }
	});
	
	deleteButton1.addEventListener('click', function () {
	    fileInput1.value = '';
	    fileName1.textContent = file_path1;
	    this.style.display = 'none';
	});
	
	const fileInput2 = document.getElementById('document_file2');
	const fileName2 = document.querySelector('.fileName.file_name_02');
	const deleteButton2 = document.querySelector('.delete_02');
	
	fileInput2.addEventListener('change', function (e) {
	    if (this.files[0]) {
	        fileName2.textContent = this.files[0].name;
	        deleteButton2.style.display = 'inline-block';
	    }
	});
	
	deleteButton2.addEventListener('click', function () {
	    fileInput2.value = '';
	    fileName2.textContent = file_path2;
	    this.style.display = 'none';
	});
	
	const fileInput3 = document.getElementById('document_file3');
	const fileName3 = document.querySelector('.fileName.file_name_03');
	const deleteButton3 = document.querySelector('.delete_03');
	
	fileInput3.addEventListener('change', function (e) {
	    if (this.files[0]) {
	        fileName3.textContent = this.files[0].name;
	        deleteButton3.style.display = 'inline-block';
	    }
	});
	
	deleteButton3.addEventListener('click', function () {
	    fileInput3.value = '';
	    fileName3.textContent = file_path3;
	    this.style.display = 'none';
	});
	
	
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
/*
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
*/


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
        url: '/api/update_request.do' // Replace with your actual endpoint
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
	const file1 = document.querySelector("#document_file1").files;
	const file2 = document.querySelector("#document_file2").files;
	const file3 = document.querySelector("#document_file3").files;
	if (file1[0] || file2[0] || file3[0]) {
		$("#retryForm").attr("action", "/retry_request.do");
		$("#retryForm").submit();
	} else {
		return window.alert("증빙서류를 업로드해주세요.");
	}
});