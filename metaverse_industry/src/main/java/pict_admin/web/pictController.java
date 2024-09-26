package pict_admin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;


import java.security.MessageDigest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.PasswordAuthentication;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.AdminService;
import pict_admin.service.AdminVO;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.commons.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONObject;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class pictController {
	PasswordAuthentication pa;
	
	@Resource(name = "pictService")
	private PictService pictService;
	
	@Resource(name = "adminService")
	private AdminService adminService;
	
	
	@RequestMapping(value = "/lending.do")
	public String lending(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		return "pict/user/user_main";
	}
	
	//로케이션
	@RequestMapping(value = "/location_db_list.do")
	public String location_db_list(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		int limitNumber = 16;
		pictVO.setLimit_cnt(limitNumber);
		Integer pageNum = pictVO.getPageNumber();
		if(pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		Integer totalCnt = pictService.video_location_list_cnt(pictVO);
		int lastPageValue = (int)(Math.ceil( totalCnt * 1.0 / 16 )); 
		pictVO.setLastPage(lastPageValue);
		
		Integer s_page = pageNum - 4;
		Integer e_page = pageNum + 5;
		if (s_page <= 0) {
			s_page = 1;
			e_page = 10;
		} 
		if (e_page > lastPageValue){
			e_page = lastPageValue;
		}
		pictVO.setStartPage(s_page);
		pictVO.setEndPage(e_page);
		
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("board_cnt", totalCnt);
    	
    	List<PictVO> reference_list = pictService.video_location_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/user/location_db_list";
	}
	@RequestMapping(value = "/location_db_map.do")
	public String location_db_map(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		pictVO.setFlag("isactive");
		
		List<PictVO> reference_list = pictService.video_location_list(pictVO);
	
		JSONArray jsonArr = new JSONArray();
		
		for(int i=0; i<reference_list.size(); i++) {
			JSONObject jsonObj1 = new JSONObject();

			jsonObj1.put("idx", reference_list.get(i).getIdx());
			String type = "";
			if(reference_list.get(i).getCategory() != null) {
				if(reference_list.get(i).getCategory().equals("1")) type = "공공/기관";
				if(reference_list.get(i).getCategory().equals("2")) type = "관광/공원/카페";
				if(reference_list.get(i).getCategory().equals("3")) type = "도로/교통";
				if(reference_list.get(i).getCategory().equals("4")) type = "숙박시설";
				if(reference_list.get(i).getCategory().equals("5")) type = "야외 스튜디오";
				if(reference_list.get(i).getCategory().equals("6")) type = "유휴시설";
				if(reference_list.get(i).getCategory().equals("7")) type = "종교/전통";
				if(reference_list.get(i).getCategory().equals("8")) type = "기타";
			}
			
			jsonObj1.put("name", reference_list.get(i).getCategory());
			jsonObj1.put("title", reference_list.get(i).getTitle());
			jsonObj1.put("lat", reference_list.get(i).getLat());
			jsonObj1.put("lng", reference_list.get(i).getLng());
			
			jsonArr.put(jsonObj1);
			
			/*
			map.put("idx", "1");
			map.put("type", "더픽트");
			map.put("title", "더픽트");
			map.put("lat", "37.87520275487296");
			map.put("lng", "127.73536032930221");
			*/
		}

		
		model.addAttribute("jsonArr", jsonArr);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/user/location_db_map";
	}
	@RequestMapping(value = "/location_view.do")
	public String location_view(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		pictVO = pictService.video_location_list_one(pictVO);
		model.addAttribute("pictVO", pictVO);
		
		List<PictVO> reference_list = pictService.movie_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("movie_cnt", reference_list.size());
		
		
		return "pict/user/location_view";
	}
	@RequestMapping(value = "/location_apply_save.do", method = RequestMethod.POST)
	public String location_apply_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file") MultipartFile attach_file) throws Exception {
		if(attach_file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file, (String)request.getSession().getAttribute("id"), uuid);
			String filepath = "/user1/upload_file/video_industry/";
			//String filepath = "D:\\user1\\upload_file\\billconcert\\";
			String filename = uuid+uploadPath.split("#####")[1];
			
			pictVO.setFile_url(filepath+filename);
		}

		pictService.location_apply_save(pictVO);
		model.addAttribute("message", "정상적으로 저장되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/location_view.do?idx="+pictVO.getIdx());
		return "pict/main/message";	
		
	}	
	
	
	//산업체
	@RequestMapping(value = "/industry_db.do")
	public String industry_db(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		
		int limitNumber = 16;
		pictVO.setLimit_cnt(limitNumber);
		Integer pageNum = pictVO.getPageNumber();
		if(pageNum == 0) {
			pictVO.setPageNumber(1);
			pageNum = 1;
		}
		int startNum = (pageNum - 1) * limitNumber;
		pictVO.setStartNumber(startNum);
		Integer totalCnt = pictService.industry_list_cnt(pictVO);
		int lastPageValue = (int)(Math.ceil( totalCnt * 1.0 / 16 )); 
		pictVO.setLastPage(lastPageValue);
		
		Integer s_page = pageNum - 4;
		Integer e_page = pageNum + 5;
		if (s_page <= 0) {
			s_page = 1;
			e_page = 10;
		} 
		if (e_page > lastPageValue){
			e_page = lastPageValue;
		}
		pictVO.setStartPage(s_page);
		pictVO.setEndPage(e_page);
		
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("board_cnt", totalCnt);
    	
    	List<PictVO> reference_list = pictService.industry_list(pictVO);
		model.addAttribute("resultList", reference_list);
		model.addAttribute("pictVO", pictVO);
		
		return "pict/user/industry_db";
	}
	@RequestMapping(value = "/industry_portfolio.do")
	public String industry_portfolio(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		List<PictVO> reference_list = pictService.portfolio_list(pictVO);
		model.addAttribute("resultList", reference_list);
		
		pictVO = pictService.industry_list_one(pictVO);
		model.addAttribute("pictVO", pictVO);
		return "pict/user/industry_portfolio";
	}
	@RequestMapping(value = "/industry_info.do")
	public String industry_info(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		pictVO = pictService.industry_list_one(pictVO);
		model.addAttribute("pictVO", pictVO);
		return "pict/user/industry_info";
	}

	
	@RequestMapping(value = "/pict_login.do")
	public String login_main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpServletResponse response) throws Exception {
		String userAgent = request.getHeader("user-agent");
		String sessions = (String)request.getSession().getAttribute("id");
		boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
		boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 
		if (mobile1 || mobile2) {
		    //여기 모바일일 경우
			System.out.println("피씨");
			model.addAttribute("message", "PC에서만 사용이 가능합니다.");
			model.addAttribute("retType", ":exit");
			return "pict/main/message";
		}
		
		
		System.out.println(sessions);
		if(sessions == null || sessions == "null") {
			return "pict/main/login";
		}
		else {
			//나중에 여기 계정별로 리다이렉트 분기처리
			System.out.println(sessions);
			if(!sessions.equals("finecom") && !sessions.equals("admin")) {
				System.out.println("교수님덜222");
				return "redirect:/board/board_list.do";
			}
			else {
				System.out.println("아래 바꾸기");
				return "redirect:/board/board_list.do";
				//return "redirect:/status/connection_status.do";
			}
			
		}
	}
	@RequestMapping(value = "/pict_main.do")
	public String main(@ModelAttribute("searchVO") AdminVO adminVO, HttpServletRequest request, ModelMap model, HttpSession session, RedirectAttributes rttr) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		System.out.println(sessions);
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		else {
			String user_id = (String)request.getSession().getAttribute("id");
			if(request.getSession().getAttribute("id") != null) {
				adminVO.setAdminId((String)request.getSession().getAttribute("id"));
				adminVO = adminService.get_user_info(adminVO);
				model.addAttribute("adminVO", adminVO);
			}
		
			//나중에 여기 계정별로 리다이렉트 분기처리
			System.out.println(sessions);
			if(!sessions.equals("finecom") && !sessions.equals("admin")) {
				return "redirect:/board/board_list.do";
			}
			else {
				System.out.println("아래 바꾸기");
				return "redirect:/board/board_list.do";
			}
		}
	}
	@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("adminVO") AdminVO adminVO, HttpServletRequest request,  ModelMap model) throws Exception {
		//처음 드러와서 세션에 정보있으면 메인으로 보내줘야함
		String inpuId = adminVO.getAdminId();
		String inputPw = adminVO.getAdminPw();
		
		adminVO = adminService.get_user_info(adminVO);

		if (adminVO != null && adminVO.getId() != null && !adminVO.getId().equals("")) {
			String user_id = adminVO.getId();
			String enpassword = encryptPassword(inputPw, inpuId);	//입력비밀번호
			
			if(enpassword.equals(adminVO.getPassword())) {
				request.getSession().setAttribute("id", adminVO.getId());
				request.getSession().setAttribute("name", adminVO.getName());
				request.getSession().setAttribute("depart", adminVO.getDepart());

				String ip = request.getRemoteAddr();
			    DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			    String now = format2.format(Calendar.getInstance().getTime());
			    
			    adminVO.setLast_login_ip(ip);
			    adminVO.setLast_login_date(now);
			    adminService.insert_login_info(adminVO);
			    
			    adminVO.setAdminId(user_id);
			    adminVO = adminService.get_user_info(adminVO);
			    
				return "redirect:/pict_main.do";
				
			}
			else {
				model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/pict_login.do");
				return "pict/main/message";
			}
		}
		else {
			model.addAttribute("message", "입력하신 정보가 일치하지 않습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/pict_login.do");
			return "pict/main/message";
		}
	}

	@RequestMapping(value = "/user_list.do")
	public String user_list(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		model.addAttribute("search_text",adminVO.getSearch_text());
		
		
		List<?> userList = adminService.user_list(adminVO);
		model.addAttribute("resultList", userList);
		return "pict/main/user_list";
	}
	@RequestMapping(value = "/user_register.do")
	public String user_register(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		if(adminVO.getId() != null && !adminVO.equals("")) {
			//수정
			adminVO = adminService.user_select_one(adminVO);
			adminVO.setSaveType("update");
			
		}
		else {
			adminVO.setSaveType("insert");
		}
		
		model.addAttribute("adminVO", adminVO);
		return "pict/main/user_register";
	}
	@RequestMapping(value = "/user_reset.do")
	public String user_reset(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		String enpassword = encryptPassword(adminVO.getId()+"1!", adminVO.getId());	//입력비밀번호
		adminVO.setPassword(enpassword);
		adminService.user_reset(adminVO);
		
		model.addAttribute("message", "비밀번호가 초기화 되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/user_list.do");
		return "pict/main/message";
	}
	@RequestMapping(value = "/user_delete.do")
	public String user_delete(@ModelAttribute("adminVO") AdminVO adminVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
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
	public String user_save(@ModelAttribute("searchVO") PictVO pictVO, @ModelAttribute("adminVO") AdminVO adminVO,ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		System.out.println("::::::::::::::"+adminVO.getPassword());
		String enpassword = encryptPassword(adminVO.getPassword(), adminVO.getId());	//입력비밀번호
		
		adminVO.setPassword(enpassword);
		String user_id = adminVO.getId();
		
		
		//중복 계정조회
		AdminVO vo = adminVO;
		vo.setAdminId(user_id);
		vo = adminService.get_user_info(vo);
		
		if(adminVO.getSaveType() != null && adminVO.getSaveType().equals("update")) {
			System.out.println("업데이트::::::::::::::::::::::");
			System.out.println(adminVO.toString());
			adminService.update_user(adminVO);	//user 정보 인설트
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/user_list.do");
			return "pict/main/message";
		}
		
		else {
	        if(vo != null) {
	        	model.addAttribute("message", "동일한 아이디가 존재합니다.");
				model.addAttribute("retType", ":location");
				model.addAttribute("retUrl", "/user_register.do");
				return "pict/main/message";
	        }
	        System.out.println("인설트::::::::::::::::::::::");
	 
	        adminService.insert_user(adminVO);	//user 정보 인설트
            model.addAttribute("message", "계정발급이 완료되었습니다.");
    		model.addAttribute("retType", ":location");
    		model.addAttribute("retUrl", "/user_list.do");
    		return "pict/main/message";
		}
	}
	@RequestMapping(value = "/logout.do")
	public String logout(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request,  ModelMap model) throws Exception {
		request.getSession().setAttribute("id", null);
		request.getSession().setAttribute("name", null);
		
		return "redirect:/pict_login.do";
		
	}
	
	

    //공지사항
    @RequestMapping(value = "/board/board_list.do")
	public String board_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> board_list = pictService.board_list(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("size", board_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/board/board_list";
	}
	@RequestMapping(value = "/board/board_register.do")
	public String board_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		System.out.println(pictVO.getUser_id());
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.board_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/board/board_register";
	}
	@RequestMapping(value = "/board/board_save.do", method = RequestMethod.POST)
	public String board_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file") MultipartFile attach_file) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		String depart = (String)request.getSession().getAttribute("depart");
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		 
		if(attach_file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file, (String)request.getSession().getAttribute("id"), uuid);
			String filepath = "/user1/upload_file/billconcert_chuncheon/";
			//String filepath = "D:\\user1\\upload_file\\billconcert\\";
			String filename = uuid+uploadPath.split("#####")[1];
			
			pictVO.setImg_url(filepath+filename);
		}

		pictVO.setDepart(depart);
		System.out.println("::::::::::::::::::::::::::::::::::::::::::"+pictVO.getImg_url());
		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.board_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/board/board_list.do");
			return "pict/main/message";
		}
		else {
			pictService.board_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/board/board_list.do");
			return "pict/main/message";	
		}
		
	}	
	@RequestMapping(value = "/board/board_delete.do")
	public String board_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.board_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/board/board_list.do");
		return "pict/main/message";
		
	}	
	@RequestMapping(value = "/board/board_file_delete.do")
	public String video_file_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		String idx = pictVO.getIdx()+"";
		System.out.println(pictVO.getIdx());
		pictService.board_file_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/board/board_register.do?idx="+idx);
		return "pict/main/message";
		
	}
	
	//이벤트
    @RequestMapping(value = "/event/event_list.do")
	public String event_list(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
	
		List<?> board_list = pictService.event_list(pictVO);
		model.addAttribute("resultList", board_list);
		model.addAttribute("size", board_list.size());
		model.addAttribute("pictVO", pictVO);
		
		return "pict/event/event_list";
	}
	@RequestMapping(value = "/event/event_register.do")
	public String event_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		pictVO.setUser_id(session);
		System.out.println(pictVO.getUser_id());
		if(pictVO.getIdx() != 0) {
			//수정
			pictVO = pictService.event_list_one(pictVO);
			pictVO.setSaveType("update");
			
		}
		else {
			pictVO.setSaveType("insert");
		}
		
		model.addAttribute("pictVO", pictVO);
		return "pict/event/event_register";
	}
	@RequestMapping(value = "/event/event_save.do", method = RequestMethod.POST)
	public String event_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request,
			@RequestParam("attach_file") MultipartFile attach_file) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		String depart = (String)request.getSession().getAttribute("depart");
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		 
		if(attach_file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = fileUpload_board(request, attach_file, (String)request.getSession().getAttribute("id"), uuid);
			String filepath = "/user1/upload_file/video_industry/";
			//String filepath = "D:\\user1\\upload_file\\billconcert\\";
			String filename = uuid+uploadPath.split("#####")[1];
			pictVO.setImg_url(filepath+filename);
		}

		pictVO.setDepart(depart);
		System.out.println("::::::::::::::::::::::::::::::::::::::::::"+pictVO.getImg_url());
		if(pictVO.getSaveType() != null && pictVO.getSaveType().equals("update")) {
			pictService.event_update(pictVO);
			model.addAttribute("message", "정상적으로 수정되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/event/event_list.do");
			return "pict/main/message";
		}
		else {
			pictService.event_insert(pictVO);
			model.addAttribute("message", "정상적으로 저장되었습니다.");
			model.addAttribute("retType", ":location");
			model.addAttribute("retUrl", "/event/event_list.do");
			return "pict/main/message";	
		}
		
	}	
	@RequestMapping(value = "/event/event_delete.do")
	public String event_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.event_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/event/event_list.do");
		return "pict/main/message";
		
	}	
	@RequestMapping(value = "/event/event_file_delete.do")
	public String event_file_delete(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		String idx = pictVO.getIdx()+"";
		System.out.println(pictVO.getIdx());
		pictService.event_file_delete(pictVO);
		
		model.addAttribute("message", "정상적으로 삭제되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/event/event_register.do?idx="+idx);
		return "pict/main/message";
		
	}
	
	
	//팸투어
	@RequestMapping(value = "/pemtour/pemtour_register.do")
	public String pemtour_register(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		String session = (String)request.getSession().getAttribute("id");
		if(session == null || session == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictVO = pictService.pemtour_select(pictVO);
		model.addAttribute("pictVO", pictVO);
		return "pict/pemtour/pemtour_register";
	}
	@RequestMapping(value = "/pemtour/pemtour_save.do", method = RequestMethod.POST)
	public String pemtour_save(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, MultipartHttpServletRequest request) throws Exception {
		String sessions = (String)request.getSession().getAttribute("id");
		if(sessions == null || sessions == "null") {
			return "redirect:/pict_login.do";
		}
		
		pictService.pemtour_update(pictVO);
		model.addAttribute("message", "정상적으로 수정되었습니다.");
		model.addAttribute("retType", ":location");
		model.addAttribute("retUrl", "/pemtour/pemtour_register.do");
		return "pict/main/message";
		
	}	
	
	public static String encryptPassword(String password, String id) throws Exception {
		if (password == null) return "";
		if (id == null) return ""; // KISA 보안약점 조치 (2018-12-11, 신용호)
		byte[] hashValue = null; // 해쉬값
	
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.reset();
		md.update(id.getBytes());
		hashValue = md.digest(password.getBytes());
	
		return new String(Base64.encodeBase64(hashValue));
    }
	
	//파일업로드 메소드
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
    		if(fileName != null && !fileName.equals("")) {
    			if(file.exists()) {
    				file = new File(path + fileName);
    			}
    		}
    		out = new FileOutputStream(file);
    		out.write(bytes);
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return path + "#####" + fileName;
    }
    
    public String fileUpload_board(MultipartHttpServletRequest request, MultipartFile uploadFile, String target, UUID uuid) {
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
    		if(fileName != null && !fileName.equals("")) {
    			if(file.exists()) {
    				file = new File(path +uuid+ fileName);
    			}
    		}
    		out = new FileOutputStream(file);
    		out.write(bytes);
    	
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return path + "#####" + fileName;
    }
    
    private String getSaveLocation(MultipartHttpServletRequest request, MultipartFile uploadFile) {
    	String uploadPath = "/user1/upload_file/video_industry/";
    	return uploadPath;
    }

    private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
    
    
    
}
