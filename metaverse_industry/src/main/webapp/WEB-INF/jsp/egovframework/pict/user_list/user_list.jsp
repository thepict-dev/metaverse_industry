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
										<p>총 <span>${size}</span>개</p>
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
										<ul class="listHead userList">
											<li>선택</li>
											<li>순서</li>
											<li>이름</li>
											<li>연락처</li>
											<li>이메일</li>
											<li>생년월일</li>
											<li>주소</li>
											<li>삭제</li>
										</ul>
										<ul class="listBody userList">
											<c:forEach var="resultList" items="${resultList}" varStatus="status">
												<li>
													<input type="hidden" value="${resultList.company_nm}" class="company_nm" />
													<input type="hidden" value="${resultList.company_address1}" class="company_address1" />
													<input type="hidden" value="${resultList.company_address2}" class="company_address2" />
													<input type="hidden" value="${resultList.sa_eob_no}" class="sa_eob_no" />
													<input type="hidden" value="${resultList.position}" class="position" />
													<input type="hidden" value="${resultList.document_url}" class="document_url" />
													<div class="checkBox">
														<input data-idx="${resultList.idx}" type="checkbox"
															class="selection" id="selection${resultList.idx}"><label
															for="selection${resultList.idx}" class="lableOnly"></label>
													</div>
													<!-- 기존 내용 -->
													<p>${resultList.idx}</p>
													<p class="title">${resultList.name}</p>
													
													<p class="mobile">${resultList.mobile}</p>
													<p class="email">${resultList.email}</p>
													<p class="birthday">${resultList.birthday}</p>
													<p class="birthday">${resultList.address1} ${resultList.address2}</p>
													<p class="delete"><button
															onclick="user_delete(${resultList.idx})"></button></p>
												</li>
											</c:forEach>
										</ul>

										<div class="listButton">
											<button class="delete_user"><img src="/img/admin/delete.png"
													alt="삭제버튼">삭제</button>
										</div>

										<div class="pagination">
							               	<c:if test="${pictVO.pageNumber ne 1}">
												<li><a href="/user_list/user_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img src="/img/admin/prev.png" alt=""></a></li>
											</c:if>	
											
											<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
												<c:if test="${i eq pictVO.pageNumber}">
													<li><a class="active" href="/notice.do?search_text=${param.search_text}&pageNumber=${i}" >${i}</a></li>
												</c:if>
												<c:if test="${i ne pictVO.pageNumber}">
													<li><a href="/user_list/user_list.do?search_text=${param.search_text}&pageNumber=${i}" >${i}</a></li>
												</c:if>
											</c:forEach>	
							                  
							                 <c:if test="${pictVO.lastPage ne pictVO.pageNumber && pictVO.lastPage != 0}">
												<li><a href="/user_list/user_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img src="/img/admin/next.png" alt=""></a></li>
											</c:if>
							            </div>
									</div>
								</div>
							</div>
							<div class="equipDetails">
								<div class="detailsTop">
									<p>사용자 세부사항</p>
									<button><img src="/img/admin/close-bk.png" alt=""></button>
								</div>
								<div class="detailInfoContainer">
									<div class="detailList">
										<div class="listInner set">
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
													<span class="bindingText _company_address"></span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox per">
													<p class="inputCaption">증빙서류</p>
													<a href="#lnk" download class="bindingText _document_url"></a>
												</div>
											</div>
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
						<script type="text/javascript" src="/js/user_list.js"></script>
						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						</body>

					</html>