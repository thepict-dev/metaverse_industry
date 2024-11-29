<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
				<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



					<!DOCTYPE html>
					<html lang="ko">
					<c:import url="../main/head.jsp">
						<c:param name="pageTitle" value="시설 리스트" />
					</c:import>

					<%@include file="../main/lnb.jsp" %>
						<c:import url="../main/header.jsp">
							<c:param name="title" value="시설 관리" />
							<c:param name="subtitle" value="시설 리스트" />
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
										<ul class="listHead equipList">
											<li>선택</li>
											<li>순서</li>
											<li>구분</li>
											<li>이미지</li>
											<li>장비명</li>
											<li>활성화 상태</li>
											<li>등록일</li>
											<li>수정</li>
											<li>삭제</li>
										</ul>
										<ul class="listBody equipList">
											<c:forEach var="resultList" items="${resultList}" varStatus="status">
												<li data-id="${resultList.id}">
													<div class="checkBox">
														<input data-idx="${resultList.idx}" type="checkbox"
															class="selection" id="selection${resultList.idx}"><label
															for="selection${resultList.idx}" class="lableOnly"></label>
													</div>
													<!-- 기존 순서 표시를 페이지 기반 순서로 변경 -->
													<p>${(pictVO.pageNumber - 1) * 20 + status.count}</p>
													<p class="equip_type">${resultList.type}</p>
													<!-- 
					                <p>${resultList.description}</p>
					                 -->
													<div class="listImg"><img src="${resultList.image_url}"
															alt="시설 이미지"></div>
													<p class="title">${resultList.name}</p>
													<div class="switchInput">
														<input type="checkbox" <c:if test="${resultList.status eq 'available'}">checked</c:if> name="status" id="onoff-switch${resultList.idx}" />
														<label data-id="${resultList.id}" class="toggle"></label>
													</div>
													<p class="reg_date">${resultList.reg_date}</p>
													<p class="modify"><a href="#lnk"
															onclick="board_mod('${resultList.idx}');">수정</a></p>
													<p class="delete"><button
															onclick="board_delete(${resultList.idx})"></button></p>
												</li>
											</c:forEach>
										</ul>

										<div class="listButton">
											<a href="/facility/facility_register.do"><img src="/img/admin/add.png"
													alt="등록버튼">등록</a>
											<button class="deleteEquipments"><img src="/img/admin/delete.png"
													alt="삭제버튼">삭제</button>
										</div>

										<div class="pagination">
											<c:if test="${pictVO.pageNumber ne 1}">
												<li><a
														href="/facility/facility_list.do?pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img
															src="/img/admin/prev.png" alt=""></a></li>
											</c:if>

											<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
												<c:if test="${i eq pictVO.pageNumber}">
													<li><a class="active"
															href="/facility/facility_list.do?pageNumber=${i}">${i}</a>
													</li>
												</c:if>
												<c:if test="${i ne pictVO.pageNumber}">
													<li><a
															href="/facility/facility_list?tpageNumber=${i}">${i}</a>
													</li>
												</c:if>
											</c:forEach>

											<c:if
												test="${pictVO.lastPage ne pictVO.pageNumber && pictVO.lastPage != 0}">
												<li><a
														href="/facility/facility_list?pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img
															src="/img/admin/next.png" alt=""></a></li>
											</c:if>
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
						<script type="text/javascript" src="/js/facility_list.js"></script>
						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						</body>

					</html>