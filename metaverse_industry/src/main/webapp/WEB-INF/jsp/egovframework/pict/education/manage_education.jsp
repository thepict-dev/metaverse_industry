<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
				<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



					<!DOCTYPE html>
					<html lang="ko">
					<c:import url="../main/head.jsp">
						<c:param name="pageTitle" value="교육 관리" />
					</c:import>

					<%@include file="../main/lnb.jsp" %>
						<c:import url="../main/header.jsp">
							<c:param name="title" value="교육 관리" />
							<c:param name="subtitle" value="신청 목록" />
						</c:import>
						<div class="contentsContainer">
							<div class="listContainer">
								<div class="listInner">
									<form action="" class="countList" id="search_fm" name="search_fm" method="get">
										<input type="hidden" name="flag" id="flag" value="eq">
										<p>총 <span>${size}</span>개</p>
										<div class="inputsContainer">
											<div class="inputBox listSearch">
												<select name="status" id="status" class="lgThinInput">
													<option value="" <c:if test="${pictVO.request_status eq '' or pictVO.request_status eq null}">
														selected</c:if>>전체</option>
													<option value="pendding" <c:if test="${pictVO.request_status eq 'pendding'}">
														selected</c:if>>승인대기</option>
													<option value="approved" <c:if test="${pictVO.request_status eq 'approved'}">
														selected</c:if>>승인</option>
													<option value="rejected" <c:if test="${pictVO.request_status eq 'rejected'}">
														selected</c:if>>거절</option>
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
					                    <a href="" class="smButton" onclick="edu_list_excel()"><img src="/img/admin/excel.png" alt="">엑셀 다운로드</a>
					                </div>
									<div class="ListWrpper">
										<ul class="listHead eduHead">
											<li>순서</li>
											<li>단체명(학교명)</li>
											<li>이름(담당자)</li>
											<li>전화번호</li>
											<li>상태</li>
										</ul>
										<ul class="listBody eduBody">
											<c:forEach var="item" items="${education_list}" varStatus="status">
												<li>
													<p>${item.idx}</p>
													<p class="title"><a href="/education/manage_education_detail.do?id=${item.id}">${item.school}</a></p>
													<p>${item.user_name}</p>
													<p>${item.mobile}</p>
				                					<p>
				                						<c:choose>
				                							<c:when test="${item.request_status eq 'pendding'}">
				                								승인대기
				                							</c:when>
				                							<c:when test="${item.request_status eq 'approved'}">
				                								승인
				                							</c:when>
				                							<c:when test="${item.request_status eq 'rejected'}">
				                								거절
				                							</c:when>
				                						</c:choose>
				                					</p>
												</li>	
											</c:forEach>
											
										</ul>

										<div class="pagination">
											<c:if test="${pictVO.pageNumber ne 1}">
												<li><a
														href="/education/manage_education.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img
															src="/img/admin/prev.png" alt=""></a></li>
											</c:if>

											<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
												<c:if test="${i eq pictVO.pageNumber}">
													<li ><a class="active"
															href="/education/manage_education.do?search_text=${param.search_text}&pageNumber=${i}">${i}</a>
													</li>
												</c:if>
												<c:if test="${i ne pictVO.pageNumber}">
													<li><a
															href="/education/manage_education.do?search_text=${param.search_text}&pageNumber=${i}">${i}</a>
													</li>
												</c:if>
											</c:forEach>

											<c:if test="${pictVO.lastPage ne pictVO.pageNumber}">
												<li><a
														href="/education/manage_education.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img
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
								$("#search_fm").attr("action", "/history/history_list.do");
								$("#search_fm").submit();
							}
							
							$("#status").change(function(e){
								location.href = "/education/manage_education.do?request_status=" + $(this).val();
							})
							
							function edu_list_excel(){
								if(confirm("해당 리스트를 엑셀파일로 다운로드 하시겠습니까?")){
									event.preventDefault();
									document.getElementById('flag').value = "edu";
									var form = document.getElementById('search_fm');
									form.action = "/api/education/excel.do";
									form.submit();
								}
							}
						</script>

						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						<script src="/js/list_js.js"></script>
						</body>

					</html>