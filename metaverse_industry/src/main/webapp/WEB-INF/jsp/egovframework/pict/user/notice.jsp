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
            <li class="<c:if test="${pictVO.type eq null || pictVO.type eq ''}">active</c:if>"><a href="/notice.do">모두보기</a></li>
            <li class="<c:if test="${pictVO.type eq '1'}">active</c:if>" ><a href="/notice.do?type=1">센터소식</a></li>
            <li class="<c:if test="${pictVO.type eq '2'}">active</c:if>"><a href="/notice.do?type=2">행사안내</a></li>
            <li class="<c:if test="${pictVO.type eq '3'}">active</c:if>"><a href="/notice.do?type=3">보도자료</a></li>
            <li class="<c:if test="${pictVO.type eq '4'}">active</c:if>"><a href="/notice.do?type=4">기타공고</a></li>
        </ul>
        <div class="tabInner active">
            <div class="noticeContainer sub">
                <ul class="notice">
                	<c:forEach var="notice" items="${noticeList}" varStatus="status">
                          <li>
                              <a href="/notice_view.do?idx=${notice.idx}">
                                  <p class="ntInfos">
                                      <span class="category">
                              	        <c:choose>
						                <c:when test="${notice.category eq '1'}">
						                    센터소식
						                </c:when>
						                <c:when test="${notice.category eq '2'}">
						                    행사안내
						                </c:when>
						                <c:when test="${notice.category eq '3'}">
						                    보도자료
						                </c:when>
						                <c:when test="${notice.category eq '4'}">
						                    기타공고
						                </c:when>
						            </c:choose>
                                      </span>
                                      
                                      <span class="ntIndex">
                    ${(pictVO.pageNumber - 1) * 10 + status.count}
                                      
                                      </span>
                                      <span class="ntTitle">${notice.title}</span>
                                  </p>
                                  <p class="ntDate">${notice.reg_date}<img src="/img/user_img/list-link.png" alt=""></p>
                              </a>
                          </li>
                   	</c:forEach>
                </ul>
            </div>
           <div class="pagination">
               	<c:if test="${pictVO.pageNumber ne 1}">
					<li><a href="/notice.do?search_text=${param.search_text}&pageNumber=${pictVO.pageNumber - 10 < 1 ? 1 : pictVO.pageNumber - 10}"><img src="/img/admin/prev.png" alt=""></a></li>
				</c:if>	
				
				<c:forEach var="i" begin="${pictVO.startPage}" end="${pictVO.endPage}">
					<c:if test="${i eq pictVO.pageNumber}">
						<li><a class="active" href="/notice.do?type=${pictVO.type}&pageNumber=${i}" >${i}</a></li>
					</c:if>
					<c:if test="${i ne pictVO.pageNumber}">
						<li><a href="/notice.do?type=${pictVO.type}&pageNumber=${i}" >${i}</a></li>
					</c:if>
				</c:forEach>	
                  
                 <c:if test="${pictVO.lastPage ne pictVO.pageNumber && pictVO.lastPage != 0}">
					<li><a href="/notice.do?type=${pictVO.type}&pageNumber=${pictVO.pageNumber + 10 > pictVO.lastPage ?  pictVO.lastPage : pictVO.pageNumber + 10}"><img src="/img/admin/next.png" alt=""></a></li>
				</c:if>
            </div>
            
            <!-- 페이지 네이 -->
        </div>  
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script src="/js/sub.js"></script>
</body>
</html>