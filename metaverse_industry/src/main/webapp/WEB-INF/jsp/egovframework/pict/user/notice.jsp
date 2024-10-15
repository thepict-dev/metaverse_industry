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
	<%@ include file="./include/header_sub.jsp" %>
    <div class="subTop notice1">
        <div class="subColor">
            <h2>공지사항</h2>
            <p>새로운 소식을 안내드립니다</p>
        </div>
    </div>
    <div class="subContents">
        <ul class="tabNav">
            <li class="active"><a href="#lnk">모두보기</a></li>
            <li><a href="#lnk">센터소식</a></li>
            <li><a href="#lnk">행사안내</a></li>
            <li><a href="#lnk">보도자료</a></li>
            <li><a href="#lnk">기타공고</a></li>
        </ul>
        <div class="tabInner active">
            <div class="noticeContainer sub">
                <ul class="notice">
                    <li>
                        <a href="/notice_view.do">
                            <p class="ntInfos">
                                <span class="category">센터소식</span>
                                <span class="ntIndex">1</span>
                                <span class="ntTitle">SW융합 해커톤 대회 강원지역 참가팀 모집 공고</span>
                            </p>
                            <p class="ntDate">2024.07.15<img src="/img/user_img/list-link.png" alt=""></p>
                        </a>
                    </li>
                    <li>
                        <a href="/notice_view.do">
                            <p class="ntInfos">
                                <span class="category">행사안내</span>
                                <span class="ntIndex">1</span>
                                <span class="ntTitle">SW융합 해커톤 대회 강원지역 참가팀 모집 공고</span>
                            </p>
                            <p class="ntDate">2024.07.15<img src="/img/user_img/list-link.png" alt=""></p>
                        </a>
                    </li>
                    <li>
                        <a href="/notice_view.do">
                            <p class="ntInfos">
                                <span class="category">보도자료</span>
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
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script src="/js/sub.js"></script>
</body>
</html>