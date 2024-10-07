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
    <div class="subTop biz">
        <div class="subColor">
            <h2>사업공고</h2>
            <p>창의적 도전을 위한<br>다양한 사업을 진행합니다</p>
        </div>
    </div>
    <div class="subContents">
        <div class="noticeContainer sub biz">
            <ul class="notice">
                <li>
                    <a href="/biz_post_view.do">
                        <p class="ntInfos">
                            <span class="category">사업공고</span>
                            <span class="ntIndex">1</span>
                            <span class="ntTitle">SW융합 해커톤 대회 강원지역 참가팀 모집 공고</span>
                        </p>
                        <p class="ntDate">2024.07.15<img src="/img/user_img/list-link.png" alt=""></p>
                    </a>
                </li>
            </ul>
        </div> 
        <div class="pagination">
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
	<%@ include file="./include/footer.jsp" %>
	<script src="/js/sub.js"></script>
</body>
</html>