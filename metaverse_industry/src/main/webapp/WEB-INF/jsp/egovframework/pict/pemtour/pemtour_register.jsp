<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/header.jsp">
	<c:param name="pageTitle" value="게시물 등록" />
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
					<h2 class="contents-title">게시물 등록</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">팸투어링크*</label>
										<div class="input-box">
											<input type="text" id="pemtour_url" name="pemtour_url" value="${pictVO.pemtour_url}" class="input opt-max-width-600">
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">대제목*</label>
										<div class="input-box">
											<input type="text" id="maintitle" name="maintitle" value="${pictVO.maintitle}" class="input opt-max-width-600">
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">제목*</label>
										<div class="input-box">
											<input type="text" id="title" name="title" value="${pictVO.title}" class="input opt-max-width-600">
										</div>
									</div>
								</div>
								<div class="write-box">
									<div class="write-item">
										<label for="title" class="title">소제목*</label>
										<div class="input-box">
											<input type="text" id="subtitle" name="subtitle" value="${pictVO.subtitle}" class="input opt-max-width-600">
										</div>
									</div>
								</div>
								<div class="btn-box">
									<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">수정</button>
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

		function button1_click() {
			var title = $('#pemtour_url').val();
			
			var saveType = $('#saveType').val();

			if (title == "" || title == undefined) {
				window.alert("팸투어 링크를 입력해주세요.");
				$('#pemtour_url').focus();
				return false;
			}
			
			//oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
			
			var text = "수정하시겠습니까?";

			if (confirm(text)) {
				$("#register").attr("action", "/pemtour/pemtour_save.do");
				$("#register").submit();
			}
		}
		

	</script>
	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>

</body>
</html>