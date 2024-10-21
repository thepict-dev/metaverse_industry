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
							<c:param name="title" value="대여 관리" />
							<c:param name="subtitle" value="대여신청 리스트" />
						</c:import>
						<div class="contentsContainer">
							<div class="listContainer">
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
								</div>
							</div>
						</div>


						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						<script src="/js/list_js.js"></script>
						</body>

					</html>