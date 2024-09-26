<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/header.jsp">
	<c:param name="pageTitle" value="이벤트 등록" />
</c:import>
<body class="sb-nav-fixed">
	<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
		<%@include file="../main/navigation.jsp"%>
		<div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp"%>
			</div>
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">이벤트 등록</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">제목*</label>
										<div class="input-box">
											<input type="text" id="title" name="title" value="${pictVO.title}" maxlength="18" class="input opt-max-width-600">
											<span id="text_cnt">0</span>/ 18
										</div>
									</div>
						
									<div class="write-item">
										<label for="title" class="title">내용*</label>
										<div class="input-box">
											<textarea name="text" id="text" cols="30" rows="5" class="txt" style="width:50%;" maxlength="85">${pictVO.text}</textarea>
											<span id="text_cnt2">0</span>/ 85
										</div>
									</div>
									
									<div class="write-item">
										<label for="title" class="title">링크*</label>
										<div class="input-box">
											<input type="text" id="link_url" name="link_url" value="${pictVO.link_url}" class="input opt-max-width-600">
										</div>
									</div>
									
									<div class="write-item">
										<label for="title" class="title">일정*</label>
										<div class="input-box">
											<input type="text" id="from_date" name="from_date" value="${pictVO.from_date}" class="input opt-max-width-200"> &nbsp;~&nbsp; 
											<input type="text" id="to_date" name="to_date" value="${pictVO.to_date}" class="input opt-max-width-200">
										</div>
									</div>
									
									<div class="write-item" id="file_div">
										<label for="title" class="title">썸네일</label>
										<div class="input-box">
											<input style="margin-bottom:15px" type="file" id="attach_file" name="attach_file" value="${pictVO.img_url}" class="input opt-max-width-600">
											<br>
											<span id="upload_file_span">${pictVO.file}</span>

											<c:if test="${pictVO.img_url ne '' && pictVO.img_url ne null}">
												첨부된 파일 : ${pictVO.img_url}
												<button type="button" onclick="javascript:file_del()" class="btn-basic btn-fill btn-sm">파일삭제</button>
											</c:if>
												
										</div>
									</div>
									
								</div>
								<div class="btn-box">
									<c:if test="${pictVO.saveType eq 'update'}">
										<button type="button" onclick="javascript:board_delete()" class="btn-basic btn-fill btn-sm">삭제</button>
									</c:if>
									<c:if test="${pictVO.saveType eq 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">등록</button>
									</c:if>
									<c:if test="${pictVO.saveType ne 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">수정</button>
									</c:if>
						        	<button type="button" onclick="javascript:board_list();" class="btn-basic btn-common btn-sm">목록보기</button>    
					            </div>
							</div>
						</div>
		            </div>
				</main>
			</div>
		</div>
		<input type='hidden' name="saveType" id="saveType" value='${pictVO.saveType}' /> 
		<input type='hidden' name="idx" id="idx" value='${pictVO.idx}' /> 
		<input type='hidden' name="use_at" id="use_at" value='${pictVO.use_at}' />
		<input type='hidden' name="type" id="type" value='' />
	</form>
	
	<script>
		$("#title").on('propertychange change keyup paste input', function() {
			newValue = $(this).val();
			$("#text_cnt").text(newValue.length)
		})
		$("#text").on('propertychange change keyup paste input', function() {
			newValue = $(this).val();
			$("#text_cnt2").text(newValue.length)
		})
		
		function board_delete() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#register").attr("action", "/event/event_delete.do");
				$("#register").submit();
			}
			
		}
		function board_list() {
			location.href = "/event/event_list.do";
		}
		function button1_click() {
			var title = $('#title').val();
			
			var saveType = $('#saveType').val();

			if (title == "" || title == undefined) {
				window.alert("제목을 입력해주세요.");
				$('#title').focus();
				return false;
			}
			
			//oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
			
			var text = "등록하시겠습니까?";
			if (saveType == 'update') {
				text = "수정하시겠습니까?"
			}

			if (confirm(text)) {
				$("#register").attr("action", "/event/event_save.do");
				$("#register").submit();
			}
		}
		function cng_use_at(idx, use_at){
			$('#idx').val(idx)
			if(use_at == 'Y'){
				$('#use_at').val('N') 
			}
			else{
				$('#use_at').val('Y')
			}
			
			$('#type').val('1');
			var text = "활성화 상태로 변경하시겠습니까?";
			if(use_at == "Y"){
				$('#type').val('2');
				text = "비활성화 상태로 변경하시겠습니까?";
			}
			
			if(confirm (text)){
				$("#register").attr("action", "/event/cng_use_at.do");
				$("#register").submit();
			}
		}
		
		function file_del(){
			$('#attach_file').val('')
			$("#upload_file_span").text("");
			if (confirm("첨부파일을 삭제 하시겠습니까?")) {
				$("#register").attr("action", "/event/event_file_delete.do");
				$("#register").submit();
			}
		}
		$( function() {
		    $( "#from_date" ).datepicker();
		    $( "#to_date" ).datepicker();
		  } );
		
		$.datepicker.setDefaults({
	        dateFormat: 'yy-mm-dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });
	</script>
	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>

</body>
</html>