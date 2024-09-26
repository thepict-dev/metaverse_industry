<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/header.jsp">
    	<c:param name="pageTitle" value="접속현황"/>
    </c:import>
    
    
    <body class="sb-nav-fixed">
        <%@include file="../main/navigation.jsp" %>
        <div id="layoutSidenav">
	        <div id="layoutSidenav_nav">
				<%@include file="../main/gnb.jsp" %>
			</div>
			
			<div id="layoutSidenav_content">
				<main class="contents">
					<h2 class="contents-title">강의실 접속현황</h2>
					<div class="contents-box">
				    	<div class="tbl-basic type2">
					        <table>
					        	<colgroup>
					        		<col style="width:15%;">
					        		<col style="width:15%;">
					        		<col style="width:auto;">
					        		<col style="width:20%;">
					        	</colgroup>
					            <thead>
					                <tr class="thead">
					                    <th>채널</th>
					                    <th>접속 인원 수</th>
					                    <th>접속인원</th>
					                    <th>상태</th>
					                </tr>
					            </thead>
					            <tbody>
					            	<tr>
					                    <td>1번 채널</td>
					                    <td><span style="color:#1f51a2">40명</span></td>
					                    <td class="opt-tl">
					                    	<div class="name-box" onmouseenter="names(this, 'open', '1');" onmouseleave="names('close');">
					                    		<span class="name-lnk">홍길동</span>
					                    	</div>
					                    	<div class="name-box" onmouseenter="names(this, 'open', '2');" onmouseleave="names('close');">
					                    		<span class="name-lnk">홍길동</span>
					                    	</div>
					                    	<div class="name-box" onmouseenter="names(this, 'open', '3');" onmouseleave="names('close');">
					                    		<span class="name-lnk">홍길동</span>
					                    	</div>
					                    </td>
					                    <td><span class="name-state name-state-y">원활</span></td>
					                </tr>
					            	<tr>
					                    <td>1번 채널</td>
					                    <td><span style="color:#1f51a2">40명</span></td>
					                    <td class="opt-tl">
					                    	<div class="name-box" onmouseenter="names(this, 'open');" onmouseleave="names('close');">
					                    		<span class="name-lnk">홍길동</span>
					                    	</div>
					                    	<div class="name-box" onmouseenter="names(this, 'open');" onmouseleave="names('close');">
					                    		<span class="name-lnk">홍길동</span>
					                    	</div>
					                    	<div class="name-box" onmouseenter="names(this, 'open');" onmouseleave="names('close');">
					                    		<span class="name-lnk">홍길동</span>
					                    	</div>
					                    </td>
					                    <td><span class="name-state name-state-n">혼잡</span></td>
					                </tr>
					            	<%-- <c:forEach var="resultList" items="${resultList}" varStatus="status">
						                <tr class="kiosk-table-tr">
						                    <td class="kiosk-table-td">${resultList.roomname}번 채널</td>
						                    <td class="kiosk-table-td">${resultList.nickname}</td>
						                    <td class="kiosk-table-td">${resultList.cnt}명</td>
						                </tr>
					                </c:forEach> --%>
					            </tbody>
				            </table>
		            	</div>
		            	<div class="name-popup" >
		            		<button type="button" class="name-btn" onclick="exit(this)">퇴장</button>
		            		<button type="button" class="name-btn" onclick="prevent(this)">텍스트채팅차단</button>
		            	</div>
		            </div>
				</main>
				<%@include file="../main/footer.jsp" %>
			</div>
		</div>
		<script>
			// name popup
			function prevent(target) {
				var data = $(target).parent().attr("data-key")
				console.log(data)
			}
			function exit(target) {
				var data = $(target).parent().attr("data-key")
				console.log(data)
			}
			function names(target, type, data) {
				const $popup = $(".name-popup");
				if(type === "open") {
					$(target).append($popup);
					$popup.addClass("active");
					$popup.attr("data-key",data);
					$(target).addClass("active");
				} else {
					$popup.removeClass("active");
					$(".name-box").removeClass("active");
				}
			}
		</script>
		<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/scripts.js"></script>
		<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
		<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
		
    </body>
</html>