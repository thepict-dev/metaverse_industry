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
            <a href="#lnk" download>
                <img src="/img/user_img/file.png" alt="">
                파일이름ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
            </a>
        </div>
        <div class="fullButtonContainer bd">
            <a href="/notice.do" class="wt view">목록으로</a>
        </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
</body>
</html>