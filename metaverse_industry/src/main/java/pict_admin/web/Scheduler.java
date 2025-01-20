package pict_admin.web;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Properties;
import javax.annotation.Resource;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.utill.html.HtmlStructure;

import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.MessagingException;

@Controller
@EnableScheduling
@Configuration
public class Scheduler {
	@Resource(name = "pictService")
	private PictService pictService;
    
	//도메인 만료일에 따른 잔디 웹훅 발송
    @Scheduled(cron = "0 0 9 * * *")//매일 오전 9시
    public void jandi() throws Exception{
		StringBuffer sb = new StringBuffer();
    	List<PictVO> dailyMailList = pictService.daily_mail_list();
    	if (dailyMailList.size() != 0) {
    		sb.append(HtmlStructure.divOpen("infoTable", "", "width: 100%; max-width: 1200px;"));
    		sb.append(HtmlStructure.tableOpen("width: 100%; border-collapse: collapse;"));
    		sb.append(HtmlStructure.colgroup("15", "15", "15", "15", "30", "10"));
    		sb.append(HtmlStructure.theadOpen());
    		sb.append(HtmlStructure.trOpen());
    		sb.append(HtmlStructure.th("vertical-align: middle; background-color: #171c61; text-align: center; padding: 16px 0; color: #fff; font-size: 16px; font-weight: 500; line-height: 100%; letter-spacing: -1px;"
    				, "대여자", "대여형태", "대여일자", "반납일자", "대여장비명", "시리얼 넘버"));
    		sb.append(HtmlStructure.trClose());
    		sb.append(HtmlStructure.theadClose());
    		sb.append(HtmlStructure.tbodyOpen());
    		
    		for(PictVO vo : dailyMailList) {
    			sb.append(HtmlStructure.trOpen());
    			sb.append(HtmlStructure.td(
    					"padding: 16px 0; text-align: center; font-size: 16px; font-weight: 500; line-height: 140%; letter-spacing: -1px; background-color: #fff; vertical-align: middle; border-bottom: 1px solid #dbdee2;"
    					, vo.getUser_name(), vo.getType() == "1" ? "개인" : "법인", vo.getRental_start_date(), vo.getRental_end_date(), vo.getEquipment_type(), vo.getSerial_number()));
    			sb.append(HtmlStructure.trClose());
    			
    			// 메일 보내는 데이터 백업
    			pictService.mailingBackup(vo.getUser_name().toString() + ", " + vo.getType() == "1" ? "개인" : "법인" + ", " + vo.getRental_start_date().toString() + ", " + vo.getRental_end_date().toString() + ", " + vo.getEquipment_type().toString() + ", " + vo.getSerial_number().toString());
    		}

    		sb.append(HtmlStructure.tbodyClose());
    		sb.append(HtmlStructure.tableClose());
    		sb.append(HtmlStructure.divClose());
    		String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    		String title = today + "반납/반출/연체 리스트 이메일 발송";
        	mailsend(title, sb.toString());	
    	}
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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("VRAR@gica.or.kr"));
			message.setSubject(subejct);
			message.setText(body, "UTF-8", "html");
			Transport.send(message);
			System.out.println("Success Message Send");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
  	}
}