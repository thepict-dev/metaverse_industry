$('.listBody.userList > li').click(function () {
	$('.equipDetails').addClass('active');
});
$('.detailsTop button').click(function () {
	$('.equipDetails').removeClass('active');
});

function board_mod(idx) {
	location.href = "/equipment/equipment_register.do?idx=" + idx;
}
function board_list() {
	location.href = "/equipment/equipment_list.do";
}

function board_delete(idx) {
	if (confirm("삭제 하시겠습니까?")) {
		$('#idx').val(idx)
		$("#register").attr("action", "/board/board_delete.do");
		$("#register").submit();
	}
}
function search() {
	$("#search_fm").attr("action", "/board/board_list.do");
	$("#search_fm").submit();
}