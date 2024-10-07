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
            <form action="">
                <div class="inputContainer login">
                    <input type="text" placeholder="아이디를 입력하세요">
                    <input type="password" placeholder="비밀번호를 입력하세요">
                </div>
                <a href="#lnk">비밀번호 찾기</a>
                <div class="fullButtonContainer">
                    <a href="#lnk" class="bl">로그인</a>
                    <a href="/join.do" class="wt">회원가입</a>
                </div>
            </form>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
</body>
</html>