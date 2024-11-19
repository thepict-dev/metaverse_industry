package pict_admin.web;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.utill.ResultReturn;

import pict_admin.service.CalendarVo;
import pict_admin.service.impl.CalendarServiceImpl;

@RestController
@RequestMapping(value = "calendar")
public class CalendarController {
	private CalendarServiceImpl calendarService;
	
	public CalendarController(CalendarServiceImpl calendarService) {
		this.calendarService = calendarService;
	}

	@GetMapping(value = "closedDate.do")
	public ResultReturn<List<CalendarVo>> findClosedDate() {
		List<CalendarVo> CalendarList = calendarService.findClosedDate();
		// 등록된 휴관 일정 전달
		return new ResultReturn<List<CalendarVo>>(CalendarList.size(), CalendarList);
	}
	
	@PostMapping(value = "saveClosedDate.do")
	public void saveClosedDate(@RequestBody List<CalendarVo> vo) {
		calendarService.saveClosedDate(vo);
	}
}
