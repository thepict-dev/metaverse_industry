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
               	<div class="findButtonContainer">
                	<button type="button" class="findID">아이디 찾기</button>
                	<button type="button" class="findPW">비밀번호 찾기</button>
               	</div>
                <div class="fullButtonContainer">
                    <a href="#lnk" class="bl" onclick="fn_login()">로그인</a>
                    <a href="/join.do" class="wt">회원가입</a>
                </div>
            </form>
        </div>
    </div>
    <div class="modalContainer" id="findIdModal1">
        <div class="myModalInner">
            <div class="modalTop">
                <p>아이디 찾기</p>
                <button class="closeModalBasic" type="button"><img
                        src="/img/user_img/close-modal2.png" alt=""></button>
            </div>
            <div class="modalBottom">
                <div class="joinFormWrapper">
                    <div class="inputContainer">
                        <p class="inputCaption">이름</p>
                        <input type="text" name="name" value="${user_info.name}" id="name"
                            placeholder="이름을 입력하세요">
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">연락처</p>
                        <input type="text" name="mobile" value="${user_info.mobile}"
                            id="mobile" placeholder="연락처를 입력하세요">
                    </div>
                </div>
                <div class="fullButtonContainer find">
                    <a href="#lnk" class="wt normal findIdButton">아이디 찾기</a>
                </div>
            </div>
        </div>
    </div>
    <div class="modalContainer" id="findIdModal2">
        <div class="myModalInner">
            <div class="modalTop">
                <p>아이디 찾기</p>
                <button class="checkIdButton" type="button"><img
                        src="/img/user_img/close-modal2.png" alt=""></button>
            </div>
            <div class="modalBottom">
                <div class="joinFormWrapper">
                    <div class="inputContainer">
                        <p class="inputCaption">회원가입시 입력한 아이디입니다.</p>
                      	<span class="bindingText">korpaper</span>
                    </div>
                </div>
                <div class="fullButtonContainer find">
                    <a href="#lnk" class="wt normal checkIdButton">확인</a>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="modalContainer" id="findPwModal1">
        <div class="myModalInner">
            <div class="modalTop">
                <p>비밀번호 찾기</p>
                <button class="closeModalBasic" type="button"><img
                        src="/img/user_img/close-modal2.png" alt=""></button>
            </div>
            <div class="modalBottom">
                <div class="joinFormWrapper">
                    <div class="inputContainer">
                        <p class="inputCaption">이름</p>
                        <input type="text" name="name" value="${user_info.name}" id="name"
                            placeholder="이름을 입력하세요">
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">연락처</p>
                        <input type="text" name="mobile" value="${user_info.mobile}"
                            id="mobile" placeholder="연락처를 입력하세요">
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">아이디</p>
                        <input type="text" name="mobile" value="${user_info.id}"
                            id="mobile" placeholder="아이디를 입력하세요">
                    </div>
                </div>
                <div class="fullButtonContainer find">
                    <a href="#lnk" class="wt normal findPwButton">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
    <div class="modalContainer" id="findPwModal2">
        <div class="myModalInner">
            <div class="modalTop">
                <p>비밀번호 찾기</p>
                <button class="checkPwButton" type="button"><img
                        src="/img/user_img/close-modal2.png" alt=""></button>
            </div>
            <div class="modalBottom">
                <div class="joinFormWrapper">
	                <div class="inputContainer">
	                    <p class="inputCaption">비밀번호*</p>
	                    <input type="password" name="password" id="new_password" placeholder="비밀번호를 입력하세요" value="${userVO.password}">
	                    <!-- <p class="rejectPw">8자리 이상 영문, 숫자, 특수문자가 포함되어야 합니다.</p> -->
	                    <p class="validation-msg none validation-user-password"></p>
	                </div>
	                <div class="inputContainer">
	                    <p class="inputCaption">비밀번호 확인*</p>
	                    <input type="password" name="password_confirm" id="new_password_confirm" placeholder="비밀번호를 입력하세요" value="${userVO.password_confirm}">
	                    <p class="validation-msg none validation-user-password_confirm"></p>
	                    <!-- <p class="unfairPw">비밀번호가 일치하지 않습니다.</p> -->
	                </div>
                </div>
                <div class="fullButtonContainer find">
                    <a href="#lnk" class="wt normal donePwButton">비밀번호 변경</a>
                </div>
            </div>
        </div>
    </div>
    
	<%@ include file="./include/footer.jsp" %>
	<script>

	$('.findID').click(function(){
		$('#findIdModal1').addClass('active');
	});

	$('.closeModalBasic').click(function(){
		$('#findIdModal1').removeClass('active');
	});

	$('.findIdButton').click(function(){
		$('#findIdModal1').removeClass('active');
		$('#findIdModal2').addClass('active');
	});
	
	$('.checkIdButton').click(function(){
		$('#findIdModal2').removeClass('active');
	});


	$('.findPW').click(function(){
		$('#findPwModal1').addClass('active');
	});
	$('.closeModalBasic').click(function(){
		$('#findPwModal1').removeClass('active');
	});

	$('.findPwButton').click(function(){
		$('#findPwModal1').removeClass('active');
		$('#findPwModal2').addClass('active');
	});
	
	$('.checkPwButton').click(function(){
		$('#findPwModal2').removeClass('active');
	});
	$('.donePwButton').click(function(){
		alert('비밀번호 변경이 완료되었습니다.');
		$('#findPwModal2').removeClass('active');
	});
	
	const validation = {
	    passwordSafe: false,
	    passwordEq: false
	};
	
	$('#new_password').on('blur', function () {
	    var password = $(this).val();
	    const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	    if (!passwordRegex.test(password)) {
	        validation.passwordSafe = false;
	        $(".validation-user-password").text("8자리 이상 영문, 숫자, 특수문자가 포함되어야 합니다.").addClass("text-red");
	        $(".validation-user-password").removeClass("none");
	    } else {
	        validation.passwordSafe = true;
	        $(".validation-user-password").text("").addClass("none");
	    }
	});

	$('#new_password_confirm').on('blur', function () {
	    if ($(this).val() !== $('#new_password').val()) {
	        validation.passwordEq = false;
	        $(".validation-user-password_confirm").text("비밀번호가 일치하지 않습니다.").addClass("text-red");
	        $(".validation-user-password_confirm").removeClass("none");  // 수정된 부분
	    } else {
	        validation.passwordEq = true;
	        $(".validation-user-password_confirm").text("").addClass("none");  // 수정된 부분
	    }
	});
    
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