<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
	
<!DOCTYPE html>
<html lang="ko">
	<c:import url="./head.jsp">
    	<c:param name="pageTitle" value="관리자 페이지 로그인"/>
    </c:import>
	<body>
	    <div class="loginContainer">
	        <div class="loginInner">
	            <form class="loginContents" action="#" id="entryForm" name="entryForm" method="post">
	                <div class="loginTitle">
	                    <h1>강원메타버스지원센터</h1>
	                    <h2>로그인</h2>
	                </div>
	                <div class="loginInputs">
	                    <div class="loginInput">
	                        <p class="inputCaption">아이디</p>
	                        <input type="text" id="id" class="loginInput" placeholder="아이디를 입력하세요." onkeypress="if(event.keyCode == 13){fn_login();}" autocomplete="off">
	                    </div>
	                    <div class="loginInput">
	                        <p class="inputCaption">비밀번호</p>
	                        <input type="password" id="password" class="loginInput" placeholder="비밀번호를 입력하세요." onkeypress="if(event.keyCode == 13){fn_login();}" autocomplete="off">
	                    </div>
	                </div>
	                <button type="button" onclick="javascript:fn_login();">로그인</button>
	            </form>
	        </div>
	        <p>계정 관련 문의는 1644-4845로 연락바랍니다.</p>
	    </div>

		<form action="#" id="loginForm" name="loginForm" method="post">
			<%-- 
			<input type="hidden" id="RSAModulus" value="${RSAModulus}"/>
			<input type="hidden" id="RSAExponent" value="${RSAExponent}"/>
			--%>
			<input type="hidden" name="adminId" id="adminId" value="">
			<input type="hidden" name="adminPw" id="adminPw" value="">
		</form>
		
		<script>
	
			$( document ).ready(function() {
			    console.log( "ready!" );
			});
			var msg = "${message}";
			if(msg != "" && msg != null){
				alert(msg);
			}
			function fn_login2(){
				var option = "width = 1000, height = 600, top = 100, left = 200, location = no"
				window.open("https://kcloud.kangwon.ac.kr/login?return_url=http://localhost:8080/sso.do", "강원대학교 통합로그인", option)
	
			}
			function fn_login() {
				
				// rsa 암호화
				//var rsa = new RSAKey();
				//rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
				
				if ($("#id").val() == "") {
					alert("아이디를 입력하세요.");
					$("#id").focus();
					return false;
				} else {
					//$("#adminId").val(rsa.encrypt($("#id").val()));
					$("#adminId").val($("#id").val());
				}
				
				if ($("#password").val() == "") {
					alert("비밀번호를 입력하세요.");
					$("#password").focus();
					return false;
				} else {
					//$("#adminPw").val(rsa.encrypt($("#pw").val()));
					$("#adminPw").val($("#password").val());
				}
				document.loginForm.action = "/login.do";
				document.loginForm.submit();
				
			}
		</script>
	</body>
</html>