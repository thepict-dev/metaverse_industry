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
        <h2 class="terms"><span>강원 메타버스 지원센터</span>이메일 무단 수집거부</h2>
    </div>
    <div class="loginWrapper terms">
        <div class="loginContainer">
        	<div class="termsTitles">
        		<p>본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며,<br>이를 위반 시 정보통신망법에 의해 형사처벌 됨을 유념하시기 바랍니다.</p>
        	</div>
			<div class="termsContentsWrapper">
				<div class="termsContents">
					<p class="termsSubTitle">정보통신망 이용촉진 및 정보보호 등에 관한 법률</p>
					<p class="termsDesc">제50조의2 (전자우편주소의 무단 수집행위 등 금지)</p>
					<p class="termsSubDesc">
						- 누구든지 인터넷 홈페이지 운영자 또는 관리자의 사전동의 없이 인터넷 홈페이지에서 자동으로 전자우편 주소를 수집하는 프로그램 그 밖의 기술적 장치를 이용하여 전자우편주소를 수집하여서는 아니된다.<br>
						- 누구든지 제1항의 규정을 위반하여 수집된 전자우편주소를 판매·유통하여서는 아니된다.<br>
						- 누구든지 제1항 및 제2항의 규정에 의하여 수집·판매 및 유통이 금지된 전자우편주소임을 알고 이를 정보 전송에 이용하여서는 아니된다.
					</p>
					<p class="termsDesc">제65조 (벌칙)</p>
					<p class="termsSubDesc">
						- 다음 각 호의 어느 하나에 해당하는 자는 1년 이하의 징역 또는 1천만원 이하의 벌금 에 처한다.
						<i style="display: block; margin-left: 13px;">제50조의2의 규정을 위반하여 전자우편 주소를 수집·판매·유통 또는 정보전송에 이용한 자</i>
					</p>
				</div>
			</div>
        </div>
    </div>
    
	<%@ include file="./include/footer.jsp" %>
</body>
</html>