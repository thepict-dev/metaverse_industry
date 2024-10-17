<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
				<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
					<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

					<!DOCTYPE html>
					<html lang="ko">
					<c:import url="../main/head.jsp">
						<c:param name="pageTitle">
						    <c:choose>
						        <c:when test="${pictVO.saveType eq 'update'}">
						            장비 수정
						        </c:when>
						        <c:otherwise>
						            장비 등록
						        </c:otherwise>
						    </c:choose>
						</c:param>
					</c:import>

					<body>

						<%@include file="../main/lnb.jsp" %>
							<c:import url="../main/header.jsp">
								<c:param name="title">
								    <c:choose>
								        <c:when test="${pictVO.saveType eq 'update'}">
								            장비 수정
								        </c:when>
								        <c:otherwise>
								            장비 등록
								        </c:otherwise>
								    </c:choose>
								</c:param>
								<c:param name="subtitle">
								    <c:choose>
								        <c:when test="${pictVO.saveType eq 'update'}">
								            장비 수정
								        </c:when>
								        <c:otherwise>
								            장비 등록
								        </c:otherwise>
								    </c:choose>
								</c:param>
							</c:import>
							<div class="contentsContainer">
								<div class="listContainer">
									<div class="listInner">
										<form action="" id="register" name="register" method="post"
											enctype="multipart/form-data" class="boardForm">
											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">카테고리*</p>
													<select name="category" id="category" class="lgThinInput">
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
											</div>

											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">장비이름*</p>
													<input type="text" name="name" id="name" placeholder="장비 이름을 입력하세요…"
														value="${pictVO.name}">
												</div>
											</div>

											<div class="inputsContainer">
												<div class="inputBox" style="width:100%">
													<p class="inputCaption">장비설명*</p>
													<textarea name="description" id="description" cols="50" rows="10"
														class="txt" style="width:100%;">${pictVO.description}</textarea>
												</div>
											</div>
											<div class="inputsContainer">
												<div class="inputBox" style="width:100%">
													<p class="inputCaption">비고</p>
													<textarea name="bujajae" id="bujajae" cols="50" rows="10"
														class="txt" style="width:100%;">${pictVO.bujajae}</textarea>
												</div>
											</div>


											<div class="inputsContainer">
												<div class="inputBox">
													<p class="inputCaption">썸네일
														<label for="attach_file">파일추가</label>
														<input type="file" id="attach_file" name="attach_file" multiple
															style="display: none;">
													</p>
													<ul class="fileList">

													</ul>
													<p class="fileCaption">첨부 파일은 각 10MB 이하의 파일만 가능합니다.</p>
												</div>
											</div>




											<div class="btnContainer">
												<a href="/equipment/equipment_list.do" class="normalButton white">목록으로</a>
												<a href="#lnk" onclick="button1_click()" class="basicButton blue"><img
														src="/img/admin/add2.png" alt="완료">완료</a>
											</div>

											<input type='hidden' name="saveType" id="saveType"
												value='${pictVO.saveType}' />
											<input type='hidden' name="idx" id="idx" value='${pictVO.idx}' />
										</form>
									</div>
								</div>
							</div>
							<script>
								function button1_click() {
									var name = $('#name').val();

									if (name == "" || name == undefined) {
										window.alert("장비 이름을 입력해주세요.");
										$('#name').focus();
										return false;
									}

									if (!$('#description').val()) {
										window.alert("장비 설명을 입력해주세요.");
										$('#description').focus();
										return false;
									}


									if ($("#saveType").val() !== 'update') {
										if ($('#attach_file')[0].files.length === 0) {
											window.alert("썸네일을 추가해주세요.");
											$('#attach_file').focus();
											return false;
										}
									}

									var text = "등록하시겠습니까?";
									if ($("#saveType").val() == 'update') {
										text = "수정하시겠습니까?"
									}
									
									
									if (confirm(text)) {
										$("#register").attr("action", "/equipment/equipment_save.do");
										$("#register").submit();
									}
								}
							</script>
					</body>

					</html>