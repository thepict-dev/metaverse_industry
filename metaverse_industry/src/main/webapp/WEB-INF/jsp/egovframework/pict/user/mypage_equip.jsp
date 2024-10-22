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
                                    <li><a href="/mypage_account.do">계정 관리</a></li>
                                    <li class="active"><a href="/mypage_equip.do">장비 예약정보</a></li>
                                    <li><a href="/mypage_facil.do">시설 예약정보</a></li>
                                    <li><a href="/mypage_bag.do">장바구니</a></li>
                                </ul>
                                <div class="tabInner loginWrapper active">
                                    <div class="equipInfoContainer">
                                        <ul class="infoTabNav">
                                            <li class="<c:if test="${pictVO.request_status eq null ||
                                                pictVO.request_status eq '' || pictVO.request_status eq undefined }">active</c:if>"><a
                                                    href="/mypage_equip.do">전체보기</a>
                                            </li>
                                            <li class="<c:if test="${pictVO.request_status eq 'pendding'}">active
                                                </c:if>"><a href="/mypage_equip.do?request_status=pendding">승인대기
                                                    <c:if test="${penddingCnt ne 0 }">
                                                    	<span>${penddingCnt}</span>
                                                	</c:if>
                                                </a></li>
                                            <li class="<c:if test="${pictVO.request_status eq 'rejected'}">active
                                                </c:if>"><a href="/mypage_equip.do?request_status=rejected">서류보완요청
                                                <c:if test="${rejectedCnt ne 0 }">
                                                    	<span>${rejectedCnt}</span>
                                               	</c:if>
                                                </a>
                                            </li>
                                            <li class="<c:if test="${pictVO.request_status eq 'retry'}">active
                                                </c:if>"><a href="/mypage_equip.do?request_status=retry">서류보완신청
                                                <c:if test="${retryCnt ne 0 }">
                                                    	<span>${retryCnt}</span>
                                               	</c:if>
                                                </a>
                                            <li class="<c:if test="${pictVO.request_status eq 'approved'}">active
                                                </c:if>"><a href="/mypage_equip.do?request_status=approved">승인완료
	                                                <c:if test="${approvedCnt ne 0 }">
	                                                    	<span>${approvedCnt}</span>
	                                               	</c:if>
                                                </a>
                                            </li>
                                            <li class="<c:if test="${pictVO.request_status eq 'refused'}">active
                                                </c:if>"><a href="/mypage_equip.do?request_status=refused">승인거절
                                                	<c:if test="${refusalCnt ne 0 }">
	                                                    	<span>${refusalCnt}</span>
	                                               	</c:if>
                                                </a></li>
                                            <li class="<c:if test="${pictVO.request_status eq 'overdue'}">active
                                                </c:if>"><a href="/mypage_equip.do?request_status=overdue">연체
                                                	<c:if test="${overdueCnt ne 0 }">
	                                                    	<span>${overdueCnt}</span>
	                                               	</c:if>
                                                </a></li>
                                            <li class="<c:if test="${pictVO.request_status eq 'rental'}">active</c:if>
                                                "><a href="/mypage_equip.do?request_status=rental">대여중
                                                	<c:if test="${rentalCnt ne 0 }">
	                                                    	<span>${rentalCnt}</span>
	                                               	</c:if>
                                                </a></li>
                                            <li class="<c:if test="${pictVO.request_status eq 'returned'}">active
                                                </c:if>"><a href="/mypage_equip.do?request_status=returned">반납완료</a>
                                            </li>
                                            <!-- <li><a href="#lnk">기타</a></li> -->
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
                                                            <th><span>대여상태<button type="button" class="infos"><img
                                                                            src="/img/user_img/tooltip-wt.png"
                                                                            alt=""></button></span></th>
                                                            <th>정보보기</th>
                                                            <th>예약 취소</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="item" items="${request_list}"
                                                            varStatus="status">
                                                            <tr>
                                                                <td class="request_date">
                                                                    <p>${item.request_date}</p>
                                                                </td>
                                                                <td class="rental_start_date">
                                                                    <p>${item.rental_start_date}</p>
                                                                </td>
                                                                <td class="rental_end_date">
                                                                    <p>${item.rental_end_date}</p>
                                                                </td>
                                                                <td class="user_name">
                                                                    <p>${item.user_name}</p>
                                                                </td>
                                                                <td class="user_type">
                                                                    <p>${item.type eq '1' ? '개인' : '기업'}</p>
                                                                    <input type="hidden" value="${item.company_nm}"
                                                                        class="company_nm" />
                                                                </td>
                                                                <td class="equip_name">
                                                                    <p><span>${item.name}</span></p>
                                                                </td>

                                                                <c:if test="${item.request_status eq 'pendding'}">
                                                                    <td class="request_status"><a href="#lnk">승인대기</a>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${item.request_status eq 'rejected'}">
                                                                    <td class="request_status">
                                                                    	<a href="#lnk" data-id="${item.id}" class="clickable docAdd">서류보완요청</a>
                                                                    	<input type="hidden" value="${item.reject_msg}"
                                                                        class="reject_msg" />
                                                                    </td>
                                                                   
                                                                </c:if>
                                                                <c:if test="${item.request_status eq 'retry'}">
                                                                    <td class="request_status"><a href="#lnk">서류보완신청</a>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${item.request_status eq 'approved'}">
                                                                    <td class="request_status"><a href="#lnk">승인완료</a>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${item.request_status eq 'refused'}">
                                                                    <td class="request_status"><a href="#lnk"
                                                                            class="clickable reject">승인거절</a>
                                                                    </td>
                                                                </c:if>

                                                                <c:if test="${item.request_status eq 'overdue'}">
                                                                    <td class="request_status"><a href="#lnk">연체</a>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${item.request_status eq 'rental'}">
                                                                    <td class="request_status"><a href="#lnk">대여중</a>
                                                                    </td>
                                                                </c:if>
                                                                <c:if test="${item.request_status eq 'returned'}">
                                                                    <td class="request_status"><a href="#lnk">반납완료</a>
                                                                    </td>
                                                                </c:if>
                                                                <td>
                                                                    <a href="#lnk" class="check"><img
                                                                            src="/img/user_img/contract.png" alt=""></a>
                                                                </td>
                                                                <c:if
                                                                    test="${item.request_status eq 'pendding' || item.request_status eq 'rejected' || item.request_status eq 'approved' || item.request_status eq 'retry'}">
                                                                    <td><a data-id="${item.id}" href="#lnk"
                                                                            class="clickable cancel_request">예약취소</a>
                                                                    </td>
                                                                </c:if>
                                                                <c:if
                                                                    test="${item.request_status ne 'pendding' && item.request_status ne 'rejected' && item.request_status ne 'approved' && item.request_status ne 'retry'}">
                                                                    <td><a href="#lnk">취소불가</a></td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>                                
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="pagination my">
                                            <c:if test="${pictVO.pageNumber ne 1}">
                                                <li><a
                                                        href="/board/board_list.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img
                                                            src="/img/admin/prev.png" alt=""></a></li>
                                            </c:if>

                                            <c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
                                                <c:if test="${i eq pictVO.pageNumber}">
                                                    <li><a class="active"
                                                            href="/notice.do?type=${pictVO.type}&pageNumber=${i}">${i}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${i ne pictVO.pageNumber}">
                                                    <li><a
                                                            href="/notice.do?type=${pictVO.type}&pageNumber=${i}">${i}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>

                                            <c:if
                                                test="${pictVO.lastPage ne pictVO.pageNumber && pictVO.lastPage != 0}">
                                                <li><a
                                                        href="/notice.do?type=${pictVO.type}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img
                                                            src="/img/admin/next.png" alt=""></a></li>
                                            </c:if>
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
                                            <button type="button"><img src="/img/user_img/close-modal2.png"
                                                    alt=""></button>
                                        </div>
                                        <form class="modalBottom" method="post" enctype="multipart/form-data" id="retryForm">
                                        	<input type="hidden" name="id" id="id" />
                                            <div class="joinFormWrapper">
                                                <div class="inputContainer">
                                                    <p class="inputCaption">사유</p>
                                                    <span class="bindingText reject_msg_ui"></span>
                                                </div>
                                                <div class="inputContainer">
                                                    <p class="inputCaption">증빙서류 첨부</p>
                                                    <div class="flexInputs file">
                                                        <p class="fileName"></p>
                                                        <label for="document_file" id="attach_file">파일추가</label>
                                                        <input type="file" name="document_file" id="document_file" style="display: none;">
                                                        <button type="button" id="deleteButton"
                                                            style="display: none;"><img src="/img/user_img/del-file.png"
                                                                alt=""></button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="fullButtonContainer my">
                                                <a href="#lnk" class="wt normal retryButton">제출하기</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="modalContainer" id="rejectModal">
                                    <div class="myModalInner">
                                        <div class="modalTop">
                                            <p>장비 대여 승인거절</p>
                                            <button type="button"><img src="/img/user_img/close-modal2.png"
                                                    alt=""></button>
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
                                <script type="text/javascript" src="/js/mypage_equip.js"></script>
                                <%@ include file="./include/footer.jsp" %>
                        </body>

                    </html>