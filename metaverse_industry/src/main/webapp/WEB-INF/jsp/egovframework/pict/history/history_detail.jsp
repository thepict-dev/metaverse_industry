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
										<div class="inputsContainer">
											<div class="inputBox">
												<p class="inputCaption">사용자 주소*</p>
												<span class="bindingText lg"></span>
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
													<span class="bindingText disable"></span>
												</div>
												<div class="inputBox">
													<p class="inputCaption">수량*</p>
													<span class="bindingText disable"></span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">대여자명*</p>
													<span class="bindingText disable"></span>
												</div>
												<div class="inputBox">
													<p class="inputCaption">대여일</p>
													<input type="date" id="reg_date" name="reg_date" class="lgThinInput" disabled>
												</div>
												<div class="inputBox">
													<p class="inputCaption">반납일</p>
													<input type="date" id="reg_date" name="reg_date" class="lgThinInput" disabled>
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
										<p class="regTitle">사용자 정보</p>
										<div class="listInner set">
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">대여상태*</p>
													<select name="history_detail" id="history_detail" class="lgThinInput">
													    <option value="">선택하세요</option>
													    <option value="pendding">대여신청</option>
													    <option value="approved">승인</option>
													    <option value="rejected">서류보완요청</option>
													    <option value="retry">재신청</option>
													    <option value="cancelled">취소</option>
													    <option value="refusal">거절</option>
													    <option value="rental">대여중</option>
													    <option value="returned">반납완료</option>
													</select>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox" style="width:100%">
													<p class="inputCaption">서류보완 요청 사유</p>
													<textarea name="" id="" cols="50" rows="10"
														class="txt" style="width:100%;"></textarea>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox" style="width:100%">
													<p class="inputCaption">승인거절 사유</p>
													<textarea name="" id="" cols="50" rows="10"
														class="txt" style="width:100%;"></textarea>
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
									<div class="listWrapper">
										<div class="listInner set">
											<div class="btnContainer">
												<a href="/history/history_list.do" class="normalButton white">목록으로</a>
												<a href="#lnk" onclick="button1_click()" class="basicButton blue"><img
														src="/img/admin/add2.png" alt="완료">완료</a>
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
							<div class="pagination">
								<c:if test="${pictVO.pageNumber ne 1}">
									<li><a
											href="/equipment/equipment_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img
												src="/img/admin/prev.png" alt=""></a></li>
								</c:if>

								<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
									<c:if test="${i eq pictVO.pageNumber}">
										<li class="active"><a
												href="/history/history_list.do?search_text=${param.search_text}&pageNumber=${i}">${i}</a>
										</li>
									</c:if>
									<c:if test="${i ne pictVO.pageNumber}">
										<li><a
												href="/history/history_list.do?search_text=${param.search_text}&pageNumber=${i}">${i}</a>
										</li>
									</c:if>
								</c:forEach>

								<c:if test="${pictVO.lastPage ne pictVO.pageNumber}">
									<li><a
											href="/history/history_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img
												src="/img/admin/next.png" alt=""></a></li>
								</c:if>
							</div>
						</div>
						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						<script src="/js/list_js.js"></script>
						</body>

					</html>