
$(".wtButtonContainer").hide();
$("#serial_number").change(function(e) {
	console.log($(this).val())
	if (e.target.value === "") {
		return
	}
	$("#idx").val("");
	let param = {
		serial_number: $(this).val(),
	};

	$.ajax({
		url: "/get_qr_code.do",
		method: "POST",
		data: JSON.stringify(param),
		contentType: "application/json",
		dataType: "json",
		success: function (res) {
			console.log(res.data)
			$(".uploaded_files").empty();
			if (res.msg === "ok") {
				$(".wtButtonContainer").show();
				const data = res.data;
				$('.user_type').text(data.rental_type === "1" ? "개인" :"기업")
				$('.equipment_type').text(data.type);
				$('.equipment_name').text(data.equipment_name);
				$('.user_name').text(data.user_name);
				$('#rental_start_date').val(data.rental_start_date);
				$('#rental_end_date').val(data.rental_end_date);
				let request_status = '';
				$(".submit").attr("data-status", data.request_status);
				$(".submit").attr("data-request_idx", data.request_idx);
		

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
				$(".file_name").val(data.file_path)
				
				$(".wtButtonContainer").show();
				
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
			} else {
				$(".wtButtonContainer").hide();
				$('.user_type').text("")
				$('.equipment_type').text("");
				$('.equipment_name').text("");
				$('.user_name').text("");
				$('#rental_start_date').val("");
				$('#rental_end_date').val("");
				$(".submit").attr("data-status", "");
				$(".submit").attr("data-request_idx", "");

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
			console.log(res.data)
			$(".uploaded_files").empty();
			if (res.msg === "ok") {
				
				const data = res.data;
				$('.user_type').text(data.rental_type === "1" ? "개인" :"기업")
				$('.equipment_type').text(data.type);
				$('.equipment_name').text(data.equipment_name);
				$('.user_name').text(data.user_name);
				$('#rental_start_date').val(data.rental_start_date);
				$('#rental_end_date').val(data.rental_end_date);
				let request_status = '';
				$(".submit").attr("data-status", data.request_status);
				$(".submit").attr("data-request_idx", data.request_idx);


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
			} else {
				$(".wtButtonContainer").hide();
				$('.user_type').text("")
				$('.equipment_type').text("");
				$('.equipment_name').text("");
				$('.user_name').text("");
				$('#rental_start_date').val("");
				$('#rental_end_date').val("");
				$(".submit").attr("data-status", "");
				$(".submit").attr("data-request_idx", "");

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
	console.log(status);
	if (status === "approved") {
		if (window.confirm("대여처리 하시겠습니까?")) {
			let param = {
				idx: $(".submit").data("request_idx"),
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
				idx: $(this).data("request_idx"),
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