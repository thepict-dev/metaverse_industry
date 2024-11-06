package com.utill.excel;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import pict_admin.service.PictVO;

public class Excel {
	public static void download(HttpServletResponse response, List<PictVO> data, String flag) {
        XSSFWorkbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("관리대장");
        LocalDate now = LocalDate.now();
        int rowCount = 0;
        
        Row headerRow = sheet.createRow(rowCount++);
        
        if(flag.equalsIgnoreCase("eq")) {
            headerRow.createCell(0).setCellValue("순서");
            headerRow.createCell(1).setCellValue("대여 상태");
            headerRow.createCell(2).setCellValue("신청일");
            headerRow.createCell(3).setCellValue("대여일(신청)");
            headerRow.createCell(4).setCellValue("반납일(신청)");
            headerRow.createCell(5).setCellValue("대여자 성명");
            headerRow.createCell(6).setCellValue("구분");
            headerRow.createCell(7).setCellValue("장비명");
            headerRow.createCell(8).setCellValue("대여형태");
            
            for(PictVO vo : data) {
                Row bodyRow = sheet.createRow(rowCount++);
                bodyRow.createCell(0).setCellValue(vo.getIdx());
                bodyRow.createCell(1).setCellValue(vo.getRequest_status());
                bodyRow.createCell(2).setCellValue(vo.getRequest_date());
                bodyRow.createCell(3).setCellValue(vo.getRental_start_date());
                bodyRow.createCell(4).setCellValue(vo.getRental_end_date());
                bodyRow.createCell(5).setCellValue(vo.getUser_name());
                bodyRow.createCell(6).setCellValue(vo.getEquipment_type());
                bodyRow.createCell(7).setCellValue(vo.getName());
                bodyRow.createCell(8).setCellValue(vo.getType() == "1" ? "개인" : "기업");
                response.setHeader("Content-Disposition", "attachment;filename=EquipmentManagement_"+ now.format(DateTimeFormatter.ofPattern("yyyyMMdd")) +".xlsx");
            }
        } else {
            headerRow.createCell(0).setCellValue("순서");
            headerRow.createCell(1).setCellValue("대여 상태");
            headerRow.createCell(2).setCellValue("신청일");
            headerRow.createCell(3).setCellValue("대여일(신청)");
            headerRow.createCell(4).setCellValue("반납일(신청)");
            headerRow.createCell(5).setCellValue("대여자 성명");
            headerRow.createCell(6).setCellValue("시설명");
            headerRow.createCell(7).setCellValue("대여형태");
            
            for(PictVO vo : data) {
                Row bodyRow = sheet.createRow(rowCount++);
                bodyRow.createCell(0).setCellValue(vo.getIdx());
                bodyRow.createCell(1).setCellValue(vo.getRequest_status());
                bodyRow.createCell(2).setCellValue(vo.getRequest_date());
                bodyRow.createCell(3).setCellValue(vo.getRental_start_date());
                bodyRow.createCell(4).setCellValue(vo.getRental_end_date());
                bodyRow.createCell(5).setCellValue(vo.getUser_name());
                bodyRow.createCell(6).setCellValue(vo.getName());
                bodyRow.createCell(7).setCellValue(vo.getType() == "1" ? "개인" : "기업");
                response.setHeader("Content-Disposition", "attachment;filename=FacilityManagement_"+ now.format(DateTimeFormatter.ofPattern("yyyyMMdd")) +".xlsx");
            }
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
