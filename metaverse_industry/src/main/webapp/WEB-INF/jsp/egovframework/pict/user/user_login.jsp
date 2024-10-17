<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<meta charset="ko">
<%@ include file="./include/head.jsp" %>
<body>
	<%@ include file="./include/header.jsp" %>
    <div class="loginTitle">
        <h2>로그인</h2>
    </div>
    <div class="loginWrapper">
        <div class="loginContainer">
            <span><img src="/img/user_img/logo.png" alt=""></span>
            <form id="loginForm" action="" method="post">
                <div class="inputContainer login">
                    <input type="text" name="user_id" id="id" placeholder="아이디를 입력하세요">
                    <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요">
                </div>
                <a href="#lnk">비밀번호 찾기</a>
                <div class="fullButtonContainer">
                    <a href="#lnk" class="bl" onclick="fn_login()">로그인</a>
                    <a href="/join.do" class="wt">회원가입</a>
                </div>
            </form>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script>
	function fn_login() {
		
		// rsa 암호화
		//var rsa = new RSAKey();
		//rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
		
		if ($("#id").val() == "") {
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return false;
		}
		
		if ($("#password").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#password").focus();
			return false;
		}
		 $("#loginForm").attr("action", "/login_action.do");
         $("#loginForm").submit();
	}
	</script>
</body>
</html>