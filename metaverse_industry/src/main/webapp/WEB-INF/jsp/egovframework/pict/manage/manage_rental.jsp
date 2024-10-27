<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
				<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



					<!DOCTYPE html>
					<html lang="ko">
					<c:import url="../main/head.jsp">
						<c:param name="pageTitle" value="대여/반납 관리" />
					</c:import>
					<link rel="stylesheet" href="/css/user_css/modal.css">
					<%@include file="../main/lnb.jsp" %>
						<c:import url="../main/header.jsp">
							<c:param name="title" value="대여/반납 관리" />
							<c:param name="subtitle" value="대여/반납 관리" />
						</c:import>
						<div class="contentsContainer">
							
								<div class="barcodeContainer">
									<div class="inputsContainer">
										<div class="inputBox">
											<p class="inputCaption">시리얼 넘버</p>
											<input type="text" name="idx" id="idx" placeholder="QR코드를 찍어주세요." value="${pictVO.id}">
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
														<p class="inputCaption">대여형태</p>
														<span class="bindingText user_type"></span>
													</div>
												</div>
												<div class="inputsContainer">
													<div class="inputBox">
														<p class="inputCaption">신청상태</p>
														<span class="bindingText request_status"></span>
													</div>
													<div class="inputBox">
														<p class="inputCaption">장비명</p>
														<span class="bindingText equipment_name"></span>
													</div>
													<div class="inputBox">
														<p class="inputCaption">수량</p>
														<span class="bindingText">1</span>
													</div>
												</div>
												<div class="inputsContainer">
													<div class="inputBox">
														<p class="inputCaption">대여자명</p>
														<span class="bindingText user_name"></span>
													</div>
													<div class="inputBox">
														<p class="inputCaption">대여일</p>
														<input type="date" id="rental_start_date"
															name="rental_start_date" class="lgThinInput" disabled>
													</div>
													<div class="inputBox">
														<p class="inputCaption">반납일</p>
														<input type="date" id="rental_end_date" name="rental_end_date"
															class="lgThinInput" disabled>
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
															<p class="file_name"></p>
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
														<span class="bindingText equipment_type"></span>
													</div>
													<div class="inputBox">
														<p class="inputCaption">장비명*</p>
														<span class="bindingText equipment_name"></span>
													</div>
													<div class="inputBox">
														<p class="inputCaption">장비상태</p>
														<div class="switchInput nonTop">
															<input type="checkbox" checked value="on" name="onoff-switch"
																id="onoff-switch1" disabled />
															<label for="onoff-switch1"></label>
														</div>
													</div>
												</div>
												<div class="inputsContainer">
													<div class="inputBox">
														<p class="inputCaption">시리얼 넘버*</p>
														<span class="bindingText serial_number"></span>
													</div>
													<div class="inputBox">
														<p class="inputCaption">등록일</p>
														<input type="date" id="reg_date" name="reg_date"
															class="lgThinInput" disabled>
													</div>
												</div>
												<div class="inputsContainer">
													<div class="inputBox" style="width:100%">
														<p class="inputCaption">비고</p>
														<textarea name="bujajae" id="bujajae" cols="50" rows="50"
															class="txt" style="width:100%;"
															disabled></textarea>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="wtButtonContainer">
										<div class="btnContainer">
											<a href="#lnk" class="normalButton blue submit">대여처리</a>
										</div>
									</div>
								</div>
							
						</div>
						<div class="modalContainer" id="adminModal">
							<div class="modalInner">
								<button type="button" class="close"><img src="/img/user_img/close-modal.png"
										alt=""></button>
								<div class="modalContents">
									<div class="modalTitles">
										<p>대여가 완료되었습니다.</p>
									</div>
									<div class="infoSlides">
										<ul class="bookingInfolists">
											<li>
												<p id="test1">장비명</p>
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
						

						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						<script src="/js/manage_rental.js"></script>
						</body>

					</html>