package pict_admin.web;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@GetMapping(value = "closedDateById.do")
	public CalendarVo findClosedDateByDate(@RequestParam(value="id") int id) {
		return calendarService.findClosedDateById(id);
	}
	
	@PostMapping(value = "saveClosedDate.do")
	public void saveClosedDate(@RequestBody CalendarVo vo) {
		calendarService.saveClosedDate(vo);
	}
	
	@PostMapping(value = "deleteClosedDate.do")
	public void deleteClosedDate(@RequestParam(value="id") int id) {
		calendarService.deleteClosedDate(id);
	}
}
