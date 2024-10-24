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
											<li>
												<div class="checkBox">
													<input type="checkbox" id="selection"><label for="selection"
														class="lableOnly"></label>
												</div>
												<p>1</p>
												<p>최태호</p>
												<p>01012341234</p>
												<p>fja@jfoiasjdfi.com</p>
												<p>19931010</p>
												<p>강원도 춘천시 효자로 144 픽트스퀘어</p>
												<p class="delete"><a href="#lnk"></a></p>
											</li>
										</ul>

										<div class="listButton">
											<a href="#lnk"><img src="/img/admin/delete.png"
													alt="삭제버튼">삭제</a>
										</div>

										<div class="pagination">
											<c:if test="${pictVO.pageNumber ne 1}">
												<li><a
														href="/board/board_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img
															src="/img/admin/prev.png" alt=""></a></li>
											</c:if>

											<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
												<c:if test="${i eq pictVO.pageNumber}">
													<li><a class="active"
															href="/notice.do?type=${pictVO.type}&pageNumber=${i}">${i}</a>
													</li>
												</c:if>
												<c:if test="${i ne pictVO.pageNumber}">
													<li><a
															href="/notice.do?type=${pictVO.type}&pageNumber=${i}">${i}</a>
													</li>
												</c:if>
											</c:forEach>

											<c:if
												test="${pictVO.lastPage ne pictVO.pageNumber && pictVO.lastPage != 0}">
												<li><a
														href="/notice.do?type=${pictVO.type}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img
															src="/img/admin/next.png" alt=""></a></li>
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
													<span class="bindingText"></span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">사업자 등록번호</p>
													<span class="bindingText"></span>
												</div>
												<div class="inputBox">
													<p class="inputCaption">직책</p>
													<span class="bindingText"></span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox per">
													<p class="inputCaption">사업장 주소</p>
													<span class="bindingText per"></span>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox per">
													<p class="inputCaption">증빙서류</p>
													<a href="#lnk" download class="bindingText"></a>
												</div>
											</div>
										</div>
									</div>
									<div class="listButton detail">
										<a href="#lnk"><img src="/img/admin/delete.png" alt="삭제버튼">삭제</a>
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