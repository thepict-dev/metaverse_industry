
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var currentEventId = null;
    
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
        
        // 기존 일정 조회
        events: function(info, successCallback, failureCallback) {
            $.ajax({
                url: '/calendar/closedDate.do',
                method: 'GET',
                dataType: 'json',
                success: function(response) {
                    successCallback(response.data.map(function(item) {
                        let endDate = new Date(item.endDate);
                        endDate.setDate(endDate.getDate() + 1);
                        
                        return {
                            id: item.id,
                            title: item.title,
                            start: item.startDate,
                            end: endDate.toISOString().split('T')[0],
                            display: 'block'
                        };
                    }));
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching events:', error);
                    failureCallback(error);
                }
            });
        },
        
        // 새 일정 등록을 위한 날짜 선택
        select: function(info) {
            document.querySelector('.event-modal h3').textContent = '일정 등록';
            document.getElementById('eventTitle').value = '';
            
            // 드래그로 선택한 경우 (시작일과 종료일이 다른 경우)
            if (info.startStr !== info.endStr) {
                let endDate = new Date(info.endStr);
                endDate.setDate(endDate.getDate() - 1); // 종료일에서 하루를 빼줍니다
                
                document.getElementById('startDate').value = info.startStr;
                document.getElementById('endDate').value = endDate.toISOString().split('T')[0];
            } 
            // 클릭으로 선택한 경우 (하루만 선택)
            else {
                document.getElementById('startDate').value = info.startStr;
                document.getElementById('endDate').value = info.startStr;
            }
            
            document.getElementById('createButtons').style.display = 'block';
            document.getElementById('editButtons').style.display = 'none';
            openModal();
        },
        
        // 기존 일정 클릭
        eventClick: function(info) {
            currentEventId = info.event.id;
            document.querySelector('.event-modal h3').textContent = '일정 수정';
            document.getElementById('eventTitle').value = info.event.title;
            
            // 원본 데이터의 날짜를 그대로 사용
            $.ajax({
                url: '/calendar/closedDateById.do',
                method: 'GET',
                data: { id: currentEventId },
                success: function(response) {
                    document.getElementById('startDate').value = response.startDate;
                    document.getElementById('endDate').value = response.endDate;
                    
                    document.getElementById('createButtons').style.display = 'none';
                    document.getElementById('editButtons').style.display = 'block';
                    openModal();
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching event:', error);
                    alert('일정 정보를 가져오는데 실패했습니다.');
                }
            });
        }
    });
    
    calendar.render();
    
    // 새 일정 저장
    window.saveEvent = function() {
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;
        
        // 시작일이 종료일보다 늦은 경우 체크
        if (startDate > endDate) {
            alert('시작일은 종료일보다 늦을 수 없습니다.');
            return;
        }
        
        var eventData = {
            title: document.getElementById('eventTitle').value,
            startDate: startDate,
            endDate: endDate
        };
        
        if (!eventData.title) {
            alert('일정 제목을 입력해주세요.');
            return;
        }
        
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
    };
    
    // 일정 수정
    window.updateEvent = function() {
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;
        
        // 시작일이 종료일보다 늦은 경우 체크
        if (startDate > endDate) {
            alert('시작일은 종료일보다 늦을 수 없습니다.');
            return;
        }
        
        var eventData = {
            id: currentEventId,
            title: document.getElementById('eventTitle').value,
            startDate: startDate,
            endDate: endDate
        };
        
        if (!eventData.title) {
            alert('일정 제목을 입력해주세요.');
            return;
        }
        
        $.ajax({
            url: '/calendar/updateClosedDate.do',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(eventData),
            success: function() {
                calendar.refetchEvents();
                closeModal();
            },
            error: function(xhr, status, error) {
                console.error('Error updating event:', error);
                alert('일정 수정에 실패했습니다.');
            }
        });
    };
    
    // 일정 삭제
    window.deleteEvent = function() {
        if (!confirm('정말 삭제하시겠습니까?')) return;
        
        $.ajax({
            url: '/calendar/deleteClosedDate.do',
            method: 'POST',
            data: { id: currentEventId },
            success: function() {
                calendar.refetchEvents();
                closeModal();
            },
            error: function(xhr, status, error) {
                console.error('Error deleting event:', error);
                alert('일정 삭제에 실패했습니다.');
            }
        });
    };
    
    // 모달 제어
    window.openModal = function() {
        document.querySelector('.event-modal').style.display = 'block';
        document.querySelector('.modal-backdrop').style.display = 'block';
    };
    
    window.closeModal = function() {
        document.querySelector('.event-modal').style.display = 'none';
        document.querySelector('.modal-backdrop').style.display = 'none';
        document.getElementById('eventTitle').value = '';
    };
});