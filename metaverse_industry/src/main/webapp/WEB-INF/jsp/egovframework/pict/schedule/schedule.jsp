<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



<!DOCTYPE html>
<html lang="ko">
<c:import url="../main/head.jsp">
	<c:param name="pageTitle" value="사용자" />
</c:import>

<!-- FullCalendar CSS -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />

<!-- 커스텀 스타일 추가 -->
<style>
.fc {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background: #fff;
    box-shadow: 0 1px 3px rgba(0,0,0,0.12);
    border-radius: 8px;
}

.fc-toolbar-title {
    font-size: 20px !important;
    font-weight: 500 !important;
    color: #333;
}

.fc-button-primary {
    background-color: #fff !important;
    border-color: #ddd !important;
    color: #333 !important;
    text-transform: capitalize !important;
    padding: 6px 12px !important;
}

.fc-button-primary:hover {
    background-color: #f8f9fa !important;
    border-color: #ddd !important;
}

.fc-button-primary:not(:disabled).fc-button-active,
.fc-button-primary:not(:disabled):active {
    background-color: #e9ecef !important;
    border-color: #ddd !important;
    color: #333 !important;
}

.fc-daygrid-day {
    cursor: pointer;
}

.fc-daygrid-day:hover {
    background-color: #f8f9fa;
}

.fc-daygrid-day-number {
    font-size: 14px;
    color: #333;
    padding: 8px !important;
}

.fc-day-today {
    background-color: #e8f0fe !important;
}

.fc-event {
    border: none !important;
    background-color: #4285f4 !important;
    color: white !important;
    padding: 2px 4px !important;
    border-radius: 4px !important;
    font-size: 13px !important;
}

.fc-day-other .fc-daygrid-day-number {
    color: #bbb;
}

.fc-header-toolbar {
    margin-bottom: 1.5em !important;
}

.listInner {
    padding: 20px;
}

/* 모달 스타일 */
.event-modal {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    z-index: 1000;
}

.modal-backdrop {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.5);
    z-index: 999;
}
</style>

<!-- 모달 추가 -->
<div class="event-modal">
    <h3>일정 등록</h3>
    <input type="text" id="eventTitle" placeholder="일정 제목" style="width: 100%; padding: 8px; margin: 10px 0; border: 1px solid #ddd; border-radius: 4px;">
    <div style="text-align: right; margin-top: 15px;">
        <button onclick="saveEvent()" style="background: #4285f4; color: white; border: none; padding: 8px 16px; border-radius: 4px; cursor: pointer;">저장</button>
        <button onclick="closeModal()" style="background: #fff; border: 1px solid #ddd; padding: 8px 16px; border-radius: 4px; margin-left: 8px; cursor: pointer;">취소</button>
    </div>
</div>
<div class="modal-backdrop"></div>

<%@include file="../main/lnb.jsp" %>
	<c:import url="../main/header.jsp">
		<c:param name="title" value="일정관리" />
		<c:param name="subtitle" value="일정 등록" />
	</c:import>
	<div class="contentsContainer">
		<div class="listContainer">
			<div class="listInner">
				<div id='calendar'></div>
			</div>
		</div>
	</div>
	
	<!-- FullCalendar JS -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
		    var calendarEl = document.getElementById('calendar');
		    var selectedDate;
		    
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		        initialView: 'dayGridMonth',
		        selectable: true,
		        editable: true,
		        headerToolbar: {
		            left: 'prev,next today',
		            center: 'title',
		            right: 'dayGridMonth,dayGridWeek'
		        },
		        locale: 'ko',
		        events: function(info, successCallback, failureCallback) {
		            $.ajax({
		                url: '/calendar/closedDate.do',
		                method: 'GET',
		                dataType: 'json',
		                success: function(response) {
		                    successCallback(response.data);
		                },
		                error: function(xhr, status, error) {
		                    console.error('Error fetching events:', error);
		                    failureCallback(error);
		                }
		            });
		        },
		        select: function(info) {
		            selectedDate = info.startStr;
		            openModal();
		        }
		    });
		    
		    calendar.render();
		    
		    // 모달 관련 함수들
		    window.openModal = function() {
		        document.querySelector('.event-modal').style.display = 'block';
		        document.querySelector('.modal-backdrop').style.display = 'block';
		    }
		    
		    window.closeModal = function() {
		        document.querySelector('.event-modal').style.display = 'none';
		        document.querySelector('.modal-backdrop').style.display = 'none';
		        document.getElementById('eventTitle').value = '';
		    }
		    
		    window.saveEvent = function() {
		        var title = document.getElementById('eventTitle').value;
		        if (title) {
		            var eventData = [{
		                title: title,
		                date: selectedDate
		            }];
		            
		            $.ajax({
		                url: '/calendar/saveClosedDate.do',
		                method: 'POST',
		                contentType: 'application/json',
		                data: JSON.stringify(eventData),
		                success: function() {
		                    calendar.refetchEvents();
		                    closeModal();
		                },
		                error: function(xhr, status, error) {
		                    console.error('Error saving event:', error);
		                    alert('일정 저장에 실패했습니다.');
		                }
		            });
		        }
		    }
		});
	</script>

	<script type="text/javascript" src="/js/user_list.js"></script>
	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
	</body>

</html>