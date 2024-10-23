// 파일 입력
$('#attach_file').on('change', function (e) {
	var fileName = e.target.files[0].name;
	$('.fileList p').text(fileName);
	$('.fileList').css('display', 'flex');
});

// 파일 삭제
$('.fileList button').on('click', function (e) {
	e.preventDefault();
	$('.fileList p').text('');
	$('#attach_file').val('');
	$('.fileList').hide();
});

// fileList 숨김
$('.fileList').hide();

function button1_click() {
	var name = $('#name').val();

	if (name == "" || name == undefined) {
		window.alert("시설명을 입력해주세요.");
		$('#name').focus();
		return false;
	}

	if (!$('#description').val()) {
		window.alert("시설의 설명을 입력해주세요.");
		$('#description').focus();
		return false;
	}


	if ($("#saveType").val() !== 'update') {
		if ($('#attach_file')[0].files.length === 0) {
			window.alert("썸네일을 추가해주세요.");
			$('#attach_file').focus();
			return false;
		}
	}

	var text = "등록하시겠습니까?";
	if ($("#saveType").val() == 'update') {
		text = "수정하시겠습니까?"
	}


	if (confirm(text)) {
		$("#register").attr("action", "/facility/facility_save.do");
		$("#register").submit();
	}
}


$(".preview-category").text("HMD");
$("#category").change(function () {
	$(".preview-category").text($("#category").val());
});

$("#name").change(function () {
	$(".preview-name").text($("#name").val());
});

$("#description").change(function () {
	$(".preview-description").text($("#description").val());
});

$("#attach_file").change(function (e) {
	if (e.target.files && e.target.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			console.log("e.target.result @@@@@@@@@@@", e.target.result);
			$(".preview-image").attr("src", e.target.result);
		}
		reader.readAsDataURL(e.target.files[0]);
	}

});