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
							<c:param name="subtitle" value="신청 세부사항" />
						</c:import>
						<div class="contentsContainer">
							<div class="listContainer set">
								<div class="listWrapper">
									<p class="regTitle">신청 정보</p>
									<div class="listInner set">
										<div class="inputsContainer">
											<div class="inputBox">
												<p class="inputCaption">단체명(학교명)</p>
												<span class="bindingText"></span>
											</div>
										</div>
										<div class="inputsContainer">
											<div class="inputBox per">
												<p class="inputCaption">주소</p>
												<span class="bindingText per"></span>
											</div>
										</div>
										<div class="inputsContainer">
											<div class="inputBox">
												<p class="inputCaption">성명(담당자)</p>
												<span class="bindingText"></span>
											</div>
											<div class="inputBox">
												<p class="inputCaption">직책</p>
												<span class="bindingText"></span>
											</div>
										</div>
										<div class="inputsContainer">
											<div class="inputBox">
												<p class="inputCaption">전화번호</p>
												<span class="bindingText"></span>
											</div>
											<div class="inputBox">
												<p class="inputCaption">이메일</p>
												<span class="bindingText"></span>
											</div>
										</div>
										<div class="inputsContainer">
											<div class="inputBox">
												<p class="inputCaption">신청교육</p>
												<span class="bindingText"></span>
											</div>
											<div class="inputBox">
												<p class="inputCaption">참여인원</p>
												<span class="bindingText"></span>
											</div>
										</div>
										<div class="inputsContainer">
											<div class="inputBox">
												<p class="inputCaption">희망일시</p>
												<span class="bindingText"></span>
											</div>
											<div class="inputBox">
												<p class="inputCaption">교육생</p>
												<span class="bindingText"><span>학교</span><span> 학년</span></span>
											</div>
										</div>
									</div>
								</div>
								<div class="listWrapper">
									<div class="listInner set">
						                <div class="buttons">
						                    <a href="#lnk" class="smButton"><img src="/img/admin/pdf.png" alt="">PDF 다운로드</a>
						                </div>
									</div>
								</div>
								<div class="listWrapper">
									<div class="listInner set">
										<div class="btnContainer">
											<a href="/education/manage_education.do" class="normalButton white">목록으로</a>
											<a href="#lnk" onclick="button1_click()" class="normalButton blue">승인</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						<script src="/js/edu.js"></script>
						</body>

					</html>