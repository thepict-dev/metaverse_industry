<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
				<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



					<!DOCTYPE html>
					<html lang="ko">
					<c:import url="../main/head.jsp">
						<c:param name="pageTitle" value="장비 리스트" />
					</c:import>

					<%@include file="../main/lnb.jsp" %>
						<c:import url="../main/header.jsp">
							<c:param name="title" value="장비 관리" />
							<c:param name="subtitle" value="장비 리스트" />
						</c:import>
						<div class="contentsContainer">
							<div class="listContainer">
								<div class="listInner">
									<form action="" class="countList" id="search_fm" name="search_fm" method="get">
										<p>총 <span>${totalCnt}</span>개</p>
										<div class="inputsContainer">
											<div class="inputBox listSearch">
												<select name="category" id="category" class="lgThinInput">
													<option value="" >장비 타입</option>
													<option value="HMD" <c:if test="${pictVO.type eq 'HMD'}">
														selected</c:if>>HMD</option>
													<option value="AR글래스" <c:if test="${pictVO.type eq 'AR글래스'}">
														selected</c:if>>AR글래스
													</option>
													<option value="모션캡처" <c:if test="${pictVO.type eq '모션캡처'}">
														selected</c:if>>모션캡처</option>
													<option value="360카메라" <c:if test="${pictVO.type eq '360카메라'}">
														selected</c:if>>360카메라
													</option>
													<option value="3D스캐너" <c:if test="${pictVO.type eq '3D스캐너'}">
														selected</c:if>>3D스캐너
													</option>
													<option value="기타" <c:if test="${pictVO.type eq '기타'}">
														selected</c:if>>기타</option>
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

									<div class="ListWrpper">
										<ul class="listHead equipList">
											<li>선택</li>
											<li>순서</li>
											<li>구분</li>
											<li>이미지</li>
											<li>장비명</li>
											<li>장비수량</li>
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
													<!-- 기존 내용 -->
													<p>${resultList.idx}</p>
													<p class="equip_type">${resultList.type}</p>
													<!-- 
					                <p>${resultList.description}</p>
					                 -->
													<div class="listImg"><img src="${resultList.image_url}"
															alt="장비 이미자"></div>
													<p class="title">${resultList.name}</p>
													<p class="items_cnt">재고 : ${resultList.inventoryCnt} / 총계  : ${resultList.avaliable_equipment_cnt}</p>
													<p class="reg_date">${resultList.reg_date}</p>
													<p class="modify"><a href="#lnk"
															onclick="board_mod('${resultList.idx}');">수정</a></p>
													<p class="delete"><button
															onclick="board_delete('${resultList.idx}')"></button></p>
												</li>
											</c:forEach>
										</ul>

										<div class="listButton">
											<a href="/equipment/equipment_register.do"><img src="/img/admin/add.png"
													alt="등록버튼">등록</a>
											<button class="deleteEquipments"><img src="/img/admin/delete.png"
													alt="삭제버튼">삭제</button>
										</div>

										<div class="pagination">
											<c:if test="${pictVO.pageNumber ne 1}">
												<li><a
														href="/equipment/equipment_list.do?type=${pictVO.type}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img
															src="/img/admin/prev.png" alt=""></a></li>
											</c:if>

											<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
												<c:if test="${i eq pictVO.pageNumber}">
													<li><a class="active"
															href="/equipment/equipment_list.do?type=${pictVO.type}&pageNumber=${i}">${i}</a>
													</li>
												</c:if>
												<c:if test="${i ne pictVO.pageNumber}">
													<li><a
															href="/equipment/equipment_list.do?type=${pictVO.type}&pageNumber=${i}">${i}</a>
													</li>
												</c:if>
											</c:forEach>

											<c:if
												test="${pictVO.lastPage ne pictVO.pageNumber && pictVO.lastPage != 0}">
												<li><a
														href="/equipment/equipment_list.do?type=${pictVO.type}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img
															src="/img/admin/next.png" alt=""></a></li>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							<div class="equipDetails">
								<div class="detailsTop">
									<p>장비 세부사항</p>
									<button><img src="/img/admin/close-bk.png" alt=""></button>
								</div>
								<div class="detailInfoContainer">
									<div class="detailCard">
										<div class="detailCardInner">
											<div class="detailCardText">
												<span class="detailCate">HMD</span>
												<p>무슨장비다</p>
												<span class="detailDate">2024-10-31</span>
											</div>
											<div class="detailCardImg">
												<img src="" alt="장비이미지">
											</div>
										</div>
									</div>
									<div class="detailList">
										<ul class="listHead detailHead">
											<li>선택</li>
											<li>시리얼 넘버</li>
											<li>등록일</li>
											<li>장비상태</li>
											<li>라벨</li>
											<li>삭제</li>
										</ul>
										<ul class="listBody detailBody">
										</ul>
									</div>
									<div class="listButton detail">
										<a class="addSerial" href="/equipment/equipment_cnt_register.do"><img
												src="/img/admin/add.png" alt="등록버튼">등록</a>
										<a class="deleteItems" href="#lnk"><img src="/img/admin/delete.png"
												alt="삭제버튼">삭제</a>
									</div>
								</div>
							</div>
						</div>
						<div class="datailCardWrapper qr-label-container">
							<div class="detailCard detailSub">
								<p class="inputCaption">라벨</p>
								<div class="detailCardInner detailSub">
									<div class="detailCardText">
										<span class="detailCate label-type"></span>
										<p class="label-name">${equipment.name}</p>
										<p class="detailDate">시리얼넘버</p>
										<p class="detailDate label-serial-number"></p>
										<br />
										<span class="detailDate lable-reg-date">${pictVO.reg_date}</span>
									</div>
									<div class="detailCardImg" id="qr-img">
										
									</div>
								</div>
								<!-- <div class="buttons">
									<a href="" class="smButton"
										style="margin-top: 8px; padding: 0 8px;">다운로드</a>
								</div> -->
							</div>
						</div>
						<script>
							$("#category").change(function(e){
								location.href = "/equipment/equipment_list.do?type=" + $(this).val();
							})
						</script>
						<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
							<input type='hidden' name="idx" id="idx" value='' />
							<input type='hidden' name="use_at" id="use_at" value='' />
							<input type='hidden' name="type" id="type" value='' />
						</form>
						<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
						<script type="text/javascript" src="/js/equipment_list.js"></script>
						<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/scripts.js"></script>
						<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
						<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
						</body>

					</html>