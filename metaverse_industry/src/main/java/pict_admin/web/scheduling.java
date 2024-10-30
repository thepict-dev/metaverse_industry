package pict_admin.web;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import pict_admin.service.PictService;

@Controller
@EnableScheduling
@Configuration
public class scheduling {
	@Resource(name = "pictService")
	private PictService pictService;
	
	@Scheduled(cron ="0 0 9 * * *") // 매일 오전 9시
	public void send_overdue_email() throws Exception {
		
	}
}
