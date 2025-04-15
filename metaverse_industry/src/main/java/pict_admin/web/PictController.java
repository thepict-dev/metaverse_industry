package pict_admin.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Properties;
import java.util.UUID;
import java.util.stream.IntStream;

import javax.mail.PasswordAuthentication;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.UserService;
import pict_admin.service.UserVO;
import pict_admin.service.AdminService;
import pict_admin.service.AdminVO;
import pict_admin.service.PdfDownVO;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONArray;
import org.json.JSONObject;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.security.UserRole;
import com.utill.FileManagement;
import com.utill.SessionHandler;
import com.utill.date.CustomDateTime;
import com.utill.excel.EduExcel;
import com.utill.excel.Excel;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Transport;



@Controller
public class PictController {
	PasswordAuthentication pa;

	@Resource(name = "pictService")
	private PictService pictService;

	@Resource(name = "adminService")
	private AdminService adminService;

	@Resource(name = "userService")
	private UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/lending.do")
	public String lending(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		pictVO.setLimit_cnt(3);
		List<?> notice_list = pictService.board_list(pictVO);
		model.addAttribute("noticeList", notice_list);
		pictVO.setOrder_by("true");
		List<?> popup_list = pictService.get_popup_list(pictVO);
		Map<String, Object> setting = pictService.get_url_settings(pictVO);
		model.addAttribute("setting", setting);
		model.addAttribute("popupList", popup_list);
		model.addAttribute("totalCnt", popup_list.size());
		return "pict/user/user_main";
	}

	@RequestMapping(value = "/user_login.do")
	public String user_login_page(@ModelAttribute("searchVO") UserVO UserVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);

		return "pict/user/user_login";
	}

	@RequestMapping(value = "/user_logout.do")
	public String user_logout(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model)
			throws Exception {
		request.getSession().setAttribute("id", null);
		request.getSession().setAttribute("name", null);
		request.getSession().setAttribute("role", null);

		return "redirect:/";

	}

	@RequestMapping(value = "/login_action.do")
	public String user_login_action(@ModelAttribute("searchVO") UserVO UserVO, HttpServletRequest request,
			ModelMap model) throws Exception {
		// 처음 드러와서 세션에 정보있으면 메인으로 보내줘야함
		String inpuId = UserVO.getUser_id();
		String inputPw = UserVO.getPassword();
		System.out.println("inputPw :::::" + inputPw);
		UserVO = userService.getUserInfo(UserVO);
		if (UserVO != null && UserVO.getUser_id() != null) {
			String user_id = UserVO.getUser_id();
			String enpassword = encryptPassword(inputPw, inpuId); // 입력비밀번호
			if (enpassword.equals(UserVO.getPassword())) {
				request.getSession().setAttribute("id", user_id);
				request.getSession().setAttribute("name", UserVO.getName());
				request.getSession().setAttribute("role", UserRole.MEMBER);

				String ip = request.getRemoteAddr();
				DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String now = format2.format(Calendar.getInstance().getTime());

				request.getSession().setMaxInactiveInterval(3600);
				// adminVO.setLast_login_ip(ip);
				// adminVO.setLast_login_date(now);
				// adminService.insert_login_info(adminVO);
				//
				// adminVO.setAdminId(user_id);
				// adminVO = adminService.get_user_info(adminVO);
				//
				return "redirect:/";
				//
			} else {
				model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/user_login.do");
				return "pict/main/message";
			}
		} else {
			model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/user_login.do");
			return "pict/main/message";
		}
	}

	@RequestMapping(value = "/join.do")
	public String join(@ModelAttribute("searchVO") UserVO UserVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		model.addAttribute("userVO", UserVO);
		return "pict/user/join";
	}

	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
	public String signUP(@ModelAttribute("searchVO") UserVO userVO, ModelMap model, MultipartHttpServletRequest request) throws Exception {

		try {
			// 비밀번호 암호
			String enpassword = encryptPassword(userVO.getPassword(), userVO.getUser_id()); // 입력비밀번호
			userVO.setPassword(enpassword);
			userService.signUp(userVO);
			model.addAttribute("message", "회원가입이 완료되었습니다. 로그인해주세요.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/user_login.do");
			return "pict/main/message";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "회원가입을 실패하셨습니다. 다시 시도해주세요.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/join.do");
			return "pict/main/message";
		}
	}

	@RequestMapping(value = "/login_done.do")
	public String login_done(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		
		return "pict/user/login_done";
	}

	// 센터소개
	@RequestMapping(value = "/intro.do")
	public String intro(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		return "pict/user/intro";
	}

	// 지원사업
	@RequestMapping(value = "/support.do")
	public String support(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		Map<String, Object> setting = pictService.get_url_settings(pictVO);
		model.addAttribute("setting", setting);

		return "pict/user/support";
	}

	// 장비대여
	@RequestMapping(value = "/equipment.do")
	public String equipment(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		// 관리자 -> 포탈 장비/시설 예약 페이지 접근 시, 관리자 인지 얼러트
		if(UserRole.adminValidationOptional(request)) model.addAttribute("role", UserRole.ADMIN);
		
		pictVO.setOnlyAvailable(true);
		if(StringUtils.hasText((String) session.getAttribute("id"))) pictVO.setUser_id((String) session.getAttribute("id"));
		
		if (pictVO.getType() != null) {
		    String type = pictVO.getType();
		    String newType = "";
		    
		    if ("hmd".equals(type)) {
		        newType = "HMD";
		        pictVO.setType(newType);
		    } else if ("ar".equals(type)) {
		        newType = "AR글래스";
		        pictVO.setType(newType);
		    } else if ("motion".equals(type)) {
		        newType = "모션캡처";
		        pictVO.setType(newType);
		    } else if ("camera".equals(type)) {
		        newType = "360카메라";
		        pictVO.setType(newType);
		    } else if ("scanner".equals(type)) {
		        newType = "3D스캐너";
		        pictVO.setType(newType);
		    } else if ("else".equals(pictVO.getType())) {
		        newType = "기타";
		        pictVO.setType(newType);
		    }
		}
		List<PictVO> equipment_list = pictService.equipment_list(pictVO);
		model.addAttribute("resultList", equipment_list);
		model.addAttribute("size", equipment_list.size());
		model.addAttribute("pictVO", pictVO);
		return "pict/user/equipment";
	}

	// 장비대여 정보입력
	@RequestMapping(value = "/equipment_rental.do")
	public String equipment_rental(@ModelAttribute("searchVO") PictVO pictVO,
			@RequestParam Map<String, String> allParams, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "") {
			return "redirect:/user_login.do";
		}
		
		if(UserRole.adminValidation(request)) {
			request.getSession().setAttribute("id", null);
			request.getSession().setAttribute("name", null);
			request.getSession().setAttribute("role", null);
		}       

	    // 사용자 정보 조회 추가
	    UserVO userVO = new UserVO();
	    userVO.setUser_id(sessions);
	    UserVO userInfo = userService.getUserInfo(userVO);
	    model.addAttribute("user_info", userInfo);  // 모델에 사용자 정보 추가
	    
		List<Map<String, Object>> equipmentList = new ArrayList<>();
		for (int i = 0;; i++) {
			String id = allParams.get("equipment[" + i + "][id]");
			String count = allParams.get("equipment[" + i + "][count]");
			String type = allParams.get("equipment[" + i + "][type]");
			String name = allParams.get("equipment[" + i + "][name]");
			if (id == null || count == null || type == null || name == null) {
				break;
			}

			Map<String, Object> equipment = new HashMap<>();
			equipment.put("id", id);
			equipment.put("count", count);
			equipment.put("type", type);
			equipment.put("name", name);

			// 여기서 장비 정보를 데이터베이스에서 조회할 수 있습니다.
			// 예: EquipmentVO equipmentInfo = equipmentService.getEquipmentById(id);
			// equipment.put("name", equipmentInfo.getName());
			// equipment.put("type", equipmentInfo.getType());

			equipmentList.add(equipment);
		}

		model.addAttribute("resultList", equipmentList);
		return "pict/user/equipment_rental";
	}

	// 시설예약
	@RequestMapping(value = "/facility.do")
	public String facility(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		// 관리자 -> 포탈 장비/시설 예약 페이지 접근 시, 관리자 인지 얼러트
		if(UserRole.adminValidationOptional(request)) model.addAttribute("role", UserRole.ADMIN);
		
		pictVO.setOnlyAvailable(true);
		List<?> facility_list = pictService.facility_list(pictVO);
		model.addAttribute("resultList", facility_list);
		model.addAttribute("size", facility_list.size());
		model.addAttribute("pictVO", pictVO);

		return "pict/user/facility";
	}

	// 시설예약 정보입력
	@RequestMapping(value = "/facility_rental.do")
	public String facility_rental(@ModelAttribute("searchVO") PictVO pictVO,
			@RequestParam Map<String, String> allParams, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "") {
			return "redirect:/user_login.do";
		}
	    // 사용자 정보 조회 추가
	    UserVO userVO = new UserVO();
	    userVO.setUser_id(sessions);
	    UserVO userInfo = userService.getUserInfo(userVO);
	    model.addAttribute("user_info", userInfo);  // 모델에 사용자 정보 추가

		List<Map<String, Object>> facilityList = new ArrayList<>();

		for (int i = 0;; i++) {
			String id = allParams.get("equipment[" + i + "][id]");
			String count = allParams.get("equipment[" + i + "][count]");
			String name = allParams.get("equipment[" + i + "][name]");
			if (id == null || count == null || name == null) {
				break;
			}

			Map<String, Object> facility = new HashMap<>();
			facility.put("id", id);
			facility.put("count", count);
			facility.put("name", name);

			// 여기서 장비 정보를 데이터베이스에서 조회할 수 있습니다.
			// 예: EquipmentVO equipmentInfo = equipmentService.getEquipmentById(id);
			// equipment.put("name", equipmentInfo.getName());
			// equipment.put("type", equipmentInfo.getType());

			facilityList.add(facility);
		}

		model.addAttribute("resultList", facilityList);
		return "pict/user/facility_rental";
	}

	// 현장체험교육
	@RequestMapping(value = "/education.do")
	public String education(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		model.addAttribute("pictVO", pictVO);

		return "pict/user/education";
	}

	@RequestMapping("/submit_education.do")
	@ResponseBody
	public HashMap<String, Object> submit_education(@ModelAttribute("searchVO") PictVO pictVO,
			HttpServletRequest request, @RequestParam(required = false) MultipartFile file) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");

		HashMap<String, Object> map = new HashMap<String, Object>();
		pictVO.setUser_id(sessions);

		try {
			pictService.request_education(pictVO);
			map.put("msg", "ok");
			String subject = "[교육신청알림]" + pictVO.getTeam() + "에서 신청서를 작성했습니다."; 
			mailsend(subject, "관리자 페이지에서 신청서를 확인하세요.");
		} catch (Exception e) {
			map.put("msg", "fail");
			e.printStackTrace();
		}
		return map;
		// userVO = userService.isUserIdAvailable(userVO);
		// userVO.getName();
		// 중
//      if (userVO != null) {
//          map.put("rst", false);
//          return map;
//      }
//      // 가입가
//      else {
//          map.put("rst", true);
//          return map;
//      }
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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("vrar@gica.co.kr"));
			message.setSubject(subejct);
			message.setText(body, "UTF-8", "html");
			Transport.send(message);
			System.out.println("Success Message Send");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
  	}

	// 공지사항
	@RequestMapping(value = "/notice.do")
	public String notice(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계��이면 세션 삭제
		SessionHandler.deleteAdmin(request);

		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		Integer totalCnt = pictService.board_list_total_cnt(pictVO);
		int lastPageValue = (int) (Math.ceil(totalCnt * 1.0 / 10));
		System.out.println("startNum @@@@@@@@@@@@@@@@@@ " + startNum);
		System.out.println("totalCnt @@@@@@@@@@@@@@@@@@ " + totalCnt);
		System.out.println("lastPageValue @@@@@@@@@@@@@@@@@@ " + lastPageValue);
		pictVO.setLastPage(lastPageValue);

		Integer s_page = pageNum - 4;
		Integer e_page = pageNum + 5;
		if (s_page <= 0) {
			s_page = 1;
			e_page = 10;
		}
		if (e_page > lastPageValue) {
			e_page = lastPageValue;
		}
		pictVO.setStartPage(s_page);
		System.out.println("s_page @@@@@@@@@@@@@@@@@@ " + s_page);
		pictVO.setEndPage(e_page);
		System.out.println("e_page @@@@@@@@@@@@@@@@@@ " + e_page);

		List<?> notice_list = pictService.board_list(pictVO);
		model.addAttribute("noticeList", notice_list);
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("board_cnt", totalCnt);
		return "pict/user/notice";
	}

	// 공지사항 뷰
	@RequestMapping(value = "/notice_view.do")
	public String notice_view(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		if (pictVO.getIdx() == 0) {
			return "redirect:/notice.do";
		}
		PictVO notice = pictService.board_list_one(pictVO);

		System.out.println("notice @@@@@@@@@@@@@@ " + notice);
		model.addAttribute("noticeResult", notice);

		return "pict/user/notice_view";
	}

	// 공지사항
	@RequestMapping(value = "/biz_post.do")
	public String biz_post(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		Integer totalCnt = pictService.biz_list_total_cnt(pictVO);
		int lastPageValue = (int) (Math.ceil(totalCnt * 1.0 / 10));
		System.out.println("startNum @@@@@@@@@@@@@@@@@@ " + startNum);
		System.out.println("totalCnt @@@@@@@@@@@@@@@@@@ " + totalCnt);
		System.out.println("lastPageValue @@@@@@@@@@@@@@@@@@ " + lastPageValue);
		pictVO.setLastPage(lastPageValue);

		Integer s_page = pageNum - 4;
		Integer e_page = pageNum + 5;
		if (s_page <= 0) {
			s_page = 1;
			e_page = 10;
		}
		if (e_page > lastPageValue) {
			e_page = lastPageValue;
		}
		pictVO.setStartPage(s_page);
		System.out.println("s_page @@@@@@@@@@@@@@@@@@ " + s_page);
		pictVO.setEndPage(e_page);
		System.out.println("e_page @@@@@@@@@@@@@@@@@@ " + e_page);

		List<?> notice_list = pictService.biz_list(pictVO);
		model.addAttribute("noticeList", notice_list);
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("board_cnt", totalCnt);
		return "pict/user/biz_post";
	}

	// 공지사항 뷰
	@RequestMapping(value = "/biz_post_view.do")
	public String biz_post_view(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		if (pictVO.getIdx() == 0) {
			return "redirect:/biz_post.do";
		}
		PictVO notice = pictService.board_list_one(pictVO);

		System.out.println("notice @@@@@@@@@@@@@@ " + notice);
		model.addAttribute("noticeResult", notice);
		return "pict/user/biz_post_view";
	}

	public String user_login(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/user/user_login";
	}

	// 마이페이지
	// 계정관리
	@RequestMapping(value = "/mypage_account.do")
	public String mypage_account(@ModelAttribute("searchVO") UserVO userVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "") {
			return "redirect:/user_login.do";
		}
		userVO.setUser_id(sessions);
		UserVO userInfo = userService.getUserInfo(userVO);
		model.addAttribute("user_info", userInfo);
		return "pict/user/mypage_account";
	}

	// 장비 예약정보
	@RequestMapping(value = "/mypage_equip.do")
	public String mypage_equip(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "") {
			return "redirect:/user_login.do";
		}
		pictVO.setUser_id(sessions);

		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		Integer totalCnt = userService.get_request_total_cnt(pictVO);
		int lastPageValue = (int) (Math.ceil(totalCnt * 1.0 / 10));
		System.out.println("startNum @@@@@@@@@@@@@@@@@@ " + startNum);
		System.out.println("totalCnt @@@@@@@@@@@@@@@@@@ " + totalCnt);
		System.out.println("lastPageValue @@@@@@@@@@@@@@@@@@ " + lastPageValue);
		pictVO.setLastPage(lastPageValue);

		Integer s_page = pageNum - 4;
		Integer e_page = pageNum + 5;
		if (s_page <= 0) {
			s_page = 1;
			e_page = 10;
		}
		if (e_page > lastPageValue) {
			e_page = lastPageValue;
		}
		pictVO.setStartPage(s_page);
		System.out.println("s_page @@@@@@@@@@@@@@@@@@ " + s_page);
		pictVO.setEndPage(e_page);
		System.out.println("e_page @@@@@@@@@@@@@@@@@@ " + e_page);

		System.out.println("request_status @@@@@@@@@@@@@@ " + pictVO.getRequest_status());
		List<?> my_request_list = userService.get_request_list(pictVO);
		String originStatus = pictVO.getRequest_status();
		// 승인 대기
		pictVO.setRequest_status("pendding");
		Integer penddingCnt = userService.get_request_total_cnt(pictVO);
		// 서류보완요청
		pictVO.setRequest_status("rejected");
		Integer rejectedCnt = userService.get_request_total_cnt(pictVO);
		// 승인완료
		pictVO.setRequest_status("approved");
		Integer approvedCnt = userService.get_request_total_cnt(pictVO);

		// 서류보완신청
		pictVO.setRequest_status("retry");
		Integer retryCnt = userService.get_request_total_cnt(pictVO);

		// 승인거절
		pictVO.setRequest_status("refusal");
		Integer refusalCnt = userService.get_request_total_cnt(pictVO);

		// 대여중
		pictVO.setRequest_status("rental");
		Integer rentalCnt = userService.get_request_total_cnt(pictVO);
		// 연체중
		pictVO.setRequest_status("overdue");
		Integer overdueCnt = userService.get_request_total_cnt(pictVO);
		pictVO.setRequest_status(originStatus);

		model.addAttribute("penddingCnt", penddingCnt);
		model.addAttribute("rejectedCnt", rejectedCnt);
		model.addAttribute("approvedCnt", approvedCnt);
		model.addAttribute("retryCnt", retryCnt);
		model.addAttribute("refusalCnt", refusalCnt);
		model.addAttribute("rentalCnt", rentalCnt);
		model.addAttribute("overdueCnt", overdueCnt);

		model.addAttribute("request_list", my_request_list);
		model.addAttribute("pictVO", pictVO);
		return "pict/user/mypage_equip";
	}

	// 장비 반려 재신청
	@RequestMapping(value = "/retry_request.do", method = RequestMethod.POST)
	public String retry_request(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
            @RequestParam(value = "document_file1", required = false) MultipartFile attach_file1,
            @RequestParam(value = "document_file2", required = false) MultipartFile attach_file2,
            @RequestParam(value = "document_file3", required = false) MultipartFile attach_file3) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null") {
			return "redirect:/user_login.do";
		}
		pictVO.setUser_id(sessions);
		
		pictVO = pictService.findEquipmentRequestById(pictVO.getId(), pictVO.getUser_id());
		pictVO.setFile_url1(new FileManagement().upload(attach_file1, sessions, pictVO.getFile_url1()));
		pictVO.setFile_url2(new FileManagement().upload(attach_file2, sessions, pictVO.getFile_url2()));
		pictVO.setFile_url3(new FileManagement().upload(attach_file3, sessions, pictVO.getFile_url3()));

		userService.retryRequest(pictVO);
		model.addAttribute("message", "정상적으로 수정되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/mypage_equip.do");
		return "pict/main/message";
	}

	// 시설 예약정보
	@RequestMapping(value = "/mypage_facil.do")
	public String mypage_facil(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "") {
			return "redirect:/user_login.do";
		}
		pictVO.setUser_id(sessions);

		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		Integer totalCnt = userService.get_facility_request_total_cnt(pictVO);
		int lastPageValue = (int) (Math.ceil(totalCnt * 1.0 / 10));
		System.out.println("startNum @@@@@@@@@@@@@@@@@@ " + startNum);
		System.out.println("totalCnt @@@@@@@@@@@@@@@@@@ " + totalCnt);
		System.out.println("lastPageValue @@@@@@@@@@@@@@@@@@ " + lastPageValue);
		pictVO.setLastPage(lastPageValue);

		Integer s_page = pageNum - 4;
		Integer e_page = pageNum + 5;
		if (s_page <= 0) {
			s_page = 1;
			e_page = 10;
		}
		if (e_page > lastPageValue) {
			e_page = lastPageValue;
		}
		pictVO.setStartPage(s_page);
		System.out.println("s_page @@@@@@@@@@@@@@@@@@ " + s_page);
		pictVO.setEndPage(e_page);
		System.out.println("e_page @@@@@@@@@@@@@@@@@@ " + e_page);

		System.out.println("request_status @@@@@@@@@@@@@@ " + pictVO.getRequest_status());
		List<?> my_request_list = userService.get_facility_request_list(pictVO);
		String originStatus = pictVO.getRequest_status();
		// 승인 대기
		pictVO.setRequest_status("pendding");
		Integer penddingCnt = userService.get_facility_request_total_cnt(pictVO);
		// 서류보완요청
		pictVO.setRequest_status("rejected");
		Integer rejectedCnt = userService.get_facility_request_total_cnt(pictVO);
		// 승인완료
		pictVO.setRequest_status("approved");
		Integer approvedCnt = userService.get_facility_request_total_cnt(pictVO);

		// 서류보완신청
		pictVO.setRequest_status("retry");
		Integer retryCnt = userService.get_facility_request_total_cnt(pictVO);

		// 승인거절
		pictVO.setRequest_status("refusal");
		Integer refusalCnt = userService.get_facility_request_total_cnt(pictVO);

		// 대여중
		pictVO.setRequest_status("rental");
		Integer rentalCnt = userService.get_facility_request_total_cnt(pictVO);
		// 연체중
		pictVO.setRequest_status("overdue");
		Integer overdueCnt = userService.get_facility_request_total_cnt(pictVO);
		pictVO.setRequest_status(originStatus);

		model.addAttribute("penddingCnt", penddingCnt);
		model.addAttribute("rejectedCnt", rejectedCnt);
		model.addAttribute("approvedCnt", approvedCnt);
		model.addAttribute("retryCnt", retryCnt);
		model.addAttribute("refusalCnt", refusalCnt);
		model.addAttribute("rentalCnt", rentalCnt);
		model.addAttribute("overdueCnt", overdueCnt);

		model.addAttribute("request_list", my_request_list);
		model.addAttribute("pictVO", pictVO);
		return "pict/user/mypage_facil";
	}

	// 시설 재신청
	@RequestMapping(value = "/retry_facility_request.do", method = RequestMethod.POST)
	public String retry_facility_request(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request
			, @RequestParam(value = "document_file1", required = false) MultipartFile attach_file1
			, @RequestParam(value = "document_file2", required = false) MultipartFile attach_file2
			, @RequestParam(value = "document_file3", required = false) MultipartFile attach_file3) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null") {
			return "redirect:/user_login.do";
		}
		pictVO.setUser_id(sessions);

		pictVO = pictService.findFacilityRequestById(pictVO.getId(), pictVO.getUser_id());
		pictVO.setFile_url1(new FileManagement().upload(attach_file1, sessions, pictVO.getFile_url1()));
		pictVO.setFile_url2(new FileManagement().upload(attach_file2, sessions, pictVO.getFile_url2()));
		pictVO.setFile_url3(new FileManagement().upload(attach_file3, sessions, pictVO.getFile_url3()));
		
		userService.retryFacilityRequest(pictVO);
		model.addAttribute("message", "정상적으로 수정되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/mypage_facil.do");
		return "pict/main/message";
	}

	// 장바구니
	@RequestMapping(value = "/mypage_bag.do")
	public String mypage_bag(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null") {
			return "redirect:/user_login.do";
		}

		pictVO.setUser_id(sessions);
		List<Map<String, Object>> bag_list = pictService.getBagList(pictVO);
		System.out.println("bag_list @@@@@@@@@@@@@@ " + bag_list);

		model.addAttribute("request_list", bag_list);
		model.addAttribute("pictVO", pictVO);
		return "pict/user/mypage_bag";
	}

	// 약관1
	@RequestMapping(value = "/terms1.do")
	public String terms1(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/user/terms1";
	}
	// 약관2
	@RequestMapping(value = "/terms2.do")
	public String terms2(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/user/terms2";
	}
	// 약관3
	@RequestMapping(value = "/terms3.do")
	public String terms3(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {

		return "pict/user/terms3";
	}
	
	@RequestMapping(value = "/pict_login.do")
	public String login_main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model,
			HttpServletResponse response) throws Exception {
		String userAgent = request.getHeader("user-agent");
		String sessions = (String) request.getSession().getAttribute("id");
		boolean mobile1 = userAgent.matches(
				".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*");
		if (mobile1 || mobile2) {
			// 여기 모바일일 경우
			System.out.println("피씨");
			model.addAttribute("message", "PC에서만 사용이 가능합니다.");
			model.addAttribute("retType", ":exit");
			return "pict/main/message";
		}

		System.out.println(sessions);
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "pict/main/login";
		} else {
			// 나중에 여기 계정별로 리다이렉트 분기처리
			System.out.println(sessions);
			if (!sessions.equals("finecom") && !sessions.equals("admin")) {
				System.out.println("교수님덜222");
				return "redirect:/equipment/equipment_list.do";
			} else {
				System.out.println("아래 바꾸기");
				return "redirect:/equipment/equipment_list.do";
				// return "redirect:/status/connection_status.do";
			}

		}
	}

	@RequestMapping(value = "/pict_main.do")
	public String main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model,
			HttpSession session, RedirectAttributes rttr) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		System.out.println(sessions);
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		} else {
			String user_id = (String) request.getSession().getAttribute("id");
			if (request.getSession().getAttribute("id") != null) {
				adminVO.setAdminId((String) request.getSession().getAttribute("id"));
				adminVO = adminService.get_user_info(adminVO);
				model.addAttribute("adminVO", adminVO);
			}

			// 나중에 여기 계정별로 리다이렉트 분기처리
			System.out.println(sessions);
			if (!sessions.equals("finecom") && !sessions.equals("admin")) {
				return "redirect:/equipment/equipment_list.do";
			} else {
				System.out.println("아래 바꾸기");
				return "redirect:/equipment/equipment_list.do";
			}
		}
	}

	@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("adminVO") AdminVO adminVO, HttpServletRequest request, ModelMap model)
			throws Exception {
		// 처음 드러와서 세션에 정보있으면 메인으로 보내줘야함
		String inpuId = adminVO.getAdminId();
		String inputPw = adminVO.getAdminPw();

		adminVO = adminService.get_user_info(adminVO);

		if (adminVO != null && adminVO.getId() != null && !adminVO.getId().equals("")) {
			String user_id = adminVO.getId();
			String enpassword = encryptPassword(inputPw, inpuId); // 입력비밀번호

			if (enpassword.equals(adminVO.getPassword())) {
				request.getSession().setAttribute("id", adminVO.getId());
				request.getSession().setAttribute("name", adminVO.getName());
				request.getSession().setAttribute("depart", adminVO.getDepart());
				request.getSession().setAttribute("role", UserRole.ADMIN);

				String ip = request.getRemoteAddr();
				DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String now = format2.format(Calendar.getInstance().getTime());

				adminVO.setLast_login_ip(ip);
				adminVO.setLast_login_date(now);
				adminService.insert_login_info(adminVO);

				adminVO.setAdminId(user_id);
				adminVO = adminService.get_user_info(adminVO);
				request.getSession().setMaxInactiveInterval(3600);
				return "redirect:/pict_main.do";
			} else {
				model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/pict_login.do");
				return "pict/main/message";
			}
		} else {
			model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/pict_login.do");
			return "pict/main/message";
		}
	}

	@RequestMapping(value = "/user/user_list.do")
	public String user_list(@ModelAttribute("adminVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		
		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		Integer totalCnt = pictService.facility_list_total_cnt(pictVO);
		int lastPageValue = (int) (Math.ceil(totalCnt * 1.0 / 10));
		pictVO.setLastPage(lastPageValue);

		Integer s_page = pageNum - 4;
		Integer e_page = pageNum + 5;
		if (s_page <= 0) {
			s_page = 1;
			e_page = 10;
		}
		if (e_page > lastPageValue) {
			e_page = lastPageValue;
		}
		pictVO.setStartPage(s_page);
		pictVO.setEndPage(e_page);
		
		
		model.addAttribute("search_text", pictVO.getSearch_text());

		List<?> userList = pictService.get_user_list(pictVO);
		model.addAttribute("resultList", userList);
		return "pict/main/user_list";
	}

	@RequestMapping(value = "/user_register.do")
	public String user_register(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if (adminVO.getId() != null && !adminVO.equals("")) {
			// 수정
			adminVO = adminService.user_select_one(adminVO);
			adminVO.setSaveType("update");

		} else {
			adminVO.setSaveType("insert");
		}

		model.addAttribute("adminVO", adminVO);
		return "pict/main/user_register";
	}

	@RequestMapping(value = "/user_reset.do")
	public String user_reset(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		String enpassword = encryptPassword(adminVO.getId() + "1!", adminVO.getId()); // 입력비밀번호
		adminVO.setPassword(enpassword);
		adminService.user_reset(adminVO);

		model.addAttribute("message", "비밀번호가 초기화 되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/user_list.do");
		return "pict/main/message";
	}

	@RequestMapping(value = "/user_delete.do")
	public String user_delete(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		System.out.println(adminVO.getId());
		adminService.user_delete(adminVO);

		model.addAttribute("message", "삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/user_list.do");
		return "pict/main/message";
	}

	@RequestMapping(value = "/user_save.do")
	public String user_save(@ModelAttribute("searchVO") PictVO pictVO, @ModelAttribute("adminVO") AdminVO adminVO,
			ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		System.out.println("::::::::::::::" + adminVO.getPassword());
		String enpassword = encryptPassword(adminVO.getPassword(), adminVO.getId()); // 입력비밀번호

		adminVO.setPassword(enpassword);
		String user_id = adminVO.getId();

		// 중복 계정조회
		AdminVO vo = adminVO;
		vo.setAdminId(user_id);
		vo = adminService.get_user_info(vo);

		if (adminVO.getSaveType() != null && adminVO.getSaveType().equals("update")) {
			System.out.println("업데이트::::::::::::::::::::::");
			System.out.println(adminVO.toString());
			adminService.update_user(adminVO); // user 정보 인설트
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/user_list.do");
			return "pict/main/message";
		}

		else {
			if (vo != null) {
				model.addAttribute("message", "동일한 아이디가 존재합니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/user_register.do");
				return "pict/main/message";
			}
			System.out.println("인설트::::::::::::::::::::::");

			adminService.insert_user(adminVO); // user 정보 인설트
			model.addAttribute("message", "계정발급이 완료되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/user_list.do");
			return "pict/main/message";
		}
	}

	@RequestMapping(value = "/logout.do")
	public String logout(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model)
			throws Exception {
		request.getSession().setAttribute("id", null);
		request.getSession().setAttribute("name", null);

		return "redirect:/pict_login.do";

	}

    @RequestMapping(value = "/schedule/schedule.do")
	public String schedule(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
        return "/pict/schedule/schedule";
    }
    
	// 사용자 리스트
	@RequestMapping(value = "/user_list/user_list.do")
	public String user_lists(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		
		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.usrCtn(pictVO);
		
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);
		
		List<?> userList = pictService.get_user_list(pictVO);
		model.addAttribute("resultList", userList);
		model.addAttribute("search_text", pictVO.getSearch_text());
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("size", userList.size());
		return "pict/user_list/user_list";
	}
	
	// 유저 삭제
	@RequestMapping("/user_list/user_delete.do")
	@ResponseBody
	public HashMap<String, Object> user_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		System.out.println("param @@@@" + param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			List<Integer> idxList = (List<Integer>) param.get("idx_list");

			// 리스트가 비어있지 않은 경우에만 처리
			if (idxList != null && !idxList.isEmpty()) {
				
				// 여기서 삭제 로직 처리
				// 예: pictService.deleteItems(idxList);
				for (int i = 0; i < idxList.size(); i++) {
					pictService.delete_user(idxList.get(i));
				}
				map.put("msg", "ok");
			} else {
				map.put("msg", "fail");
			}
		} catch (ClassCastException e) {
			map.put("msg", "fail");
		}

		return map;
	}

	// 공지사항
	@RequestMapping(value = "/board/board_list.do")
	public String board_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.board_list_total_cnt(pictVO);
		
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);
		
		
		List<?> board_list = pictService.board_list(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("size", board_list.size());
		model.addAttribute("pictVO", pictVO);

		return "pict/board/board_list";
	}

	@RequestMapping(value = "/board/board_register.do")
	public String board_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		if (pictVO.getIdx() != 0) {
			// 수정
			pictVO = pictService.board_list_one(pictVO);
			// 파일 이름만 담아서 화면 출력
			Optional.ofNullable(pictVO.getFile_url1()).ifPresent(pictVO::saveFileNameToFile_url1);
			Optional.ofNullable(pictVO.getFile_url2()).ifPresent(pictVO::saveFileNameToFile_url2);
			Optional.ofNullable(pictVO.getFile_url3()).ifPresent(pictVO::saveFileNameToFile_url3);
			
			pictVO.setSaveType("update");
		} else {
			pictVO.setSaveType("insert");
		}

		model.addAttribute("pictVO", pictVO);
		return "pict/board/board_register";
	}

	@RequestMapping(value = "/board/board_save.do", method = RequestMethod.POST)
	public String board_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			MultipartHttpServletRequest request,
			@RequestParam(value = "file_1", required=false) MultipartFile attach_file1,
			@RequestParam(value = "file_2", required=false) MultipartFile attach_file2,
			@RequestParam(value = "file_3", required=false) MultipartFile attach_file3)
			throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		String file_dir = "/user1/upload_file/metaverse_industry/";

		if(attach_file1.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file1, (String)request.getSession().getAttribute("id"), uuid);
			String filepath = file_dir;
			String filename = uuid+uploadPath.split("#####")[1];
			pictVO.setFile_url1(filepath+filename);
		}
		if(attach_file2.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file2, (String)request.getSession().getAttribute("id"), uuid);
			String filepath = file_dir;
			String filename = uuid+uploadPath.split("#####")[1];
			pictVO.setFile_url2(filepath+filename);
		}
		if(attach_file3.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file3, (String)request.getSession().getAttribute("id"), uuid);
			String filepath = file_dir;
			String filename = uuid+uploadPath.split("#####")[1];
			pictVO.setFile_url3(filepath+filename);
		}

		if (pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.board_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/board/board_list.do");
			return "pict/main/message";
		} else {
			pictService.board_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/board/board_list.do");
			return "pict/main/message";
		}
	}

	@RequestMapping(value = "/board/board_delete.do")
	public String board_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		pictService.board_delete(pictVO);

		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/board/board_list.do");
		return "pict/main/message";

	}

	@RequestMapping(value = "/board/board_file_delete.do")
	public String video_file_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			@RequestParam(value="fileidx") int fileNum,
			HttpServletRequest request) throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		int idx = pictVO.getIdx();
		
		pictVO = pictService.board_list_one(pictVO);
		
		switch(fileNum) {
			case 1 :
				pictVO.setFile_url1(null);
				break;
			case 2 :
				pictVO.setFile_url2(null);
				break;
			case 3 :
				pictVO.setFile_url3(null);
				break;
		}
		
		pictService.board_file_delete(pictVO);

		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/biz_post/biz_register.do?idx=" + idx);
		return "pict/main/message";

	}

	// 사업공고
	@RequestMapping(value = "/biz_post/biz_list.do")
	public String biz_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

			
		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.biz_list_total_cnt(pictVO);
		
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);

		List<?> biz_list = pictService.biz_list(pictVO);
		model.addAttribute("resultList", biz_list);
		model.addAttribute("size", biz_list.size());
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pictVO", pictVO);

		return "pict/biz_post/biz_list";
	}

	@RequestMapping(value = "/biz_post/biz_register.do")
	public String biz_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		if (pictVO.getIdx() != 0) {
			// 수정
			pictVO = pictService.biz_list_one(pictVO);
			// 파일 이름만 담아서 화면 출력
			Optional.ofNullable(pictVO.getFile_url1()).ifPresent(pictVO::saveFileNameToFile_url1);
			Optional.ofNullable(pictVO.getFile_url2()).ifPresent(pictVO::saveFileNameToFile_url2);
			Optional.ofNullable(pictVO.getFile_url3()).ifPresent(pictVO::saveFileNameToFile_url3);
			pictVO.setSaveType("update");

		} else {
			pictVO.setSaveType("insert");
		}

		model.addAttribute("pictVO", pictVO);
		return "pict/biz_post/biz_register";
	}

	@RequestMapping(value = "/biz_post/biz_save.do", method = RequestMethod.POST)
	public String biz_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request
			, @RequestParam(value="attach_file1", required=false) MultipartFile attach_file1
			, @RequestParam(value="attach_file2", required=false) MultipartFile attach_file2
			, @RequestParam(value="attach_file3", required=false) MultipartFile attach_file3
			) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if(attach_file1.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file1, (String)request.getSession().getAttribute("id"), uuid);
			String filepath = "/user1/upload_file/metaverse_industry/";
			String filename = uuid+uploadPath.split("#####")[1];
			pictVO.setFile_url1(filepath+filename);
		}
		if(attach_file2.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file2, (String)request.getSession().getAttribute("id"), uuid);
			String filepath = "/user1/upload_file/metaverse_industry/";
			String filename = uuid+uploadPath.split("#####")[1];
			pictVO.setFile_url2(filepath+filename);
		}
		if(attach_file3.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file3, (String)request.getSession().getAttribute("id"), uuid);
			String filepath = "/user1/upload_file/metaverse_industry/";
			String filename = uuid+uploadPath.split("#####")[1];
			pictVO.setFile_url3(filepath+filename);
		}

		if (pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.biz_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/biz_post/biz_list.do");
			return "pict/main/message";
		} else {
			pictService.biz_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/biz_post/biz_list.do");
			return "pict/main/message";
		}
	}

	@RequestMapping(value = "/biz_post/biz_delete.do")
	public String biz_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		pictService.biz_delete(pictVO);

		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/biz_post/biz_list.do");
		return "pict/main/message";

	}

	@RequestMapping(value = "/biz_post/biz_file_delete.do")
	public String biz_file_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		String idx = pictVO.getIdx() + "";
		pictService.biz_file_delete(pictVO);

		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/biz_post/biz_register.do?idx=" + idx);
		return "pict/main/message";

	}

	// 장비리스트
	@RequestMapping(value = "/equipment/equipment_list.do")
	public String equipment_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.equipment_list_total_cnt(pictVO);
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);
		
		
		
		pictVO.setOnlyAvailable(false);
		List<?> equipment_list = pictService.equipment_list(pictVO);
		model.addAttribute("resultList", equipment_list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("size", equipment_list.size());
		model.addAttribute("pictVO", pictVO);

		return "pict/equipment/equipment_list";
	}

	// 장비 생성
	@RequestMapping(value = "/equipment/equipment_register.do")
	public String equipment_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		if (pictVO.getIdx() != 0) {
			// 수정
			pictVO = pictService.equipment_list_one(pictVO);
			System.out.println("pictVO ::::::::::" + pictVO);
			pictVO.setSaveType("update");

		} else {
			LocalDate today = LocalDate.now();
			String formattedDate = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			pictVO.setReg_date(formattedDate);
			pictVO.setSaveType("insert");
		}

		model.addAttribute("pictVO", pictVO);
		return "pict/equipment/equipment_register";
	}

	// 장비 등록 처리
	@RequestMapping(value = "/equipment/equipment_save.do", method = RequestMethod.POST)
	public String equipment_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			MultipartHttpServletRequest request, @RequestParam("attach_file") MultipartFile attach_file)
			throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		String depart = (String) request.getSession().getAttribute("depart");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if (attach_file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file, (String) request.getSession().getAttribute("id"),
					uuid);
			String filepath = "/user1/upload_file/metaverse_industry/";
			// String filepath = "D:\\user1\\upload_file\\billconcert\\";
			String filename = uuid + uploadPath.split("#####")[1];

			pictVO.setImage_url(filepath + filename);
		}

		pictVO.setDepart(depart);
		if (pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.equipment_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/equipment/equipment_list.do");
			return "pict/main/message";
		} else {
			pictService.equipment_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/equipment/equipment_list.do");
			return "pict/main/message";
		}
	}

	// 장비 재고 등록
	@RequestMapping(value = "/equipment/equipment_cnt_register.do")
	public String equipment_cnt_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		if (pictVO.getIdx() == 0 && pictVO.getId() == null) {
			return "redirect:/equipment/equipment_list.do";
		}
		if (pictVO.getIdx() != 0) {
			// 수정
			pictVO = pictService.equipment_item_one(pictVO);
			System.out.println("equipment_id" + pictVO.getEquipment_type_id());
			PictVO equipmentVO = new PictVO();
			equipmentVO.setId(pictVO.getEquipment_type_id());
			PictVO equipment = pictService.equipment_list_one(equipmentVO);
			model.addAttribute("equipment", equipment);
			model.addAttribute("pictVO", pictVO);
			pictVO.setSaveType("update");
		} else {
			LocalDate today = LocalDate.now();
			String formattedDate = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			pictVO.setReg_date(formattedDate);
			pictVO.setSaveType("insert");
		}

		if (pictVO.getId() != null && pictVO.getIdx() == 0) {
			PictVO equipment = pictService.equipment_list_one(pictVO);
			model.addAttribute("equipment", equipment);
		}

		model.addAttribute("pictVO", pictVO);
		return "pict/equipment/equipment_cnt_register";
	}

	// 장비 재고 등록 저장처리
	@RequestMapping(value = "/equipment/equipment_cnt_save.do", method = RequestMethod.POST)
	public String equipment_cnt_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			MultipartHttpServletRequest request) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if (pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {

			if (pictVO.getSerial_number() == null) {
				pictVO.setSerial_number("");
			}

			if (pictVO.getText() == null) {
				pictVO.setText("");
			}

			pictService.equipment_cnt_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/equipment/equipment_list.do");
			return "pict/main/message";
		} else {
			// QR코드 생성
			pictService.equipment_cnt_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/equipment/equipment_list.do");
			return "pict/main/message";
		}
	}

	// 시리얼 넘버 장비의 상태값 변경(사용가능/사용불가)
	@RequestMapping("/changeItemStatus.do")
	@ResponseBody
	public HashMap<String, Object> changeItemStatus(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (param.get("idx") != null) {
			Integer idx = (Integer) param.get("idx");

			pictVO.setIdx(idx);
			String status = param.get("status").toString();
			pictVO.setStatus(status);
			System.out.println("status @@@@" + pictVO.getStatus());
			pictService.equipment_cnt_update(pictVO);
			map.put("msg", "ok");

		} else {
			map.put("msg", "fail");
		}
		return map;
	}

	// 시리얼 넘버 삭제
	@RequestMapping("/deleteItems.do")
	@ResponseBody
	public HashMap<String, Object> deleteItems(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			List<Integer> idxList = (List<Integer>) param.get("idx_list");

			// 리스트가 비어있지 않은 경우에만 처리
			if (idxList != null && !idxList.isEmpty()) {
				// 여기서 삭제 로직 처리
				// 예: pictService.deleteItems(idxList);
				for (int i = 0; i < idxList.size(); i++) {
					pictService.equipment_cnt_delete(idxList.get(i));
				}
				map.put("msg", "ok");
			} else {
				map.put("msg", "fail");
			}
		} catch (ClassCastException e) {
			System.out.println("error: " + e);
			map.put("msg", "fail");
		}

		return map;
	}

	// 장비삭제
	@RequestMapping("/deleteEquipment.do")
	@ResponseBody
	public HashMap<String, Object> deleteEquipment(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {

			List<Integer> idxList = (List<Integer>) param.get("idx_list");

			// 리스트가 비어있지 않은 경우에만 처리
			if (idxList != null && !idxList.isEmpty()) {
				// 여기서 삭제 로직 처리
				// 예: pictService.deleteItems(idxList);
				for (int i = 0; i < idxList.size(); i++) {
					pictService.equipment_delete(idxList.get(i));
				}
				map.put("msg", "ok");
			} else {
				map.put("msg", "fail");
			}
			return map;
		} catch (ClassCastException e) {
			System.out.println("error: " + e);
			map.put("msg", "fail");
		}

		return map;
	}

	// 대여관리 리스트
	@RequestMapping(value = "/history/history_list.do")
	public String history_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		
		// 페이지당 표시할 항목 수 설정
		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.request_total_cnt(pictVO);
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);

		// 데이터 조회
		List<?> history_list = pictService.get_request_list(pictVO);
		
		// 모델에 데이터 추가
		model.addAttribute("resultList", history_list);
		model.addAttribute("size", history_list.size());
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("search_text", pictVO.getSearch_text());
		
		return "pict/history/history_list";
	}

	//장비 임의 대여
	@RequestMapping(value = "/equipment/admin_rental.do")
	public String admin_rental(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		
		
		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.usrCtn(pictVO);
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);
		
		// 데이터 조회
		List<?> userList = pictService.get_user_list(pictVO);
		// 장비 목록 조회
		if (pictVO.getSearch_text() != null) {
			pictVO.setSearch_text(null);
		}
		List<PictVO> equipmentList = pictService.equipment_list(pictVO);
		// 모델에 데이터 추가
		model.addAttribute("resultList", userList);
		model.addAttribute("search_text", pictVO.getSearch_text());
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("size", userList.size());
		model.addAttribute("equipmentList", equipmentList);

		return "pict/equipment/admin_rental";
	}
	
	// 시설물 리스트
	@RequestMapping(value = "/facility/facility_list.do")
	public String facility_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		
		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.facility_list_total_cnt(pictVO);
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);
		
		pictVO.setOnlyAvailable(false);
		List<?> facility_list = pictService.facility_list(pictVO);
		model.addAttribute("resultList", facility_list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("size", facility_list.size());
		model.addAttribute("pictVO", pictVO);

		return "pict/facility/facility_list";
	}

	// 시설물 생성
	@RequestMapping(value = "/facility/facility_register.do")
	public String facility_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {

		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		if (pictVO.getIdx() != 0) {
			// 수정
			pictVO = pictService.facility_list_one(pictVO);
			pictVO.setSaveType("update");

		} else {
			LocalDate today = LocalDate.now();
			String formattedDate = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			pictVO.setReg_date(formattedDate);
			pictVO.setSaveType("insert");
		}

		model.addAttribute("pictVO", pictVO);
		return "pict/facility/facility_register";
	}

	// 시설물 생성 처리
	@RequestMapping(value = "/facility/facility_save.do", method = RequestMethod.POST)
	public String facility_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			MultipartHttpServletRequest request, @RequestParam("attach_file") MultipartFile attach_file)
			throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if (attach_file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file, (String) request.getSession().getAttribute("id"),
					uuid);
			String filepath = "/user1/upload_file/metaverse_industry/";
			// String filepath = "D:\\user1\\upload_file\\billconcert\\";
			String filename = uuid + uploadPath.split("#####")[1];

			pictVO.setImage_url(filepath + filename);
		}

		if (pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.facility_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/facility/facility_list.do");
			return "pict/main/message";
		} else {
			pictService.facility_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/facility/facility_list.do");
			return "pict/main/message";
		}
	}

	// 시설물 사용불가 처리
	@RequestMapping("/toggleFacilityStatus.do")
	@ResponseBody
	public HashMap<String, Object> toggleFacilityStatus(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (param.get("id") != null && param.get("id") != "") {
			String id = param.get("id").toString();

			pictVO.setId(id);
			String status = param.get("status").toString();
			pictVO.setStatus(status);
			pictService.facility_cnt_update(pictVO);
			map.put("msg", "ok");

		} else {
			map.put("msg", "fail");
		}
		return map;
	}

	// 시설삭제
	@RequestMapping("/deleteFacilities.do")
	@ResponseBody
	public HashMap<String, Object> deleteFacilities(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			List<Integer> idxList = (List<Integer>) param.get("idx_list");

			// 리스트가 비어있지 않은 경우에만 처리
			if (idxList != null && !idxList.isEmpty()) {
				// 여기서 삭제 로직 처리
				// 예: pictService.deleteItems(idxList);
				for (int i = 0; i < idxList.size(); i++) {
					pictService.facility_delete(idxList.get(i));
				}
				map.put("msg", "ok");
			} else {
				map.put("msg", "fail");
			}
		} catch (ClassCastException e) {
			System.out.println("error: " + e);
			map.put("msg", "fail");
		}

		return map;
	}

	// 시설물 대여 신청관리
	@RequestMapping(value = "/facility/facility_history_list.do")
	public String facility_history_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		
		
		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.get_facility_request_total_cnt(pictVO);
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);
		
		// 데이터 조회
		List<?> history_list = pictService.get_facility_request_list(pictVO);
		
		// 모델에 데이터 추가
		model.addAttribute("resultList", history_list);
		model.addAttribute("size", history_list.size());
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("search_text", pictVO.getSearch_text());
		return "pict/facility/facility_history_list";
	}

	// 시설물 대여신청 상세보기
	@RequestMapping(value = "/facility/facility_history_detail.do")
	public String facility_history_detail(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		if (pictVO.getIdx() == 0) {
			return "redirect:/facility/history_list.do";
		}
		Integer idx = pictVO.getIdx();
		Map<String, Object> history_detail = pictService.get_facility_request_detail(idx);
		// for PDF
		if("approved".equals(history_detail.get("request_status"))) {
			Map<String, Integer> approveNum = pictService.facilityApproveNum(idx.intValue());
	        CustomDateTime.formatFromString("yyyy-MM-dd", (String) history_detail.get("request_date"), "yyyy년 MM월 dd일 E");
	        model.addAttribute("pdf",
	        		PdfDownVO.of(
			        		  approveNum.get("year") + "-" + approveNum.get("year_order_num")
			        		, CustomDateTime.dateFormat("yyyy.MM.dd. ") + CustomDateTime.timeFormat("HH:mm")
			        		, CustomDateTime.formatFromDate("yyyy년 MM월 dd일 E", (Date) history_detail.get("rental_start_date"))
			        		, CustomDateTime.formatFromDate("yyyy년 MM월 dd일 E", (Date) history_detail.get("rental_end_date"))
			        		, CustomDateTime.formatFromDate("yyyy년 MM월 dd일", (Date) history_detail.get("rental_start_date"))
			        		, CustomDateTime.formatFromDate("yyyy년 MM월 dd일", (Date) history_detail.get("rental_end_date"))
			        		, CustomDateTime.formatFromString("yyyy-MM-dd", (String) history_detail.get("request_date"), "yyyy년 MM월 dd일")
			));
		}
		model.addAttribute("history_detail", history_detail);
		model.addAttribute("pictVO", pictVO);
		return "pict/facility/facility_history_detail";
	}

	//시설 임의 대여
	@RequestMapping(value = "/facility/facility_admin_rental.do")
	public String facility_admin_rental(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		
		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.usrCtn(pictVO);
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);

		// 데이터 조회
		List<?> userList = pictService.get_user_list(pictVO);
		
		// 모델에 데이터 추가
		model.addAttribute("resultList", userList);
		model.addAttribute("search_text", pictVO.getSearch_text());
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pictVO", pictVO);

		// 시설 목록 조회 (available한 시설만)
		pictVO.setOnlyAvailable(true);
		// 장비 목록 조회
		if (pictVO.getSearch_text() != null) {
			pictVO.setSearch_text(null);
		}
		List<?> facilityList = pictService.facility_list(pictVO);
		model.addAttribute("facilityList", facilityList);

		return "pict/facility/facility_admin_rental";
	}
	
	// 장비 대여/반납 관리
	@RequestMapping(value = "/manage/manage_rental.do")
	public String manage_rental(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("search_text", pictVO.getSearch_text());
		return "pict/manage/manage_rental";
	}

	@RequestMapping("/get_qr_code.do")
	@ResponseBody
	public HashMap<String, Object> get_qr_code(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");

		HashMap<String, Object> map = new HashMap<String, Object>();
		if (sessions == null || sessions == "" || !UserRole.adminValidation(request)) {
			map.put("msg", "fail");
			return map;
		}
		
		if (param.get("serial_number") != null) {
			String serial_number = param.get("serial_number").toString(); 
			pictVO.setSerial_number(serial_number);
			
			pictVO.setIdx(0);
			Map<String, Object> rental = pictService.get_qr_code(pictVO);
			if (rental == null) {
				map.put("msg", "fail");
			} else {				
				if (rental.get("request_idx") != null) {
					map.put("msg", "ok");
					map.put("data", rental);
				} else {
					map.put("msg", "fail");
				}
			}
		}
		
		if (param.get("idx") != null) {
			Integer idx = Integer.parseInt((String) param.get("idx"));
			pictVO.setIdx(idx);
			pictVO.setSerial_number("");
			Map<String, Object> rental = pictService.get_qr_code(pictVO);
			if (rental == null) {
				map.put("msg", "fail");
			} else {				
				if (rental.get("request_idx") != null) {
					map.put("msg", "ok");
					map.put("data", rental);
				} else {
					map.put("msg", "fail");
				}
			}
		}

		return map;
	}

	@RequestMapping("/update_request.do")
	@ResponseBody
	public HashMap<String, Object> update_request(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");

		HashMap<String, Object> map = new HashMap<String, Object>();
		if (sessions == null || sessions == "") {
			map.put("msg", "fail");
			return map;
		}
		if (param.get("idx") != null && param.get("status") != null) {
			Integer idx = Integer.parseInt(param.get("idx").toString());
			String status = param.get("status").toString();
			pictVO.setIdx(idx);
			pictVO.setRequest_status(status);
			try {
				pictService.update_request_status(pictVO);
				map.put("msg", "ok");
			} catch (Exception e) {
				map.put("msg", "fail");
			}
		} else {
			map.put("msg", "fail");
		}

		return map;
	}

	// 장비 대여신청 상세보기
	@RequestMapping(value = "/history/history_detail.do")
	public String history_detail(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		if (pictVO.getIdx() == 0) {
			return "redirect:/history/history_list.do";
		}
		Integer idx = pictVO.getIdx();
		Map<String, Object> history_detail = pictService.get_request_detail(idx);

		// for PDF
		// for PDF
		if("approved".equals(history_detail.get("request_status"))) {
			Map<String, Integer> approveNum = pictService.equipmentApproveNum(idx.intValue());
	        CustomDateTime.formatFromString("yyyy-MM-dd", (String) history_detail.get("request_date"), "yyyy년 MM월 dd일 E");
	        model.addAttribute("pdf",
	        		PdfDownVO.of(
			        		  approveNum.get("year") + "-" + approveNum.get("year_order_num")
			        		, CustomDateTime.dateFormat("yyyy.MM.dd. ") + CustomDateTime.timeFormat("HH:mm")
			        		, CustomDateTime.formatFromDate("yyyy년 MM월 dd일 E", (Date) history_detail.get("rental_start_date"))
			        		, CustomDateTime.formatFromDate("yyyy년 MM월 dd일 E", (Date) history_detail.get("rental_end_date"))
			        		, CustomDateTime.formatFromDate("yyyy년 MM월 dd일", (Date) history_detail.get("rental_start_date"))
			        		, CustomDateTime.formatFromDate("yyyy년 MM월 dd일", (Date) history_detail.get("rental_end_date"))
			        		, CustomDateTime.formatFromString("yyyy-MM-dd", (String) history_detail.get("request_date"), "yyyy년 MM월 dd일")
			        		)
	        		);
		}
		model.addAttribute("history_detail", history_detail);
		model.addAttribute("pictVO", pictVO);
		return "pict/history/history_detail";
	}

	// 관리자 장비대여 관리대장 상태 업데이트 (이메일 발송 추가해야 함)
	@RequestMapping(value = "/history/update_request.do", method = RequestMethod.POST)
	public String update_request(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if (pictVO.getIdx() == 0) {
			model.addAttribute("message", "서버와 통신 중 에러가 발생했습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/history/history_list.do");
			return "pict/main/message";
		}

		if (pictVO.getRequest_status() == null || pictVO.getRequest_status() == "") {
			model.addAttribute("message", "서버와 통신 중 에러가 발생했습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/history/history_list.do");
			return "pict/main/message";
		}

		if (pictVO.getReject_msg() == null) {
			pictVO.setReject_msg("");
		}

		pictService.update_request_status(pictVO);
		Map<String, Object> user = pictService.get_user_by_request(pictVO);
		System.out.println("user 핸드폰 번호" + user.get("mobile") + "이름" + user.get("name"));
		if (user.get("mobile") != null && user.get("mobile") != "") {
			String msg = "강원 메타버스 지원센터에서 알려드립니다. 신청하신 장비 대여 서비스가 ";
			System.out.println(pictVO.getRequest_status());
			if (pictVO.getRequest_status().equals("rejected")) {
				msg += "반려처리 되었습니다. 마이페이지에서 반려사유를 확인 후 서류를 보완해주세요.";
			} else if (pictVO.getRequest_status().equals("approved")) {
				msg += "승인처리 되었습니다. 대여날짜에 맞춰 방문해주세요.";
			} else if (pictVO.getRequest_status().equals("refusal")) {
				msg += "거절처리 되었습니다. 마이페이지에서 거절사유를 확인해주세요.";
			}
			
			// send_sms(msg ,(String) user.get("mobile"));
			
		}
		model.addAttribute("message", "정상적으로 수정되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/history/history_list.do");
		return "pict/main/message";
	}

	// 관리자 시설대여 관리대장 상태 업데이트 (이메일 발송 추가해야 함)
	@RequestMapping(value = "/facility/update_request.do", method = RequestMethod.POST)
	public String update_facility_request(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if (pictVO.getIdx() == 0) {
			model.addAttribute("message", "서버와 통신 중 에러가 발생했습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/facility/facility_history_list.do");
			return "pict/main/message";
		}

		if (pictVO.getRequest_status() == null || pictVO.getRequest_status() == "") {
			model.addAttribute("message", "서버와 통신 중 에러가 발생했습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/facility/facility_history_list.do");
			return "pict/main/message";
		}

		if (pictVO.getReject_msg() == null) {
			pictVO.setReject_msg("");
		}
		// 시작 날짜에서 쉼표가 있으면 제거
		if (pictVO.getRental_start_date() != null && pictVO.getRental_start_date().startsWith(",")) {
		    String cleanStartDate = pictVO.getRental_start_date().substring(1);
		    pictVO.setRental_start_date(cleanStartDate);
		    System.out.println("정제된 시작 날짜: " + pictVO.getRental_start_date());
		}

		// 종료 날짜에서 쉼표가 있으면 제거
		if (pictVO.getRental_end_date() != null && pictVO.getRental_end_date().startsWith(",")) {
		    String cleanEndDate = pictVO.getRental_end_date().substring(1);
		    pictVO.setRental_end_date(cleanEndDate);
		    System.out.println("정제된 종료 날짜: " + pictVO.getRental_end_date());
		}
		pictService.update_facility_request_status(pictVO);
		Map<String, Object> user = pictService.get_user_by_faility_request(pictVO);
		System.out.println("user 핸드폰 번호" + user.get("mobile") + "이름" + user.get("name"));
		if (user.get("mobile") != null && user.get("mobile") != "") {
			String msg = "강원 메타버스 지원센터에서 알려드립니다. 신청하신 시설 대여 서비스가 ";
			if (pictVO.getRequest_status().equals("rejected")) {
				msg += "반려처리 되었습니다. 마이페이지에서 반려사유를 확인 후 서류를 보완해주세요.";
			} else if (pictVO.getRequest_status().equals("approved")) {
				msg += "승인처리 되었습니다. 날짜에 맞춰 방문해주세요.";
			} else if (pictVO.getRequest_status().equals("refusal")) {
				msg += "거절처리 되었습니다. 마이페이지에서 거절사유를 확인해주세요.";
			}
			
			// send_sms(msg ,(String) user.get("mobile"));
			
		}
		model.addAttribute("message", "정상적으로 수정되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/facility/facility_history_list.do");
		return "pict/main/message";
	}

	// 교육신청
	@RequestMapping(value = "/education/manage_education.do")
	public String manage_education(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		
		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.facility_list_total_cnt(pictVO);
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);
		

		List<Map<String, Object>> education_list = pictService.get_education_list(pictVO);
		model.addAttribute("education_list", education_list);

		model.addAttribute("size", education_list.size());
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("search_text", pictVO.getSearch_text());
		return "pict/education/manage_education";
	}

	// 교육신청 뷰
	@RequestMapping(value = "/education/manage_education_detail.do")
	public String manage_education_detail(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if (pictVO.getId() == null || pictVO.getId() == "") {
			return "redirect:/education/manage_education.do";
		}

		Map<String, Object> education = pictService.get_education_by_id(pictVO);

		model.addAttribute("education", education);
		return "pict/education/manage_education_detail";
	}

	// 관리자 교육관리대장 (이메일 발송 추가해야 함)
	@RequestMapping(value = "/education/update_request.do", method = RequestMethod.POST)
	public String update_education_request(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request) throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if (pictVO.getId() == null || pictVO.getId() == "") {
			model.addAttribute("message", "서버와 통신 중 에러가 발생했습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/education/manage_education.do");
			return "pict/main/message";
		}

		if (pictVO.getRequest_status() == null || pictVO.getRequest_status() == "") {
			model.addAttribute("message", "서버와 통신 중 에러가 발생했습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/education/manage_education.do");
			return "pict/main/message";
		}

		if (pictVO.getReject_msg() == null) {
			pictVO.setReject_msg("");
		}

		pictService.update_education(pictVO);
		model.addAttribute("message", "정상적으로 처리되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/education/manage_education.do");
		return "pict/main/message";
	}
	
	// 팝업리스트
	@RequestMapping(value = "/popup/popup_list.do")
	public String popup_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		int limitNumber = 20;
		pictVO.setLimit_cnt(limitNumber);
		// 전체 데이터 수 조회
		Integer totalCnt = pictService.get_popup_total_cnt(pictVO);
		
		// 현재 페이지 번호 설정
		Integer pageNum = pictVO.getPageNumber();
		if (pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		// 마지막 페이지 계산 수정 (10이 아닌 limitNumber로 나눔)
		int lastPageValue = (int) Math.ceil((double)totalCnt / limitNumber);
		pictVO.setLastPage(lastPageValue);
		int[] pageRange = calculatePageRange(pageNum, limitNumber, totalCnt);
		pictVO.setStartPage(pageRange[0]);
		pictVO.setEndPage(pageRange[1]);

		pictVO.setOnlyAvailable(false);
		List<?> popup_list = pictService.get_popup_list(pictVO);
		model.addAttribute("resultList", popup_list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("size", popup_list.size());
		model.addAttribute("pictVO", pictVO);

		return "pict/popup/popup_list";
	}
	
	@RequestMapping(value = "/popup/popup_delete.do")
	public String popup_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		pictService.popup_delete(pictVO);

		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/popup/popup_list.do");
		return "pict/main/message";
	}
	
	
	@RequestMapping(value = "/popup/popup_form.do")
	public String popup_form(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		if (pictVO.getIdx() != 0) {
			// 수정
			pictVO = pictService.popup_list_one(pictVO);
			pictVO.setFile(pictVO.getImage_url().substring(pictVO.getImage_url().lastIndexOf("/")+1));
			pictVO.setSaveType("update");

		} else {
			pictVO.setSaveType("insert");
		}

		model.addAttribute("pictVO", pictVO);
		return "pict/popup/popup_form";
	}
	
	@RequestMapping(value = "/popup/popup_save.do", method = RequestMethod.POST)
	public String popup_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			MultipartHttpServletRequest request, @RequestParam("attach_file") MultipartFile attach_file)
			throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if (attach_file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file, (String) request.getSession().getAttribute("id"),
					uuid);
			String filepath = "/user1/upload_file/metaverse_industry/" + uuid + "/";
			// String filepath = "D:\\user1\\upload_file\\billconcert\\";
			String filename = uploadPath.split("#####")[1];

			pictVO.setImage_url(filepath + filename);
		}

		if (pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.popup_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/popup/popup_list.do");
			return "pict/main/message";
		} else {
			pictService.popup_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/popup/popup_list.do");
			return "pict/main/message";
		}
	}
	
	
	@RequestMapping(value = "/setting/settings.do")
	public String settings(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request)
			throws Exception {
		String session = (String) request.getSession().getAttribute("id");
		if (session == null || session == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		Map<String, Object> setting = pictService.get_url_settings(pictVO);
		if (setting.get("content_url") != null) {
			pictVO.setContent_url((String)setting.get("content_url"));
		}
		if (setting.get("professional_url") != null) {
			pictVO.setProfessional_url((String)setting.get("professional_url"));
		}
		if (setting.get("infra_url") != null) {
			pictVO.setInfra_url((String)setting.get("infra_url"));
		}
		if (setting.get("video_url") != null) {
			pictVO.setVideo_url((String)setting.get("video_url"));
		}
		if (setting.get("video_thumb") != null) {
			pictVO.setVideo_thumb((String)setting.get("video_thumb"));
		}
		if (setting.get("channel_url") != null) {
			pictVO.setChannel_url((String)setting.get("channel_url"));
		}
		pictVO.setSaveType("update");
		model.addAttribute("pictVO", pictVO);
		return "pict/setting/settings";
	}
	
	
	@RequestMapping(value = "/setting/settings_save.do", method = RequestMethod.POST)
	public String settings_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			MultipartHttpServletRequest request, @RequestParam("attach_file") MultipartFile attach_file)
			throws Exception {
		String sessions = (String) request.getSession().getAttribute("id");
		if (sessions == null || sessions == "null" || !UserRole.adminValidation(request)) {
			return "redirect:/pict_login.do";
		}

		if (attach_file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file, (String) request.getSession().getAttribute("id"),
					uuid);
			String filepath = "/user1/upload_file/metaverse_industry/";
			// String filepath = "D:\\user1\\upload_file\\billconcert\\";
			String filename = uuid + uploadPath.split("#####")[1];

			pictVO.setVideo_thumb(filepath + filename);
		}

		if (pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.update_url_settings(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/setting/settings.do");
			return "pict/main/message";
		} else {
			pictService.update_url_settings(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/setting/settings.do");
			return "pict/main/message";
		}
	}
	
  	
  	//문자
	public void send_sms(String msg, String receiver) throws Exception {

    	try{
    		
    		final String encodingType = "utf-8";
    		final String boundary = "____boundary____";
    	
    		/**************** 문자전송하기 예제 ******************/
    		/* "result_code":결과코드,"message":결과문구, */
    		/* "msg_id":메세지ID,"error_cnt":에러갯수,"success_cnt":성공갯수 */
    		/* 동일내용 > 전송용 입니다.  
    		/******************** 인증정보 ********************/
    		String sms_url = "https://apis.aligo.in/send/"; // 전송요청 URL
    		
    		Map<String, String> sms = new HashMap<String, String>();
    		
    		sms.put("user_id", "gica"); // SMS 아이디
    		sms.put("key", "rarf9fv8guylxaw80avten6uig3spw1b"); //인증키
    		
    		/******************** 인증정보 ********************/
    		
    		/******************** ��송정보 ********************/

//    		request.getAttribute("text").toString();
    		sms.put("msg", msg);
    		sms.put("receiver", receiver); // 수신번호
    		//sms.put("sender", "16444845"); // 발신번호
    		sms.put("sender", "0332456315"); // 발신번호
    		String image = "";
    		//image = "/tmp/pic_57f358af08cf7_sms_.jpg"; // MMS 이미지 파일 위치
    		
    		/******************** 전송정보 ********************/
    		
    		MultipartEntityBuilder builder = MultipartEntityBuilder.create();
    		
    		builder.setBoundary(boundary);
    		builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
    		builder.setCharset(Charset.forName(encodingType));
    		
    		for(Iterator<String> i = sms.keySet().iterator(); i.hasNext();){
    			String key = i.next();
    			builder.addTextBody(key, sms.get(key)
    					, ContentType.create("Multipart/related", encodingType));
    		}
    		/*
    		File imageFile = new File(image);
    		if(image!=null && image.length()>0 && imageFile.exists()){
    	
    			builder.addPart("image",
    					new FileBody(imageFile, ContentType.create("application/octet-stream"),
    							URLEncoder.encode(imageFile.getName(), encodingType)));
    		}
    		*/
    		HttpEntity entity = builder.build();
    		
    		HttpClient client = HttpClients.createDefault();
    		HttpPost post = new HttpPost(sms_url);
    		post.setEntity(entity);
    		
    		HttpResponse res = client.execute(post);
    		
    		String result = "";
    		if(res != null){
    			BufferedReader in = new BufferedReader(new InputStreamReader(res.getEntity().getContent(), encodingType));
    			String buffer = null;
    			while((buffer = in.readLine())!=null){
    				result += buffer;
    			}
    			in.close();
    		}
    		
    	}catch(Exception e){
    		System.out.println(e.getMessage());
    	}
    }

	

	public static String encryptPassword(String password, String id) throws Exception {
		if (password == null)
			return "";
		if (id == null)
			return ""; // KISA 보안약점 조치 (2018-12-11, 신용호)
		byte[] hashValue = null; // 해쉬값

		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.reset();
		md.update(id.getBytes());
		hashValue = md.digest(password.getBytes());

		return new String(Base64.encodeBase64(hashValue));
	}

	// 파일업로드 메소드
	public String fileUpload(MultipartHttpServletRequest request, MultipartFile uploadFile, String target) {
		String path = "";
		String fileName = "";
		OutputStream out = null;
		PrintWriter printWriter = null;
		long fileSize = uploadFile.getSize();
		try {
			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();

			path = getSaveLocation(request, uploadFile);

			File file = new File(path);
			if (fileName != null && !fileName.equals("")) {
				if (file.exists()) {
					file = new File(path + fileName);
				}
			}
			out = new FileOutputStream(file);
			out.write(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return path + "#####" + fileName;
	}

	public String fileUpload_board(MultipartHttpServletRequest request, MultipartFile uploadFile, String target,
			UUID uuid) {
		String path = "";
		String fileName = "";
		Path uploadPath;

		OutputStream out = null;
		PrintWriter printWriter = null;
		long fileSize = uploadFile.getSize();
		try {
			fileName = uploadFile.getOriginalFilename();
			byte[] bytes = uploadFile.getBytes();

			path = getSaveLocation(request, uploadFile);

			File file = new File(path + uuid);
			if (fileName != null && !fileName.equals("")) {
				if (file.exists()) {
					file = new File(path + uuid + "/" + fileName);
				} else {
					boolean directoryCreated = file.mkdir();
					file = new File(path + uuid + "/" + fileName);
				}
			}
			out = new FileOutputStream(file);
			out.write(bytes);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return path + "#####" + fileName;
	}

	private String getSaveLocation(MultipartHttpServletRequest request, MultipartFile uploadFile) {
		// 서버
		String uploadPath = "/user1/upload_file/metaverse_industry/";
//		String uploadPath = "C:\\Users\\82105\\Desktop\\";

		// 로컬
		//String uploadPath = "~/Desktop/upload_file/";
		return uploadPath;
	}

	private static String getTagValue(String tag, Element eElement) {
		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	@ResponseBody
	@RequestMapping(value = "/api/equipment/list.do", produces = "application/json; charset=utf-8")
	public Map<String, Object> getEquipmentList(@RequestParam(required = false) String type, HttpSession session) throws Exception {
		Map<String, Object> response = new HashMap<>();
		
		PictVO pictVO = new PictVO();
		pictVO.setOnlyAvailable(true);
		
		// 로그인한 사용자 ID 설정
		if(StringUtils.hasText((String) session.getAttribute("id"))) {
			pictVO.setUser_id((String) session.getAttribute("id"));
		}
		
		// 타입 변환 로직
		if (type != null) {
			switch (type) {
				case "hmd":
					pictVO.setType("HMD");
					break;
				case "ar":
					pictVO.setType("AR글래스");
					break;
				case "motion":
					pictVO.setType("모션캡처");
					break;
				case "camera":
					pictVO.setType("360카메라");
					break;
				case "scanner":
					pictVO.setType("3D스캐너");
					break;
				case "else":
					pictVO.setType("기타");
					break;
			}
		}
		
		List<PictVO> equipment_list = pictService.equipment_list(pictVO);
		
		response.put("success", true);
		response.put("resultList", equipment_list);
		response.put("size", equipment_list.size());
		
		return response;
	}
	/**
	 * 현재 페이지를 기준으로 페이지 범위를 계산하는 메서드
	 * 
	 * @param currentPage 현재 페이지 번호
	 * @param limit 페이지당 항목 수
	 * @param totalCnt 전체 항목 수
	 * @return int[] - [0]: 시작 페이지(s_page), [1]: 끝 페이지(e_page)
	 */
	public static int[] calculatePageRange(int currentPage, int limit, int totalCnt) {
	    // 현재 페이지가 0이하인 경우 1로 설정
	    if (currentPage <= 0) {
	        currentPage = 1;
	    }
	    
	    // 마지막 페이지 계산
	    int lastPageValue = (int) Math.ceil(totalCnt * 1.0 / limit);
	    if (lastPageValue < 1) {
	        lastPageValue = 1;
	    }
	    
	    // 시작 페이지와 끝 페이지 계산
	    int s_page = currentPage - 4;
	    int e_page = currentPage + 5;
	    
	    // 시작 페이지가 0 이하인 경우 조정
	    if (s_page <= 0) {
	        s_page = 1;
	        e_page = 10;
	    }
	    
	    // 끝 페이지가 마지막 페이지보다 큰 경우 조정R
	    if (e_page > lastPageValue) {
	        e_page = lastPageValue;
	    }
	    
	    // 시작 페이지가 끝 페이지보다 큰 경우 조정
	    if (s_page > e_page) {
	        s_page = e_page;
	    }
	    
	    return new int[]{s_page, e_page};
	}
}
