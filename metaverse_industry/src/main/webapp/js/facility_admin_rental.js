$('.listBody.rentalList > li > .title').click(function () {
	const li = $(this).parent();
	console.log(li);
	let user_id = li.find(".user_id").val();
	let company_nm = li.find(".company_nm").val();
	let company_address1 = li.find(".company_address1").val();
	let company_address2 = li.find(".company_address2").val();
	let sa_eob_no = li.find(".sa_eob_no").val();
	let position = li.find(".position").val();
	
	$('.equipDetails').find("._company_nm").text(company_nm);
	$('.equipDetails').find("._company_address").text(`${company_address1} ${company_address2}`);
	$('.equipDetails').find("._sa_eob_no").text(sa_eob_no);
	$('.equipDetails').find("._position").text(position);
	
	$('.equipDetails').data('selected-user-id', user_id);
	$('.equipDetails').addClass('active');
});

$('.detailsTop button').click(function () {
	$('.equipDetails').removeClass('active');
});

let user_list = [];

function search() {
	const searchParams = new URLSearchParams(window.location.search);
	const pageNumber = searchParams.get('pageNumber') || 1;
	
	$("#search_fm").attr("action", `/facility/facility_admin_rental.do?pageNumber=${pageNumber}`);
	$("#search_fm").submit();
}

$(".selection").change(function () {
	user_list.push($(this).data("idx"));
});

function facility_rental() {
	const selectedUserId = $('.equipDetails').data('selected-user-id');
	const facility = $('#category option:selected');
	const rentalType = $('#rental_type').val();
	const startDate = $('#rental_start_date').val();
	const endDate = $('#rental_end_date').val();

	if (!facility.val() || !startDate || !endDate) {
		alert("시설, 대여일, 반납일을 모두 입력해주세요.");
		return;
	}

	// 날짜 형식 변환
	const originalStartDate = new Date(startDate);
	const originalEndDate = new Date(endDate);
	const formattedStartDate = startDate.replace(/-/g, '.');
	const formattedEndDate = endDate.replace(/-/g, '.');

	const formData = new FormData();
	formData.append("rental_type", rentalType);
	formData.append("facility_list", JSON.stringify([{
		id: facility.data('id'),
		name: facility.text().trim(),
		cnt: 1,
		original_rental_start_date: originalStartDate.toISOString(),
		original_rental_end_date: originalEndDate.toISOString(),
		rental_start_date: formattedStartDate,
		rental_end_date: formattedEndDate
	}]));
	formData.append("facility_plan", "관리자 임의 대여");
	formData.append("user_id", selectedUserId);

	$.ajax({
		url: '/api/booking_facility.do',
		type: 'POST',
		data: formData,
		processData: false,
		contentType: false,
		success: function(response) {
			if (response.msg === "ok") {
				alert("시설 대여가 완료되었습니다.");
				location.reload();
			} else {
				
				alert("시설 대여에 실패했습니다.");
				console.log(response);
			}
		},
		error: function(xhr, status, error) {
			alert("시설 대여 중 오류가 발생했습니다.");
			console.log(xhr.responseText);
		}
	});
}

// rentalButton 클릭 이벤트 핸들러
$('#rentalButton').click(function() {
	facility_rental();
});