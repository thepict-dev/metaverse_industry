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
        <h2>마이페이지</h2>
    </div>
    <ul class="tabNav">
        <li><a href="/mypage_account.do">계정 관리</a></li>
        <li class="active"><a href="/mypage_equip.do">장비 예약정보</a></li>
        <li><a href="/mypage_facil.do">시설 예약정보</a></li>
        <li><a href="/mypage_bag.do">장바구니</a></li>
    </ul>
    <div class="tabInner loginWrapper active">
        <div class="equipInfoContainer">
            <ul class="infoTabNav">
                <li class="active"><a href="#lnk">전체보기</a></li>
                <li><a href="#lnk">승인대기<span>5</span></a></li>
                <li><a href="#lnk">서류보완요청</a></li>
                <li><a href="#lnk">승인완료</a></li>
                <li><a href="#lnk">승인거절</a></li>
                <li><a href="#lnk">연체</a></li>
                <li><a href="#lnk">대여중</a></li>
                <li><a href="#lnk">반납완료</a></li>
                <li><a href="#lnk">기타</a></li>
            </ul>
            <div class="infoTabInner active">
                <div class="infoTable">
                    <table>
                        <colgroup>
                            <col width="10%" />
                            <col width="11.5%" />
                            <col width="11.5%" />
                            <col width="10%" />
                            <col width="10%" />
                            <col width="15%" />
                            <col width="12%" />
                            <col width="10%" />
                            <col width="10%" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>신청일</th>
                                <th>대여일</th>
                                <th>반납일</th>
                                <th>대여자 성명</th>
                                <th>대여형태</th>
                                <th>장비명</th>
                                <th><span>대여상태<button type="button" class="infos"><img src="/img/user_img/tooltip-wt.png" alt=""></button></span></th>
                                <th>정보보기</th>
                                <th>예약 취소</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><p>2024.8.4.화</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>한지현</p></td>
                                <td><p>개인</p></td>
                                <td><p><span>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span></p></td>
                                <td><a href="#lnk">승인대기</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk" class="clickable">예약취소</a></td>
                            </tr>
                            <tr>
                                <td><p>2024.8.4.화</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>한지현</p></td>
                                <td><p>개인</p></td>
                                <td><p>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p></td>
                                <td><a href="#lnk">승인대기</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk" class="clickable">예약취소</a></td>
                            </tr>
                            <tr>
                                <td><p>2024.8.4.화</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>한지현</p></td>
                                <td><p>개인</p></td>
                                <td><p><span>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span></p></td>
                                <td><a href="#lnk" class="clickable docAdd">서류보완요청</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk" class="clickable">예약취소</a></td>
                            </tr>
                            <tr>
                                <td><p>2024.8.4.화</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>한지현</p></td>
                                <td><p>개인</p></td>
                                <td><p><span>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span></p></td>
                                <td><a href="#lnk">승인완료</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk" class="clickable">예약취소</a></td>
                            </tr>
                            <tr>
                                <td><p>2024.8.4.화</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>한지현</p></td>
                                <td><p>개인</p></td>
                                <td><p><span>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span></p></td>
                                <td><a href="#lnk" class="clickable reject">승인거절</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk">취소불가</a></td>
                            </tr>
                            <tr>
                                <td><p>2024.8.4.화</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>한지현</p></td>
                                <td><p>개인</p></td>
                                <td><p><span>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span></p></td>
                                <td><a href="#lnk">대여중</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk">취소불가</a></td>
                            </tr>
                            <tr>
                                <td><p>2024.8.4.화</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>한지현</p></td>
                                <td><p>개인</p></td>
                                <td><p><span>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span></p></td>
                                <td><a href="#lnk">연체</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk">취소불가</a></td>
                            </tr>
                            <tr>
                                <td><p>2024.8.4.화</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>2024.8.5.수</p></td>
                                <td><p>한지현</p></td>
                                <td><p>개인</p></td>
                                <td><p><span>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span></p></td>
                                <td><a href="#lnk">반납완료</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk">취소불가</a></td>
                            </tr>
                            <!-- 1~5열의 조건이 같을 경우 rowspan -->
                            <tr>
                                <td rowspan="3"><p>2024.8.5.수</p></td>
                                <td rowspan="3"><p>2024.8.5.수</p></td>
                                <td rowspan="3"><p>2024.8.5.수</p></td>
                                <td rowspan="3"><p>한지현</p></td>
                                <td rowspan="3"><p>개인</p></td>
                                <td><p><span>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span></p></td>
                                <td><a href="#lnk">반납완료</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk">취소불가</a></td>
                            </tr>
                            <tr>
                                <td><p><span>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span></p></td>
                                <td><a href="#lnk">반납완료</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk">취소불가</a></td>
                            </tr>
                            <tr>
                                <td><p><span>Oculus Quest2ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span></p></td>
                                <td><a href="#lnk">반납완료</a></td>
                                <td><a href="#lnk" class="check"><img src="/img/user_img/contract.png" alt=""></a></td>
                                <td><a href="#lnk">취소불가</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="pagination my">
                <a href="#lnk"><img src="/img/user_img/first.png" alt="처음으로"></a>
                <a href="#lnk"><img src="/img/user_img/prev.png" alt="이전으로"></a>
                <a href="#lnk" class="active">1</a>
                <a href="#lnk">2</a>
                <a href="#lnk">3</a>
                <p>...</p>
                <a href="#lnk">10</a>
                <a href="#lnk"><img src="/img/user_img/next.png" alt="다음으로"></a>
                <a href="#lnk"><img src="/img/user_img/last.png" alt="처음으로"></a>
            </div> 
        </div>
    </div>
    <div class="stateModal">
        <div class="stateModalInner">
            <button type="button"><img src="/img/user_img/close-modal.png" alt=""></button>
            <ul class="stateLists">
                <li>
                    <span>승인대기<br>(신청)</span>
                    <p>관리자에게 승인받기 전 상태</p>
                </li>
                <li>
                    <span>서류보완요청</span>
                    <p>서류 누락 등의 이유로 관리자가 추가 서류를 요청한 상태</p>
                </li>
                <li>
                    <span>승인완료</span>
                    <p>승인 완료됐으나 아직 대여하지 않은 상태</p>
                </li>
                <li>
                    <span>승인거절</span>
                    <p>관리자가 대여 요청을 거절한 상태</p>
                </li>
                <li>
                    <span>대여중</span>
                    <p>장비를 실제로 대여중인 상태</p>
                </li>
                <li>
                    <span>반납완료</span>
                    <p>장비를 실제로 반납 완료한 상태</p>
                </li>
                <li>
                    <span>예약취소</span>
                    <p>사용자가 예약을 취소한 상태</p>
                </li>
                <li>
                    <span>연체</span>
                    <p>반납일이 지났으나 반납 바코드가 찍히지 않은 상태</p>
                </li>
                <li>
                    <span>기타</span>
                    <p>기타 다른 상태</p>
                </li>
            </ul>
        </div>
    </div>
    <div class="modalContainer" id="docAddModal">
        <div class="myModalInner">
            <div class="modalTop">
                <p>서류보완요청</p>
                <button type="button"><img src="/img/user_img/close-modal2.png" alt=""></button>
            </div>
            <div class="modalBottom">
                <div class="joinFormWrapper">
                    <div class="inputContainer">
                        <p class="inputCaption">회사명</p>
                        <span class="bindingText">이래서 저래서 서류 보완 요청 합니다 다시 내세요</span>
                    </div>
                    <div class="inputContainer">
                        <p class="inputCaption">증빙서류 첨부</p>
                        <div class="flexInputs file">
                            <p class="fileName"></p>
                            <label for="file" id="attach_file">파일추가</label>
                            <input type="file" id="file" style="display: none;">
                            <button type="button" id="deleteButton" style="display: none;"><img src="/img/user_img/del-file.png" alt=""></button>
                        </div>
                    </div>
                </div>
                <div class="fullButtonContainer my">
                    <a href="#lnk" class="wt normal">제출하기</a>
                </div>
            </div>
        </div>
    </div>
    <div class="modalContainer" id="rejectModal">
        <div class="myModalInner">
            <div class="modalTop">
                <p>장비 대여 승인거절</p>
                <button type="button"><img src="/img/user_img/close-modal2.png" alt=""></button>
            </div>
            <div class="modalBottom">
                <div class="joinFormWrapper">
                    <div class="inputContainer">
                        <p class="inputCaption">거절 사유</p>
                        <span class="bindingText">이래서 저래서 서류 거절함</span>
                    </div>
                </div>
                <div class="fullButtonContainer my">
                    <a href="#lnk" class="wt normal" id="closeReject">확인</a>
                </div>
            </div>
        </div>
    </div>
    <div class="modalContainer" id="bookingInfoModal">
        <div class="modalInner">
            <button type="button"><img src="/img/user_img/close-modal.png" alt=""></button>
            <div class="modalContents">
                <div class="modalTitles">
                    <p>예약 정보</p>
                </div>
                <div class="infoSlides">
                    <ul class="bookingInfolists">
                        <li>
                            <p>장비명</p>
                            <span>Oculus Quest2 외 2건</span>
                        </li>
                        <li>
                            <p>대여자명</p>
                            <span>이유리</span>
                        </li>
                        <li>
                            <p>대여형태</p>
                            <span>기업</span>
                        </li>
                        <li>
                            <p>회사명</p>
                            <span>주식회사 더픽트</span>
                        </li>
                        <li>
                            <p>대여일</p>
                            <span>2024.8.13.화</span>
                        </li>
                        <li>
                            <p>반납일</p>
                            <span>2024.8.13.화</span>
                        </li>
                    </ul>
                </div>
                <ul class="modalDesc">
                    <li>
                        <span>•</span>
                        <p>제출서류 확인 필수</p>
                    </li>
                    <li>
                        <span>•</span>
                        <p>현장방문 시 대여자 본인 신분증 지참 필수</p>
                    </li>
                    <li>
                        <span>•</span>
                        <p>장비 대여 및 반납시 방문전 033-245-6313으로 연락 부탁드립니다.</p>
                    </li>
                </ul>
                <div class="fullButtonContainer conirmBtn">
                    <a href="#lnk" class="bl closeCheck">확인</a>
                </div>
            </div>
        </div>
    </div>
    <script>
        //이용상태 모달 열고, 닫기
        $('.infos').click(function(){
            $('.stateModal').addClass('active');
            $('body').addClass("no-scroll");
        })
        $('.stateModal button').click(function(){
            $('.stateModal').removeClass('active');
            $('body').removeClass("no-scroll");
        })

        //서류보완 모달 열고, 닫기
        $('.docAdd').click(function(){
            $('#docAddModal').addClass('active');
            $('body').addClass("no-scroll");
        })
        $('#docAddModal button').click(function(){
            $('#docAddModal').removeClass('active');
            $('body').removeClass("no-scroll");
        })

        //승인거절 모달 열고, 닫기
        $('.reject').click(function(){
            $('#rejectModal').addClass('active');
            $('body').addClass("no-scroll");
        })
        $('#rejectModal button, #closeReject').click(function(){
            $('#rejectModal').removeClass('active');
            $('body').removeClass("no-scroll");
        })

        //정보보기 모달 열고, 닫기
        $('.check').click(function(){
            $('#bookingInfoModal').addClass('active');
            $('body').addClass("no-scroll");
        })
        $('#bookingInfoModal button, .closeCheck').click(function(){
            $('#bookingInfoModal').removeClass('active');
            $('body').removeClass("no-scroll");
        })

        const fileInput = document.getElementById('file');
        const fileName = document.querySelector('.fileName');
        const deleteButton = document.getElementById('deleteButton');

        fileInput.addEventListener('change', function(e) {
            if (this.files[0]) {
                fileName.textContent = this.files[0].name;
                deleteButton.style.display = 'inline-block';
            }
        });

        deleteButton.addEventListener('click', function() {
            fileInput.value = '';
            fileName.textContent = '';
            this.style.display = 'none';
        });
    </script>
	<%@ include file="./include/footer.jsp" %>
</body>
</html>