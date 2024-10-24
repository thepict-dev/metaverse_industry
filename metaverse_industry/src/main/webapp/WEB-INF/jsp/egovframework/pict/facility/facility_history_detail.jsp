<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
				<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



					<!DOCTYPE html>
					<html lang="ko">
					<c:import url="../main/head.jsp">
						<c:param name="pageTitle" value="대여 관리" />
					</c:import>

					<%@include file="../main/lnb.jsp" %>
						<c:import url="../main/header.jsp">
							<c:param name="title" value="장비 관리" />
							<c:param name="subtitle" value="장비대여 관리대장" />
						</c:import>
						<div class="contentsContainer">
							<div class="listContainer set">
								<div class="listWrapper">
									<p class="regTitle">사용자 정보</p>
									<div class="listInner set">
										<div class="inputsContainer">
											<div class="inputBox">
												<p class="inputCaption">사용자 아이디*</p>
												<span class="bindingText">${history_detail.user_id}</span>
											</div>
											<div class="inputBox">
												<p class="inputCaption">사용자 이름*</p>
												<span class="bindingText">${history_detail.user_name}</span>
											</div>
											<div class="inputBox">
												<p class="inputCaption">사용자 연락처*</p>
												<span class="bindingText">${history_detail.mobile}</span>
											</div>
											<div class="inputBox">
												<p class="inputCaption">사용자 이메일*</p>
												<span class="bindingText">${history_detail.email}</span>
											</div>
											<div class="inputBox">
												<p class="inputCaption">사용자 생년월일*</p>
												<span class="bindingText">${history_detail.bitrhday}</span>
											</div>
										</div>
										<div class="inputsContainer">
											<div class="inputBox">
												<p class="inputCaption">사용자 주소*</p>
												<span class="bindingText lg">${history_detail.address1} ${not empty history_detail.address2 ? history_detail.address2 : ''}</span>
											</div>
										</div>
									</div>
								</div>
								<div class="listWrapper">
									<p class="regTitle">장비 정보</p>
										<div class="listInner set">
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">대여형태*</p>
													<select name="history_detail" id="history_detail" class="lgThinInput"
													disabled>
													<option value="1" <c:if test="${history_detail.type eq '1'}">seleted
														</c:if>>개인</option>
													<option value="2" <c:if test="${history_detail.type eq '2'}">seleted
														</c:if>>기업</option>
												</select>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">시설명*</p>
													<span class="bindingText disable">${history_detail.name}</span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">대여자명*</p>
													<span class="bindingText disable">${history_detail.user_name}</span>
												</div>
												<div class="inputBox">
													<p class="inputCaption">대여일</p>
													<span class="bindingText disable" value="${history_detail.rental_start_date}"></span>
												</div>
												<div class="inputBox">
													<p class="inputCaption">반납일</p>
													<input type="date" id="reg_date" name="reg_date" class="lgThinInput"
														disabled value="${history_detail.rental_end_date}">
												</div>
											</div>
											<c:if test="${history_detail.type eq '1'}">
												<div class="inputsContainer">
													<div class="inputBox">
														<p class="inputCaption">시설사용계획</p>
														<span
															class="bindingText plan">${history_detail.facility_plan}</span>
													</div>
												</div>
											</c:if>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">첨부파일</p>
						                            <div class="fileList binding">
						                                <p>${history_detail.file_path}</p>
						                            </div>
												</div>
											</div>
										</div>
									</div>
									<div class="listWrapper">
										<div class="listInner set">
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">대여상태*</p>
													<c:choose>
															<c:when test="${history_detail.request_status eq 'pendding' or history_detail.request_status eq 'retry'}">
																<select name="request_status" id="request_status" class="lgThinInput"
																	value="${pictVO.request_status}">
																	<option value="">선택하세요</option>
																	<option value="approved">승인</option>
																	<option value="rejected">서류보완요청</option>
																	<option value="refusal">거절</option>
																</select>
															</c:when>
															<c:when test="${history_detail.request_status ne 'pendding' and history_detail.request_status ne 'retry'}">
																<span class="bindingText disable">
																	<c:choose>
																		<c:when test="${history_detail.request_status eq 'approved'}">
																			승인
																		</c:when>
																		<c:when test="${history_detail.request_status eq 'rejected'}">
																			승인보완요청
																		</c:when>
																		<c:when test="${history_detail.request_status eq 'cancelled'}">
																			신청취소
																		</c:when>
																		<c:when test="${history_detail.request_status eq 'refusal'}">
																			거절
																		</c:when>
																	</c:choose>
																</span>
															</c:when>
													</c:choose>
													
												</div>
											</div>
											<div class="inputsContainer reason" style="display: none;">
												<div class="inputBox" style="width:100%">
													<p class="inputCaption reason_title">서류보완 요청 사유</p>
													<textarea name="reject_msg" id="reject_msg" cols="50" rows="10"
														class="txt" style="width:100%;">${pictVO.reject_msg}</textarea>
												</div>
											</div>
										</div>
									</div>
									<div class="listWrapper">
										<div class="listInner set">
							                <div class="buttons">
							                    <a href="" class="smButton"><img src="/img/admin/pdf.png" alt="">PDF 다운로드</a>
							                </div>
										</div>
									</div>
									<form class="hidden_form" action="/facility/update_request.do" method="post">
										<input type="hidden" name="idx" value="${history_detail.idx}">
										<input type="hidden" name="request_status" class="hidden_request_status">
										<input type="hidden" name="reject_msg" class="hidden_reject_msg">
									</form>
									<div class="listWrapper">
										<div class="listInner set">
											<div class="btnContainer">
												<a href="/facility/facility_history_list.do" class="normalButton white">목록으로</a>
												<button class="basicButton blue update_status"><img
													src="/img/admin/add2.png" alt="완료">완료</button>
											</div>
										</div>
									</div>
								</div>
								
								<!-- 
								
								<div class="listInner">
									<div class="ListWrpper">
									<c:choose>
										<c:when test="${history_detail.type eq '1'}">
											<p>사용자 아이디 : ${history_detail.user_name}</p>
											<p>사용자 이름 : ${history_detail.user_name}</p>
											<p>사용자 연락처 : ${history_detail.user_name}</p>
											<p>사용자 이메일 : ${history_detail.user_name}</p>
											<p>사용자 생년월일 : ${history_detail.user_name}</p>
											<p>사용자 주소 : ${history_detail.user_name}</p>
											<p>대여 형태 : 개인</p>
										</c:when>
										<c:when test="${history_detail.type eq '2'}">
											<p>대여 형태 : 기</p>
											<p>사용자 아이디 : ${history_detail.user_name}</p>
											<p>사용자 이름 : ${history_detail.user_name}</p>
											<p>사용자 연락처 : ${history_detail.user_name}</p>
											<p>사용자 이메일 : ${history_detail.user_name}</p>
											<p>사용자 생년월일 : ${history_detail.user_name}</p>
											<p>사용자 주소 : ${history_detail.user_name}</p>
											<p>대여 형태 : 개인</p>
											<p>구분 : ${history_detail.equipment_type}</p>
											<p>장비명 : ${history_detail.name}</p>
											<p>수량 : ${history_detail.name}</p>
											
										</c:when>
									</c:choose>
										<p>신청 상태 :
											<c:choose>
												<c:when test="${history_detail.request_status eq 'pendding'}">
													대여신청
												</c:when>
												<c:when test="${history_detail.request_status eq 'approved'}">
													승인
												</c:when>
												<c:when test="${history_detail.request_status eq 'rejected'}">
													서류보안요청
												</c:when>
												<c:when test="${history_detail.request_status eq 'retry'}">
													재신청
												</c:when>
												<c:when test="${history_detail.request_status eq 'cancelled'}">
													취소
												</c:when>
												<c:when test="${history_detail.request_status eq 'refusal'}">
													거절
												</c:when>
												<c:when test="${history_detail.request_status eq 'rental'}">
													대여중
												</c:when>
												<c:when test="${history_detail.request_status eq 'returned'}">
													반납완료

												</c:when>
											</c:choose>

										</p>
										<p>대여 신청일 : ${history_detail.request_date}</p>
										<p>대여일 :${history_detail.rental_start_date}</p>
										<p>반납일 : ${history_detail.rental_end_date}</p>
										<p>${history_detail.equipment_type}</p>
										<p>${history_detail.name}</p>

									</div>
								</div>
								 -->
						</div>
						<script>

							$("#request_status").change(function () {
								$("#reject_msg").val("");
								if ($("#request_status").val() === "rejected" || $("#request_status").val() === "refusal") {
									if ($("#request_status").val() === "rejected") {
										$(".reason_title").text("서류보완 요청 사유");
									} else if ($("#request_status").val() === "refusal") {
										$(".reason_title").text("거절 사유");
									}
									$(".reason").show();
								} else {
									$(".reason").hide();

								}
							})

							$(".update_status").click(function () {
								if ($("#request_status").val() === "") {
									alert("대여상태를 선택해주세요.");
									return;
								} else {
									$(".hidden_request_status").val($("#request_status").val());
									console.log($(".hidden_request_status").val());
									$(".hidden_reject_msg").val($("#reject_msg").val());
									console.log($(".hidden_reject_msg").val());
									$(".hidden_form").submit();
								}
								console.log("완료");
							})
						</script>
						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						<script src="/js/list_js.js"></script>
						</body>

					</html>