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
        <h2 class="terms"><span>강원 메타버스 지원센터</span>개인정보처리방침</h2>
    </div>
    <div class="loginWrapper terms">
        <div class="loginContainer">
        	<div class="termsTitles">
        		<p>&lt;강원 메타버스 지원센터&gt;('http://www.gvar.or.kr/'이하 '지원센터')는 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p>
        		<p>&lt;강원 메타버스 지원센터&gt;는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</p>
        	</div>
			<div class="termsContentsWrapper">
				<div class="termsContents">
					<p class="termsSubTitle">1) 개인정보의 처리 목적 <강원 메타버스 지원센터>('http://www.gvar.or.kr/'이하 '지원센터')는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다.</p>
					<p class="termsDesc">가. 홈페이지 회원가입 및 관리</p>
					<p class="termsSubDesc">
						회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 각종 고지·통지, 고충 처리 등을 목적으로 개인정보를 처리합니다.
					</p>
					<p class="termsDesc">나. 민원사무 처리</p>
					<p class="termsSubDesc">
						민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등을 목적으로 개인정보를 처합니다.
					</p>
					<p class="termsDesc">다. 재화 또는 서비스 제공</p>
					<p class="termsSubDesc">
						서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증 등을 목적으로 개인정보를 처리합니다.
					</p>
					<p class="termsDesc">라. 마케팅 및 광고에의 활용</p>
					<p class="termsSubDesc">
						신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">2) 개인정보 파일 현황</p>
					<p class="termsDesc">1. 개인정보 파일명 : 관리자</p>
					<p class="termsSubDesc">
						- 개인정보 항목 : 로그인 ID, 이름, 연락처, 이메일, 생년월일, 주소, 회사명, 사업자등록번호, 직책, 사업장 주소, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보 등<br>
						- 수집방법 : 홈페이지 로그인 및 사용<br>
						- 보유근거 : 홈페이지 관리권한부여에 따른 보유<br>
						- 보유기간 : 5년<br>
						- 관련법령 : 대금결제 및 재화 등의 공급에 관한 기록 : 5년
					</p>
					<p class="termsDesc">2. 개인정보 파일명 : 사용자</p>
					<p class="termsSubDesc">
						- 개인정보 항목 : 로그인 ID, 이름, 연락처, 이메일, 생년월일, 주소, 회사명, 사업자등록번호, 직책, 사업장 주소, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보 등<br>
						- 수집방법 : 홈페이지 로그인 및 사용<br>
						- 보유근거 : 홈페이지 서비스 이용에 따른 보유<br>
						- 보유기간 : 5년<br>
						- 관련법령 : 대금결제 및 재화 등의 공급에 관한 기록 : 5년
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">3) 개인정보의 처리 및 보유 기간</p>
					<p class="termsDesc">① <강원 메타버스 지원센터>는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유,이용기간 내에서 개인정보를 처리,보유합니다.</p>
					<p class="termsDesc">② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.</p>
					<p class="termsDesc">1.<제화 또는 서비스 제공></p>
					<p class="termsSubDesc">
						<제화 또는 서비스 제공>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<준영구>까지 위 이용목적을 위하여 보유.이용됩니다.<br>
						-보유근거 : 사용자의 서비스이용에 따른 개인정보 처리 및 보유<br>
						-관련법령 : 대금결제 및 재화 등의 공급에 관한 기록 : 5년
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">4) 개인정보의 제3자 제공에 관한 사항</p>
					<p class="termsDesc">① <강원 메타버스 지원센터>('http://www.gvar.or.kr/'이하 '지원센터')는 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.</p>
					<p class="termsDesc">② <강원 메타버스 지원센터>('http://www.gvar.or.kr/'이하 '지원센터')는 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.</p>
					<p class="termsDesc">1. <주식회사 더픽트></p>
					<p class="termsSubDesc">
						- 개인정보를 제공받는 자 : 주식회사 더픽트<br>
						- 제공받는 자의 개인정보 이용목적 : 로그인 ID, 이름, 연락처, 이메일, 생년월일, 주소, 회사명, 사업자등록번호, 직책, 사업장 주소, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보 등<br>
						- 제공받는 자의 보유.이용기간: 반영구
					</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">5. 개인정보처리 위탁</p>
					<p class="termsDesc">① <강원 메타버스 지원센터>는 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.</p>
					<p class="termsDesc">1. <홈페이지 개설, 유지관리></p>
					<p class="termsSubDesc">
						- 위탁받는 자 (수탁자) : 주식회사 더픽트 / 연도별 유지관리용역사 : 선정사<br>
						- 위탁하는 업무의 내용 : 회원제 서비스 이용에 따른 본인확인, 불만처리 등 민원처리, 고지사항 전달, 신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광고성 정보 제공 및 참여기회 제공<br>
						- 위탁기간 : 반영구
					</p>
					<p class="termsDesc">② <강원 메타버스 지원센터>('http://www.gvar.or.kr/'이하 '지원센터')는 위탁계약 체결 시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.</p>
					<p class="termsDesc">③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">6) 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.</p>
					<p class="termsDesc">① 정보주체는 센터에 대해 언제든지 개인정보 열람,정정,삭제,처리정지 요구 등의 권리를 행사할 수 있습니다.</p>
					<p class="termsDesc">② 제1항에 따른 권리 행사는 센터에 대해 개인정보 보호법 시행령 제41조 제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 센터는 이에 대해 지체 없이 조치하겠습니다.</p>
					<p class="termsDesc">③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</p>
					<p class="termsDesc">④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.</p>
					<p class="termsDesc">⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.</p>
					<p class="termsDesc">⑥ 센터는 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">8) 개인정보의 파기</p>
					<p class="termsDesc">&lt;강원 메타버스 지원센터&gt;는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.</p>
					<p class="termsDesc">-파기절차</p>
					<p class="termsSubDesc">이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</p>
					<p class="termsDesc">-파기기한</p>
					<p class="termsSubDesc">이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</p>
					<p class="termsDesc">-파기방법</p>
					<p class="termsSubDesc">전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">9) 개인정보 자동 수집 장치의 설치&bull;운영 및 거부에 관한 사항</p>
					<p class="termsDesc">① 센터는 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 &lsquo;쿠기(cookie)&rsquo;를 사용합니다.</p>
					<p class="termsDesc">② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.</p>
					<p class="termsDesc">가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.</p>
					<p class="termsDesc">나. 쿠키의 설치&bull;운영 및 거부 : 웹브라우저 상단의 도구&gt;인터넷 옵션&gt;개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부할 수 있습니다.</p>
					<p class="termsDesc">다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">10) 개인정보 보호책임자 작성</p>
					<p class="termsDesc">① &lt;강원 메타버스 지원센터&gt;(&lsquo;http://www.gvar.or.kr/&rsquo;이하 &lsquo;지원센터&rsquo;)는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p>
					<p class="termsDesc">▶ 개인정보 보호책임자</p>
					<p class="termsSubDesc">
						성명 :김남수<br>
						직책 :디지털콘텐츠팀 업무 총괄<br>
						직급 :팀장<br>
						연락처 :033-245-6310, kimnamsoo@gica.or.kr<br>
						※ 개인정보 보호 담당부서로 연결됩니다.
					</p>
					<p class="termsDesc">② 정보주체께서는 &lt;강원 메타버스 지원센터&gt;(&lsquo;http://www.gvar.or.kr/&rsquo;이하 &lsquo;지원센터&rsquo;)의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자에게 문의하실 수 있습니다. &lt;강원 메타버스 지원센터&gt;(&lsquo;http://www.gvar.or.kr/&rsquo;이하 &lsquo;지원센터&rsquo;)는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">11) 개인정보 처리방침 변경</p>
					<p class="termsDesc">①이 개인정보처리방침은 시행일(홈페이지 정식 오픈일)로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">12) 개인정보의 안전성 확보 조치</p>
					<p class="termsDesc">&lt;강원 메타버스 지원센터&gt;는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.</p>
					<p class="termsDesc">1. 정기적인 자체 감사 실시</p>
					<p class="termsSubDesc">개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.</p>
					<p class="termsDesc">2. 개인정보 취급 직원의 최소화 및 교육</p>
					<p class="termsSubDesc">개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화하여 개인정보를 관리하는 대책을 시행하고 있습니다.</p>
					<p class="termsDesc">3. 해킹 등에 대비한 기술적 대책</p>
					<p class="termsSubDesc">&lt;강원 메타버스 지원센터&gt;는 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신&middot;점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.</p>
					<p class="termsDesc">4. 개인정보의 암호화</p>
					<p class="termsSubDesc">이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</p>
					<p class="termsDesc">5. 접속기록의 보관 및 위변조 방지</p>
					<p class="termsSubDesc">개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.</p>
					<p class="termsDesc">6. 개인정보에 대한 접근 제한</p>
					<p class="termsSubDesc">개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</p>
					<p class="termsDesc">7. 문서보안을 위한 잠금장치 사용</p>
					<p class="termsSubDesc">개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.</p>
					<p class="termsDesc">8. 비인가자에 대한 출입 통제</p>
					<p class="termsSubDesc">개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.</p>
				</div>
				<div class="termsContents">
					<p class="termsSubTitle">13) 개인정보 열람청구</p>
					<p class="termsDesc">① 정보주체는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. &lt;강원 메타버스 지원센터&gt;(&lsquo;http://www.gvar.or.kr/&rsquo;이하 &lsquo;지원센터&rsquo;)는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.</p>
					<p class="termsDesc">▶ 개인정보 열람청구 접수&middot;처리 부서</p>
					<p class="termsSubDesc">
						부서명 : 디지털콘텐츠팀<br>
						담당자 : 김남수<br>
						연락처 : 033-245-6310, kimnamsoo@gica.or.kr
					</p>
					<p class="termsDesc">② 정보주체께서는 제1항의 열람청구 접수&middot;처리부서 이외에, 행정안전부의 &lsquo;개인정보보호 종합지원 포털&rsquo; 웹사이트(www.privacy.go.kr)를 통하여서도 개인정보 열람청구를 하실 수 있습니다.</p>
					<p class="termsDesc">▶ 행정안전부 개인정보보호 종합지원 포털 &rarr; 개인정보 민원 &rarr; 개인정보 열람등 요구 (본인확인을 위하여 아이핀(I-PIN)이 있어야 함)</p>
				</div>
			</div>
        </div>
    </div>
    
	<%@ include file="./include/footer.jsp" %>
</body>
</html>