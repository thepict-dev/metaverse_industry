
var calendarEl = document.querySelector('.dateContainer');
var startDate = null;
var endDate = null;
var selectedDates = []; // 선택된 날짜들을 저장할 배열

// 선택 불가능한 날짜를 정의하는 함수
function isDateDisabled(date) {
    return date.getFullYear() === 2024 && 
           date.getMonth() === 9 && // JavaScript에서 월은 0부터 시작하므로 10월은 9
           date.getDate() === 1;
}

// 날짜 스타일 초기화 함수
function resetDateStyles() {
    selectedDates.forEach(dateEl => {
        dateEl.style.backgroundColor = '';
        dateEl.style.color = '';
        dateEl.style.borderRadius = '';
    });
    selectedDates = [];
}

var calendar = new FullCalendar.Calendar(calendarEl, {
    initialView: 'multiMonth',
    views: {
        multiMonth: {
            duration: { months: 2 },
            multiMonthMaxColumns: 2,
            monthHeight: 300
        }
    },
    headerToolbar: {
        left: 'prev',
        center: '',
        right: 'next'
    },
    selectable: true,
    unselectAuto: false,
    selectLongPressDelay: 0,
    selectAllow: function(selectInfo) {
        return !isDateDisabled(selectInfo.start);
    },
    dayCellDidMount: function(arg) {
        if (isDateDisabled(arg.date)) {
            arg.el.classList.add('fc-day-disabled');
        }
    },
    dateClick: function(info) {
        if (isDateDisabled(info.date)) {
            return;
        }

        resetDateStyles();

        var clickedDate = new Date(info.date.getTime() - (info.date.getTimezoneOffset() * 60000));
        
        if (!startDate || (startDate && endDate)) {
            startDate = clickedDate;
            endDate = null;
            info.dayEl.style.backgroundColor = '#03B635';
            info.dayEl.style.color = 'white';
            info.dayEl.style.borderRadius = '100%';
            selectedDates.push(info.dayEl);
            calendar.unselect();
            calendar.select(clickedDate);
        } else {
            endDate = clickedDate;
            if (endDate < startDate) {
                var temp = startDate;
                startDate = endDate;
                endDate = temp;
            }
            calendar.unselect();
            var nextDay = new Date(endDate);
            nextDay.setDate(nextDay.getDate() + 1);
            calendar.select(startDate, nextDay);

            // 선택된 범위의 날짜들에 스타일 적용
            var currentDate = new Date(startDate);
            while (currentDate <= endDate) {
                var dateEl = calendar.el.querySelector('.fc-day[data-date="' + formatDate(currentDate) + '"]');
                if (dateEl) {
                    if (currentDate.getTime() === startDate.getTime() || currentDate.getTime() === endDate.getTime()) {
                        dateEl.style.backgroundColor = '#03B635'; // 진한 초록색
                        dateEl.style.color = 'white';
                        dateEl.style.borderRadius = '100%';
                    } else {
                        dateEl.style.backgroundColor = 'rgba(3, 182, 53, 0.40)'; // 연한 초록색
                        dateEl.style.color = 'black';
                    }
                    selectedDates.push(dateEl);
                }
                currentDate.setDate(currentDate.getDate() + 1);
            }
        }
        updateDateDisplay();
    },
    select: function(info) {
        // 선택된 날짜 범위를 시각화 (필요한 경우 여기에 추가 로직 구현)
    },
    buttonText: {
        today: 'Today'
    }
});

calendar.render();

function updateDateDisplay() {
    console.log('Start Date:', startDate ? formatDate(startDate) : 'Not selected');
    console.log('End Date:', endDate ? formatDate(endDate) : 'Not selected');
}

function formatDate(date) {
    return date.getFullYear() + '-' + 
           padZero(date.getMonth() + 1) + '-' + 
           padZero(date.getDate());
}

function padZero(num) {
    return num < 10 ? '0' + num : num;
}





// .fc .fc-highlight {
//     /* background: rgba(3, 182, 53, 0.40) !important;  */
//     background: inherit !important;
// }
// .fc .fc-day-today {
//     background: inherit !important;
// }
// .fc-day-disabled {
//     background: #f0f0f0 !important;
//     color: #ccc !important;
//     cursor: not-allowed !important;
// }

// .fc .fc-multimonth{
//     border: 0;
//     flex-wrap: nowrap;
//     column-gap: 6.5px;
//     padding: 0 60px;
// }
// .fc .fc-multimonth-multicol .fc-multimonth-month {
//     padding: 0;
//     box-sizing: border-box;
// }

// .fc .fc-multimonth-singlecol .fc-multimonth-header-table{
//     border-right: 1px solid var(--grey-50);
//     border-left: 1px solid var(--grey-50);
//     border-top: 1px solid var(--grey-50);
//     box-sizing: border-box;
// }
// .fc .fc-multimonth-daygrid{
//     border-right: 1px solid var(--grey-50);
//     border-left: 1px solid var(--grey-50);
//     border-bottom: 1px solid var(--grey-50);
//     box-sizing: border-box;
// }
// .fc-scrollgrid-sync-inner{
//     /* max-width: 56px; */
//     /* width: 56px;
//     height: 56px; */
// }
// .fc-theme-standard td, .fc-theme-standard th{
//     width: 56px;
//     height: 56px;
//     min-height: unset;
//     vertical-align: middle;
//     border: 0;
//     padding: 8px;
// }
// .fc .fc-col-header-cell-cushion{
//     padding: 0;
//     color: var(--grey-600);
//     font-size: 12px;
//     font-weight: 400;
//     line-height: 16px; /* 133.333% */
// }
// .fc .fc-daygrid-day-frame{
//     /* margin: 8px; */
// }
// .fc .fc-daygrid-day-number{
//     width: 56px;
//     height: 56px;
//     display: flex;
//     justify-content: center;
//     align-items: center;
//     padding: 0;
// }

// .fc-direction-ltr{
//     position: relative;
//     width: 100%;
// }
// .fc .fc-button {
//     background-color: transparent;
//     border: 1px solid transparent;
//     border-radius: 0.25em;
//     display: inline-block;
//     font-size: 1em;
//     font-weight: 400;
//     line-height: 1.5;
//     padding: 0;
//     text-align: center;
//     user-select: none;
//     vertical-align: middle;
// }
// .fc .fc-button-primary {
//     background-color: transparent;
//     border-color: transparent;
//     color: #000;
// }
// .fc-next-button.fc-button.fc-button-primary{
//     position: absolute;
//     right: 20px;
// }
// .fc-prev-button.fc-button.fc-button-primary{
//     position: absolute;
//     left: 20px;
// }
// .fc .fc-button .fc-icon{
//     font-size: 20px;
// }