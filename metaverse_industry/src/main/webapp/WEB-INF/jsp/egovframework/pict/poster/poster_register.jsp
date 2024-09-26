<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/header.jsp">
	<c:param name="pageTitle" value="포스터 등록" />
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
					<h2 class="contents-title">포스터 등록</h2>
					<div class="contents-box">
						<div class="card">
							<div class="card-body">
								<div class="write-box">
									<div class="write-item">
										<label for="campus_id" class="title">카테고리</label>
										<div class="input-box">
											<select id="category" name="category" class="input opt-max-width-200">
												<option value="0">게시판선택</option>
												<option value="1" <c:if test="${pictVO.category eq '1'}"> selected </c:if> >겸재정선미술관</option>
												<option value="2" <c:if test="${pictVO.category eq '2'}"> selected </c:if> >허준박물관</option>
												<option value="3" <c:if test="${pictVO.category eq '3'}"> selected </c:if> >곰달래 문화복지센터</option>
											</select>
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">제목(좌)*</label>
										<div class="input-box">
											<input type="text" id="title1" name="title1" value="${pictVO.title1}" class="input opt-max-width-600">
										</div>
									</div>
									<div class="write-item" id="file_div">
										<label for="title" class="title">썸네일(좌)</label>
										<div class="input-box">
											<input style="margin-bottom:15px" type="file" id="attach_file" name="attach_file" value="${pictVO.img_url1}" class="input opt-max-width-600">
											<br>
											<c:if test="${pictVO.img_url1 ne '' && pictVO.img_url1 ne null}">
												첨부된 파일 : ${pictVO.img_url1}
												<button type="button" onclick="javascript:file_del('img1')" class="btn-basic btn-fill btn-sm">파일삭제</button>
											</c:if>
												
										</div>
									</div>
									<div class="write-item"  style="margin-bottom : 70px">
										<label for="title" class="title">링크(좌)*</label>
										<div class="input-box">
											<input type="text" id="link_url1" name="link_url1" value="${pictVO.link_url1}" class="input opt-max-width-600">
										</div>
									</div>
									
									
									<div class="write-item">
										<label for="title" class="title">제목(우)*</label>
										<div class="input-box">
											<input type="text" id="title2" name="title2" value="${pictVO.title2}" class="input opt-max-width-600">
										</div>
									</div>
									<div class="write-item" id="file_div">
										<label for="title" class="title">썸네일(우)</label>
										<div class="input-box">
											<input style="margin-bottom:15px" type="file" id="attach_file2" name="attach_file2" value="${pictVO.img_url2}" class="input opt-max-width-600">
											<br>
											<c:if test="${pictVO.img_url2 ne '' && pictVO.img_url2 ne null}">
												첨부된 파일 : ${pictVO.img_url2}
												<button type="button" onclick="javascript:file_del('img2')" class="btn-basic btn-fill btn-sm">파일삭제</button>
											</c:if>
												
										</div>
									</div>
									<div class="write-item">
										<label for="title" class="title">링크(우)*</label>
										<div class="input-box">
											<input type="text" id="link_url2" name="link_url2" value="${pictVO.link_url2}" class="input opt-max-width-600">
										</div>
									</div>
									
									
									<c:if test="${pictVO.saveType eq 'update'}">
										<div class="write-item">
											<label for="title" class="title">활성여부*</label>
											<div class="input-box">
												<c:if test="${pictVO.use_at eq 'N'}">
									            	<button type="button" class="state-box state-n" onclick="javascript:cng_use_at('${pictVO.idx}', '${pictVO.use_at}');">
									            		<span class="text">비활성화</span> 
									            	</button>
								            	</c:if>
								            	<c:if test="${pictVO.use_at ne 'N'}">
									            	<button type="button" class="state-box state-y" onclick="javascript:cng_use_at('${pictVO.idx}', '${pictVO.use_at}');">
									            		<span class="text">활성화</span>
									            	</button>
								            	</c:if>
												
											</div>
										</div>
									</c:if>
									
								
								</div>
								<div class="btn-box">
									<c:if test="${pictVO.saveType eq 'update'}">
										<button type="button" onclick="javascript:poster_delete()" class="btn-basic btn-fill btn-sm">삭제</button>
									</c:if>
									<c:if test="${pictVO.saveType eq 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">등록</button>
									</c:if>
									<c:if test="${pictVO.saveType ne 'insert'}">
										<button type="button" onclick="button1_click();" class="btn-basic btn-primary btn-sm">수정</button>
									</c:if>
						        	<button type="button" onclick="javascript:poster_list();" class="btn-basic btn-common btn-sm">목록보기</button>    
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
		function poster_delete() {
			if (confirm("삭제 하시겠습니까?")) {
				$("#register").attr("action", "/poster/poster_delete.do");
				$("#register").submit();
			}
			
		}
		function poster_list() {
			location.href = "/poster/poster_list.do";
		}
		function button1_click() {
			var title = $('#title1').val();
			
			var saveType = $('#saveType').val();

			if (title == "" || title == undefined) {
				window.alert("제목을 입력해주세요.");
				$('#title1').focus();
				return false;
			}
			
			var text = "등록하시겠습니까?";
			if (saveType == 'update') {
				text = "수정하시겠습니까?"
			}

			if (confirm(text)) {
				$("#register").attr("action", "/poster/poster_save.do");
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
				$("#register").attr("action", "/poster/cng_use_at.do");
				$("#register").submit();
			}
		}
		
		function file_del(img){
			console.log(img)
			$('#attach_file').val('')
			$("#upload_file_span").text("");
			if (confirm("첨부파일을 삭제 하시겠습니까?")) {
				$("#register").attr("action", "/poster/poster_file_delete.do");
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