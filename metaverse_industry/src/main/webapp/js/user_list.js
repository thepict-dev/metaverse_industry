$('.listBody.userList > li > .title').click(function () {
	const li = $(this).parent();
	console.log(li);
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