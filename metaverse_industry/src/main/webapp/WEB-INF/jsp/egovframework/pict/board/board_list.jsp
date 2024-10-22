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
	                <form action="" class="countList" id="search_fm" name="search_fm" method="get">
	                    <p>총 <span>${totalCnt}</span>개</p>
	                    <div class="inputsContainer">
	                        <div class="inputBox listSearch">
	                            <input type="text" name="search_text" id="search_text" placeholder="내용을 입력하세요…" value="${pictVO.search_text}">
	                            <a href="#lnk" onclick="search_list();"><img src="/img/admin/search2.png" alt=""></a>
	                        </div>
	                    </div>
	                </form>
	               
	                <div class="ListWrpper">
	                    <ul class="listHead noticelist">
	                        <li>순서</li>
	                        <li>제목</li>
	                        <li>작성일</li>
	                        <li>삭제</li>
	                    </ul>
	                    <ul class="listBody noticelist">
	                    	<c:forEach var="resultList" items="${resultList}" varStatus="status">
		                        <li>
		                            <c:if test="${pictVO.pageNumber eq 1}">
										<p>${board_cnt - status.index}</p>					
									</c:if>
									<c:if test="${pictVO.pageNumber ne 1}">
										<p>${board_cnt - (status.index +  ((pictVO.pageNumber - 1) * 20))}</p>
									</c:if>
		                            <a href="/board/board_register.do?idx=${resultList.idx}"><p>${resultList.title}</p></a>
		                            <p>${resultList.reg_date}</p>
		                            <p class="delete"><a href="#lnk" onclick="board_delete('${resultList.idx}')"></a></p>
		                        </li>
	                        </c:forEach>
	                    </ul>
	                    
	                    <div class="listButton">
	                        <a href="/board/board_register.do"><img src="/img/admin/add.png" alt="등록버튼">등록</a>
	                    </div>
	                    
	                    <div class="pagination">
	                    	<c:if test="${pictVO.pageNumber ne 1}">
								<li><a href="/board/board_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img src="/img/admin/prev.png" alt=""></a></li>
							</c:if>	
							
							<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
								<c:if test="${i eq pictVO.pageNumber}">
									<li class="active"><a href="/board/board_list.do?search_text=${param.search_text}&pageNumber=${i}" >${i}</a></li>
								</c:if>
								<c:if test="${i ne pictVO.pageNumber}">
									<li><a href="/board/board_list.do?search_text=${param.search_text}&pageNumber=${i}" >${i}</a></li>
								</c:if>
							</c:forEach>	
	                    
		                    <c:if test="${pictVO.lastPage ne pictVO.pageNumber}">
								<li><a href="/board/board_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img src="/img/admin/next.png" alt=""></a></li>
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
				location.href= "/board/board_register.do?idx="+ idx;
			}
			function board_list(){
				location.href= "/board/board_list.do";
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
		
    </body>
</html>