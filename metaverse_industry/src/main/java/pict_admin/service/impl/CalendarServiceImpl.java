package pict_admin.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pict_admin.service.CalendarVo;

@Service
public class CalendarServiceImpl {
	private CalendarMapper calendarMapper;
	
	public CalendarServiceImpl(CalendarMapper calendarMapper) {
		this.calendarMapper = calendarMapper;
	}

	@Transactional
	public List<CalendarVo> findClosedDate() {
		return calendarMapper.findClosedDate();
	}

	@Transactional
	public void saveClosedDateOnlyOne(CalendarVo vo) {
		calendarMapper.saveClosedDate(vo);
	}

	@Transactional
	public void saveClosedDate(List<CalendarVo> vo) {
		for(CalendarVo cv : vo) {
			cv.setInsertDate(cv.getDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			// 캘린더에 저장하려는 날짜가 있다면 저장하지 않고 넘어감.
			if(Optional.ofNullable(calendarMapper.findClosedDateByDate(cv)).isPresent()) continue;
			calendarMapper.saveClosedDate(cv);
		}
	}
}
