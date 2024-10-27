package pict_admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pict_admin.service.UserService;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.UserVO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private PictService pictService;

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
	
	
	@RequestMapping("/update_user.do")
	@ResponseBody
	public HashMap<String, Object> update_user(@ModelAttribute("searchVO") UserVO userVO, ModelMap model,
			HttpServletRequest request,  @RequestBody Map<String, Object> param) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> result_data = new HashMap<String, Object>();
		String sessions = (String)request.getSession().getAttribute("id");
		if(sessions == null || sessions == "null") {
			map.put("rst", false);
			return map;
		}
		userVO.setUser_id(sessions);
		
		if (param.get("name") != null) {			
			String name = param.get("name").toString();
			userVO.setName(name);
			result_data.put("name", name);
		}
		if (param.get("mobile") != null) {
			String mobile = param.get("mobile").toString();
			userVO.setMobile(mobile);
			result_data.put("mobile", mobile);
		}
		
		if (param.get("email") != null) {
			String email = param.get("email").toString();
			userVO.setEmail(email);
			result_data.put("email", email);
		}
		if (param.get("birthday") != null) {
			String birthday = param.get("birthday").toString();
			userVO.setBirthday(birthday);
			result_data.put("birthday", birthday);
		}
		if (param.get("user_address1") != null) {
			String user_address1 = param.get("user_address1").toString();
			userVO.setUser_address1(user_address1);
			result_data.put("user_address1", user_address1);
		}
		
		if (param.get("user_address2") != null) {
			String user_address2 = param.get("user_address2").toString();
			userVO.setUser_address2(user_address2);
			result_data.put("user_address2", user_address2);
		}
		
		if (param.get("company_nm") != null) {
			String company_nm = param.get("company_nm").toString();
			userVO.setCompany_nm(company_nm);
			result_data.put("company_nm", company_nm);
		}
		
		
		if (param.get("sa_eob_no") != null) {
			String sa_eob_no = param.get("sa_eob_no").toString();
			userVO.setSa_eob_no(sa_eob_no);
			result_data.put("sa_eob_no", sa_eob_no);
		}
		
		if (param.get("position") != null) {
			String position = param.get("position").toString();
			userVO.setPosition(position);
			result_data.put("position", position);
		}
		
		if (param.get("company_address1") != null) {
			String company_address1 = param.get("company_address1").toString();
			userVO.setCompany_address1(company_address1);
			result_data.put("company_address1", company_address1);
		}
		
		if (param.get("company_address2") != null) {
			String company_address2 = param.get("company_address2").toString();
			userVO.setCompany_address2(company_address2);
			result_data.put("company_address2", company_address2);
		}
		System.out.println("userVO @@@@@@@@@@@@" + userVO);

		
		
		
		try {
			userService.updateUser(userVO);
			map.put("rst", true);
			map.put("data", result_data);
			return map;
		} catch(IOException e) {
			map.put("rst", false);
		}
		return map;
	}

	@RequestMapping("/checkEquipmentAvailableDate.do")
	@ResponseBody
	public HashMap<String, Object> getEquipmentAvailableDate(@ModelAttribute("searchVO") PictVO pictVO, ModelMap model,
			HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
		System.out.println("param @@@@" + param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (param.get("id") != null) {
			String equipmentId = param.get("id").toString();
			System.out.println(equipmentId + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

			pictVO.setId(equipmentId);
			System.out.println("id @@@@" + pictVO.getId());
			List<Map<String, Object>> unavailable_date_list = pictService.equipment_unavailable_date_list(pictVO);
			System.out.println("available_date_list@@@@@@@@@@@ " + unavailable_date_list);
			map.put("msg", "ok");
			if (unavailable_date_list.isEmpty()) {
				System.out.println("모두 가능할때@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ " + unavailable_date_list);
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
			List<Map<String, Object>> item_list = pictService.equipment_item_list(pictVO);
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
		System.out.println("param @@@@" + param);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (param.get("id") != null) {
			String facilityId = param.get("id").toString();
			System.out.println(facilityId + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

			pictVO.setId(facilityId);
			System.out.println("id @@@@" + pictVO.getId());
			List<Map<String, Object>> unavailable_date_list = pictService.facility_unavailable_date_list(pictVO);
			System.out.println("available_date_list@@@@@@@@@@@ " + unavailable_date_list);
			map.put("msg", "ok");
			if (unavailable_date_list.isEmpty()) {
				System.out.println("모두 가능할때@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ " + unavailable_date_list);
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
            @RequestParam(value = "attach_file", required = false) MultipartFile attach_file,
            HttpServletRequest request) throws Exception {
		
		String sessions = (String) request.getSession().getAttribute("id");
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (sessions == null || sessions == "") {
			map.put("msg", "fail");
			return map;
		}
		
		if (attach_file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = upload_file(request, attach_file,
					(String) request.getSession().getAttribute("id"), uuid);
			// String filepath = "~/Desktop/upload_file/";
			String filepath = "/user1/upload_file/metaverse_industry/";
			String filename = uuid + uploadPath.split("#####")[1];
			pictVO.setFile_url1(filename);
		}

		
		List<Map<String, Object>> equipment_list = pictVO.getEquipmentListObject();
		String rental_type = pictVO.getRental_type();
		
		if (rental_type.equals("individual")) {
			pictVO.setType("1");
			// 개인 렌탈 신청

		} else if (rental_type.equals("company")) {
			pictVO.setType("2");
		}
		
			for(int i = 0; i < equipment_list.size(); i++ ) {
				Map<String, Object> equipment = equipment_list.get(i);
				String equipment_id = equipment.get("id").toString();
				System.out.println("type_id @@@@@@@@@@@@@@" + equipment_id);
				pictVO.setEquipment_id(equipment_id);

				try {
					List<Map<String, Object>> items = pictService.equipment_item_list(pictVO);
					System.out.println("items @@@@@@@@@@@@@@" + items);
					if (items.isEmpty()) {
						// 재고가 없을 때
						map.put("msg", "fail");
						break;
					} else {
						// 재고가 있을 때
						int cnt = Integer.parseInt(equipment.get("cnt").toString());
						System.out.println("cnt @@@@@@@@@@@@@@" + cnt);
						for (int j = 0; j < cnt; j++) {
							Map<String, Object> randomItem = items.get(new Random().nextInt(items.size()));
							// Map<String, Object> randomItem = items.get(new
							// Random().nextInt(items.size()));
							System.out.println("randomItem @@@@@@@@@@@@@@" + randomItem);

							String equipment_item_id = randomItem.get("id").toString();
							System.out.println("equipment_item_id @@@@@@@@@@@@@@" + equipment_item_id);
							System.out.println("user_id @@@@@@@@@@@@@@" + sessions);
							pictVO.setId(equipment_item_id);

							String startDateStr = (String) equipment.get("rental_start_date");
							String endDateStr = (String) equipment.get("rental_end_date");

							pictVO.setRental_start_date(startDateStr);
							pictVO.setRental_end_date(endDateStr);

							pictVO.setUser_id(sessions);
							
							// 렌탈 신청
							pictService.submit_rental_request(pictVO);
							// 관리자로 메일 보내기
						}

						map.put("msg", "ok");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		return map;

	}
	
	// 파일업로드쪽 수정해야되는지 체크하기
	@RequestMapping("/booking_facility.do")
	@ResponseBody
	public HashMap<String, Object> booking_facility(@ModelAttribute PictVO pictVO, 
            @RequestParam(value = "attach_file", required = false) MultipartFile attach_file,
            HttpServletRequest request) throws Exception {
		
		String sessions = (String) request.getSession().getAttribute("id");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (sessions == null || sessions == "") {
			map.put("msg", "fail");
			return map;
		}
		
		if (attach_file.getSize() != 0) {
			UUID uuid = UUID.randomUUID();
			String uploadPath = upload_file(request, attach_file,
					(String) request.getSession().getAttribute("id"), uuid);
			// String filepath = "~/Desktop/upload_file/";
			String filepath = "/user1/upload_file/metaverse_industry/";
			String filename = uuid + uploadPath.split("#####")[1];
			pictVO.setFile_url1(filename);
		}
		
		
		
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
			System.out.println("type_id @@@@@@@@@@@@@@" + facility_id);
			pictVO.setEquipment_id(facility_id);

			try {
				List<Map<String, Object>> items = pictService.facility_item_list(pictVO);
				System.out.println("items @@@@@@@@@@@@@@" + items);
				if (items.isEmpty()) {
					// 재고가 없을 때
					map.put("msg", "fail");
					break;
				} else {
					// 재고가 있을 때
					int cnt = Integer.parseInt(facility.get("cnt").toString());
					System.out.println("cnt @@@@@@@@@@@@@@" + cnt);
					for (int j = 0; j < cnt; j++) {
						Map<String, Object> randomItem = items.get(new Random().nextInt(items.size()));
						// Map<String, Object> randomItem = items.get(new
						// Random().nextInt(items.size()));
						System.out.println("randomItem @@@@@@@@@@@@@@" + randomItem);

						String facility_item_id = randomItem.get("id").toString();
						System.out.println("facility_item_id @@@@@@@@@@@@@@" + facility_item_id);
						System.out.println("user_id @@@@@@@@@@@@@@" + sessions);
						pictVO.setId(facility_item_id);

						String startDateStr = (String) facility.get("rental_start_date");
						String endDateStr = (String) facility.get("rental_end_date");

						pictVO.setRental_start_date(startDateStr);
						pictVO.setRental_end_date(endDateStr);

						pictVO.setUser_id(sessions);
						
						// 렌탈 신청
						pictService.submit_facility_request(pictVO);
						// 관리자로 메일 보내기
					}

					map.put("msg", "ok");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
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
    	String uploadPath = "/user1/upload_file/video_industry/";
    	
    	//로컬
    	// String uploadPath = "~/Desktop/upload_file/";
    	return uploadPath;
    }
}