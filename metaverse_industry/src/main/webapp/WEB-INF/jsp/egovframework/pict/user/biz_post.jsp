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
        <div class="noticeContainer sub biz">
            <ul class="notice">
                <c:forEach var="notice" items="${noticeList}" varStatus="status">
                      <li>
                          <a href="/biz_post_view.do?idx=${notice.idx}">
                              <p class="ntInfos">
                                  <span class="category">사업공고</span>
                                  <span class="ntIndex">
                                     ${(pictVO.pageNumber - 1) * 10 + status.count}

                                  </span>
                                  <span class="ntTitle">${notice.title}</span>
                              </p>
                              <p class="ntDate">${notice.reg_date}<img src="/img/user_img/list-link.webp" alt=""></p>
                          </a>
                      </li>
               	</c:forEach>
            </ul>
        </div> 
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