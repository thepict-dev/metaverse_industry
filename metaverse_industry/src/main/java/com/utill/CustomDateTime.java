package com.utill;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class CustomDateTime {
	
	public static String dateFormat(String format) {
		return LocalDate.now().format(DateTimeFormatter.ofPattern(format));
	}

	public static String timeFormat(String format) {
		return LocalTime.now().format(DateTimeFormatter.ofPattern(format));
	}

	public static String changeFormat(String format, String date) {
		return LocalTime.now().format(DateTimeFormatter.ofPattern(format));
	}
	
	public static String formatFromDate(String format, Date inputDate) throws ParseException {
		return new SimpleDateFormat(format).format(inputDate);
	}
	
	public static String formatFromString(String formatFrom, String inputDate, String formatTo) throws ParseException {
        SimpleDateFormat inputFormat = new SimpleDateFormat(formatFrom);
        Date date = inputFormat.parse(inputDate);
        SimpleDateFormat outputFormat = new SimpleDateFormat(formatTo);
        String formattedDate = outputFormat.format(date);
        return formattedDate;
	}
}
