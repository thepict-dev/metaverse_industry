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
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
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
	
	/* 모달 스타일 개선 */
	.event-modal {
	    display: none;
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    background: white;
	    width: 400px;
	    border-radius: 12px;
	    box-shadow: 0 4px 20px rgba(0,0,0,0.15);
	    z-index: 1000;
	    overflow: hidden;
	}
	
	/* 모달 헤더 스타일 */
	.event-modal h3 {
	    margin: 0;
	    padding: 20px;
	    background: #f8f9fa;
	    border-bottom: 1px solid #eee;
	    font-size: 1.4em;
	    color: #333;
	    font-weight: 600;
	}
	
	.event-modal .subtitle {
	    font-size: 0.9em;
	    color: #666;
	    margin-top: 5px;
	    font-weight: normal;
	}
	
	/* 모달 바디 스타일 */
	.modal-body {
	    padding: 24px;
	}
	
	.form-group {
	    margin-bottom: 20px;
	}
	
	.form-group label {
	    display: block;
	    margin-bottom: 8px;
	    font-weight: 500;
	    color: #444;
	    font-size: 0.95em;
	}
	
	.form-control {
	    width: 100%;
	    padding: 10px 12px;
	    border: 1px solid #ddd;
	    border-radius: 6px;
	    box-sizing: border-box;
	    font-size: 0.95em;
	    transition: border-color 0.2s, box-shadow 0.2s;
	}
	
	.form-control:focus {
	    border-color: #4285f4;
	    box-shadow: 0 0 0 3px rgba(66, 133, 244, 0.1);
	    outline: none;
	}
	
	/* 모달 푸터 스타일 */
	.modal-footer {
	    padding: 16px 24px;
	    background: #f8f9fa;
	    border-top: 1px solid #eee;
	    text-align: right;
	}
	
	/* 버튼 스타일 개선 */
	.btn-save {
	    background: #4285f4;
	    color: white;
	    border: none;
	    padding: 10px 20px;
	    border-radius: 6px;
	    cursor: pointer;
	    font-weight: 500;
	    transition: background-color 0.2s;
	}
	
	.btn-save:hover {
	    background: #3367d6;
	}
	
	.btn-delete {
	    background: #dc3545;
	    color: white;
	    border: none;
	    padding: 10px 20px;
	    border-radius: 6px;
	    cursor: pointer;
	    font-weight: 500;
	    transition: background-color 0.2s;
	}
	
	.btn-delete:hover {
	    background: #c82333;
	}
	
	.btn-cancel {
	    background: #fff;
	    border: 1px solid #ddd;
	    padding: 10px 20px;
	    border-radius: 6px;
	    cursor: pointer;
	    font-weight: 500;
	    transition: all 0.2s;
	}
	
	.btn-cancel:hover {
	    background: #f8f9fa;
	    border-color: #c8c8c8;
	}
	
	/* 모달 백드롭 스타일 */
	.modal-backdrop {
	    display: none;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background: rgba(0,0,0,0.4);
	    backdrop-filter: blur(2px);
	    z-index: 999;
	}
</style>

<div class="event-modal">
    <h3>일정 등록</h3>
    <div class="modal-body">
        <div class="form-group">
            <label for="eventTitle">일정 제목</label>
            <input type="text" id="eventTitle" class="form-control" placeholder="일정 제목을 입력하세요">
        </div>
        <div class="form-group">
            <label for="startDate">시작일</label>
            <input type="date" id="startDate" class="form-control">
        </div>
        <div class="form-group">
            <label for="endDate">종료일</label>
            <input type="date" id="endDate" class="form-control">
        </div>
    </div>
    <div class="modal-footer">
        <div id="createButtons" style="display: none;">
            <button onclick="saveEvent()" class="btn-save">저장</button>
            <button onclick="closeModal()" class="btn-cancel">취소</button>
        </div>
        <div id="editButtons" style="display: none;">
            <button onclick="updateEvent()" class="btn-save">수정</button>
            <button onclick="deleteEvent()" class="btn-delete">삭제</button>
            <button onclick="closeModal()" class="btn-cancel">취소</button>
        </div>
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
	
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
	<script type="text/javascript" src="/js/schedule.js"></script>
	<script src="../../../../../js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/scripts.js"></script>
	<script src="../../../../../js/Chart.min.js" crossorigin="anonymous"></script>
	<script src="../../../../../js/simple-datatables@latest.js" crossorigin="anonymous"></script>
</body>

</html>