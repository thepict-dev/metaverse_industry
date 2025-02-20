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
        	<span class="category">사업공고</span>
            <p class="viewTitle">${noticeResult.title}</p>
            <span class="viewDate">${noticeResult.reg_date}</span>
        </div>
        <div class="viewBottom">
            ${noticeResult.text}
        </div>
        <c:if test="${(noticeResult.file_url1 ne null and noticeResult.file_url1 ne '') or 
                      (noticeResult.file_url2 ne null and noticeResult.file_url2 ne '') or 
                      (noticeResult.file_url3 ne null and noticeResult.file_url3 ne '')}">
	       	<div class="addFile">
	            <c:if test="${noticeResult.file_url1 ne null and noticeResult.file_url1 ne ''}">
	        	    <c:set var="fullFileName1" value="${fn:substringAfter(noticeResult.file_url1, 'metaverse_industry/')}" />
		            <c:set var="fileName1" value="${fn:substring(fullFileName1, 37, fn:length(fullFileName1))}" />
		            <a href="${noticeResult.file_url1}" download>
		                <img src="/img/user_img/file.webp" alt="">
		                ${fileName1}
		            </a>
	        	</c:if>
	        	<c:if test="${noticeResult.file_url2 ne null and noticeResult.file_url2 ne ''}">
	        	    <c:set var="fullFileName2" value="${fn:substringAfter(noticeResult.file_url2, 'metaverse_industry/')}" />
		            <c:set var="fileName2" value="${fn:substring(fullFileName2, 37, fn:length(fullFileName2))}" />
		            <a href="${noticeResult.file_url2}" download>
		                <img src="/img/user_img/file.webp" alt="">
		                ${fileName2}
		            </a>
	        	</c:if>
	        	<c:if test="${noticeResult.file_url3 ne null and noticeResult.file_url3 ne ''}">
	        	    <c:set var="fullFileName3" value="${fn:substringAfter(noticeResult.file_url3, 'metaverse_industry/')}" />
		            <c:set var="fileName3" value="${fn:substring(fullFileName3, 37, fn:length(fullFileName3))}" />
		            <a href="${noticeResult.file_url3}" download>
		                <img src="/img/user_img/file.webp" alt="">
		                ${fileName3}
		            </a>
	        	</c:if>
	        </div>
        </c:if>
        
        <div class="fullButtonContainer bd">
            <a href="/biz_post.do" class="wt view">목록으로</a>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
</body>
</html>