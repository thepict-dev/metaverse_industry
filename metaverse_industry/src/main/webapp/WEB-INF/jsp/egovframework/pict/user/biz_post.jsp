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
    <div class="subContents" style="padding-top: 150px;">
        <c:choose>
            <c:when test="${empty noticeList}">
                <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 36px; margin-top: 40px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="183" height="183" viewBox="0 0 183 183" fill="none">
                        <circle cx="91.5" cy="91.5" r="81" stroke="#CACFD4" stroke-width="21"/>
                        <path d="M97.1314 107.759H85.219L83 56H99L97.1314 107.759ZM91.292 116.447C93.3942 116.447 95.1071 116.97 96.4307 118.018C97.7543 119.065 98.4161 120.452 98.4161 122.177C98.4161 123.902 97.7543 125.289 96.4307 126.336C95.1071 127.445 93.3942 128 91.292 128C89.1119 128 87.3212 127.445 85.9197 126.336C84.5961 125.289 83.9343 123.902 83.9343 122.177C83.9343 120.452 84.5961 119.065 85.9197 118.018C87.3212 116.97 89.1119 116.447 91.292 116.447Z" fill="#CACFD4"/>
                    </svg>
                    <p class="emptyMsg">등록된 <span>게시글</span>이 없습니다</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="noticeContainer sub biz">
                    <ul class="notice">
                        <c:forEach var="notice" items="${noticeList}" varStatus="status">
                            <li>
                                <a href="/biz_post_view.do?idx=${notice.idx}">
                                    <p class="ntInfos">
                                        <span class="category">사업공고</span>
                                        <span class="ntIndex">
                                            ${board_cnt - ((pictVO.pageNumber - 1) * 10 + status.count) + 1}
                                        </span>
                                        <span class="ntTitle">${notice.title}</span>
                                    </p>
                                    <p class="ntDate">${notice.reg_date}<img src="/img/user_img/list-link.webp" alt=""></p>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div> 
            </c:otherwise>
        </c:choose>
        <div class="pagination">
               	<c:if test="${pictVO.pageNumber ne 1}">
					<li><a href="/biz_post.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img src="/img/admin/prev.webp" alt=""></a></li>
				</c:if>	
				
				<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
					<c:if test="${i eq pictVO.pageNumber}">
						<li><a class="active" href="/biz_post.do?type=${pictVO.type}&pageNumber=${i}" >${i}</a></li>
					</c:if>
					<c:if test="${i ne pictVO.pageNumber}">
						<li><a href="/biz_post.do?type=${pictVO.type}&pageNumber=${i}" >${i}</a></li>
					</c:if>
				</c:forEach>	
                  
                 <c:if test="${pictVO.lastPage ne pictVO.pageNumber && pictVO.lastPage != 0}">
					<li><a href="/biz_post.do?type=${pictVO.type}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img src="/img/admin/next.webp" alt=""></a></li>
				</c:if>
            </div>
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script src="/js/sub.js"></script>
</body>
</html>