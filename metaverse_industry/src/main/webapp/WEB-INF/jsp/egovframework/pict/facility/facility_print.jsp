<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/head.jsp">
	<c:param name="pageTitle" value="대여 관리" />
</c:import>
<c:import url="../main/header.jsp">
	<c:param name="title" value="시설대여 관리대장" />
	<c:param name="subtitle" value="시설대여 관리대장 다운로드" />
</c:import>
	<body>
	    <div class="printWrapper">
	        <div class="printTop">
	            <p>${pdf.nowDate}</p>
	            <p>${pdf.title}_강원 메타버스 지원센터 시설•장비 사용신청서</p>
	        </div>
	        <h1>강원 메타버스 지원센터 시설 사용신청서</h1>
	        <div class="printBottom">
	            <div class="printSection">
	                <p class="sectionTitle">신청자 개요</p>
	                <div class="sectionsInfoWrapper">
	                    <ul class="sectionsInfo">
	                        <li class="half">
	                            <div class="row">
	                                <p>대 표(단체명)</p>
	                                <span>${history_detail.company_nm}</span>
	                            </div>
	                            <div class="row">
	                                <p>성명</p>
	                                <span>${history_detail.user_name}</span>
	                            </div>
	                        </li>
	                        <li class="half">
	                            <div class="row">
	                                <p>생년월일</p>
	                                <span>${history_detail.birthday}</span>
	                            </div>
	                            <div class="row">
	                                <p>전화번호</p>
	                                <span>${history_detail.mobile}</span>
	                            </div>
	                        </li>
	                        <li class="half">
	                            <div class="row">
	                                <p>사업자등록번호</p>
	                                <span>${history_detail.sa_eob_no}</span>
	                            </div>
	                            <div class="row">
	                                <p>E-mail</p>
	                                <span>${history_detail.email}</span>
	                            </div>
	                        </li>
	                        <li>
	                            <div class="row">
	                                <p>주소</p>
	                                <span>
										<c:choose>
										    <c:when test = "${empty history_detail.company_address1}">
										    	${history_detail.address1} ${not empty history_detail.address2 ? history_detail.address2 : ''}
										    </c:when>
										    <c:otherwise>
										    	${history_detail.company_address1} ${not empty history_detail.address2 ? history_detail.company_address2 : ''}
											</c:otherwise>
										</c:choose>
									</span>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	            <div class="sectionsInfoWrapper half">
	                <div class="printSection">
	                    <p class="sectionTitle">사용 신청 시설</p>
	                    <ul class="sectionsInfo">
	                        <li>
	                            <div class="row">
	                                <p><img src="/img/admin/print-check.png" alt=""><!-- <span>01</span> --></p>
	                                <span>${history_detail.name}</span>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	                <div class="printSection">
	                    <p class="sectionTitle">사용 계획</p>
	                    <ul class="sectionsInfo">
	                        <li>
	                            <div class="row">
	                                <span>${history_detail.facility_plan}</span>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	            </div>
	            <div class="sectionsInfoWrapper">
	                <div class="printSection">
	                    <p class="sectionTitle">사용 개요</p>
	                    <div class="sectionsInfoWrapper">
	                        <ul class="sectionsInfo">
	                            <li>
	                                <div class="row">
	                                    <p>사용기간</p>
	                                    <span>${pdf.rentalStartDate} - ${pdf.rentalEndDate}</span>
	                                </div>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <div class="sectionsInfoWrapper">
	                <div class="printSection">
	                    <p class="sectionTitle">개인정보 수집∙이용에 대한 동의</p>
	                    <div class="sectionsInfoWrapper">
	                        <ul class="sectionsInfo printAgree">
	                            <li>
	                                <div class="row">
	                                    <p>수집하는 개인정보 항목</p>
	                                    <span>성명, 생년월일, 주소, 연락처, 사업자등록증, 신분 확인이 가능한 정보 등</span>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="row">
	                                    <p>개인정보의 수집 및 이용 목적</p>
	                                    <span>
	                                        제공하신 정보는 강원 메타버스 지원센터 시설 및 장비 이용자 등록·관리를 위해서 사용합니다.<br>
	                                        ① 본인 확인 및 식별 절차에 이용: 성명, 연락처, 전화전호<br>
	                                        ② 의사소통 및 정보 전달 등에 이용 : 성명, 전화전호, 이메일
	                                    </span>
	                                </div>
	                            </li>
	                            <li>
	                                <div class="row">
	                                    <p>개인정보의 보유 및 이용기간</p>
	                                    <span>수집된 개인정보는 사용 목적이 종료된 후 바로 파기하며, 별도 삭제 요청 시 강원 메타버스 지원센터는 개인 정보를 재생이 불가능한 방법으로 즉시 파기합니다.</span>
	                                </div>
	                            </li>
	                        </ul>
	                        <div class="agreeBtn">
	                            <p>※ 귀하는 이에 대한 동의를 거부할 수 있습니다. 다만, 동의가 없을 경우 강원 메타버스 지원센터 시설장비를 사용하실 수 없습니다.</p>
	                            <span><img src="/img/admin/print-check.png" alt="">개인정보 수집 및 이용에 동의함</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="sectionsInfoWrapper">
	                <div class="printSection">
	                    <p class="sectionTitle">개인정보 수집∙이용에 대한 동의</p>
	                    <div class="sectionsInfoWrapper">
	                        <ul class="sectionsInfo">
	                            <li style="column-gap: 16px; border-bottom: 0;">
	                                <p>
	                                    <span>• </span>이용중 파손이나 분실이 발생한 경우 센터 규정에 따라 이용자가 민형사상 책임을 질 수도 있습니다.<br>
	                                    <span>• </span>대여·반납 시 이용자와 담당자 상호간 장비및 부속품의 이상 유무를 확인하고 대여·반납 이용자란에 서명해주세요.
	                                </p>
	                                <p>
	                                    <span>• </span>신청서 작성 및 대여·반납은 이용자가 직접 해주시고, 반납 기일을 꼭 지켜주세요.<br>
	                                    <span>• </span>센터의 장비 및 시설은 상업적· 정치적· 종교적 목적으로는 절대 이용하실 수 없습니다.(적발 시 이용자격 박탈)
	                                </p>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <div class="sectionsInfoWrapper">
	                <div class="signSection">
	                    <div class="signTexts">
	                        <p>
	                            위와 같이 강원 메타버스 지원센터 시설·장비 사용을 신청합니다.<br>
	                            신청인은 상기한 주의 사항을 숙지하였으며, 센터를 이용함에 있어 규정을 준수하겠습니다.
	                        </p>
	                        <span>※ 퇴실/반납 시 사용자는 시설 및 장비의 이상 유무를 체크하여 반드시 강원 메타버스 지원센터 담당자에게 점검을 받아야 합니다. </span>
	                    </div>
	                    <div class="signTexts sign">
	                        <p>
	                            <span>${pdf.requestDate}</span>
	                            <span>신청인<span>${history_detail.user_name}<span>(인)</span></span></span>
	                            <span>강원 메타버스 지원센터 귀하</span>
	                        </p>
	                    </div>
	                </div>
	            </div>
	            <div class="cutting">
	                <div class="line">
	                    <i></i>
	                    <p>아래 칸은 대여·반납 당일 작성</p>
	                    <i></i>
	                </div>
	                <div class="cuttingContainer">
	                    <div class="sectionsInfoWrapper half">
	                        <div class="printSection">
	                            <p class="sectionTitle dates"><span>대여일</span>${pdf.rentalOnlyStartDate}</p>
	                            <ul class="sectionsInfo">
	                                <li>
	                                    <div class="row dates">
	                                        <p>이용자</p>
	                                        <span>(인)</span>
	                                    </div>
	                                </li>
	                                <li>
	                                    <div class="row dates">
	                                        <p>확인자</p>
	                                        <span>(인)</span>
	                                    </div>
	                                </li>
	                            </ul>
	                        </div>
	                        <div class="printSection">
	                            <p class="sectionTitle dates"><span>대여일</span>${pdf.rentalOnlyEndDate}</p>
	                            <ul class="sectionsInfo">
	                                <li>
	                                    <div class="row dates">
	                                        <p>이용자</p>
	                                        <span>(인)</span>
	                                    </div>
	                                </li>
	                                <li>
	                                    <div class="row dates">
	                                        <p>확인자</p>
	                                        <span>(인)</span>
	                                    </div>
	                                </li>
	                            </ul>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <button onclick="printPage()" class="print-btn">PDF 출력</button>
	    <script>
	        function printPage() {
	            const element = document.querySelector('.printWrapper');
	            
	            html2canvas(element, {
	                scale: 1,
	                useCORS: true,
	                logging: true,
	                windowWidth: element.scrollWidth,
	                windowHeight: element.scrollHeight
	            }).then(canvas => {
	                const imgData = canvas.toDataURL('image/jpeg', 1.0);
	                const { jsPDF } = window.jspdf;
	                const pdf = new jsPDF('p', 'mm', 'a4');
	                
	                const pdfWidth = pdf.internal.pageSize.getWidth();
	                const pdfHeight = pdf.internal.pageSize.getHeight();
	                
	                const imgWidth = canvas.width;
	                const imgHeight = canvas.height;
	                const ratio = Math.min(pdfWidth / imgWidth, pdfHeight / imgHeight);
	                
	                const x = (pdfWidth - imgWidth * ratio) / 2;
	                const y = (pdfHeight - imgHeight * ratio) / 2;
	                
	                pdf.addImage(imgData, 'JPEG', x, y, imgWidth * ratio, imgHeight * ratio);
	                pdf.save('시설사용신청서.pdf');
	            });
	        }
	    </script>
	
	</body>
</html>