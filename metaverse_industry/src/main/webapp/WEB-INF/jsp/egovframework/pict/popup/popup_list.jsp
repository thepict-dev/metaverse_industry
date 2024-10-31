<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/head.jsp">
    	<c:param name="pageTitle" value="게시물"/>
    </c:import>
    
    <%@include file="../main/lnb.jsp" %>
		<c:import url="../main/header.jsp">
	    	<c:param name="title" value="게시물"/>
	    	<c:param name="subtitle" value="공지사항 리스트"/>
	    </c:import>
	   <div class="contentsContainer">
	        <div class="listContainer">
	            <div class="listInner">
	                <form action="" id="search_fm" name="search_fm" method="get" class="countList">
	                    <p>총 <span>${size}</span>개</p>
	                    <%-- <div class="inputsContainer">
	                        <div class="inputBox listSearch">
	                            <input type="text" name="search_text" id="search_text" placeholder="내용을 입력하세요…" value="${pictVO.search_text}">
	                            <a href="#lnk" onclick="fn_search()"><img src="/front_img/search2.png" alt=""></a>
	                        </div>
	                    </div> --%>
	                </form>
	                <div class="ListWrpper">
		                <ul class="listHead popupList">
		                    <li>순서</li>
		                    <li>제목</li>
		                    <li>링크</li>
		                    <li>정렬순서</li>
		                    <li>등록일</li>
		                    <li>삭제</li>
		                </ul>
		                <ul class="listBody popupList">
		                	<c:forEach var="item" items="${resultList}" varStatus="status">
			                    <li>
			                        <p>
			                        	<c:if test="${pictVO.pageNumber eq 1}">
			                        		${size - status.index}
		                        		</c:if>
		                        		<c:if test="${pictVO.pageNumber ne 1}">
		                        			${size - (status.index +  ((pictVO.pageNumber - 1) * 10))}
		                        		</c:if>
			                        </p>
			                        <a href="/popup/popup_form.do?idx=${item.idx}" class="title">${item.title}</a>
			                        <p>${item.link_url}</p>
			                        <p>${item.order_by}</p>
			                        <p>${fn:substring(item.reg_date,0,10)}</p>
									<p class="delete"><button onclick="board_delete(${item.idx})"></button></p>
			                    </li>
		                    </c:forEach>
		                </ul>
		                <div class="listButton">
							<a href="/popup/popup_form.do"><img src="/img/admin/add.png"
									alt="등록버튼">등록</a>
						</div>

		                <div class="pagination">
							<c:if test="${pictVO.pageNumber ne 1}">
								<li><a
										href="/popup/popup_list.do?pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img
											src="/img/admin/prev.png" alt=""></a></li>
							</c:if>
	
							<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
								<c:if test="${i eq pictVO.pageNumber}">
									<li><a class="active"
											href="/popup/popup_list.do?pageNumber=${i}">${i}</a>
									</li>
								</c:if>
								<c:if test="${i ne pictVO.pageNumber}">
									<li><a
											href="/popup/popup_list.do?tpageNumber=${i}">${i}</a>
									</li>
								</c:if>
							</c:forEach>
	
							<c:if
								test="${pictVO.lastPage ne pictVO.pageNumber && pictVO.lastPage != 0}">
								<li><a
										href="/popup/popup_list.do?pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img
											src="/img/admin/next.png" alt=""></a></li>
							</c:if>
						</div>
	                </div>
	            </div>
	        </div>
	    </div>
		<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
			<input type='hidden' name="idx" id="idx" value='' />
		</form>
		<script>
	
			function fn_search(){
				$("#search_fm").attr("action", "/popup/popup_list.do");
				$("#search_fm").submit();
			}
			function board_delete(idx) {
				if (confirm("삭제 하시겠습니까?")) {
					$('#idx').val(idx)
					$("#register").attr("action", "/popup/popup_delete.do");
					$("#register").submit();
				}
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>

