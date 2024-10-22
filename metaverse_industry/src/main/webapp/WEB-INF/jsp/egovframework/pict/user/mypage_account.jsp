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
                                    <h2>마이페이지</h2>
                                </div>
                                <ul class="tabNav">
                                    <li class="active"><a href="/mypage_account.do">계정 관리</a></li>
                                    <li><a href="/mypage_equip.do">장비 예약정보</a></li>
                                    <li><a href="/mypage_facil.do">시설 예약정보</a></li>
                                    <li><a href="/mypage_bag.do">장바구니</a></li>
                                </ul>
                                <div class="tabInner loginWrapper active">
                                    <form action="">
                                        <div class="joinContainer">
                                            <p class="joinTitle">기본 정보</p>
                                            <div class="joinFormWrapper">
                                                <div class="inputContainer">
                                                    <p class="inputCaption _name">이름*</p>
                                                    <span class="bindingText">${user_info.name}</span>
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption _mobile">연락처*</p>
                                                    <span class="bindingText">${user_info.mobile}</span>
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption _email">이메일*</p>
                                                    <span class="bindingText">${user_info.email}</span>
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption _birthday">생년월일*</p>
                                                    <span class="bindingText">${user_info.birthday}</span>
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption _address">주소*</p>
                                                    <span class="bindingText">${user_info.user_address1}
                                                        ${user_info.user_address2}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="fullButtonContainer my">
                                            <a href="#lnk" class="wt normal" id="basicModeButton">수정하기</a>
                                        </div>
                                        <div class="joinContainer">
                                            <div class="joinContainer">
                                                <div class="titleTooltip">
                                                    <p class="joinTitle">근무지 정보</p>
                                                </div>
                                                <div class="joinFormWrapper">
                                                    <div class="inputContainer">
                                                        <p class="inputCaption _company_nm">회사명</p>
                                                        <span class="bindingText">${user_info.company_nm}</span>
                                                    </div>
                                                    <div class="inputContainer">
                                                        <p class="inputCaption _sa_eob_no">사업자등록번호</p>
                                                        <span class="bindingText">${user_info.sa_eob_no}</span>
                                                    </div>
                                                    <div class="inputContainer">
                                                        <p class="inputCaption _position">직책</p>
                                                        <span class="bindingText">${user_info.position}</span>
                                                    </div>
                                                    <div class="inputContainer">
                                                        <p class="inputCaption _company_address">사업장주소*</p>
                                                        <span class="bindingText">${user_info.company_address1}
                                                            ${user_info.company_address2}</span>
                                                    </div>
                                                    <div class="inputContainer">
                                                        <p class="inputCaption _document_url">증빙서류 첨부</p>
                                                        <span class="fileText">${user_info.document_url}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="fullButtonContainer">
                                            <a href="#lnk" class="wt normal" id="addModeButton">수정하기</a>
                                        </div>
                                    </form>
                                </div>
                                <div class="modalContainer" id="modifyBasic">
                                    <div class="myModalInner">
                                        <div class="modalTop">
                                            <p>기본 정보 수정하기</p>
                                            <button class="closeModalBasic" type="button"><img
                                                    src="/img/user_img/close-modal2.png" alt=""></button>
                                        </div>
                                        <div class="modalBottom">
                                            <div class="joinFormWrapper">
                                                <div class="inputContainer">
                                                    <p class="inputCaption">이름*</p>
                                                    <input type="text" name="name" value="${user_info.name}" id="name"
                                                        placeholder="이름을 입력하세요">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">연락처*</p>
                                                    <input type="text" name="mobile" value="${user_info.mobile}"
                                                        id="mobile" placeholder="연락처를 입력하세요">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">이메일*</p>
                                                    <input type="text" name="email" value="${user_info.email}"
                                                        id="email" placeholder="이메일을 입력하세요">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">생년월일*</p>
                                                    <input type="text" name="birthday" value="${user_info.birthday}"
                                                        id="birthday" placeholder="생년월일을 입력하세요">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">주소*</p>
                                                    <div class="flexInputs">
                                                        <input type="text" name="user_address1"
                                                            value="${user_info.user_address1}" id="user_address1"
                                                            readonly placeholder="주소를 입력하세요">
                                                        <a href="#lnk" id="search_add1">주소검색</a>
                                                    </div>
                                                    <input type="text" name="user_address2" style="display: block;"
                                                        value="${user_info.user_address2}" id="user_address2">
                                                </div>
                                            </div>
                                            <div class="fullButtonContainer my">
                                                <a href="#lnk" class="wt normal updateBasic">수정하기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modalContainer" id="modefyAdd">
                                    <div class="myModalInner">
                                        <div class="modalTop">
                                            <p>추가 정보 수정하기</p>
                                            <button class="closeModalAdd" type="button"><img
                                                    src="/img/user_img/close-modal2.png" alt=""></button>
                                        </div>
                                        <div class="modalBottom">
                                            <div class="joinFormWrapper">
                                                <div class="inputContainer">
                                                    <p class="inputCaption">회사명</p>
                                                    <input type="text" name="company_nm" value="${user_info.company_nm}"
                                                        id="company_nm" placeholder="회사명을 입력하세요">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">사업자등록번호</p>
                                                    <input type="text" name="sa_eob_no" value="${user_info.sa_eob_no}"
                                                        id="sa_eob_no" placeholder="사업자등록번호를 입력하세요">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">직책</p>
                                                    <input type="text" name="position" value="${user_info.position}"
                                                        id="position" placeholder="직책을 입력하세요">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">사업장주소*</p>
                                                    <div class="flexInputs">
                                                        <input type="text" name="company_address1"
                                                            value="${user_info.company_address1}" id="company_address1"
                                                            readonly placeholder="주소를 입력하세요">
                                                        <a href="#lnk" id="search_add2">주소검색</a>
                                                    </div>
                                                    <input type="text" name="company_address2" style="display: block;"
                                                        value="${user_info.company_address2}" id="company_address2">
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">증빙서류 첨부</p>
                                                    <div class="flexInputs file">
                                                        <p class="fileName"></p>
                                                        <label for="file" id="attach_file">파일추가</label>
                                                        <input type="file" id="file" style="display: none;">
                                                        <button type="button" id="deleteButton"
                                                            style="display: none;"><img src="/img/user_img/del-file.png"
                                                                alt=""></button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="fullButtonContainer my">
                                                <a href="#lnk" class="wt normal updateAdd">수정하기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%@ include file="./include/footer.jsp" %>
                                    <script
                                        src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                                    <script>
                                        document.getElementById("search_add1").addEventListener("click", function () {
                                            new daum.Postcode({
                                                oncomplete: function (data) {
                                                    document.getElementById("user_address1").value = data.address;
                                                    document.getElementById("user_address2").focus();
                                                }
                                            }).open();
                                        });
                                        document.getElementById("search_add2").addEventListener("click", function () {
                                            new daum.Postcode({
                                                oncomplete: function (data) {
                                                    document.getElementById("company_address1").value = data.address;
                                                    document.getElementById("company_address2").focus();
                                                }
                                            }).open();
                                        });
                                        $('#basicModeButton').click(function () {
                                            $('#modifyBasic').addClass('active');
                                        });
                                        $('#addModeButton').click(function () {
                                            $('#modefyAdd').addClass('active');
                                        });
                                        $('.closeModalBasic').click(function () {
                                            $('#modifyBasic').removeClass('active');
                                        });
                                        $('.closeModalAdd').click(function () {
                                            $('#modefyAdd').removeClass('active');
                                        });
                                        $('.updateBasic').click(function () {
                                            if ($('#name').val() == '') {
                                                return window.alert('이름을 입력하세요.');
                                            }
                                            if ($('#mobile').val() == '') {
                                                return window.alert('연락처를 입력하세요.');
                                            }
                                            if ($('#email').val() == '') {
                                                return window.alert('이메일을 입력하세요.');
                                            }
                                            if ($('#birthday').val() == '') {
                                                return window.alert('생년월일을 입력하세요.');
                                            }
                                            if ($('#user_address1').val() == '') {
                                                return window.alert('주소를 입력하세요.');
                                            }
                                            var param = {
                                                name: $('#name').val(),
                                                mobile: $('#mobile').val(),
                                                email: $('#email').val(),
                                                birthday: $('#birthday').val(),
                                                user_address1: $('#user_address1').val(),
                                                user_address2: $('#user_address2').val(),
                                            }
                                            $.ajax({
                                                url: '/api/update_user.do' // Replace with your actual endpoint
                                                , type: "POST"
                                                , data: JSON.stringify(param)
                                                , contentType: "application/json"
                                                , dataType: "json"
                                                , async: true,
                                                success: function (response) {
                                                    console.log(response);
                                                    if (response.rst) {
                                                        if (response.data.name !== '') {
                                                            document.querySelector("._name ~ span").textContent = response.data.name;
                                                        }
                                                        if (response.data.mobile !== '') {
                                                            document.querySelector("._mobile ~ span").textContent = response.data.mobile;
                                                        }
                                                        if (response.data.email !== '') {
                                                            document.querySelector("._email ~ span").textContent = response.data.email;
                                                        }
                                                        if (response.data.birthday !== '') {
                                                            document.querySelector("._birthday ~ span").textContent = response.data.birthday;
                                                        }
                                                        if (response.data.user_address1 !== '') {
                                                            document.querySelector("._address ~ span").textContent = response.data.user_address1 + ' ' + response.data.user_address2;
                                                        }

                                                        $('#modifyBasic').removeClass('active');
                                                        return window.alert('수정되었습니다.');
                                                    } else {
                                                        return window.alert('수정에 실패하였습니다.');
                                                    }
                                                },
                                                error: function () {
                                                    // $('#idCheckResult').text('아이디 확인 중 오류가 발생했습니다.').css('color', 'red');
                                                }
                                            });

                                            // $('#modifyBasic').removeClass('active');
                                        });
                                        $('.updateAdd').click(function () {
                                            var param = {
                                                company_nm: $('#company_nm').val(),
                                                sa_eob_no: $('#sa_eob_no').val(),
                                                position: $('#position').val(),
                                                company_address1: $('#company_address1').val(),
                                                company_address2: $('#company_address2').val(),
                                            }
                                            $.ajax({
                                                url: '/api/update_user.do' // Replace with your actual endpoint
                                                , type: "POST"
                                                , data: JSON.stringify(param)
                                                , contentType: "application/json"
                                                , dataType: "json"
                                                , async: true,
                                                success: function (response) {
                                                    if (response.rst) {
                                                        const data = response.data;
                                                        if (data.company_nm !== '') {
                                                            document.querySelector("._company_nm ~ span").textContent = data.company_nm;
                                                        }
                                                        if (data.sa_eob_no !== '') {
                                                            document.querySelector("._sa_eob_no ~ span").textContent = data.sa_eob_no;
                                                        }
                                                        if (data.position !== '') {
                                                            document.querySelector("._position ~ span").textContent = data.position;
                                                        }
                                                        if (data.company_address1 !== '') {
                                                            document.querySelector("._company_address ~ span").textContent = data.company_address1 + ' ' + data.company_address2;
                                                        }
                                                        if (data.document_url !== '') {
                                                            document.querySelector("._document_url ~ span").textContent = data.document_url;
                                                        }
                                                        $('#modefyAdd').removeClass('active');
                                                        return window.alert('수정되었습니다.');
                                                    } else {
                                                        return window.alert('수정에 실패하였습니다.');
                                                    }
                                                },
                                                error: function () {
                                                    // $('#idCheckResult').text('아이디 확인 중 오류가 발생했습니다.').css('color', 'red');
                                                }
                                            });

                                        });
                                    </script>
                        </body>

                    </html>