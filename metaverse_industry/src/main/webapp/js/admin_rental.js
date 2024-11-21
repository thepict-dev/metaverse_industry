$('.listBody.userList > li > .title').click(function () {
	const li = $(this).parent();
	console.log(li);
	let user_id = li.find(".user_id").val();
	let company_nm = li.find(".company_nm").val();
	let company_address1 = li.find(".company_address1").val();
	let company_address2 = li.find(".company_address2").val();
	let sa_eob_no = li.find(".sa_eob_no").val();
	let position = li.find(".position").val();
	let document_url = li.find(".document_url").val();
	
	// 파일명만 추출하는 함수
	function getFileNameFromPath(filePath) {
		const parts = filePath.split('/');
		let fileName = parts[parts.length - 1];
		// UUID 패턴을 정규 표현식으로 제거
		fileName = fileName.replace(/[a-f0-9-]{36}/, '').trim();
		// 괄호와 숫자 제거
		fileName = fileName.replace(/\(\d+\)/, '').trim();
		return fileName;
	}
	
	// 파일명 추출
	let document_name = getFileNameFromPath(document_url);
	
	console.log(company_nm, company_address1, company_address2, sa_eob_no, position, document_url);
	console.log($('.equipDetails').find("._company_nm"));
	console.log($('.equipDetails').find("._company_address"));
	$('.equipDetails').find("._company_nm").text(company_nm);
	$('.equipDetails').find("._company_address").text(`${company_address1} ${company_address2}`);
	$('.equipDetails').find("._sa_eob_no").text(sa_eob_no);
	$('.equipDetails').find("._position").text(position);
	$('.equipDetails').find("._document_url").text(document_name);
	$('.equipDetails').find("._document_url").attr('href', document_url);
	
	$('.equipDetails').data('selected-user-id', user_id);
	
	$('.equipDetails').addClass('active');
});
$('.detailsTop button').click(function () {
	$('.equipDetails').removeClass('active');
});
let user_list = [];

function board_mod(idx) {
	location.href = "/equipment/equipment_register.do?idx=" + idx;
}
function board_list() {
	location.href = "/equipment/equipment_list.do";
}

function user_delete(idx) {
	console.log(idx);
	if (confirm("삭제 하시겠습니까?")) {
		$.ajax({
			url: '/user_list/user_delete.do',
			type: 'POST',
			data: JSON.stringify({ idx_list: [idx] }),
			contentType: "application/json",
			dataType: "json",
			success: function (response) {
				console.log("response @@@@@@@@@@@", response);
				window.alert("유저 삭제에 성공하였습니다.");
				window.location.reload();
				// 초기화
				// id_list = [];
				// selected_list = [];
				// item_cnt = null;
			}
		})
	}
}
function search() {
	$("#search_fm").attr("action", "/user_list/user_list.do");
	$("#search_fm").submit();
}


$(".selection").change(function () {
	user_list.push($(this).data("idx"));
})

$(".delete_user").click(function () {
	if (user_list.length === 0) {
		window.alert("삭제할 유저를 선택해주세요.");
		return;
	}
	if (window.confirm("유저를 삭제 하시겠습니까? 삭제시 신청내역 또한 삭제됩니다.")) {
		$.ajax({
			url: '/user_list/user_delete.do',
			type: 'POST',
			data: JSON.stringify({ idx_list: user_list }),
			contentType: "application/json",
			dataType: "json",
			success: function (response) {
				console.log("response @@@@@@@@@@@", response);
				window.alert("유저 삭제에 성공하였습니다.");
				window.location.reload();
				// 초기화
				// id_list = [];
				// selected_list = [];
				// item_cnt = null;
			}
		})
	}
})

function equip_rental() {
	const selectedUserId = $('.equipDetails').data('selected-user-id');
	const equipment = $('#category option:selected');
	const rentalType = $('#rental_type').val();
	const startDate = $('#rental_start_date').val();
	const endDate = $('#rental_end_date').val();
	const count = $('input[name="count"]').val();

	// if (!equipment.val() || !startDate || !endDate || !count) {
	// 	alert("장비, 대여일, 반납일, 수량을 모두 입력해주세요.");
	// 	return;
	// }

	// 날짜 형식 변환
	const originalStartDate = new Date(startDate);
	const originalEndDate = new Date(endDate);
	const formattedStartDate = startDate.replace(/-/g, '.');
	const formattedEndDate = endDate.replace(/-/g, '.');

	const formData = new FormData();
	formData.append("rental_type", rentalType);
	formData.append("equipment_list", JSON.stringify([{
		id: equipment.data('id'),
		name: equipment.text().trim(),
		cnt: count,
		original_rental_start_date: originalStartDate.toISOString(),
		original_rental_end_date: originalEndDate.toISOString(),
		rental_start_date: formattedStartDate,
		rental_end_date: formattedEndDate,
		request_status: 'approved'
	}]));
	formData.append("equipment_plan", "관리자 임의 대여");
	formData.append("user_id", selectedUserId);

	$.ajax({
		url: '/api/booking.do',
		type: 'POST',
		data: formData,
		processData: false,
		contentType: false,
		success: function(response) {
			if (response.msg === "ok") {
				alert("장비 대여가 완료되었습니다.");
				location.reload();
			} else {
				alert("장비 대여에 실패했습니다.");
			}
		},
		error: function() {
			alert("장비 대여 중 오류가 발생했습니다.");
		}
	});
}

// rentalButton 클릭 이벤트 핸들러
$('#rentalButton').click(function() {
	equip_rental();
});