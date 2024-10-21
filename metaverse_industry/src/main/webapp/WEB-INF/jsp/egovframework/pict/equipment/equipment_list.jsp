<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/head.jsp">
    	<c:param name="pageTitle" value="장비 리스트"/>
    </c:import>
    
    <%@include file="../main/lnb.jsp" %>
		<c:import url="../main/header.jsp">
	    	<c:param name="title" value="장비 관리"/>
	    	<c:param name="subtitle" value="장비 리스트"/>
	    </c:import>
	    <div class="contentsContainer">
	        <div class="listContainer">
	            <div class="listInner">
	                <form action="" class="countList" id="search_fm" name="search_fm" method="get">
	                    <p>총 <span>${size}</span>개</p>
	                    <div class="inputsContainer">
	                        <div class="inputBox listSearch">
	                            <input type="text" name="search_text" id="search_text" placeholder="내용을 입력하세요…" value="${pictVO.search_text}">
	                            <a href="#lnk" onclick="search_list();"><img src="/img/admin/search2.png" alt=""></a>
	                        </div>
	                    </div>
	                </form>
	               
	                <div class="ListWrpper">
	                    <ul class="listHead boardlist">
	                        <li>순서</li>
	                        <li>이름</li>
	                        <li>설명</li>
	                        <li>썸네일</li>
	                        <li>비고</li>
	                        <li>작성일</li>
	                        <li>상세보기</li>
	                    </ul>
	                    <ul class="listBody boardlist">
						    <c:forEach var="resultList" items="${resultList}" varStatus="status">
						        <li>
						            <div class="list-item">
						                <!-- 기존 내용 -->
					                    <p>${resultList.idx}</p>
						                <p>
						                	<a href="javascript:void(0);" onclick="board_mod('${resultList.idx}');" class="link">
						                		${resultList.name}
						                	</a>
					                	</p>
						                <p>${resultList.description}</p>
						                <p>${resultList.image_url}</p>
						                <p>${resultList.bujajae}</p>
						                <p>${resultList.reg_date}</p>
						                <!-- 
						                <p class="delete"><a href="#lnk" onclick="board_delete('${resultList.idx}')"></a></p>
						                 -->
						                <p class="details">상세보기</p>
						            </div>
						            <div class="detail-view" style="display: none;">
					                    <ul class="detailHead">
					                        <li>순서</li>
					                        <li>시리얼넘버</li>
					                        <li>상태</li>
					                    </ul>
	                    				<ul class="detailBody">
	                    					<li>1</li>
	                    					<li>2938fFADJ1234FAJVIOB</li>
	                    					<li>대여중</li>
	                    				</ul>
						            </div>
						        </li>
						    </c:forEach>
						</ul>
	                    
	                    <div class="listButton">
	                        <a href="/equipment/equipment_register.do"><img src="/img/admin/add.png" alt="등록버튼">장비등록</a>
	                    </div>
	                    
	                    <div class="pagination">
	                    	<c:if test="${pictVO.pageNumber ne 1}">
								<li><a href="/equipment/equipment_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img src="/img/admin/prev.png" alt=""></a></li>
							</c:if>	
							
							<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
								<c:if test="${i eq pictVO.pageNumber}">
									<li class="active"><a href="/board/board_list.do?search_text=${param.search_text}&pageNumber=${i}" >${i}</a></li>
								</c:if>
								<c:if test="${i ne pictVO.pageNumber}">
									<li><a href="/equipment/equipment_list.do?search_text=${param.search_text}&pageNumber=${i}" >${i}</a></li>
								</c:if>
							</c:forEach>	
	                    
		                    <c:if test="${pictVO.lastPage ne pictVO.pageNumber}">
								<li><a href="/equipment/equipment.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img src="/img/admin/next.png" alt=""></a></li>
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

			function board_mod(idx){
				location.href= "/equipment/equipment_register.do?idx="+ idx;
			}
			function board_list(){
				location.href= "/equipment/equipment_list.do";
			}

			function board_delete(idx) {
				if (confirm("삭제 하시겠습니까?")) {
					$('#idx').val(idx)
					$("#register").attr("action", "/board/board_delete.do");
					$("#register").submit();
				}
			}
			function search(){
				$("#search_fm").attr("action", "/board/board_list.do");
				$("#search_fm").submit();
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		<script src="/js/list_js.js"></script>
    </body>
</html>