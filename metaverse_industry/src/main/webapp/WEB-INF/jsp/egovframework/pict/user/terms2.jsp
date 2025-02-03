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
        <h2 class="terms"><span>강원 메타버스 지원센터</span>홈페이지 약관</h2>
    </div>
    <div class="loginWrapper terms">
        <div class="loginContainer">
			<div class="termsContentsWrapper">
				<div class="termsContents">
					<p class="termsSubTitle">제 1 조 (목적)</p>
					<p class="termsDesc">이 약관은 "강원 메타버스 지원센터" 홈페이지에서 제공하는 모든 서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항에 대해 정의하는 것을 목적으로 합니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 2 조 (약관의 효력 및 변경)</p>
					<p class="termsDesc">
						① 이 약관은 서비스를 통하여 알리거나, 홈페이지, 전자우편 등의 방법으로 회원에게 알림으로써 효력을 발생합니다.<br>
						② "강원 메타버스 지원센터"는 이 약관의 내용을 변경할 수 있으며, 이에 대하여 제1항과 같은 방법에 의해 효력을 갖습니다.
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 3 조 (약관 이외의 준칙)</p>
					<p class="termsDesc">이 약관에 언급되지 않은 사항은 기타 관련 법령 및 강원정보문화산업진흥원 내규에 의거하여 적용할 수 있습니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 4 조 (이용계약의 성립)</p>
					<p class="termsDesc">
						① 이용자가 회원가입 시 "약관동의" 박스에 체크하면 이 약관에 동의하는 것으로 간주됩니다.<br>
						② 이용계약은 이용자의 이용신청에 대하여 "강원 메타버스 지원센터"의 승낙으로 성립합니다.<br>
						③ 회원이 변경된 약관에 동의하지 않을 경우, 서비스 이용을 중단하고 탈퇴할 수 있습니다. 약관이 변경된 이후에도 계속적으로 서비스를 이용하는 경우에는 회원이 약관의 변경 사항에 동의한 것으로 봅니다.<br>
						④ 이용계약은 회원 1인당 1개의 실명이 확인된 ID로 체결하는 것을 원칙으로 합니다.
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 5 조 (회원의 탈퇴 및 자격 상실)</p>
					<p class="termsDesc">
						① 회원은 "강원 메타버스 지원센터"에 언제든지 자신의 회원 등록을 말소해 줄 것(회원 탈퇴)을 요청할 수 있으며 "강원 메타버스 지원센터"는 위 요청을 받은 즉시 해당 회원의 회원 등록을 말소합니다.<br>
						② 회원이 다음 각 호의 사유에 해당하는 경우, "강원 메타버스 지원센터"는 회원의 회원자격을 제한 및 정지, 상실시킬 수 있습니다.
					</p>
					<p class="termsSubDesc">
						1. 가입 신청 시에 허위 내용을 등록한 경우<br>
						2. 다른 사람의 "강원 메타버스 지원센터" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우<br>
						3. 사회의 안녕질서 및 미풍양속을 저해할 목적으로 신청하였을 경우<br>
						4. 기타 회사가 정한 이용신청 요건이 미비하였을 경우
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 6 조 (이용신청)</p>
					<p class="termsDesc">
						① 본 서비스를 이용하기 위해서는 "강원 메타버스 지원센터" 소정의 가입 신청 양식에서 요구하는 모든 회원 정보를 기록하여 신청해야 합니다.<br>
						② 가입 신청 양식에 쓰는 모든 회원 정보는 모두 실제 데이터인 것으로 간주합니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 7 조 (이용신청의 승낙)</p>
					<p class="termsDesc">
						① "강원 메타버스 지원센터"는 제4조, 제5조, 제6조의 각 조항에 위배되는 경우를 제외하고 서비스 이용신청을 승낙합니다.<br>
						② "강원 메타버스 지원센터"는 다음에 해당하는 경우, 그 사유가 해소될 때까지 승낙을 유보할 수 있습니다.
					</p>
					<p class="termsSubDesc">
						1. 서비스 관련 설비에 여유가 없는 경우<br>
						2. 기술상 지장이 있는 경우<br>
						3. 기타 "강원 메타버스 지원센터"가 필요하다고 인정되는 경우
					</p>
					<p class="termsDesc">③ "강원 메타버스 지원센터"는 다음에 해당하는 경우, 가입을 승낙하지 않을 수 있습니다.</p>
					<p class="termsSubDesc">
						1. 본인의 실명과 정보가 아닌 경우<br>
						2. 가입 시 필요내용을 허위로 기재하여 신청한 경우<br>
						3. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우<br>
						4. 기타 "강원 메타버스 지원센터"가 정한 이용신청 요건에 맞지 않을 경우
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 8 조 (회원정보의 변경)</p>
					<p class="termsDesc">회원은 본 서비스의 이용을 위해 자신의 정보를 성실히 관리해야 하며 회원정보의 변동사항이 있을 경우 온라인으로 이를 수정해야 하며, 변경을 하지 않아 생기는 문제의 책임은 회원에게 있습니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 9 조 ("강원 메타버스 지원센터"의 의무)</p>
					<p class="termsDesc">
						① "강원 메타버스 지원센터"는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.<br>
						② "강원 메타버스 지원센터"는 회원의 개인정보를 본인의 승낙 없이 타인에게 공개, 배포하지 않으며, 서비스 관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음에 해당하는 경우는 예외입니다.
					</p>
					<p class="termsSubDesc">
						1. 기타 관계 법령에 의거 국가기관의 요구가 있는 경우<br>
						2. 통계작성/학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우<br>
						3. 회원가입 고객이 정보제공 동의 승인 시, 이벤트 참여 및 기타 보다 나은 서비스 제공을 위하여 이벤트 주최 및 후원하는 비즈니스 파트너 및 제휴사와는 회원의 일부 정보를 공유하는 경우
					</p>
					<p class="termsDesc">③ "강원 메타버스 지원센터"는 회원이 서비스 이용 중 필요가 있다고 인정되는 다양한 정보를 회원의 신청에 따라 소정의 절차를 거쳐 전자우편이나 서신 등으로 제공합니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 10 조 (회원의 의무)</p>
					<p class="termsDesc">
						① 회원ID와 비밀번호에 관한 모든 관리와 부정 사용에 대한 결과의 책임은 회원에게 있습니다.<br>
						② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 "강원 메타버스 지원센터"에 그 사실을 통보해야 합니다.<br>
						③ 회원ID와 비밀번호는 다른 사람에게 양도, 임대, 대여할 수 없습니다.<br>
						④ 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.<br>
						⑤ 회원은 "강원 메타버스 지원센터"의 사전 승인 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 11 조 (서비스의 범주)</p>
					<p class="termsDesc">이 약관은 "강원 메타버스 지원센터"에서 제공하는 모든 서비스에 기본적으로 적용되며, 다른 항의 별도 조항이 요구되는 서비스에는 부속약관을 둘 수 있습니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 12 조 (정보의 제공)</p>
					<p class="termsDesc">"강원 메타버스 지원센터"는 회원이 서비스 이용 중 필요하고 인정되는 다양한 정보에 대해서 전자메일이나 서신 우편 등의 방법으로 회원에게 제공할 수 있으며, 회원은 원하지 않을 경우 가입 신청 메뉴와 회원 정보수정 메뉴에서 정보수신거부를 할 수 있습니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 13 조 (회원의 게시물)</p>
					<p class="termsDesc">"강원 메타버스 지원센터"는 회원이 본 서비스를 통하여 게시, 게재, 전자메일 또는 달리 전송한 내용물에 대해 일체 민·형사상의 책임을 지지 않으며, 다음의 경우에 해당될 경우 사전통지 없이 삭제할 수 있습니다.</p>
					<p class="termsSubDesc">
						1. 다른 회원이나 타인을 비방하거나, 프라이버시를 침해하거나, 중상모략으로 명예를 손상시키는 내용인 경우<br>
						2. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 경우<br>
						3. 범죄적 행위에 관련된다고 인정되는 내용일 경우<br>
						4. "강원 메타버스 지원센터"의 지적재산권, 타인의 지적재산권 등 기타 권리를 침해하는 내용인 경우<br>
						5. 기타 관계법령에 위반된다고 판단되는 경우
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 14 조 (게시물에 대한 권리 및 책임)</p>
					<p class="termsDesc">
						① 본 사이트의 모든 게시물에 대한 저작권은 사전에 당사자 간 명시한 별도의 의사표시가 없는 한 "강원 메타버스 지원센터"에 귀속됩니다.<br>
						② 게시물에 대한 보호는 "강원 메타버스 지원센터"에서 하며, "강원 메타버스 지원센터"의 허가 없이 타인에 의해 게시물이 다른 사이트에서 사용 또는 인용되는 것은 금지됩니다.
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 15 조 (이용시간)</p>
					<p class="termsDesc">"강원 메타버스 지원센터"는 평일 오전 10시부터 17시까지 이용이 가능하며, 주말/공휴일은 휴관입니다. 기타 "강원 메타버스 지원센터"의 내부 시설 공사 등의 사유로 인해 서비스를 제공하지 않을 경우 고객의 이용이 불가능합니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 16 조 (서비스 이용 책임)</p>
					<p class="termsDesc">회원은 서비스를 이용하여 불법 상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 돈 벌기 광고, 음란사이트를 통한 상업행위 등을 할 수 없습니다. 이를 위반하고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 "강원메타버스지원센터"가 책임을 지지 않습니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 17 조 (계약해지 및 이용제한)</p>
					<p class="termsDesc">
						① 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 홈페이지를 통하여 해지신청을 하여야 합니다.<br>
						② "강원 메타버스 지원센터"는 회원이 다음에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.
					</p>
					<p class="termsSubDesc">
						1. 타인의 회원 ID 및 비밀번호 등 개인정보를 도용한 경우<br>
						2. 서비스 운영을 고의로 방해한 경우<br>
						3. 공공질서 및 미풍양속에 반하는 경우<br>
						4. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우<br>
						5. 서비스에 위해를 가할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우<br>
						6. "강원 메타버스 지원센터", 다른 회원 또는 타인의 지적재산권을 침해하는 경우<br>
						7. "강원 메타버스 지원센터"의 서비스 정보를 이용하여 얻은 정보를 "강원메타버스지원센터"의 사전 승낙 없이 복제 또는 유통하거나 상업적으로 이용하는 경우<br>
						8. 회원이 자신의 홈페이지와 게시판에 음란물을 게재하거나 음란사이트를 링크하는 경우<br>
						9. 본 약관을 포함하여 기타 "강원 메타버스 지원센터"가 정한 이용 조건 및 관계 법령을 위반한 경우
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 18 조 (손해배상)</p>
					<p class="termsDesc">"강원 메타버스 지원센터"는 서비스 이용과 관련하여 회원에게 발생한 어떠한 손해도 책임지지 않습니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">제 19 조 (관할법원)</p>
					<p class="termsDesc">서비스 이용과 관련하여 소송이 제기될 경우 "강원 메타버스 지원센터"의 소재지를 관할하는 법원을 관할법원으로 합니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsDesc">(시행일) 이 약관은 2021년 1월 1일부터 시행합니다.</p>
				</div>
			</div>
        </div>
    </div>
    
	<%@ include file="./include/footer.jsp" %>
</body>
</html>