<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="포스터 리스트"/>
    </c:import>
    
    <body class="sb-nav-fixed">
        <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">포스터 리스트</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
							    <div class="search-form">
							    	<form action="" id="search_fm" name="search_fm" method="get" class="search-box">
								    	<input type="text" id="search_text" name="search_text" value="${pictVO.search_text}" class="input" placeholder="검색어를 입력하세요." autocomplete="off">
								    	<button type="button" onclick="search();" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
							    	</form>
							    </div>
						    	<div class="tbl-basic tbl-hover">
							        <table style="text-align: left">
							        	<colgroup>
							        		<%-- <col style="width:10%;"> --%>
							        		<col style="width:20%;">
							        		<col style="width:30%;">
							        		<col style="width:20%;">
							        		<col style="width:20%;">
							        		<%-- <col style="width:10%;"> --%>
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <!-- <th>순서</th> -->
							                    <th>카테고리</th>
							                    <th>제목</th>
							                    <th>사용여부</th>
							                    <th>등록일시</th>
							                    <!-- <th>삭제</th> -->
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
							                    	<%-- <td>${status.count}</td> --%>
							                    	<td>
							                    		<c:if test="${resultList.category eq '1'}">겸재정선미술관</c:if>
							                    		<c:if test="${resultList.category eq '2'}">허준박물관</c:if>
							                    		<c:if test="${resultList.category eq '3'}">곰달래 문화복지센터</c:if>
							                    	</td>
							                    	<td class="opt-tl"><a href="javascript:void(0);" onclick="poster_mod('${resultList.idx}');" class="link">${resultList.title1}</a></td>
							                    	<td style="text-align:left">
							                    		<c:if test="${resultList.use_at eq 'N'}">
											            	<button type="button" style="margin-left:30px" class="state-box state-n" onclick="javascript:cng_use_at('${resultList.idx}', '${resultList.use_at}');">
											            		<span class="text">비활성화</span> 
											            	</button>
										            	</c:if>
										            	<c:if test="${resultList.use_at ne 'N'}">
											            	<button type="button" style="margin-left:30px" class="state-box state-y" onclick="javascript:cng_use_at('${resultList.idx}', '${resultList.use_at}');">
											            		<span class="text">활성화</span>
											            	</button>
										            	</c:if>
							                    	</td>
							                    	<td>${resultList.reg_date}</td>
							                    	<%-- <td>
							                    		<button type="button" onclick="javascript:poster_delete('${resultList.idx}')" class="btn-basic btn-fill btn-sm">삭제</button>
									            	</td> --%>
								                </tr>
							                </c:forEach>
							            </tbody>
						            </table>
				            	</div>
				            </div>
			            </div>
		            </div>
		            <!-- <div style="float : right; margin-right: 20%">
			            <button type="button" id="button1" onclick="board_list();">게시글 리스트</button>
		            </div> -->
				</main>
			</div>
		</div>
		<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
			<input type='hidden' name="idx" id="idx" value='' />
			<input type='hidden' name="use_at" id="use_at" value='' />
			<input type='hidden' name="type" id="type" value='' />
		</form>
		<script>

			function poster_mod(idx){
				location.href= "/poster/poster_register.do?idx="+ idx;
			}
			function poster_list(){
				location.href= "/poster/poster_list.do";
			}
			function cng_use_at(idx, use_at){
				$('#idx').val(idx)
				if(use_at == 'Y'){
					$('#use_at').val('N') 
				}
				else{
					$('#use_at').val('Y')
				}
				$('#type').val('1');
				var text = "활성화 상태로 변경하시겠습니까?";
				if(use_at == "Y"){
					$('#type').val('2');
					text = "비활성화 상태로 변경하시겠습니까?";
				}
				
				if(confirm (text)){
					$("#register").attr("action", "/poster/cng_use_at.do");
					$("#register").submit();
				}
				
			}
			function poster_delete(idx) {
				if (confirm("삭제 하시겠습니까?")) {
					$('#idx').val(idx)
					$("#register").attr("action", "/poster/poster_delete.do");
					$("#register").submit();
				}
			}
			function search(){
				$("#search_fm").attr("action", "/poster/poster_list.do");
				$("#search_fm").submit();
			}
		</script>
            
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>