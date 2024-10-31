package pict_admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;
import org.springframework.mail.MailMessage;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import pict_admin.service.PictService;
import pict_admin.service.PictVO;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;

import javax.mail.Authenticator;
import javax.mail.internet.MimeMessage;

import javax.mail.MessagingException;
@Controller
@EnableScheduling
@Configuration
public class Scheduler {
	@Resource(name = "pictService")
	private PictService pictService;
	
	//도메인 만료일에 따른 잔디 웹훅 발송
	
    @Scheduled(cron = "0 28 13 * * *")//매일 오전 9시
	//@Scheduled(cron = "0/5 * * * * *")
    public void jandi() throws Exception{
    	/*
    	PictVO pictVO = null;
    	List<Map<String, Object>> jandiList = pictService.get_overdue_list();
    	String html = "";
		html += "연체 내역 리스트 \n";
    	for(int i=0; i<jandiList.size(); i++) {
    		String equip_type = "";
    		String equip_num = "";
    		String equip_name = "";
    		String per_name = "";
    		String per_mobile = "";
    		
    		equip_type = jandiList.get(i).get("equipment_type") != null ? (String) jandiList.get(i).get("equipment_type") : "";
    		equip_num = jandiList.get(i).get("serial_number") != null ? (String) jandiList.get(i).get("serial_number") : "";
    		equip_name = jandiList.get(i).get("equipment_name") != null ? (String) jandiList.get(i).get("equipment_name") : "";
    		per_name = jandiList.get(i).get("user_name") != null ? (String) jandiList.get(i).get("user_name") : "";
    		per_mobile = jandiList.get(i).get("user_mobile") != null ? (String) jandiList.get(i).get("user_mobile") : "";
    		
    		
    		html += "장비 종류: " + equip_type + " 장비 시리얼넘버 : " + equip_num + " 장비 명칭 :" + equip_name + " 대여자 성명 : " + per_name + "대여자 연락처 : " + per_mobile;
    		
    	}
    	
    	mailsend("연체 내역리스트 이메일발송 ", html);
    	
    	
    	System.out.println("서비스가 돌고있으면 탈것");
    	*/
    	
    }
  	public void mailsend(String subejct, String body) throws Exception{
  		String host = "smtp.naver.com";
		String user = "gica_@naver.com";
		String password = "wlsgmddnjs-24";
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", "smtp.naver.com");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("lovefinecom@naver.com"));
			message.setSubject(subejct);
			message.setText(body);
			Transport.send(message);
			System.out.println("Success Message Send");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
  	} 

	
}