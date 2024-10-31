let selected_list = [];
let id_list = [];
let item_cnt = null;
let equipmentIdxList = [];


$('.listBody.equipList > li').click(function (e) {
	if ($(this).find("button")[0] === e.target || $(this).find(".lableOnly")[0] === e.target || $(this).find(".selection")[0] === e.target || $(this).find(".checkBox")[0] === e.target) {
		return;
	}

	// 초기화
	selected_list = [];
	id_list = [];
	// 로직
	const id = $(this).data('id');
	// console.log("id @@@@@@@@@@@", id);
	const type = $(this).find('.equip_type').text();
	const name = $(this).find('.title').text();
	const image_url = $(this).find('.listImg > img').attr('src');
	const reg_date = $(this).find('.reg_date').text();
	item_cnt = $(this).find(".items_cnt");
	// 화면처리
	$('.addSerial').attr('href', `/equipment/equipment_cnt_register.do?id=${id}`);
	$('.detailCardInner').find('.detailCate').text(type);
	$('.detailCardInner').find('.detailCardText > p').text(name);
	$('.detailCardInner').find('.detailCardImg > img').attr('src', image_url);
	$('.detailCardInner').find('.detailDate').text(reg_date);
	$('.equipDetails').addClass('active');
	$('.detailBody').empty();
	// 데이터 조회
	$.ajax({
		url: '/api/getEquipmentItems.do',
		type: 'POST',
		data: JSON.stringify({ id: id }),
		contentType: "application/json",
		dataType: "json",
		success: function (response) {
			// 성공
			if (response.msg === "ok") {
				const data = response.data;
				data.forEach(item => {
					// 화면처리
					const li = document.createElement('li');
					li.dataset.id = item.id;
					li.innerHTML = `
						<div class="checkBox">
							<input class="selection" type="checkbox" id="selection${item.idx}"><label for="selection${item.idx}"
								class="lableOnly"></label>
						</div>
						<p><a href="/equipment/equipment_cnt_register.do?idx=${item.idx}">${item.serial_number}</a></p>
						<p>${item.reg_date}</p>
						<div class="switchInput">
							<input type="checkbox" ${item.status === 'available' ? 'checked' : ''} name="status" id="onoff-switch${item.idx}" />
							<label class="toggle"></label>
						</div>
						<p class="label"><a data-idx="${item.idx}" href="#lnk"></a></p>
						<p class="delete"><a class="deleteItem" href="#lnk"></a></p>
					`
					const toggleRadio = li.querySelector(".toggle");
					toggleRadio.addEventListener('click', (e) => {
						const input = toggleRadio.parentElement.querySelector("input");
						const status = input.checked ? 'available' : 'disabled';
						if (status === 'available') {
							if (window.confirm("장비를 대여불가 상태로 변경하시겠습니까?")) {
								return changeStatus(item.idx, 'disabled', input);
							}
						} else {
							if (window.confirm("장비를 대여가능 상태로 변경하시겠습니까?")) {
								return changeStatus(item.idx, 'available', input);
							}
						}
					})
					li.querySelector('.deleteItem').addEventListener('click', (e) => {
						e.preventDefault();
						deleteItems([item.id], [item.idx], item_cnt);
					})
					li.querySelector('.selection').addEventListener('change', (e) => {
						if (e.target.checked) {
							selected_list.push(item.idx);
							id_list.push(item.id);
						} else {
							selected_list = selected_list.filter(idx => idx !== item.idx);
							id_list = id_list.filter(id => id !== item.id);
						}
					})
					li.querySelector(".label a").addEventListener('click', (e) => {
						$("#qr-img").empty();
						console.log(item);
						console.log(item.serial_number);
						e.preventDefault();
						new QRCode(document.querySelector("#qr-img"), {
							text: item.serial_number
						});
						document.querySelector(".label-type").textContent = type;
						document.querySelector(".label-name").textContent = name;
						document.querySelector(".label-serial-number").textContent = "시리얼 넘버 : " + item.serial_number;
						document.querySelector(".lable-reg-date").textContent = item.reg_date;
						$('.qr-label-container').addClass('active');
						setTimeout(() => {
							const element = $('.qr-label-container')[0];

							// html2canvas 옵션
							const options = {
								scale: 1,  // 해상도 향상
								useCORS: true,  // 외부 이미지 허용
								backgroundColor: '#ffffff',  // 배경색
								logging: false,  // 디버그 로깅 비활성화
								allowTaint: true,  // 외부 이미지 허용
								letterRendering: true,  // 텍스트 렌더링 품질 향상
							};

							html2canvas(element, options).then(function (canvas) {
								try {
									// 이미지 품질 설정
									const imgData = canvas.toDataURL('image/png', 1.0);

									// 현재 날짜시간으로 파일명 생성
									const date = new Date();
									const fileName = `detail_card_${date.getFullYear()}${(date.getMonth() + 1).toString().padStart(2, '0')}${date.getDate().toString().padStart(2, '0')}_${date.getHours().toString().padStart(2, '0')}${date.getMinutes().toString().padStart(2, '0')}.png`;

									// 다운로드
									const downloadLink = document.createElement('a');
									downloadLink.href = imgData;
									downloadLink.download = fileName;

									document.body.appendChild(downloadLink);
									downloadLink.click();
									document.body.removeChild(downloadLink);

									// 성공 메시지 (선택사항)
									$('.qr-label-container').removeClass('active');
								} catch (error) {
									console.error('이미지 저장 중 오류 발생:', error);
									alert('이미지 저장 중 오류가 발생했습니다.');
								} finally {

								}
							}).catch(function (error) {
								console.error('캡처 중 오류 발생:', error);
								alert('이미지 캡처 중 오류가 발생했습니다.');

							});
						}, 500)
					})
					$('.detailBody').append(li);
				})
			}
		}
	});
});
$('.deleteItems').click(function () {
	console.log("selected_list @@@@@@@@@@@", selected_list);
	console.log("id_list @@@@@@@@@@@", id_list);
	console.log("item_cnt @@@@@@@@@@@", item_cnt);

	deleteItems(id_list, selected_list, item_cnt);
})


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
	if (confirm("장비를 삭제 하시겠습니까? 삭제시 장비신청 내역과 장비 재고 또한 삭제됩니다.")) {
		$.ajax({
			url: '/deleteEquipment.do',
			type: 'POST',
			data: JSON.stringify({ idx_list: [idx] }),
			contentType: "application/json",
			dataType: "json",
			success: function (response) {
				console.log("response @@@@@@@@@@@", response);
				window.alert("장비 삭제에 성공하였습니다.");
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
	$("#search_fm").attr("action", "/board/board_list.do");
	$("#search_fm").submit();
}

function changeStatus(idx, status, input) {
	const param = {
		idx: idx,
		status: status
	}
	console.log("param @@@@@@@@@@@", param);
	$.ajax({
		url: '/changeItemStatus.do',
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
				window.alert("장비 상태 변경에 실패하였습니다.");
			}
		}
	})




	console.log("changeStatus @@@@@@@@@@@", idx);
}

function deleteItems(id_list, idx_list, item_cnt) {
	if (window.confirm("장비의 재고를 삭제 하시겠습니까? 삭제시 장비신청 내역 또한 삭제됩니다.")) {
		const param = {
			idx_list: idx_list
		}
		console.log("param @@@@@@@@@@@", param);
		$.ajax({
			url: '/deleteItems.do',
			type: 'POST',
			data: JSON.stringify(param),
			contentType: "application/json",
			dataType: "json",
			success: function (response) {
				console.log("response @@@@@@@@@@@", response);
				window.alert("장비 삭제에 성공하였습니다.");
				id_list.forEach(id => {
					document.querySelector(`.detailBody > li[data-id="${id}"]`).remove();
				})
				item_cnt.text(parseInt(item_cnt.text()) - idx_list.length);
				// 초기화
				// id_list = [];
				// selected_list = [];
				// item_cnt = null;
			}
		})
	}
}

$(".selection").change(function () {
	equipmentIdxList.push($(this).data("idx"));
})

$(".deleteEquipments").click(function () {
	if (equipmentIdxList.length === 0) {
		window.alert("삭제할 장비를 선택해주세요.");
		return;
	}
	if (window.confirm("장비를 삭제 하시겠습니까? 삭제시 장비신청 내역과 장비 재고 또한 삭제됩니다.")) {
		console.log("equipmentIdxList @@@@@@@@@@@", equipmentIdxList);
		$.ajax({
			url: '/deleteEquipment.do',
			type: 'POST',
			data: JSON.stringify({ idx_list: equipmentIdxList }),
			contentType: "application/json",
			dataType: "json",
			success: function (response) {
				console.log("response @@@@@@@@@@@", response);
				window.alert("장비 삭제에 성공하였습니다.");
				window.location.reload();
				// 초기화
				// id_list = [];
				// selected_list = [];
				// item_cnt = null;
			}
		})
	}
})