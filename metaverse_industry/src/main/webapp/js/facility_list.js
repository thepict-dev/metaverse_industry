let equipmentIdxList = [];


$('.detailsTop button').click(function () {
	$('.equipDetails').removeClass('active');
});

function board_mod(idx) {
	location.href = "/facility/facility_register.do?idx=" + idx;
}
function board_list() {
	location.href = "/facility/facility_list.do";
}

function board_delete(idx) {
	if (confirm("시설을 삭제 하시겠습니까? 삭제시 시설 대여 신청 내역 또한 삭제될 수 있습니다.")) {

		$.ajax({
			url: '/deleteFacilities.do',
			type: 'POST',
			data: JSON.stringify({ idx_list: [Number(idx)] }),
			contentType: "application/json",
			dataType: "json",
			success: function (response) {
				console.log("response @@@@@@@@@@@", response);
				window.alert("시설 삭제에 성공하였습니다.");
				window.location.reload();
			}
		})

	}
}
function search() {
	$("#search_fm").attr("action", "/facility/facility_list.do");
	$("#search_fm").submit();
}

const toggleRadioList = document.querySelectorAll(".toggle");
toggleRadioList.forEach(toggleRadio => {
	toggleRadio.addEventListener('click', (e) => {
		const input = toggleRadio.parentElement.querySelector("input");
		const status = input.checked ? 'available' : 'disabled';
		if (status === 'available') {
			if (window.confirm("장비를 대여불가 상태로 변경하시겠습니까?")) {
				console.log(toggleRadio.dataset.id);
				return changeStatus(toggleRadio.dataset.id, 'disabled', input);
			}
		} else {
			if (window.confirm("장비를 대여가능 상태로 변경하시겠습니까?")) {
				console.log(toggleRadio.dataset.id);
				return changeStatus(toggleRadio.dataset.id, 'available', input);
			}
		}
	})
})

function changeStatus(id, status, input) {
	const param = {
		id: id,
		status: status
	}
	console.log("param @@@@@@@@@@@", param);

	$.ajax({
		url: '/toggleFacilityStatus.do',
		type: 'POST',
		data: JSON.stringify(param),
		contentType: "application/json",
		dataType: "json",
		success: function (response) {
			if (response.msg === "ok") {
				if (status === 'available') {
					input.checked = true;
				} else {
					input.checked = false;
				}
			} else {
				window.alert("시설 상태 변경에 실패하였습니다.");
			}
		}
	})




	console.log("changeStatus @@@@@@@@@@@", idx);
}


$(".selection").change(function () {
	console.log($(this).data("idx"));
	equipmentIdxList.push($(this).data("idx"));
})

$(".deleteEquipments").click(function () {
	
	if (equipmentIdxList.length === 0) {
		window.alert("삭제할 시설을 선택해주세요.");
		return;
	}
	if (window.confirm("시설을 삭제 하시겠습니까? 삭제시 시설 대여 신청 내역 또한 삭제될 수 있습니다.")) {
		$.ajax({
			url: '/deleteFacilities.do',
			type: 'POST',
			data: JSON.stringify({ idx_list: equipmentIdxList }),
			contentType: "application/json",
			dataType: "json",
			success: function (response) {
				console.log("response @@@@@@@@@@@", response);
				window.alert("시설 삭제에 성공하였습니다.");
				window.location.reload();
				// 초기화
				// id_list = [];
				// selected_list = [];
				// item_cnt = null;
			}
		})

	}
})