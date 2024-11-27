package pict_admin.web;

import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.security.UserRole;
import com.utill.FileManagement;
import com.utill.ResultReturn;
import com.utill.SessionHandler;
import com.utill.excel.EduExcel;
import com.utill.excel.Excel;

import pict_admin.service.UserService;
import pict_admin.service.CalendarVo;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.UserVO;
import pict_admin.service.impl.CalendarServiceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.UUID;

import javax.security.sasl.AuthenticationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.security.MessageDigest;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	private UserService userService;
	private PictService pictService;
	private CalendarServiceImpl calendarService;

	public UserController(UserService userService, PictService pictService, CalendarServiceImpl calendarService) {
		super();
		this.userService = userService;
		this.pictService = pictService;
		this.calendarService = calendarService;
	}

	@GetMapping("/history_list_excel.do")
	public void excelDownload(HttpServletRequest request, HttpServletResponse response, @RequestParam("flag") String flag) throws Exception {
		Optional.of(request.getSession().getAttribute("id"))
				.filter(id -> UserRole.adminValidation(request))
				.orElseThrow(() -> new IllegalArgumentException());
		
		Excel.download(response, flag.equalsIgnoreCase("eq") ? pictService.findEquipmentRequest() : pictService.findFacilityRequest(), flag);
	}

	@GetMapping("/education/excel.do")
	public void eduListExcel(HttpServletRequest request, HttpServletResponse response, PictVO pictVO) throws Exception {
		// 관리자 권한 체크
		Optional.of(request.getSession().getAttribute("id"))
				.filter(id -> UserRole.adminValidation(request))
				.orElseThrow(() -> new IllegalArgumentException());

		// 검색 조건 유지
		pictVO.setRequest_status(request.getParameter("status"));
		pictVO.setSearch_text(request.getParameter("search_text"));
		
		// 엑셀 다운로드 실행
		EduExcel.download(response, pictService.get_education_list(pictVO));
	}
	
	@RequestMapping("/checkUserId.do")
	@ResponseBody
	public HashMap<String, Object> isUseableUserId(@ModelAttribute("searchVO") UserVO userVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		System.out.println("들어는 오는가??????????? 새로만든데~~~");
		String userId = param.get("userId").toString();
		System.out.println(userId + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

		HashMap<String, Object> map = new HashMap<String, Object>();
		userVO.setUser_id(userId);

		userVO = userService.isUserIdAvailable(userVO);
		// userVO.getName();
		// 중
		if (userVO != null) {
			map.put("rst", false);
			return map;
		}
		// 가입가
		else {
			map.put("rst", true);
			return map;
		}
	}
	//아이디 찾기
	@RequestMapping("/find_id.do")
	@ResponseBody
	public HashMap<String, Object> find_id(@ModelAttribute("searchVO") UserVO userVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		System.out.println("param @@@@" + param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("여기???3333" + param.get("user_name"));
		if (param.get("user_name") != null && param.get("mobile") != null) {
			System.out.println("여기???222");
			String user_name =  param.get("user_name").toString();
			String mobile =  param.get("mobile").toString();
			System.out.println("user_name @@@@" + user_name);
			userVO.setName(user_name);
			userVO.setMobile(mobile);
			
			Map<String, Object> user = userService.find_id_pwd(userVO);
			System.out.println("user @@@@" + user);
			if (user.isEmpty()) {
				map.put("msg", "fail");
			} else {
				String user_id = user.get("user_id").toString();
				map.put("msg", "ok");
				map.put("user_id", user_id);
			}
		} else {
			System.out.println("여기???1111");
			map.put("msg", "fail");
		}
		return map;
	}
	
	
	//비밀번호 찾기
	@RequestMapping("/find_pwd.do")
	@ResponseBody
	public HashMap<String, Object> find_pwd(@ModelAttribute("searchVO") UserVO userVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		System.out.println("param @@@@" + param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("여기???3333" + param.get("user_name"));
		if (param.get("user_name") != null && param.get("mobile") != null && param.get("user_id") != null) {
			System.out.println("여기???222");
			String user_name =  param.get("user_name").toString();
			String user_id =  param.get("user_id").toString();
			String mobile =  param.get("mobile").toString();
			System.out.println("user_name @@@@" + user_name);
			userVO.setName(user_name);
			userVO.setMobile(mobile);
			userVO.setUser_id(user_id);
			
			Map<String, Object> user = userService.find_id_pwd(userVO);
			System.out.println("user @@@@" + user);
			if (user.isEmpty()) {
				map.put("msg", "fail");
			} else {
				map.put("msg", "ok");
			}
		} else {
			System.out.println("여기???1111");
			map.put("msg", "fail");
		}
		return map;
	}
	
	//새로운 비밀번호 설정
	@RequestMapping("/set_new_password.do")
	@ResponseBody
	public HashMap<String, Object> set_new_password(@ModelAttribute("searchVO") UserVO userVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		System.out.println("param @@@@" + param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("여기???3333" + param.get("user_name"));
		if (param.get("password") != null && param.get("user_id") != null) {
			String user_id =  param.get("user_id").toString();
			String password =  param.get("password").toString();
			String enpassword = encryptPassword(password, user_id); // 입력비밀번호
			System.out.println("여기???222");
			userVO.setUser_id(user_id);
			userVO.setPassword(enpassword);
			try {
				userService.set_new_password(userVO);
				map.put("msg", "ok");
			} catch(IOException e) {
				map.put("msg", "fail");
			}
		} else {
			System.out.println("여기???1111");
			map.put("msg", "fail");
		}
		return map;
	}
	
	
	@RequestMapping("/update_user.do")
	@ResponseBody
	public HashMap<String, Object> update_user(@ModelAttribute UserVO userVO, 
            @RequestParam(value = "attach_file", required = false) MultipartFile attach_file,
            HttpServletRequest request) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> result_data = new HashMap<String, Object>();
		
		String sessions = (String)request.getSession().getAttribute("id");
		if(sessions == null || sessions == "null" || UserRole.adminValidation(request)) {
			map.put("rst", false);
			return map;
		}
		userVO.setUser_id(sessions);
		
		// 전체 유저 데이터 불러온다음 수정해야함
		UserVO userDb = userService.isUserIdAvailable(userVO);
		
		if(StringUtils.hasText(userVO.getUser_address1())) {
			// 기본 정보 수정
			userVO.setCompany_nm(userDb.getCompany_nm());
			userVO.setSa_eob_no(userDb.getSa_eob_no());
			userVO.setPosition(userDb.getPosition());
			userVO.setCompany_address1(userDb.getCompany_address1());
			userVO.setCompany_address2(userDb.getCompany_address2());
		} else if (StringUtils.hasText(userDb.getCompany_address1())) {
			// 근무지 정보 수정
			userVO.setName(userDb.getName());
			userVO.setEmail(userDb.getEmail());
			userVO.setMobile(userDb.getMobile());
			userVO.setBirthday(userDb.getBirthday());
			userVO.setUser_address1(userDb.getUser_address1());
			userVO.setUser_address2(userDb.getUser_address2());
		}
		
		if (attach_file != null && attach_file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = upload_file(request, attach_file,
					(String) request.getSession().getAttribute("id"), uuid);
			// String filepath = "~/Desktop/upload_file/";
			//String filepath = "C:\\Users\\82105\\Desktop\\test\\";
			String filepath = "/user1/upload_file/metaverse_industry/";
			String filename = uuid + uploadPath.split("#####")[1];
			userVO.setDocument_url(filepath + filename);
		}
		
		// 수정된 유저 데이터 업데이트
		userService.updateUser(userVO);
		
		map.put("rst", true);
		map.put("data", userVO);
		return map;
	}

	@RequestMapping("/checkEquipmentAvailableDate.do")
	@ResponseBody
	public HashMap<String, Object> getEquipmentAvailableDate(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (param.get("id") != null) {
			pictVO.setId(param.get("id").toString());
			pictVO.setCount(param.get("count").toString());
			List<Map<String, Object>> unavailable_date_list = pictService.equipment_unavailable_date_list(pictVO);
			map.put("msg", "ok");
			if (unavailable_date_list.isEmpty()) {
				List<Map<String, Object>> allAvailable = new ArrayList<>();
				map.put("data", allAvailable);
			} else {
				map.put("data", unavailable_date_list);
			}

		} else {
			map.put("msg", "fail");
		}
		return map;
	}
	
	@RequestMapping("/getEquipmentItems.do")
	@ResponseBody
	public HashMap<String, Object> getEquipmentItems(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		System.out.println("param @@@@" + param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (param.get("id") != null) {
			String equipmentId = param.get("id").toString();
			System.out.println(equipmentId + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			
			pictVO.setEquipment_id(equipmentId);
			pictVO.setAll(true);
			System.out.println("id @@@@" + pictVO.getId());
			// equipment_item_list 쿼리 수정으로 확인 필요
			List<Map<String, Object>> item_list = pictService.equipmentItemListByEquipmentId(pictVO);
			System.out.println("available_date_list@@@@@@@@@@@ " + item_list);
			map.put("msg", "ok");
			map.put("data", item_list);
		} else {
			map.put("msg", "fail");
		}
		return map;
	}
	
	
	// 시설 대여가능 날짜 조회
	@RequestMapping("/checkFacilityAvailableDate.do")
	@ResponseBody
	public HashMap<String, Object> getFacilityAvailableDate(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (param.get("id") != null) {
			pictVO.setId(param.get("id").toString());
			List<Map<String, Object>> unavailable_date_list = pictService.facility_unavailable_date_list(pictVO);
			map.put("msg", "ok");
			if (unavailable_date_list.isEmpty()) {
				List<Map<String, Object>> allAvailable = new ArrayList<>();
				map.put("data", allAvailable);
			} else {
				map.put("data", unavailable_date_list);
			}

		} else {
			map.put("msg", "fail");
		}
		return map;
	}
	
	
	// 마이페이지 장비 예약폼 업데이트(취소처리)
	@RequestMapping("/update_request.do")
	@ResponseBody
	public HashMap<String, Object> update_request(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		System.out.println("param @@@@" + param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sessions = (String)request.getSession().getAttribute("id");
		if(sessions == null || sessions == "null") {
			map.put("rst", false);
			return map;
		}
		pictVO.setUser_id(sessions);
		if (param.get("id") != null) {
			String request_id = param.get("id").toString();
			System.out.println("request_id @@@@@@@@@@@@@@@@@@ " + request_id);

			pictVO.setId(request_id);
		} else {
			map.put("rst", false);
			return map;
		}
		
		if (param.get("request_status") != null) {
			String request_status = param.get("request_status").toString();
			System.out.println("request_status @@@@@@@@@@@@@@@@@@ " + request_status);
			pictVO.setRequest_status(request_status);
		} else {
			map.put("rst", false);
			return map;
		}
		
		userService.updateRequestStatus(pictVO);
		map.put("rst", true);
		return map;

	}
	// 마이페이지 시설 예약폼 업데이트(취소처리)
	@RequestMapping("/update_facility_request.do")
	@ResponseBody
	public HashMap<String, Object> update_facility_request(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		System.out.println("param @@@@" + param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String sessions = (String)request.getSession().getAttribute("id");
		if(sessions == null || sessions == "null") {
			map.put("rst", false);
			return map;
		}
		pictVO.setUser_id(sessions);
		if (param.get("id") != null) {
			String request_id = param.get("id").toString();
			System.out.println("request_id @@@@@@@@@@@@@@@@@@ " + request_id);

			pictVO.setId(request_id);
		} else {
			map.put("rst", false);
			return map;
		}
		
		if (param.get("request_status") != null) {
			String request_status = param.get("request_status").toString();
			System.out.println("request_status @@@@@@@@@@@@@@@@@@ " + request_status);
			pictVO.setRequest_status(request_status);
		} else {
			map.put("rst", false);
			return map;
		}
		
		userService.updateFacilityRequestStatus(pictVO);
		map.put("rst", true);
		return map;

	}
	
	// 파일업로드쪽 수정해야되는지 체크하기
	@RequestMapping("/booking.do")
	@ResponseBody
	public HashMap<String, Object> submitBooking(@ModelAttribute PictVO pictVO, 
            @RequestParam(value = "attach_file1", required = false) MultipartFile attach_file1,
            @RequestParam(value = "attach_file2", required = false) MultipartFile attach_file2,
            @RequestParam(value = "attach_file3", required = false) MultipartFile attach_file3,
            HttpServletRequest request) throws Exception {
		
		String sessions = (String) request.getSession().getAttribute("id");
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (sessions == null || sessions == "") {
			map.put("msg", "fail");
			return map;
		}

		switch(pictVO.getRental_type()) {
			case "individual" :
				pictVO.setType("1");
				break;
			case "company" :
				pictVO.setType("2");
				break;
		}

		// 유저가 직접 신청 시, UserId 값 세팅
		if(!UserRole.adminValidation(request)) {
			pictVO.setUser_id(sessions);
		}
		
		for(Map<String, Object> data : pictVO.getEquipmentListObject()) {
			/**
			 * 재고 조회 세팅
			 * 장비 ID, ITEM ID, 렌탈 시작 날짜, 렌탈 마지막 날짜
			 */
			pictVO.setEquipment_id(data.get("id").toString());
			pictVO.setRental_start_date(data.get("rental_start_date").toString());
			pictVO.setRental_end_date(data.get("rental_end_date").toString());
			// 재고 조회
			Optional<List<Map<String, Object>>> itemsOptional = Optional.ofNullable(pictService.equipment_item_list(pictVO));
			// 신청 재고
			int cnt = Integer.parseInt(data.get("cnt").toString());
			// 재고 여부 및 신청 수량과 재고 수량 체크
			if(itemsOptional.isPresent() && itemsOptional.get().size() >= cnt) {
				List<Map<String, Object>> items = itemsOptional.get();
				// 신청 재고 수량만큼 렌탈
				for (int i = 0; i < cnt; i++) {
					pictVO.setId(items.get(i).get("id").toString());
					// 렌탈 신청
					pictService.submit_rental_request(pictVO);
					// 관리자가 신청 시, 승인처리
					if(UserRole.adminValidation(request)) {
						pictVO.setRequest_status("approved");
						/**
						 * request id 값 가져와서 바꿔줘야함
						 * item id, 		user_id, 			rental start,end date
						 * pictVO.getId(), pictVO.getUser_id(), pictVO.getRental_start_date(), pictVO.getRental_end_date()
						 */
						Map<String, String> requestData = userService.findEquipmentRequestId(pictVO.getId(), pictVO.getUser_id(), pictVO.getRental_start_date(), pictVO.getRental_end_date());
						pictVO.setId(requestData.get("id"));
						userService.updateRequestStatus(pictVO);
					}
				}
			} else {
				map.put("msg", "fail");
				break;
			}
		}
		
		Optional.ofNullable(attach_file1).ifPresent(file -> pictVO.setFile_url1(new FileManagement().upload(file, sessions)));
		Optional.ofNullable(attach_file2).ifPresent(file -> pictVO.setFile_url2(new FileManagement().upload(file, sessions)));
		Optional.ofNullable(attach_file3).ifPresent(file -> pictVO.setFile_url3(new FileManagement().upload(file, sessions)));
		
		map.put("msg", "ok");
		return map;
	}
	
	@RequestMapping("/booking_facility.do")
	@ResponseBody
	public HashMap<String, Object> booking_facility(@ModelAttribute PictVO pictVO
			, @RequestParam(value = "attach_file1", required = false) MultipartFile attach_file1
			, @RequestParam(value = "attach_file2", required = false) MultipartFile attach_file2
			, @RequestParam(value = "attach_file3", required = false) MultipartFile attach_file3
			, HttpServletRequest request) throws Exception {
		
		String sessions = (String) request.getSession().getAttribute("id");
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (sessions == null || sessions == "") {
			map.put("msg", "fail");
			return map;
		}

		Optional.ofNullable(attach_file1).ifPresent(file -> pictVO.setFile_url1(new FileManagement().upload(file, sessions)));
		Optional.ofNullable(attach_file2).ifPresent(file -> pictVO.setFile_url2(new FileManagement().upload(file, sessions)));
		Optional.ofNullable(attach_file3).ifPresent(file -> pictVO.setFile_url3(new FileManagement().upload(file, sessions)));
		
		List<Map<String, Object>> facility_list = pictVO.getFacilityListObject();
		String rental_type = pictVO.getRental_type();
		
		if (rental_type.equals("individual")) {
			pictVO.setType("1");
			// 개인 렌탈 신청
		} else if (rental_type.equals("company")) {
			pictVO.setType("2");
		}
		
		for(int i = 0; i < facility_list.size(); i++ ) {
			Map<String, Object> facility = facility_list.get(i);
			String facility_id = facility.get("id").toString();
			pictVO.setEquipment_id(facility_id);
			try {
				List<Map<String, Object>> items = pictService.facility_item_list(pictVO);
				if (items.isEmpty()) {
					// 재고가 없을 때
					map.put("msg", "fail");
					break;
				} else {
					// 재고가 있을 때
					int cnt = Integer.parseInt(facility.get("cnt").toString());
					for (int j = 0; j < cnt; j++) {
						for(Map<String, Object> item : items) {
							if(item.get("facility_type_id").equals(facility.get("id").toString())) {
								pictVO.setId(item.get("id").toString());
							}
						}
						pictVO.setRental_start_date((String) facility.get("rental_start_date"));
						pictVO.setRental_end_date((String) facility.get("rental_end_date"));
						// 관리자가 해당 유저에게 대여할 때는 유저 데이터를 전송하기에 필요 없음
						if(!UserRole.adminValidation(request)) {
							// 유저가 접속해서 대여할 때
							pictVO.setUser_id(sessions);
						}
						// 렌탈 신청
						pictService.submit_facility_request(pictVO);
						
						// 관리자가 신청 시, 승인처리
						if(UserRole.adminValidation(request)) {
							pictVO.setRequest_status("approved");
							/**
							 * request id 값 가져와서 바꿔줘야함
							 * item id, 		user_id, 			rental start,end date
							 * pictVO.getId(), pictVO.getUser_id(), pictVO.getRental_start_date(), pictVO.getRental_end_date()
							 */
							Map<String, String> requestData = userService.findFacilityRequestId(pictVO.getId(), pictVO.getUser_id(), pictVO.getRental_start_date(), pictVO.getRental_end_date());
							pictVO.setId(requestData.get("id"));
							userService.updateFacilityRequestStatus(pictVO);
						}
					}
					map.put("msg", "ok");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	@RequestMapping("/toggle_bag.do")
	@ResponseBody
	public HashMap<String, Object> add_bag(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		System.out.println("param @@@@" + param);
		String sessions = (String) request.getSession().getAttribute("id");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (sessions == null || sessions == "") {
			map.put("msg", "fail");
			return map;
		}
		
		pictVO.setUser_id(sessions);
		if (param.get("type") != null) {
			String type = param.get("type").toString();
			pictVO.setType(type);
		} else {
			map.put("msg", "fail");
			return map;
		}
		if (param.get("key_id") != null) {
			String key_id = param.get("key_id").toString();
			System.out.println(key_id + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

			pictVO.setKey_id(key_id);
			System.out.println("key_id @@@@" + pictVO.getKey_id());
			try {
				Integer isBag = pictService.isBag(pictVO);
				if (isBag == 0) {					
					pictService.add_bag(pictVO);
					map.put("msg", "added");	
				} else {
					pictService.delete_bag(pictVO);
					map.put("msg", "deleted");	
				}
			} catch(Exception e) {
				map.put("msg", "fail");
			}
		} else {
			map.put("msg", "fail");
		}
		return map;
	}

	@GetMapping("/corporationInfo.do")
	public UserVO corporationInfo(HttpSession session) throws Exception {
		return Optional.of(session.getAttribute("id"))
				.map(id -> userService.isUserIdAvailable(UserVO.of((String) id)))
				.orElseThrow(() -> new AuthenticationException());
	}

	@GetMapping("/rentalApprovedList.do")
	public List<PictVO> rentalApprovedList(HttpServletRequest request, @RequestParam(value="serial_number") String serial_number) {
		return Optional.of(request)
				.filter(req -> UserRole.adminValidation(req))
				.map(req -> pictService.rentalApprovedList(serial_number))
				.orElseGet(() -> new ArrayList<PictVO>());
	}

	// 장비대여
	@GetMapping(value = "/equipmentList.do")
	public ResultReturn<?> equipmentList(@ModelAttribute("searchVO") PictVO pictVO, HttpServletRequest request
			, HttpSession session, Map<String, Object> result) throws Exception {
		// ADMIN 계정이면 세션 삭제
		SessionHandler.deleteAdmin(request);
		
		pictVO.setOnlyAvailable(true);
		if(StringUtils.hasText((String) session.getAttribute("id"))) pictVO.setUser_id((String) session.getAttribute("id"));
		
		switch(pictVO.getType()) {
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
			default :
		        pictVO.setType("기타");
		}
		
		List<?> equipment_list = pictService.equipment_list(pictVO);
		return new ResultReturn<>(equipment_list.size(), equipment_list);
	}

	// 공지사항
	@RequestMapping(value = "/noticeApi.do")
	public ResultReturn<?> noticeApi(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model, HttpServletRequest request) throws Exception {
		// ADMIN 계이면 세션 삭제
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

		model.addAttribute("data", pictService.board_list(pictVO));
		model.addAttribute("pictVO", pictVO);
		model.addAttribute("board_cnt", totalCnt);

		return new ResultReturn<>(totalCnt, pictService.board_list(pictVO));
	}
	
	public String upload_file(HttpServletRequest request, MultipartFile uploadFile, String target, UUID uuid) {
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
    	
    	/*
        try {
            fileName = uploadFile.getOriginalFilename();
            byte[] bytes = uploadFile.getBytes();
            
            // 사용자의 홈 디렉토리 아래에 업로드 폴더 생성
            String homeDir = System.getProperty("user.home");
            uploadPath = Paths.get(homeDir, "Documents", "uploads");
            
            // 디렉토리가 존재하지 않으면 생성
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            
            // UUID를 파일명에 추가하여 중복 방지
            String uniqueFileName = uuid.toString() + "_" + fileName;
            Path filePath = uploadPath.resolve(uniqueFileName);
            
            // 파일 쓰기
            Files.write(filePath, bytes);
            
            System.out.println("File uploaded successfully: " + filePath);
            
            return filePath.toString() + "#####" + fileName;
        } catch (IOException e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
        */
    }
    
    private String getSaveLocation(HttpServletRequest request, MultipartFile uploadFile) {
		//서버
    	String uploadPath = "/user1/upload_file/metaverse_industry/";
    	//String uploadPath = "C:\\Users\\82105\\Desktop\\test\\";
    	
    	//로컬
    	// String uploadPath = "~/Desktop/upload_file/";
    	return uploadPath;
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
}