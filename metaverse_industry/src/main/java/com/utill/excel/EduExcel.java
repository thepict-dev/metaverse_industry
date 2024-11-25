package com.utill.excel;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class EduExcel {
	public static void download(HttpServletResponse response, List<Map<String, Object>> data) {
        XSSFWorkbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("교육신청목록");
        LocalDate now = LocalDate.now();
        int rowCount = 0;
        
        Row headerRow = sheet.createRow(rowCount++);
        
        headerRow.createCell(0).setCellValue("순서");
        headerRow.createCell(1).setCellValue("단체명(학교명)");
        headerRow.createCell(2).setCellValue("이름(담당자)");
        headerRow.createCell(3).setCellValue("전화번호");
        headerRow.createCell(4).setCellValue("상태");
        
        for(Map<String, Object> vo : data) {
            Row bodyRow = sheet.createRow(rowCount++);
            bodyRow.createCell(0).setCellValue(vo.get("idx").toString());
            bodyRow.createCell(1).setCellValue(vo.get("school").toString());
            bodyRow.createCell(2).setCellValue(vo.get("user_name").toString());
            bodyRow.createCell(3).setCellValue(vo.get("mobile").toString());
            
            switch(vo.get("request_status").toString()) {
            case "pendding":
                bodyRow.createCell(4).setCellValue("승인대기");
            	break;
            case "approved":
                bodyRow.createCell(4).setCellValue("승인");
            	break;
            case "rejected":
                bodyRow.createCell(4).setCellValue("거절");
            	break;
            }
            response.setHeader("Content-Disposition", "attachment;filename=Edu_"+ now.format(DateTimeFormatter.ofPattern("yyyyMMdd")) +".xlsx");
        }
        
        response.setContentType("ms-vnd/excel");
        
        try {
            wb.write(response.getOutputStream());
            wb.close();
        } catch (Exception e) {
            e.getMessage();
        }
	}

}
