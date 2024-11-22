$(".wtButtonContainer").hide();
$("#serial_number").change(function(e) {
	if (e.target.value === "") {
		return;
	}
	$("#idx").val("");
	
	// API 호출을 GET 방식으로 수정
	$.ajax({
		url: "/api/rentalApprovedList.do",
		method: "GET",
		data: { serial_number: $(this).val() },
		success: function(res) {
			$("#userEquipList").empty();
			
			if (res && res.length > 0) {
				res.forEach((item, index) => {
					const statusText = getStatusText(item.request_status);
					const tr = `
						<tr data-item='${JSON.stringify(item)}'>
							<td><input type="radio" name="userSelect" value="${index}"></td>
							<td>${index + 1}</td>
							<td>${item.name || ''}</td>
							<td>${item.serial_number || ''}</td>
							<td>${item.rental_start_date || ''}</td>
							<td>${item.rental_end_date || ''}</td>
							<td>${statusText}</td>
							<td>${item.user_name || ''}</td>
							<td>${item.request_date || ''}</td>
						</tr>
					`;
					$("#userEquipList").append(tr);
				});
				
				// 팝업 표시
				$("#userListPopup").css('display', 'flex');
			} else {
				window.alert("조회 가능한 데이터가 없습니다.");
			}
		},
		error: function(xhr, status, error) {
			console.error("Error:", error);
			window.alert("데이터 조회 중 오류가 발생했습니다.");
		}
	});
});

// 상태 텍스트 변환 함수
function getStatusText(status) {
	switch(status) {
		case "approved": return "승인완료";
		case "rental": return "대여중";
		case "overdue": return "연체중";
		case "returned": return "반납완료";
		default: return status;
	}
}

// 팝업 닫기
$("#userListPopup button").click(function() {
	$("#userListPopup").hide();
});

// 사용자 선택
function choose_user() {
	const selectedRadio = $("input[name='userSelect']:checked");
	if (selectedRadio.length === 0) {
		alert("사용자를 선택해주세요.");
		return;
	}
	
	const selectedTr = selectedRadio.closest('tr');
	const userData = JSON.parse(selectedTr.attr('data-item'));
	
	// 선택된 사용자 정보 바인딩
	bindUserData(userData);
	
	// 팝업 닫기
	$("#userListPopup").hide();
}

// 사용자 정보 바인딩 함수
function bindUserData(data) {
	console.log("bindUserData 호출됨. 전체 데이터:", data);
	console.log("id 값:", data.id);
	
	$('.user_type').text(data.rental_type === "1" ? "개인" : "기업");
	$('.equipment_type').text(data.type);
	$('.equipment_name').text(data.name);
	$('.user_name').text(data.user_name);
	$('#rental_start_date').val(data.rental_start_date);
	$('#rental_end_date').val(data.rental_end_date);
	
	let request_status = getStatusText(data.request_status);
	$('.request_status').text(request_status);
	
	$(".submit").attr("data-status", data.request_status);
	$(".submit").attr("data-id", data.id);
	console.log("설정된 data-id 값:", $(".submit").attr("data-id"));
	
	updateSubmitButton(data.request_status);
	
	$(".plan").text(data.equipment_plan);
	$(".serial_number").text(data.serial_number);
	$("#reg_date").val(data.equipment_reg_date);
	$("#bujajae").text(data.item_text);
	
	$('#register').children('input[name="idx"]').val(data.idx)
	$('input[name="idx"]').val(data.idx)
	
	
	$(".wtButtonContainer").show();
}

// 제출 버튼 상태 업데이트
function updateSubmitButton(status) {
	const submitBtn = $(".submit");
	submitBtn.removeClass("white blue");
	
	switch(status) {
		case "approved":
			submitBtn.addClass("blue").text("대여처리");
			break;
		case "rental":
		case "overdue":
			submitBtn.addClass("blue").text("반납처리");
			break;
		case "returned":
			submitBtn.addClass("white").text("반납완료");
			break;
	}
}

$("#idx").change(function(e) {
	$(this).val($(this).val().replace(/[^0-9]/g, ''));
	if (e.target.value === "") {
		return
	}
	
	$("#serial_number").val("")
	let param = {
		idx: $(this).val(),
	};

	$.ajax({
		url: "/get_qr_code.do",
		method: "POST",
		data: JSON.stringify(param),
		contentType: "application/json",
		dataType: "json",
		success: function (res) {
			console.log("QR 코드 응답 데이터:", res);
			if (res.msg === "ok") {
				const data = res.data;
				console.log("QR 코드 처리 - id 값:", data.id);
				$('.user_type').text(data.rental_type === "1" ? "개인" :"기업")
				$('.equipment_type').text(data.type);
				$('.equipment_name').text(data.name);
				$('.user_name').text(data.user_name);
				$('#rental_start_date').val(data.rental_start_date);
				$('#rental_end_date').val(data.rental_end_date);
				let request_status = '';
				$(".submit").attr("data-status", data.request_status);
				$(".submit").attr("data-id", data.id);

				
				if (data.request_status === "approved") {
					request_status = "승인완료";
					$(".submit").text("대여처리");

				} else if (data.request_status === "rental") {
					request_status = "대여중";
					$(".submit").text("반납처리");

				} else if (data.request_status === "overdue") {
					request_status = "연체중";
					$(".submit").text("반납처리");
				} else if (data.request_status === "returned") {
					$(".submit").removeClass("blue");
					$(".submit").addClass("white");
					$(".submit").text("반납완료");
					request_status = "반납완료"
				}
				$('.request_status').text(request_status);
				$(".plan").text(data.equipment_plan);
				$(".serial_number").text(data.serial_number)
				$("#reg_date").val(data.equipment_reg_date);
				$("#bujajae").text(data.item_text);
				
				$(".wtButtonContainer").show();
				/*
				if (data.file_path) {
					const Container = document.createElement("div");
					Container.classList.add("inputsContainer");
					Container.innerHTML = `
						<div class="inputBox">
							<p class="inputCaption">첨부파일 1</p>
							<div class="fileList binding">
								<p class="file_name">${data.file_path}</p>
							</div>
						</div>
					`
					document.querySelector(".uploaded_files").appendChild(Container);
				}
				if (data.file_path2) {
					const Container = document.createElement("div");
					Container.classList.add("inputsContainer");
					Container.innerHTML = `
						<div class="inputBox">
							<p class="inputCaption">첨부파일 2</p>
							<div class="fileList binding">
								<p class="file_name">${data.file_path2}</p>
							</div>
						</div>
					`
					document.querySelector(".uploaded_files").appendChild(Container);
				}
				if (data.file_path3) {
					const Container = document.createElement("div");
					Container.classList.add("inputsContainer");
					Container.innerHTML = `
						<div class="inputBox">
							<p class="inputCaption">첨부파일 3</p>
							<div class="fileList binding">
								<p class="file_name">${data.file_path3}</p>
							</div>
						</div>
					`
					document.querySelector(".uploaded_files").appendChild(Container);
				}
				*/
			} else {
				$(".wtButtonContainer").hide();
				$('.user_type').text("")
				$('.equipment_type').text("");
				$('.equipment_name').text("");
				$('.user_name').text("");
				$('#rental_start_date').val("");
				$('#rental_end_date').val("");
				$(".submit").attr("data-status", "");
				$(".submit").attr("data-id", "");

				$('.request_status').text("");
				$(".plan").text("");
				$(".serial_number").text("")
				$("#reg_date").val("");
				$("#bujajae").text("");
				$(".file_name").val("");
				window.alert("오늘 날짜를 기준으로 조회 가능한 데이터가 없습니다.");
			}
		}
	})
})


$(".submit").click(function () {
	const status = $(this).data("status");
	const id = $(this).data("id");
	console.log("submit 버튼 클릭됨");
	console.log("현재 상태:", status);
	console.log("현재 ID:", id);
	
	if (status === "approved") {
		if (window.confirm("대여처리 하시겠습니까?")) {
			let param = {
				idx: $('#register').children('input[name="idx"]').val(),
				status: "rental",
			};
	
			$.ajax({
				url: "/update_request.do",
				method: "POST",
				data: JSON.stringify(param),
				contentType: "application/json",
				dataType: "json",
				success: function (res) {
					console.log(res);
					if (res.msg === "ok") {
						window.alert("대여처리가 완료되었습니다.");
						window.location.reload()
					}
				}
			})
		}
		
	}
	if (status === "rental" || status === "overdue") {		
		if (window.confirm("반납처리 하시겠습니까?")) {
			let param = {
				id: $(this).data("id"),
				status: "returned",
			};
	
			$.ajax({
				url: "/update_request.do",
				method: "POST",
				data: JSON.stringify(param),
				contentType: "application/json",
				dataType: "json",
				success: function (res) {
					console.log(res);
					if (res.msg === "ok") {
						window.alert("반납처리가 완료되었습니다.");
					}
				}
			})
		}
	}
})