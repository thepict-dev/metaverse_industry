<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/head.jsp">
    	<c:param name="pageTitle" value="게시물 리스트"/>
    </c:import>
    <link rel="stylesheet" href="/css/user_css/modal.css">
    
    <%@include file="../main/lnb.jsp" %>
		<c:import url="../main/header.jsp">
	    	<c:param name="title" value="게시물 관리"/>
	    	<c:param name="subtitle" value="게시물 리스트"/>
	    </c:import>
	    <div class="contentsContainer">
            <form action="" class="barcodeForm" id="search_fm" name="search_fm" method="get">
				<div class="barcodeContainer">
					<div class="inputsContainer">
						<div class="inputBox">
							<p class="inputCaption">시리얼 넘버</p>
							<input type="text" name="name" id="name" placeholder="내용을 입력하세요…"
								value="${pictVO.serial_number}">
						</div>
					</div>
				</div>
				<div class="listContainer bar">
					<div class="listContainerInner">
						<div class="listWrapper">
							<p class="regTitle">사용자 정보</p>
							<div class="listInner set">
								<div class="inputsContainer">
									<div class="inputBox">
										<p class="inputCaption">대여형태,*</p>
										<select name="history_detail" id="history_detail" class="lgThinInput" disabled>
											<option value="1">개인</option>
											<option value="2">기업</option>
										</select>
									</div>
								</div>
								<div class="inputsContainer">
									<div class="inputBox">
										<p class="inputCaption">구분</p>
										<select name="category" id="category" class="lgThinInput" disabled>
											<option value="HMD" <c:if test="${pictVO.category eq 'HMD'}">
												selected</c:if>>HMD</option>
											<option value="AR글래스" <c:if
												test="${pictVO.category eq 'AR글래스'}">selected</c:if>>AR글래스
											</option>
											<option value="모션캡처" <c:if test="${pictVO.category eq '모션캡처'}">
												selected</c:if>>모션캡처</option>
											<option value="360카메라" <c:if
												test="${pictVO.category eq '360카메라'}">selected</c:if>>360카메라
											</option>
											<option value="3D스캐너" <c:if
												test="${pictVO.category eq '3D스캐너'}">selected</c:if>>3D스캐너
											</option>
											<option value="기타" <c:if test="${pictVO.category eq '기타'}">
												selected</c:if>>기타</option>
										</select>
									</div>
									<div class="inputBox">
										<p class="inputCaption">장비명*</p>
										<span class="bindingText">${pictVO.name}</span>
									</div>
									<div class="inputBox">
										<p class="inputCaption">수량*</p>
										<span class="bindingText">${pictVO.mobile}</span>
									</div>
								</div>
								<div class="inputsContainer">
									<div class="inputBox">
										<p class="inputCaption">대여자명*</p>
										<span class="bindingText disable"></span>
									</div>
									<div class="inputBox">
										<p class="inputCaption">대여일</p>
										<input type="date" id="rental_start_date" name="rental_start_date" class="lgThinInput" disabled>
									</div>
									<div class="inputBox">
										<p class="inputCaption">반납일</p>
										<input type="date" id="rental_end_date" name="rental_end_date" class="lgThinInput" disabled>
									</div>
								</div>
								<div class="inputsContainer">
									<div class="inputBox">
										<p class="inputCaption">장비사용계획</p>
										<span class="bindingText plan"></span>
									</div>
								</div>
								<div class="inputsContainer">
									<div class="inputBox">
										<p class="inputCaption">첨부파일</p>
			                            <div class="fileList binding">
			                                <p></p>
			                            </div>
									</div>
								</div>
							</div>
						</div>
						<div class="listWrapper">
							<p class="regTitle">장비 정보</p>
							<div class="listInner set">
								<div class="inputsContainer">
									<div class="inputBox">
										<p class="inputCaption">구분</p>
										<select name="category" id="category" class="lgThinInput" disabled>
											<option value="HMD" <c:if test="${pictVO.category eq 'HMD'}">
												selected</c:if>>HMD</option>
											<option value="AR글래스" <c:if
												test="${pictVO.category eq 'AR글래스'}">selected</c:if>>AR글래스
											</option>
											<option value="모션캡처" <c:if test="${pictVO.category eq '모션캡처'}">
												selected</c:if>>모션캡처</option>
											<option value="360카메라" <c:if
												test="${pictVO.category eq '360카메라'}">selected</c:if>>360카메라
											</option>
											<option value="3D스캐너" <c:if
												test="${pictVO.category eq '3D스캐너'}">selected</c:if>>3D스캐너
											</option>
											<option value="기타" <c:if test="${pictVO.category eq '기타'}">
												selected</c:if>>기타</option>
										</select>
									</div>
									<div class="inputBox">
										<p class="inputCaption">장비명*</p>
										<span class="bindingText">${history_detail.mobile}</span>
									</div>
									<div class="inputBox">
										<p class="inputCaption">장비상태</p>
			                            <div class="switchInput nonTop">
			                                <input type="checkbox" name="onoff-switch" id="onoff-switch1" />
			                                <label for="onoff-switch1"></label>
			                            </div>
									</div>
								</div>
								<div class="inputsContainer">
									<div class="inputBox">
										<p class="inputCaption">시리얼 넘버*</p>
										<span class="bindingText">${history_detail.address1} ${not empty history_detail.address2 ? history_detail.address2 : ''}</span>
									</div>
									<div class="inputBox">
										<p class="inputCaption">등록일</p>
										<input type="date" id="reg_date" name="reg_date" class="lgThinInput" disabled>
									</div>
								</div>
								<div class="inputsContainer">
									<div class="inputBox" style="width:100%">
										<p class="inputCaption">비고</p>
										<textarea name="bujajae" id="bujajae" cols="50" rows="50"
											class="txt" style="width:100%;">${pictVO.bujajae}</textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="wtButtonContainer">
						<div class="btnContainer">
							<a href="#lnk" class="normalButton blue">대여처리</a>
							<a href="#lnk" class="normalButton blue">반납처리</a>
						</div>
					</div>
				</div>
            </form>
	    </div>
	    <div class="modalContainer" id="adminModal">
	        <div class="modalInner">
	            <button type="button" class="close"><img src="/img/user_img/close-modal.png" alt=""></button>
	            <div class="modalContents">
	                <div class="modalTitles">
	                    <p>대여가 완료되었습니다.</p>
	                </div>
	                <div class="infoSlides">
	                    <ul class="bookingInfolists">
	                        <li>
	                            <p>장비명</p>
	                            <span>Oculus Quest2 외 2건</span>
	                        </li>
	                        <li>
	                            <p>대여자명</p>
	                            <span>이유리</span>
	                        </li>
	                        <li>
	                            <p>대여형태</p>
	                            <span>기업</span>
	                        </li>
	                        <li>
	                            <p>회사명</p>
	                            <span>주식회사 더픽트</span>
	                        </li>
	                        <li>
	                            <p>대여일</p>
	                            <span>2024.8.13.화</span>
	                        </li>
	                        <li>
	                            <p>반납일</p>
	                            <span>2024.8.13.화</span>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	            <div class="fullButtonContainer">
	                <a href="#lnk" class="bl close">확인</a>
	            </div>
	        </div>
	    </div>
		<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
			<input type='hidden' name="idx" id="idx" value='' />
			<input type='hidden' name="use_at" id="use_at" value='' />
			<input type='hidden' name="type" id="type" value='' />
		</form>
		<script>
			$('.normalButton').click(function(){
				$('#adminModal').addClass('active');
			});
			$('.close').click(function(){
				$('#adminModal').removeClass('active');
			});
			
			function search_list(){
				$("#search_fm").attr("action", "/board/board_list.do");
				$("#search_fm").submit();
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>