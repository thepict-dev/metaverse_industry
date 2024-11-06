<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
				<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



					<!DOCTYPE html>
					<html lang="ko">
					<c:import url="../main/head.jsp">
						<c:param name="pageTitle" value="시설 관리" />
					</c:import>

					<%@include file="../main/lnb.jsp" %>
						<c:import url="../main/header.jsp">
							<c:param name="title" value="시설 관리" />
							<c:param name="subtitle" value="시설대여 관리대장" />
						</c:import>
						<div class="contentsContainer">
							<div class="listContainer">
								<div class="listInner">
									<form action="" class="countList" id="search_fm" name="search_fm" method="get">
										<input type="hidden" name="flag" value="fc">
										<p>총 <span>${size}</span>개</p>
										<div class="inputsContainer">
											<div class="inputBox listSearch">
												<select name="request_status" id="status" class="lgThinInput" >
													<option value="">대여 상태 전체</option>
													<option <c:if test="${pictVO.request_status eq 'pendding'}">selected</c:if> value="pendding"">승인대기</option>
													<option <c:if test="${pictVO.request_status eq 'approved'}">selected</c:if> value="approved">승인</option>
													<option <c:if test="${pictVO.request_status eq 'rejected'}">selected</c:if> value="rejected">서류보안요청</option>
													<option <c:if test="${pictVO.request_status eq 'retry'}">selected</c:if> value="retry">재신청</option>
													<option <c:if test="${pictVO.request_status eq 'refusal'}">selected</c:if> value="refusal">거절</option>
													<option <c:if test="${pictVO.request_status eq 'cancelled'}">selected</c:if> value="cancelled">취소</option>
												</select>
											</div>
											<div class="inputBox listSearch">
												<input type="text" name="search_text" id="search_text"
													placeholder="내용을 입력하세요…" value="${pictVO.search_text}">
												<a href="#lnk" onclick="search_list();"><img
														src="/img/admin/search2.png" alt=""></a>
											</div>
										</div>
									</form>
									<div class="buttons">
										<a href="#lnk" class="smButton" onclick="history_list_excel('eq')"><img src="/img/admin/excel.png" alt="">엑셀 다운로드</a>
									</div>
									<div class="ListWrpper">
										<ul class="listHead setFacilHead">
											<li>선택</li>
											<li>순서</li>
											<li>대여 상태</li>
											<li>신청일</li>
											<li>대여일(신청)</li>
											<li>반납일(신청)</li>
											<li>대여자 성명</li>
											<li>시설명</li>
											<li>대여형태</li>
											<li>삭제</li>
										</ul>
										<ul class="listBody setFacilHead">
											<c:forEach var="resultList" items="${resultList}" varStatus="status">
												<li>
						                            <div class="checkBox">
						                                <input type="checkbox" id="selection"><label for="selection" class="lableOnly"></label>
						                            </div>
													<!-- 기존 내용 -->
													<p>${resultList.idx}</p>
													<p>
														<!-- 'pendding', 'approved', 'rejected', 'retry', 'cancelled', 'refusal', 'rental', 'returned' -->
														<c:choose>
															<c:when test="${resultList.request_status eq 'pendding'}">
																대여신청
															</c:when>
															<c:when test="${resultList.request_status eq 'approved'}">
																승인
															</c:when>
															<c:when test="${resultList.request_status eq 'rejected'}">
																서류보안요청
															</c:when>
															<c:when test="${resultList.request_status eq 'retry'}">
																재신청
															</c:when>
															<c:when test="${resultList.request_status eq 'cancelled'}">
																취소
															</c:when>
															<c:when test="${resultList.request_status eq 'refusal'}">
																거절
															</c:when>
														</c:choose>
														<!-- <a href="javascript:void(0);" onclick="board_mod('${resultList.idx}');" class="link">
					                		
					                	</a> -->
													</p>
													<p>${resultList.request_date}</p>
													<p>${resultList.rental_start_date}</p>
													<p>${resultList.rental_end_date}</p>
													<p>${resultList.user_name}</p>
													<p class="title">
														<a href="/facility/facility_history_detail.do?idx=${resultList.idx}">${resultList.name}</a>
													</p>
													<p>
														<c:choose>
															<c:when test="${resultList.type eq '1'}">
																개인
															</c:when>
															<c:when test="${resultList.type eq '2'}">
																기업
															</c:when>
														</c:choose>
													</p>
					                				<p class="delete"><a href="#lnk" onclick="board_delete('${resultList.idx}')"></a></p>
												</li>
											</c:forEach>
										</ul>

										<div class="pagination">
											<c:if test="${pictVO.pageNumber ne 1}">
												<li><a
														href="/facility/facility_history_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img
															src="/img/admin/prev.png" alt=""></a></li>
											</c:if>

											<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
												<c:if test="${i eq pictVO.pageNumber}">
													<li class="active"><a
															href="/facility/facility_history_list.do?search_text=${param.search_text}&pageNumber=${i}">${i}</a>
													</li>
												</c:if>
												<c:if test="${i ne pictVO.pageNumber}">
													<li><a
															href="/facility/facility_history_list.do?search_text=${param.search_text}&pageNumber=${i}">${i}</a>
													</li>
												</c:if>
											</c:forEach>

											<c:if test="${pictVO.lastPage ne pictVO.pageNumber}">
												<li><a
														href="/facility/facility_history_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img
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
						<script>

							function board_mod(idx) {
								location.href = "/history/history_detail.do?idx=" + idx;
							}
							function board_list() {
								location.href = "/history/history_list.do";
							}

							/* function board_delete(idx) {
								if (confirm("삭제 하시겠습니까?")) {
									$('#idx').val(idx)
									$("#register").attr("action", "/board/board_delete.do");
									$("#register").submit();
								}
							} */
							function search() {
								$("#search_fm").attr("action", "/facility/facility_history_list.do");
								$("#search_fm").submit();
							}
							
							function history_list_excel(){
								if(confirm("해당 리스트를 엑셀파일로 다운로드 하시겠습니까?")){
									$('#flag').val("refuse");
									$("#search_fm").attr("action", "/history/history_list_excel.do");
									$("#search_fm").submit();
								}
							}
							
							$("#status").change(function(e){
								location.href = "/facility/facility_history_list.do?request_status=" + $(this).val();
							})
						</script>

						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						<script src="/js/list_js.js"></script>
						</body>

					</html>