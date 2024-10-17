<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/head.jsp">
    	<c:param name="pageTitle" value="유저 리스트"/>
    </c:import>
    
    
    <body>
   		<%@include file="../main/lnb.jsp" %>
		<c:import url="../main/header.jsp">
	    	<c:param name="title" value="유저 리스트"/>
	    	<c:param name="subtitle" value="유저 리스트"/>
	    </c:import>
    </body>
	<script>
		function search(){
			$("#search_fm").attr("action", "/user_list.do");
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
		function fn_delete(id){
			if(confirm(id + " 계정을 삭제하시겠습니까?")){
				$("#id").val(id);
				document.register.action = "/user_delete.do";
				document.register.submit();
			}
		}
		
	
	</script>
           
	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
	
</html>