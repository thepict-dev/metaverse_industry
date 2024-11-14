<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>

<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>


<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/head.jsp">
	<c:param name="pageTitle" value="장비 등록" />
</c:import>

<body>

	<%@include file="../main/lnb.jsp"%>
	<c:import url="../main/header.jsp">
		<c:param name="title" value="장비 관리" />
		<c:param name="subtitle" value="세부장비등록" />
	</c:import>
	<div class="contentsContainer">
		<div class="listContainer">
			<div class="listInner">
				<form action="" id="register" name="register" method="post"
					enctype="multipart/form-data" class="boardForm">
					<input type="hidden" name="status" id="status"
						value="${pictVO.status}">
					<div class="inputsContainer">
						<div class="inputBox">
							<p class="inputCaption">장비구분*</p>
							<select name="equipment_id" id="equipment_id" class="lgThinInput"
								disabled>
								<option value="${equipment.category}" selected>
									${equipment.category}</option>
							</select>
						</div>
						<div class="inputBox">
							<p class="inputCaption">장비명*</p>
							<input type="text" name="name" id="name"
								placeholder="장비 이름을 입력하세요…" value="${equipment.name}" disabled>
						</div>
						<div class="inputBox">
							<p class="inputCaption">장비상태</p>
							<div class="switchInput nonTop">
								<input type="checkbox" class="toggle" name="toggle"
									<c:if
															test="${pictVO.status eq 'available'}">checked</c:if>
									id="onoff-switch1" /> <label for="onoff-switch1"></label>
							</div>
						</div>
					</div>

					<div class="inputsContainer">
						<div class="inputBox">
							<p class="inputCaption">시리얼넘버*</p>
							<input type="text" name="serial_number" id="serial_number"
								placeholder="시리얼넘버를 입력하세요…" value="${pictVO.serial_number}"
								class="lgThinInput">
						</div>
						<div class="inputBox">
							<p class="inputCaption">등록일</p>
							<input type="date" value="${pictVO.reg_date}" id="reg_date"
								name="reg_date" class="lgThinInput">
						</div>
					</div>
					<div class="inputsContainer">
						<div class="inputBox" style="width: 100%">
							<p class="inputCaption">비고</p>
							<textarea name="text" id="bujajae" cols="50" rows="10"
								class="txt" style="width: 100%;">${pictVO.text}</textarea>
						</div>
					</div>
					<div class="btnContainer">
						<a href="/equipment/equipment_list.do" class="normalButton white">목록으로</a>
						<a href="#lnk" onclick="button1_click()" class="basicButton blue"><img
							src="/img/admin/add2.png" alt="등록">등록</a>
					</div>

					<input type='hidden' name="saveType" id="saveType"
						value='${pictVO.saveType}' /> <input type='hidden' name="idx"
						id="idx" value='${pictVO.idx}' /> <input type='hidden'
						name="equipment_id" id="equipment_id" value='${equipment.id}' />
				</form>
			</div>
			<c:if test="${pictVO.saveType eq 'update'}">
				<div class="detailCard detailSub">
					<p class="inputCaption">라벨</p>
					<div class="detailCardInner detailSub">
						<div class="detailCardText">
							<span class="detailCate">${equipment.category}</span>
							<p>${equipment.name}</p>
							<p class="detailDate">시리얼넘버 : ${pictVO.serial_number}</p>
							<span class="detailDate">${pictVO.reg_date}</span>
						</div>
						<div class="detailCardImg" id="qr_img">
							<%-- <img id="qr_img" src="${pictVO.image_url}" alt="장비이미지"> --%>
						</div>
					</div>
					<div class="buttons">
						<button href="" class="smButton"
							style="margin-top: 8px; padding: 0 8px;">다운로드</button>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<script>
		let qr = null
		function button1_click() {
			if (!$('#serial_number').val()) {
				window.alert("시리얼넘버를 입력해주세요.");
				$('#serial_number').focus();
				return false;
			}

			var text = "등록하시겠습니까?";
			if ($("#saveType").val() == 'update') {
				text = "수정하시겠습니까?"
			}

			if (confirm(text)) {
				$("#register").attr("action",
						"/equipment/equipment_cnt_save.do");
				$("#register").submit();
			}
		}
		$(document).ready(function() {
			var idx = '${pictVO.idx}'

			var qrcode = new QRCode(document.getElementById("qr_img"), {
				text: idx,
			    //correctLevel : QRCode.CorrectLevel.L
			});

		});
		$('.toggle').change(function(e) {
			console.log("toggle @@@@@@@@@@@", e.target.checked);
			$('#status').val(e.target.checked ? 'available' : 'disabled');
			console.log("changed status", $('#status').val());
		})
	</script>
	<script src="/js/download_qr.js"></script>

</body>

</html>