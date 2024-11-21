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
<style>
					        #dropZone {
					        	margin-top: 20px;
					            width: 350px;
					            height: 200px;
					            border: 2px dashed #ccc;
					            text-align: center;
					            padding: 20px;
					        }
					        #dropZone.dragover {
					            background-color: #e1e1e1;
					            border-color: #999;
					        }
					        .file-list {
					            margin: 20px 0 0 0;
					            width: 400px;
					            display: flex;
							    flex-direction: column;
							    row-gap: 10px;
							    align-items: baseline;
					        }
					        .file-item {
					        	width : 100%;
					            display: flex;
					            justify-content: space-between;
					            align-items: center;
					            padding: 10px 20px;
					            border-bottom: 1px solid #eee;
					            border: 1px solid var(--grey-grey-100, #DBDEE2);
								background: var(--wh, #FFF);
								column-gap : 5px;
					        }
					        .file-item > p {
						        white-space: nowrap;
							    width: 100%;
							    overflow: hidden;
							    text-overflow: ellipsis;
					        }
					        .remove-file {
					            color: red;
					            cursor: pointer;
					        }
					        .progress {
					            width: 300px;
					            height: 20px;
					            background-color: #f0f0f0;
					            margin: 10px 20px;
					        }
					        .progress-bar {
					            height: 100%;
					            background-color: #4CAF50;
					            width: 0%;
					            transition: width 0.3s ease-in-out;
					        }
					        #uploadButton {
					            margin: 20px;
					            padding: 10px 20px;
					            background-color: #4CAF50;
					            color: white;
					            border: none;
					            border-radius: 4px;
					            cursor: pointer;
					        }
					        #uploadButton:disabled {
					            background-color: #cccccc;
					            cursor: not-allowed;
					        }
					    </style>
	<%@ include file="./include/header.jsp" %>
    <div class="loginTitle book">
        <h2><a href="/facility.do"><img src="/img/user_img/back-grey.png" alt=""></a>시설 예약</h2>
    </div>
    <div class="loginWrapper book">
        <form action="">
            <div class="bookingWrapper">
                <h3 class="subTitles"><span>01</span> 시설 대여일/반납일을 선택해주세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner equip">
                        <div class="equipLists">
                            <p class="bookingTitle">시설 목록</p>
                            <ul class="equipList">
                                <c:forEach var="equipment" items="${resultList}"
                                   varStatus="status">
                                   <li data-id="${equipment.id}"
                                       data-cnt="${equipment.count}">
                                       <!-- <input type="checkbox" name="booking" id="booking_${equipment.id}" class="booking-checkbox"> -->
                                       <!-- <div class="equipment-status"></div> -->
                                       <span class="checkBox"></span>
                                       <div class="checkItem list">
                                           <div class="itemTitles">
                                               <p><span class="facil">${equipment.name}</span></p>
                                           </div>
                                       </div>
                                       <a href="#lnk"><img src="/img/user_img/delete2.png"
                                               alt=""></a>
                                   </li>
                               </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="bookingInner date">
                    	<div class="disable-calendar">
                          <p>좌측 시설을 선택하고<br /> 대여일/반납일을 선택해주세요</p>
                       	</div>
                        <p class="bookingTitle">대여일/반납일 선택</p>
                        <div class="dateContainer">
                            <div id="datepicker"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bookingWrapper step-02 blind">
                <h3 class="subTitles"><span>02</span> 예약하신 시설 정보를 확인해주세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner">
                        <p class="bookingTitle">대여시설 확인</p>
                        <ul class="dateResultLists">
                            
                        </ul>
                    </div>
                </div>
            </div>
            <div class="bookingWrapper step-03 blind">
                <h3 class="subTitles"><span>03</span> 대여 형태를 선택해주세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner">
                        <p class="bookingTitle">대여형태 선택</p>
                        <div class="radioWrapper">
                            <input type="radio" name="option" id="individual">
                            <label for="individual">
                                개인
                            </label>
                            <input type="radio" name="option" id="company">
                            <label for="company">
                                기업
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bookingWrapper addIndiv" style="display: none;">
                <h3 class="subTitles"><span>04</span> 추가 정보를 입력하세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner">
                        <p class="bookingTitle">추가정보 입력</p>
                        <div class="joinFormWrapper">
                        	<div class="inputContainer">
                                <p class="inputCaption">시설사용계획*</p>
                                <textarea class="equipment-plan-individual" name="" id=""
                                    placeholder="시설 사용 계획을 상세히 적어주세요."></textarea>
                            </div>
                            <div class="inputContainer">
                                <p class="inputCaption">증빙서류 첨부*</p>
                                <p class="fileSub">신분증 사본을 제출해주세요.</p>
                                <div id="dropZone" class="dropzone_individual">
							        파일을 여기에 드래그하세요
							        <br>또는<br>
							        <input type="file" id="fileInput" class="fileInput_individual" multiple style="margin-top: 10px;" accept=".jpg, .jpeg, .png, .pdf, .hwp">
							    </div>
							    <div class="file-list file_list_individual" id="fileList"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bookingWrapper addCompany" style="display: none;">
                <h3 class="subTitles"><span>04</span> 추가 정보를 입력하세요</h3>
                <div class="bookingContainer con01">
                    <div class="bookingInner">
                        <p class="bookingTitle">추가정보 입력</p>
                        <div class="joinFormWrapper">
                            <div class="inputContainer">
                                <p class="inputCaption">회사명</p>
                                <input type="text" name="company_nm" id="company_nm" placeholder="회사명을 입력하세요" value="${user_info.company_nm}" />
                            </div>
                            <div class="inputContainer">
                                <p class="inputCaption">사업자등록번호</p>
                                <input type="text" name="sa_eob_no" id="sa_eob_no" placeholder="사업자등록번호를 입력하세요" value="${user_info.sa_eob_no}" />
                            </div>
                            <div class="inputContainer">
                                <p class="inputCaption">직책</p>
                                <input type="text" name="position" id="position" placeholder="직책을 입력하세요" value="${user_info.position}" />
                            </div>
                            <div class="inputContainer">
                                <p class="inputCaption">사업장주소*</p>
                                <div class="flexInputs">
                                    <input type="text" name="company_address1" id="company_address1" readonly placeholder="주소를 입력하세요" value="${user_info.company_address1}">
                                    <a href="#lnk" id="search_add2">주소검색</a>
                                </div>
                                <input type="text" name="company_address2" id="company_address2" value="${user_info.company_address2}">
                            </div>
                            <div class="inputContainer">
                               <p class="inputCaption">시설사용계획*</p>
                               <textarea class="equipment-plan-company" name="" id=""
                                   placeholder="사용목적/기간/인원/세부내용 등 시설사용계획을 상세히 적어주세요. "></textarea>
                           </div>
                            <div class="inputContainer">
                                <p class="inputCaption">증빙서류 첨부</p>
                                <p class="fileSub">신분증 사본 등 필요서류를 제출해주세요.</p>
                                <div id="dropZone" class="dropzone_company">
							        파일을 여기에 드래그하세요
							        <br>또는<br>
							        <input type="file" id="fileInput" class="fileInput_company" multiple style="margin-top: 10px;" accept=".jpg, .jpeg, .png, .pdf, .hwp">
							    </div>
							    <div class="file-list file_list_company" id="fileList"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fullButtonContainer">
                <a href="#lnk" class="wt normal booking" id="bookingButton">예약하기</a>
            </div>
        </form>
    </div>
	<%@ include file="./include/footer.jsp" %>
    <div class="modalContainer" id="confirmModal">
        <div class="modalInner">
            <button type="button"><img src="/img/user_img/close-modal.png" alt=""></button>
            <div class="modalContents">
                <div class="modalTitles">
                    <p>예약하시겠습니까?</p>
                    <span>아래 예약 정보를 확인하시고<br>‘예약하기’ 버튼을 눌러주세요</span>
                </div>
                <div class="infoSlides">
                    <div class="swiper">
                        <div class="swiper-wrapper">
                            <!-- <div class="swiper-slide">
                                <ul class="bookingInfolists">
                                    <li>
                                        <p>장비명</p>
                                        <span>Oculus Quest / 1대</span>
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
                                        <p>사업자등록번호</p>
                                        <span>779-86-00871</span>
                                    </li>
                                    <li>
                                        <p>직책</p>
                                        <span>팀장</span>
                                    </li>
                                    <li>
                                        <p>주소</p>
                                        <span>강원특별자치도 춘천시 효자로 144 픽트</span>
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
                            </div> -->
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
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
                <div class="checkConfirm">
                    <input type="checkbox" name="agree" id="agree" class="checkOnly">
                    <label for="agree">시설·장비 사용 안내 및 유의사항을 확인하였습니다</label>
                </div>
            </div>
            <div class="fullButtonContainer conirmBtn">
                <a href="#lnk" class="bl" id="setButton">예약하기</a>
            </div>
        </div>
    </div>
    <div class="modalContainer" id="checkModal">
        <div class="modalInner">
            <button type="button"><img src="/img/user_img/close-modal.png" alt=""></button>
            <div class="modalContents">
                <div class="modalTitles">
                    <p>예약이 완료되었습니다.</p>
                    <span>신청하신 대여/반납일에 <span>방문하시어</span><br>장비를 대여/반납하시기 바랍니다</span>
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
            </div>
            <div class="fullButtonContainer conirmBtn">
                <a href="/mypage_facil.do" class="bl">마이페이지</a>
            </div>
        </div>
    </div>

    <div class="modalContainer" id="agreeModal">
        <div class="modalInner">
            <button type="button"><img src="/img/user_img/close-modal.png" alt=""></button>
            <div class="modalContents">
                <div class="modalTitles">
                    <p>강원 메타버스 지원센터 인프라(시설·장비) 운영 지침</p>
                    <span>아래 내용을 확인하시고 동의해주세요</span>
                </div>
                <div class="agreeContent">
                    <h3>제1조(목적)</h3>
                    <p>제1조(목적) 이 지침은“강원 메타버스 지원센터”에서 제공하는 인프라(시설·장비)의 사용 조건 및 절차에 관한 기본적인 사항에 대해 정의하는 것을 목적으로 한다. 본 지침에 언급되지 않은 사항은 관련 법령 및‘강원정보문화산업진흥원’내규에 의거하여 적용한다.</p>
                </div>
                <div class="agreeContent">
                    <h3>제2조(사용자 범위)</h3>
                    <p><span>①</span>센터 인프라(시설·장비) 사용자 범위는 다음 각 호와 같다.</p>
                    <p style="margin-left: 10px;">              
                        1. 강원특별자치도 메타버스 관련 기업, 유관기관 임직원<br>
                        2. 강원특별자치도에 거주하는 메타버스 관련 창·취업 준비자<br>
                        3. 강원특별자치도 메타버스 관련 학과 대학생<br>
                        4. 기타 센터 관리자와 사전 협의가 이뤄진 사용자 (개정 2024. 03. 결재일.)<br>
                        5. 중복 예약 시 기업 지원을 우선으로 함 (신설 2024. 03. 결재일.)
                    </p>
                    <p><span>②</span>미성년자는 보호자 동행하여, 센터 인프라(시설·장비)를 사용할 수 있다. (개정 2024. 03. 결재일.)</p>
                </div>
                <div class="agreeContent">
                    <h3>제3조(운영시간 및 사용료)</h3>
                    <p><span>①</span>센터 인프라(시설·장비)의 운영시간은 다음 각 호와 같다.</p>
                    <p style="margin-left: 10px;">
                        1. 운영시간: 평일 10시부터 17시까지 (개정 2024. 03. 결재일.)<br>
                        2. 휴 관 일: 법정 휴일, 근로자의 날, 기타 지정일<br>
                        3. 운영시간 외 사용 희망 시 센터 관리자와 협의 가능 (신설 2024. 03. 결재일.)
                    </p>
                    <p><span>②</span>센터 인프라(시설·장비)는 무상으로 운영한다.</p>
                </div>
                <div class="agreeContent">
                    <h3>제4조(시설 사용신청)</h3>
                    <p><span>①</span>시설의 사용신청은 강원 메타버스 지원센터 홈페이지를 통해 법정 공휴일 및 주말을 제외한 사용 희망일 최소 1일 전에 예약해야 한다.</p>
                    <p><span>②</span>사용 기간은 단기사용 최대 15일, 장기사용 최대 3개월이며, 1개월 이상 사용 시 센터 관리자에게 중간보고를 해야 한다. (개정 2024. 03. 결재일.)</p>
                    <p><span>③</span>제1항의 사용신청 시 최초 신청자는 사업자등록증, 신분증, 관련 자격증 등을 제출해야 한다. (개정 2024. 03. 결재일.)</p>
                    <p><span>④</span>장기사용과‘제  2조 제1항 4호’의 경우, 관련 사업계획서(자유 양식)를 상세히 작성하여 제출하고 센터 관리자가 타당하다고 판단하면 사용할 수 있다. (개정 2024. 03. 결재일.)</p>
                    <p><span>⑤</span>모션캡쳐룸과 브이튜버룸의 경우, 공용시설(랩실, 회의실, 테스트베드룸)과 함께 사용할 수 있다. (신설 2024. 03. 결재일.)</p>
                </div>
                <div class="agreeContent">
                    <h3>제5조(장비 사용신청)</h3>
                    <p><span>①</span>장비의 사용신청은 강원 메타버스 지원센터 홈페이지를 통해 법정 공휴일 및 주말을 제외한 사용 희망일 최소 1일 전 예약해야 한다.</p>
                    <p><span>②</span>사용 기간은 단기사용 최대 15일, 장기사용 최대 3개월이며, 1개월 이상 사용 시 센터 관리자에게 중간보고를 해야 한다. 다만, 센터 관리자와 사전 협의를 통해 6~12개월 사용할 수 있다. (개정 2024. 03. 결재일.)</p>
                    <p><span>③</span>제1항의 사용신청 시 최대 사용 수량은 4대이며, 최초 신청자는 사업자등록증, 신분증, 관련 자격증 등을 제출해야 한다. (개정 2024. 03. 결재일.)</p>
                    <p><span>④</span>장기사용과‘제2조 제1항 4호’의 경우, 관련 사업계획서(자유 양식)를 상세히 작성하여 제출하고 센터 관리자가 타당하다고 판단하면 사용할 수 있다. (개정 2024. 03. 결재일.)</p>
                </div>
                <div class="agreeContent">
                    <h3>제6조(사용목적)</h3>
                    <p><span>①</span>사용자는 센터 인프라(시설·장비) 사용 신청 시‘사용목적’을 반드시 작성해야 한다. (개정 2024. 03. 결재일.)</p>
                    <p><span>②</span>사용목적은 다음 각 호의 어느 하나에 부합해야 한다.</p>
                    <p style="margin-left: 10px;">
                        1. 메타버스 관련 콘텐츠 개발, 제작, 교육, 행사 등을 목적으로 하는 경우<br>
                        2. 그 외 센터 설립 취지에 부합하는 경우
                    </p>
                    <p><span>③</span>사용목적이 다음 각 호의 어느 하나에 해당하는 경우, 센터 인프라(시설·장비)를 사용할 수 없다.</p>
                    <p style="margin-left: 10px;">
                        1. 특정 정당, 종교의 활동 및 홍보를 목적으로 하는 경우<br>
                        2. 센터 인프라(시설·장비)로 부당한 수익을 취하는 경우(재임대 등)<br>
                        3. 센터 인프라(시설, 장비 등)를 사유 재산 및 기업 자산으로 이용 및 홍보하는 경우<br>
                    </p>
                    <p><span>④</span>기타 현행 법률에 저촉되거나 부적절한(폭력적, 선정적 등) 콘텐츠를 제작하는 경우 (개정 2024. 03. 결재일.)</p>
                </div>
                <div class="agreeContent">
                    <h3>제7조(사용 승인 거절)</h3>
                    <p>센터 관리자는 사용자가 다음 각 호의 어느 하나에 해당하는 경우, 사용신청을 거절할 수 있다.</p>
                    <p style="margin-left: 10px;">
                        1. 사용자가 본 지침을 위반했을 경우<br>
                        2. 기존 센터 인프라(시설·장비)를 사용 시 훼손, 분실 등 피해를 준 경우(개정 2024. 03. 결재일.)<br>
                        3. 기존에 유관기관과 강원정보문화산업진흥원에서 운영하는 다른 인프라(시설·장비) 사용에 있어서 유사 지침 위반 사례가 있는 경우(신설 2024. 03. 결재일.)<br>
                        4. 기타 센터 관리자가 운영상의 이유로 사용신청에 문제가 있다고 판단하는 경우
                    </p>
                </div>
                <div class="agreeContent">
                    <h3>제8조(사용 및 반납)</h3>
                    <p><span>①</span>사용과 반납은 사용자 신청 기간을 준수해야 한다. 예약 이후, 별도 연락 없이 사용하지 않을 경우, 센터 관리자는 사용을 취소할 수 있으며, 제10조(자격 제한)에 따라 주의 조치할 수 있다. (개정 2024. 03. 결재일.)</p>
                    <p><span>②</span>사용과 반납은 신청자 본인이 원칙이며, 대리 사용과 반납은 불가하다. 다만, 센터 관리자로부터 합리적인 사유(질병, 사고 등)로 사전에 승인을 득했을 때는 가능하며, 추가 신분 확인이 진행된다. (개정 2024. 03. 결재일.)</p>
                    <p><span>③</span>사용자는 인프라 사용 이후 반납 시 원상 복귀(SW 임의 설치, 정리 정돈 등)해야 한다. (신설 2024. 03. 결재일.)</p>
                    <p><span>④</span>사용과 반납 시, 센터 관리자는 인프라(시설·장비)의 정상 작동 여부를 확인하며, 사용자는 이에 적극적으로 임해야 한다. (개정 2024. 03. 결재일.)</p>
                    <p><span>⑤</span>사용자는 사용과 반납 시 신분 확인 절차에 응해야 한다. (개정 2024. 03. 결재일.)</p>
                    <p><span>⑥</span>사용자는 인프라(시설·장비)의 사용 완료 이후 만족도 조사, 사용 완료 서명 등을 작성해야 한다. (신설 2024. 03. 결재일.)</p>
                    <p><span>⑦</span>장비 사용기간 연장은 센터 관리자의 사전 승인 없이 자체 연장이 불가하다. (신설 2024. 03. 결재일.)</p>
                </div>
                <div class="agreeContent">
                    <h3>제9조(후원 명칭 사용 등)</h3>
                    <p><span>①</span>사용자는 센터 관리자가 콘텐츠 결과물을 공유 요청할 시, 반드시 제출해야 한다. (신설 2024. 03. 결재일.)</p>
                    <p><span>②</span>사용자는 센터 인프라(시설·장비)를 활용한 결과물에 대하여,‘본 콘텐츠는 강원 메타버스 지원센터의 후원으로 만들어졌습니다.’를 표기하여, 결과물 복사본 1부를 제출해야 한다. (개정 2024. 03. 결재일.)</p>
                    <p><span>③</span>제출된 결과물은 본 센터의 홍보, 교육, 결과보고 등을 위해 비영리 목적으로 활용될 수 있다. (개정 2024. 03. 결재일.)</p>
                </div>
                <div class="agreeContent">
                    <h3>제10조(자격 제한)</h3>
                    <p>센터 관리자는 사용자가 다음 각 호의 어느 하나에 해당하는 사항을 위반한 경우, 구두주의를 줄 수 있다. 구두주의 2회 이상 시 제11조(자격 정지)에 따라 사용자의 자격을 곧바로 1회 이상 또는 영구 정지할 수 있다.</p>
                    <p style="margin-left: 10px;">
                        1. 센터 인프라(시설·장비)를 훼손, 분실 등 피해를 준 경우<br>
                        2. 센터 내 타인의 저작물을 훼손하는 경우<br>
                        3. 센터 내 음주 및 흡연하는 경우<br>
                        4. 사용신청 이후 임의로 변경 및 취소하는 경우<br>
                        5. 제8조(사용 및 반납) 제1항인 경우(다른 사용자에게 피해를 준 경우)<br>
                        6. 제8조(사용 및 반납) 제3항인 경우(원상 복귀 필수)<br>
                        7. 기타 센터 사용지침을 위반한 경우
                    </p>
                </div>
                <div class="agreeContent">
                    <h3>제11조(자격 정지)</h3>
                    <p>센터 관리자는 사용자가 다음 각 호의 어느 하나에 해당하는 사항을 위반한 경우, 사용자의 자격을 곧바로 1회 이상 또는 영구 정지할 수 있다.</p>
                    <p style="margin-left: 10px;">
                        1. 사용신청 시 허위 정보(타인의 신분증 사용 등)를 작성한 경우<br>
                        2. 사용승인 사항을 타인에게 양도한 경우<br>
                        3. 사전 승인을 받지 않고 사용한 경우<br>
                        4. 사용 시 불법적인(흉기, 비정품 SW 등) 물건을 소지한 경우<br>
                        5. 센터 인프라(시설·장비)를 고의로 훼손할 경우<br>
                        6. 센터 인프라(시설·장비)를 임의로 SW업데이트·개조·변형하는 경우<br>
                        7. 장기 시설 사용 시 주 1회 이하로 사용하는 경우(남아있는 사용 기간 즉시 종료)<br>
                        8. 제10조(자격 제한)에 따른 구두주의 2회 이상인 경우<br>
                        9. 기존 유관기관과 강원정보문화산업진흥원에서 운영하는 다른 인프라(시설·장비) 사용에 있어서 유사 지침 위반 사례가 적발된 경우
                    </p>
                </div>
                <div class="agreeContent">
                    <h3>제12조(손해에 대한 책임)</h3>
                    <p><span>①</span>사용자는 센터 인프라(시설·장비) 사용 중에 발생한 사고에 대한 모든 민·형사상 책임을 진다.</p>
                    <p><span>②</span>장비를 분실했을 때는 감가상각을 고려한 동일기종의 장비를 구매하여, 반납해야 한다.</p>
                    <p><span>③</span>반납 시 작동에 문제가 있을 시 사용자는 구매 또는 수리하여 반납해야 한다.(신설 2024. 03. 결재일.)</p>
                    <p style="margin-left: 10px;">
                        1. 제8조(사용 및 반납) 2항인 경우 당초 신청자에게 책임이 있음<br>   
                        2. 제11조(자격 정지) 5, 6호로 원상 복귀를 위해 사용자는 구매 또는 수리해야 함
                    </p>    
                    <p><span>④</span>센터 인프라(시설·장비)를 훼손 또는 파손했을 때는 수리하여 반납해야 한다.(개정 2024. 03. 결재일.)</p>
                    <p><span>⑤</span>손해배상은 사유서 및 서약서를 작성하고, 사유 발생일로부터 30일 이내에 완료해야 한다.</p>
                    <p><span>⑥</span>제품을 사용하고 별도 연락 없이 반납일 기준 7일 이내에도 반납하지 않는다면 반납 의사가 없는 것으로 간주하여, 센터는 법적 처리를 진행한다.</p>
                    <p><span>⑦</span>미반납으로 인한 법적 처리 시, 미반납 제품에 해당하는 금액을 청구할 수 있다.</p>
                    <p><span>⑧</span>민·형사상 소송의 경우, “강원 메타버스 지원센터”의 소재지를 담당하는 관할 법원으로 한다.</p>
                </div>
                <div class="fullButtonContainer conirmBtn">
                    <a href="#lnk" class="bl" id="agreeButton">동의하기</a>
                </div>
            </div>
        </div>
    </div>
    <script>

	    const user_name = "<%=session.getAttribute("name")%>";
	</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="/js/rental_facility.js"></script>
</body>
</html>