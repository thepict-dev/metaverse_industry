<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
                <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


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
                                    <form id="signUpForm" action="" method="post" enctype="multipart/form-data">
                                        <div class="joinContainer">
                                            <p class="joinTitle">기본 정보</p>
                                            <div class="joinFormWrapper">
                                                <div class="inputContainer">
                                                    <p class="inputCaption">아이디*</p>
                                                    <input type="text" name="user_id" value="${userVO.user_id}" id="id"
                                                        placeholder="아이디를 입력하세요">
                                                    <p class="validation-msg none validation-user-id"></p>
                                                    <!-- <p class="unusedId">사용 가능한 아이디 입니다.</p> -->
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">비밀번호*</p>
                                                    <input type="password" name="password" id="password"
                                                        placeholder="비밀번호를 입력하세요" value="${userVO.password}">
                                                    <!-- <p class="rejectPw">8자리 이상 영문, 숫자, 특수문자가 포함되어야 합니다.</p> -->
                                                    <p class="validation-msg none validation-user-password"></p>
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">비밀번호 확인*</p>
                                                    <input type="password" name="password_confirm" id="password_confirm"
                                                        placeholder="비밀번호를 입력하세요" value="${userVO.password_confirm}">
                                                    <p class="validation-msg none validation-user-password_confirm"></p>
                                                    <!-- <p class="unfairPw">비밀번호가 일치하지 않습니다.</p> -->
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">이름*</p>
                                                    <input type="text" name="name" id="name" placeholder="이름을 입력하세요"
                                                        value="${userVO.name}">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">연락처*</p>
                                                    <input type="text" name="mobile" id="mobile" placeholder="연락처를 입력하세요"
                                                        value="${userVO.mobile}">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">이메일*</p>
                                                    <input type="text" name="email" id="email" placeholder="이메일을 입력하세요"
                                                        value="${userVO.email}">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">생년월일*</p>
                                                    <input type="text" name="birthday" id="birthday" placeholder="생년월일을 입력하세요"
                                                        value="${userVO.birthday}">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">주소*</p>
                                                    <div class="flexInputs">
                                                        <input type="text" name="user_address1" id="user_address1"
                                                            readonly placeholder="주소를 입력하세요"
                                                            value="${userVO.user_address1}">
                                                        <a href="#lnk" id="search_add1">주소검색</a>
                                                    </div>
                                                    <input type="text" name="user_address2" id="user_address2"
                                                        value="${userVO.user_address2}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="joinContainer">
                                            <div class="joinContainer">
                                                <div class="titleTooltip">
                                                    <p class="joinTitle">(추가정보) 근무지 정보</p>
                                                    <div class="tooltipBox">
                                                        <button type="button"><img src="/img/user_img/tooltip.png"
                                                                alt=""></button>
                                                        <div class="tooltipDesc">
                                                            <p>근무지 정보를 미리 입력해두시면,<br>장비&시설을 <span>예약할 때 편리하게 이용</span>하실
                                                                수 있어요!</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="joinFormWrapper">
                                                    <div class="inputContainer">
                                                        <p class="inputCaption">회사명</p>
                                                        <input type="text" name="company_nm" id=""
                                                            placeholder="회사명을 입력하세요" value="${userVO.company_nm}">
                                                    </div>
                                                    <div class="inputContainer">
                                                        <p class="inputCaption">사업자등록번호</p>
                                                        <input type="text" name="sa_eob_no" id="sa_eob_no"
                                                            placeholder="사업자등록번호를 입력하세요" value="${userVO.sa_eob_no}">
                                                    </div>
                                                    <div class="inputContainer">
                                                        <p class="inputCaption">직책</p>
                                                        <input type="text" name="position" id="" placeholder="직책을 입력하세요"
                                                            value="${userVO.position}">
                                                    </div>
                                                    <div class="inputContainer">
                                                        <p class="inputCaption">사업장주소</p>
                                                        <div class="flexInputs">
                                                            <input type="text" name="company_address1"
                                                                id="company_address1" readonly placeholder="주소를 입력하세요"
                                                                value="${userVO.company_address1}">
                                                            <a href="#lnk" id="search_add2">주소검색</a>
                                                        </div>
                                                        <input type="text" name="company_address2"
                                                            value="${userVO.company_address2}" id="company_address2">
                                                    </div>
                                                    <div class="inputContainer">
                                                        <p class="inputCaption">증빙서류 첨부</p>
                                                        <div class="flexInputs file">
                                                            <p class="fileName"></p>
                                                            <label for="file" id="attach_file">파일추가</label>
                                                            <input type="file" id="file" style="display: none;"
                                                                name="attach_file">
                                                            <button type="button" id="deleteButton"
                                                                style="display: none;"><img
                                                                    src="/img/user_img/del-file.png" alt=""></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="checkInputBox">
                                            <input type="checkbox" name="agree" id="agree" class="checkOnly">
                                            <label for="agree">개인정보 이용에 동의합니다</label>
                                        </div>
                                        <div class="fullButtonContainer">
                                            <a href="#lnk" class="wt normal" onclick="onSubmit()">회원가입</a>
                                        </div>
                                    </form>
                                </div>
                                <%@ include file="./include/footer.jsp" %>

                                    <script
                                        src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                                    <script>

                                        window.onload = function () {
                                            document.getElementById("search_add1").addEventListener("click", function () {
                                                new daum.Postcode({
                                                    oncomplete: function (data) {
                                                        document.getElementById("user_address1").value = data.address;
                                                        $('#user_address2').css("display", "block");
                                                        document.getElementById("user_address2").focus();
                                                    }
                                                }).open();
                                            });
                                            document.getElementById("search_add2").addEventListener("click", function () {
                                                new daum.Postcode({
                                                    oncomplete: function (data) {
                                                        document.getElementById("company_address1").value = data.address;
                                                        $('#company_address2').css("display", "block");
                                                        document.getElementById("company_address2").focus();
                                                    }
                                                }).open();
                                            });
                                        }

                                        const fileInput = document.getElementById('file');
                                        const fileName = document.querySelector('.fileName');
                                        const deleteButton = document.getElementById('deleteButton');

                                        fileInput.addEventListener('change', function (e) {
                                            if (this.files[0]) {
                                                fileName.textContent = this.files[0].name;
                                                deleteButton.style.display = 'inline-block';
                                            }
                                        });

                                        deleteButton.addEventListener('click', function () {
                                            fileInput.value = '';
                                            fileName.textContent = '';
                                            this.style.display = 'none';
                                        });

                                        const tooltipButtons = document.querySelectorAll('.tooltipBox button');
                                        const tooltipDescs = document.querySelectorAll('.tooltipDesc');

                                        tooltipButtons.forEach((button, index) => {
                                            button.addEventListener('click', function (e) {
                                                e.stopPropagation();
                                                tooltipDescs[index].style.opacity = tooltipDescs[index].style.opacity === '1' ? '0' : '1';
                                            });
                                        });

                                        document.addEventListener('click', function () {
                                            tooltipDescs.forEach(desc => {
                                                desc.style.opacity = '0';
                                            });
                                        });

                                        tooltipDescs.forEach(desc => {
                                            desc.addEventListener('click', function (e) {
                                                e.stopPropagation();
                                            });
                                        });

                                        let validation = {
                                            userId: false,
                                            passwordSafe: false,
                                            passwordEq: false
                                        }
                                        $('#id').on('blur', function () {
                                            var userId = $(this).val()
                                            var param = {
                                                userId: userId
                                            }
                                            if (userId) {
                                                $.ajax({
                                                    url: '/api/checkUserId.do' // Replace with your actual endpoint
                                                    , type: "POST"
                                                    , data: JSON.stringify(param)
                                                    , contentType: "application/json"
                                                    , dataType: "json"
                                                    , async: true,
                                                    success: function (response) {
                                                        console.log(response.rst);
                                                        if (response.rst) {
                                                            validation.userId = true;
                                                            $(".validation-user-id").text("사용 가능한 아이디 입니다.").addClass("text-green");
                                                            $(".validation-user-id").removeClass("text-red");
                                                            $(".validation-user-id").removeClass("none");
                                                        } else {
                                                            validation.userId = false;
                                                            $(".validation-user-id").text("이미 사용중인 아이디 입니다.").addClass("text-red");
                                                            $(".validation-user-id").removeClass("text-green");
                                                            $(".validation-user-id").removeClass("none");
                                                        }
                                                    },
                                                    error: function () {
                                                        $('#idCheckResult').text('아이디 확인 중 오류가 발생했습니다.').css('color', 'red');
                                                    }
                                                });
                                            } else {
                                                $('#idCheckResult').text('');
                                            }
                                        });


                                        $('#password').on('blur', function () {
                                            var password = $(this).val()
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

                                        $('#password_confirm').on('blur', function () {
                                            if ($(this).val() !== $('#password').val()) {
                                                validation.passwordEq = false;
                                                $(".validation-user-password_confirm").text("비밀번호가 일치하지 않습니다.").addClass("text-red");
                                                $(".validation-user-password").removeClass("none");
                                            } else {
                                                validation.passwordEq = true;
                                                $(".validation-user-password").text("").addClass("none");
                                            }

                                        });

                                        $("#mobile").keyup(function() {
                                            var replace_text = $(this).val().replace(/[^0-9]/g, '');
                                            $(this).val(replace_text);
                                        });

                                        $("#email").keyup(function() {
                                            var replace_text = $(this).val().replace(/[^a-zA-Z0-9@.]/g, '');
                                            $(this).val(replace_text);
                                        });

                                        $("#email").blur(function() {
                                            var email = $(this).val();

                                            // '@'가 포함되어 있는지 확인
                                            if (!email.includes('@')) {
                                                alert("이메일에 '@' 기호가 필요합니다.");
                                            }
                                        });

                                    	$("#birthday").keyup(function() {
                                    	    var replace_text = $(this).val().replace(/[^0-9]/g, '');
                                            var inputValue = $(this).val();
                                            
                                    	    $(this).val(replace_text);
                                    	    
                                            if (inputValue.length > 8) {
                                                $(this).val(inputValue.substring(0, 8));
                                            }
                                    	});
                                    	
                                    	$("#birthday").blur(function() {
                                            var dob = $("#birthday").val();
                                            var dobPattern = /^\d{8}$/;
                                            if (!dobPattern.test(dob)) {
                                                alert("생년월일은 8자리 숫자로 입력해야 합니다.");
                                                return false;
                                            }
                                    	});
                                        
                                        function onSubmit() {
                                            if (!validation.userId) {
                                                $("#id").focus();
                                                return window.alert("사용할 수 없는 아이디입니다");
                                            }
                                            if (!validation.passwordSafe) {
                                                $("#password").focus();
                                                return window.alert("비밀번호가 안전하지 않습니다.");
                                            }
                                            if (!validation.passwordEq) {
                                                $("#password_confirm").focus();
                                                return window.alert("비밀번호가 일치하지 않습니다");
                                            }

                                            if ($("#id").val() === "") {
                                                $("#id").focus();
                                                return window.alert("아이디를 입력해주세요");
                                            }

                                            if ($("#password").val() === "") {
                                                $("#password").focus();
                                                return window.alert("비밀번호를 입력해주세요");
                                            }

                                            if ($("#password_confirm").val() === "") {
                                                $("#password_confirm").focus();
                                                return window.alert("비밀번호 확인을 입력해주세요");
                                            }

                                            if ($("#name").val() === "") {

                                                $("#name").focus();
                                                return window.alert("이름을 입력해주세요");
                                            }

                                            if ($("#mobile").val() === "") {
                                                $("#mobile").focus();
                                                return window.alert("연락처를 입력해주세요");
                                            }

                                            if ($("#email").val() === "") {
                                                $("#email").focus();
                                                return window.alert("이메일을 입력해주세요");
                                            }

                                            if ($("#birthday").val() === "") {
                                                $("#birthday").focus();
                                                return window.alert("생년월일을 입력해주세요");
                                            }

                                            if ($("#user_address1").val() === "") {
                                                $("#user_address1").focus();
                                                return window.alert("주소를 입력해주세요");
                                            }


                                            if (!$("#agree").is(":checked")) {
                                                return window.alert("개인정보 이용에 동의해주세요");
                                            }


                                            $("#signUpForm").attr("action", "/signUp.do");
                                            $("#signUpForm").submit();
                                        }
                                    </script>
                        </body>

                    </html>