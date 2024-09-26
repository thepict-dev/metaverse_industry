<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="사용자관리"/>
    </c:import>
    
    <body class="sb-nav-fixed">
        <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">사용자 리스트</h2>
					<div class="contents-box">
						<div class="card">
						    <div class="card-body">
						    	<div class="search-form">
								    <form action="" id="search_fm" name="search_fm" method="get" class="search-box">
								    	<input type="text" id="search_text" name="search_text" value="${search_text}" class="input" placeholder="검색어를 입력하세요." autocomplete="off">
								    	<%-- 닉네임 <input type="text" id="search_nickname" name="search_nickname" value="${search_nickname}"/> &nbsp;&nbsp;
								    	연락처 <input type="text" id="search_mobile" name="search_mobile" value="${search_mobile}"/>
								    	이메일 <input type="text" id="search_email" name="search_email" value="${search_email}"/> --%>
								    	<button type="button" onclick="search();" class="btn"><i class="fa-solid fa-magnifying-glass"></i></button>
							    	</form>
						    	</div>
						    	<div class="tbl-basic tbl-hover">
							        <table>
							        	<colgroup>
							        		<col style="width:10%;">
							        		<col style="width:18%;">
							        		<col style="width:16%;">
							        		<col style="width:16%;">
							        		<col style="width:auto;">
							        		<col style="width:14%;">
							        	</colgroup>
							            <thead>
							                <tr class="thead">
							                    <th>순서</th>
							                    <th>아이디</th>
							                    <th>닉네임</th>
							                    <th>연락처</th>
							                    <th>이메일</th>
							                    <th>계정관리</th>
							                </tr>
							            </thead>
							            <tbody>
								            <c:forEach var="resultList" items="${resultList}" varStatus="status">
								                <tr>
								                    <td>${status.count}</td>
								                    <td>${resultList.id}</td>
								                    <td>${resultList.nick_name}</td>
								                    <td>${resultList.mobile}</td>
								                    <td>${resultList.email}</td>
								                    <td>
								                    	<button type="button" onclick="javascript:user_del('${resultList.id}');" class="btn-basic btn-sm btn-default">삭제</button>
								                    </td>
								                </tr>
							                </c:forEach>
							            </tbody>
						            </table>
				            	</div>
				            </div>
			            </div>
		            </div>
				</main>
			</div>
		</div>

		<form action="" id="register" name="register" method="post" enctype="multipart/form-data">
			<input type="hidden" id="id" name="id" value=""/>
		</form>
		
		<script>
			function search(){
				$("#search_fm").attr("action", "/status/connection_user.do");
				$("#search_fm").submit();
			}
			function user_mod(id){
				location.href= "/user_register.do?id="+ id;
			}
			function button1_click(id){
				location.href= "/user_register.do"
			}
			function password_reset(id){
				if(confirm(id + " 계정의 비밀번호를 초기화 하시겠습니까?")){
					$("#id").val(id);
					document.register.action = "/user_reset.do";
					document.register.submit();
				}
			}
			function user_del(id){
				$('#id').val(id)
				console.log(id)
				if(confirm("해당 계정을 삭제하시겠습니까?")){
					$("#register").attr("action", "/status/connection_user_del.do");
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