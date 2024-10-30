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
    <div class="viewContainer">
        <div class="viewTop">
            <span class="category">
            <c:choose>
                <c:when test="${noticeResult.category eq '1'}">
                    센터소식
                </c:when>
                <c:when test="${noticeResult.category eq '2'}">
                    행사안내
                </c:when>
                <c:when test="${noticeResult.category eq '3'}">
                    보도자료
                </c:when>
                <c:when test="${noticeResult.category eq '4'}">
                    기타공고
                </c:when>
            </c:choose>
            </span>
            <p class="viewTitle">${noticeResult.title}</p>
            <span class="viewDate">${noticeResult.reg_date}</span>
        </div>
        <div class="viewBottom">
            ${noticeResult.text}
        </div>
        <div class="addFile">
        	<c:if test="${noticeResult.file_url1 ne null and noticeResult.file_url1 ne ''}">
        	    <c:set var="fileName1" value="${fn:substringAfter(noticeResult.file_url1, 'metaverse_industry/')}" />
	            <a href="${noticeResult.file_url1}" download>
	                <img src="/img/user_img/file.png" alt="">
	                ${fileName1}
	            </a>
        	</c:if>
        	<c:if test="${noticeResult.file_url2 ne null and noticeResult.file_url2 ne ''}">
        	    <c:set var="fileName2" value="${fn:substringAfter(noticeResult.file_url2, 'metaverse_industry/')}" />
	            <a href="${noticeResult.file_url2}" download>
	                <img src="/img/user_img/file.png" alt="">
	                ${fileName2}
	            </a>
        	</c:if>
        	<c:if test="${noticeResult.file_url3 ne null and noticeResult.file_url3 ne ''}">
        	    <c:set var="fileName3" value="${fn:substringAfter(noticeResult.file_url3, 'metaverse_industry/')}" />
	            <a href="${noticeResult.file_url3}" download>
	                <img src="/img/user_img/file.png" alt="">
	                ${fileName3}
	            </a>
        	</c:if>
        </div>
        <div class="fullButtonContainer bd">
            <a href="/notice.do" class="wt view">목록으로</a>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
</body>
</html>