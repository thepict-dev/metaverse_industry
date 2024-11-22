package pict_admin.service.impl;

import java.util.List;

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
	public CalendarVo findClosedDateById(int id) {
		return calendarMapper.findClosedDateById(id);
	}

	@Transactional
	public void saveClosedDate(CalendarVo vo) {
		calendarMapper.saveClosedDate(vo);
	}

	@Transactional
	public void deleteClosedDate(int id) {
		calendarMapper.deleteClosedDate(id);
	}
}
