package pict_admin.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import pict_admin.service.CalendarVo;

@Mapper("calendarMapper")
public interface CalendarMapper {
	List<CalendarVo> findClosedDate();
	
	CalendarVo findClosedDateById(int id);

	void updateClosedDate(CalendarVo vo);

	void saveClosedDate(CalendarVo vo);

	void deleteClosedDate(int id);
}
