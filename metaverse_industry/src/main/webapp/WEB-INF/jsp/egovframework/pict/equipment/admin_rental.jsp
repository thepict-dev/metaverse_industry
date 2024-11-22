<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
				<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



					<!DOCTYPE html>
					<html lang="ko">
					<c:import url="../main/head.jsp">
						<c:param name="pageTitle" value="사용자" />
					</c:import>

					<%@include file="../main/lnb.jsp" %>
						<c:import url="../main/header.jsp">
							<c:param name="title" value="사용자" />
							<c:param name="subtitle" value="사용자 리스트" />
						</c:import>
						<div class="contentsContainer">
							<div class="listContainer">
								<div class="listInner">
									<form action="" class="countList" id="search_fm" name="search_fm" method="get">
										<p>총 <span>${totalCnt}</span>개</p>
										<div class="inputsContainer">
											<div class="inputBox listSearch">
												<input type="text" name="search_text" id="search_text"
													placeholder="내용을 입력하세요…" value="${pictVO.search_text}">
												<a href="#lnk" onclick="search_list();"><img
														src="/img/admin/search2.png" alt=""></a>
											</div>
										</div>
									</form>

									<div class="ListWrpper">
										<ul class="listHead rentalList">
											<li>순서</li>
											<li>이름</li>
											<li>연락처</li>
											<li>이메일</li>
											<li>생년월일</li>
											<li>주소</li>
										</ul>
										<ul class="listBody rentalList">
											<c:forEach var="resultList" items="${resultList}" varStatus="status">
												<li>
													<input type="hidden" value="${resultList.user_id}" class="user_id" />
													<input type="hidden" value="${resultList.company_nm}" class="company_nm" />
													<input type="hidden" value="${resultList.company_address1}" class="company_address1" />
													<input type="hidden" value="${resultList.company_address2}" class="company_address2" />
													<input type="hidden" value="${resultList.sa_eob_no}" class="sa_eob_no" />
													<input type="hidden" value="${resultList.position}" class="position" />
													<input type="hidden" value="${resultList.document_url}" class="document_url" />
													<!-- 기존 내용 -->
													<p>${resultList.idx}</p>
													<p class="title">${resultList.name}</p>
													
													<p class="mobile">${resultList.mobile}</p>
													<p class="email">${resultList.email}</p>
													<p class="birthday">${resultList.birthday}</p>
													<p class="birthday">${resultList.address1} ${resultList.address2}</p>
												</li>
											</c:forEach>
										</ul>

										<div class="pagination">
											<c:if test="${pictVO.pageNumber > 1}">
												<li>
													<a href="/equipment/admin_rental.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 1}">
														<img src="/img/admin/prev.png" alt="이전">
													</a>
												</li>
											</c:if>
											
											<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
												<li>
													<a href="/equipment/admin_rental.do?search_text=${param.search_text}&pageNumber=${i}" 
													   class="${i eq pictVO.pageNumber ? 'active' : ''}">${i}</a>
												</li>
											</c:forEach>
											
											<c:if test="${pictVO.pageNumber < pictVO.lastPage}">
												<li>
													<a href="/equipment/admin_rental.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber + 1}">
														<img src="/img/admin/next.png" alt="다음">
													</a>
												</li>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							<div class="equipDetails">
								<div class="detailsTop">
									<p>장비 임의 대여</p>
									<button><img src="/img/admin/close-bk.png" alt=""></button>
								</div>
								<div class="detailInfoContainer">
									<div class="detailList">
										<div class="listInner set">
											<p>사용자 정보</p>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">이름</p>
													<span class="bindingText _company_nm"></span>
												</div>
												<div class="inputBox">
													<p class="inputCaption">생년월일</p>
													<span class="bindingText _company_nm"></span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">연락처</p>
													<span class="bindingText _company_nm"></span>
												</div>
												<div class="inputBox">
													<p class="inputCaption">이메일</p>
													<span class="bindingText _company_nm"></span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox per">
													<p class="inputCaption">주소</p>
													<span class="bindingText per _company_address"></span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">회사명</p>
													<span class="bindingText _company_nm"></span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">사업자 등록번호</p>
													<span class="bindingText _sa_eob_no"></span>
												</div>
												<div class="inputBox">
													<p class="inputCaption">직책</p>
													<span class="bindingText _position"></span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox per">
													<p class="inputCaption">사업장 주소</p>
													<span class="bindingText per _company_address"></span>
												</div>
											</div>
										</div>
										<div class="listInner set">
											<p>대여 장비</p>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">장비목록</p>
													<select name="category" id="category" class="lgThinInput">
														<option value="">장비 선택</option>
														<c:forEach var="equipment" items="${equipmentList}">
															<option value="${equipment.idx}" 
																	data-id="${equipment.id}"
																	data-type="${equipment.type}"
																	data-name="${equipment.name}"
																	data-cnt="${equipment.count}">
																${equipment.name} (${equipment.type})
															</option>
														</c:forEach>
													</select>
												</div>
												<div class="inputBox">
													<p class="inputCaption">대여형태</p>
													<select name="rental_type" id="rental_type" class="lgThinInput" >
														<option value="individual">개인</option>
														<option value="company">기업</option>
													</select>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">대여일</p>
													<input type="date" id="rental_start_date" name="rental_start_date" class="lgThinInput" required>
												</div>
												<div class="inputBox">
													<p class="inputCaption">반납일</p>
													<input type="date" id="rental_end_date" name="rental_end_date" class="lgThinInput" required>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">수량</p>
													<input type="text" id="count" name="count" class="lgThinInput" 
														   placeholder="수량을 입력하세요." required>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">장비사용계획</p>
													<span class="bindingText plan" style="width: 500px;">관리자 임의 대여</span>
												</div>
											</div>
										</div>
										<div class="buttons" style="padding: 0 24px;">
			                        		<a href="#lnk" class="white normalButton" id="rentalButton">장비대여</a>
		                        		</div>
									</div>
								</div>
							</div>
						</div>
						<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
							<input type='hidden' name="idx" id="idx" value='' />
							<input type='hidden' name="use_at" id="use_at" value='' />
							<input type='hidden' name="type" id="type" value='' />
						</form>
						<script type="text/javascript" src="/js/admin_rental.js"></script>
						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						</body>

					</html>