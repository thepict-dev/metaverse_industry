$('.listBody.equipList > li').click(function () {
	const id = $(this).data('id');
	console.log("id @@@@@@@@@@@", id);
	const type = $(this).find('.equip_type').text();
	const name = $(this).find('.title').text();
	const image_url = $(this).find('.listImg > img').attr('src');
	const reg_date = $(this).find('.reg_date').text();
	$('.addSerial').attr('href', `/equipment/equipment_cnt_register.do?id=${id}`);
	$('.detailCardInner').find('.detailCate').text(type);
	$('.detailCardInner').find('.detailCardText > p').text(name);
	$('.detailCardInner').find('.detailCardImg > img').attr('src', image_url);
	$('.detailCardInner').find('.detailDate').text(reg_date);
	$('.equipDetails').addClass('active');
	$('.detailBody').empty();
	$.ajax({
		url: '/api/getEquipmentItems.do',
		type: 'POST',
		data: JSON.stringify({ id: id }),
		contentType: "application/json",
		dataType: "json",
		success: function (response) {
			if (response.msg === "ok") {
				const data = response.data;
				data.forEach(item => {

					const li = document.createElement('li');
					li.dataset.id = item.id;
					li.innerHTML = `
						<div class="checkBox">
							<input type="checkbox" id="selection${item.idx}"><label for="selection${item.idx}"
								class="lableOnly"></label>
						</div>
						<p>${item.serial_number}</p>
						<p>${item.reg_date}</p>
						<div class="switchInput">
							<input type="checkbox" ${item.status === 'available' ? 'checked' : ''} name="onoff-switch" id="onoff-switch${item.idx}" />
							<label for="onoff-switch${item.idx}"></label>
						</div>
						<p class="label"><a href="#lnk"></a></p>
						<p class="delete"><a href="#lnk"></a></p>
					`
					$('.detailBody').append(li);
				})
			}
		}
	});
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