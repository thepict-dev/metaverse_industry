package pict_admin.service;

import java.time.LocalDateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.utill.date.LocalDateTimeSerializer;
import com.utill.date.LocalDateTimeDeserializer;

public class CalendarVo {
	private int id;
	private String title;
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
	private LocalDateTime date;
	
	public CalendarVo() {}
	
	public CalendarVo(int id, String title, LocalDateTime date) {
		super();
		this.id = id;
		this.title = title;
		// 시간은 00:00 으로 저장
		this.date = date.toLocalDate().atStartOfDay();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public LocalDateTime getDate() {
		return date;
	}
	public void setDate(LocalDateTime date) {
		// 시간은 00:00 으로 저장
		this.date = date.toLocalDate().atStartOfDay();
	}
}
