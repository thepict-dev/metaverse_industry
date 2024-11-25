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
        <h2>회원가입</h2>
    </div>
    <div class="loginWrapper">
        <div class="loginContainer done">
            <span><img src="/img/user_img/logo.webp" alt=""></span>
            <div class="doneContainer">
                <div class="doneContents">
                    <span><img src="/img/user_img/check_circle.webp" alt=""></span>
                    <p>회원가입 완료</p>
                    <span class="pc">회원가입이 성공적으로 완료되었습니다.<br>회원가입 시 입력한 정보는 마이페이지 > 계정관리에서 수정 가능합니다.</span>
                    <span class="mb">회원가입이 성공적으로 완료되었습니다.<br>회원가입 시 입력한 정보는<br>마이페이지 > 계정관리에서 수정 가능합니다.</span>
                </div>
                <div class="fullButtonContainer">
                    <a href="/user_login.do" class="bl">로그인</a>
                </div>
            </div>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
</body>
</html>