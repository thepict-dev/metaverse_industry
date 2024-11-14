package pict_admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.security.UserRole;
import com.utill.FileManagement;

import pict_admin.service.UserService;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;
import pict_admin.service.UserVO;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
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
import java.security.MessageDigest;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.apache.commons.codec.binary.Base64;
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
			String filepath = "/user1/upload_file/metaverse_industry/";
			String filename = uuid + uploadPath.split("#####")[1];
			userVO.setDocument_url(filename);
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

		Optional.ofNullable(attach_file1).ifPresent(file -> pictVO.setFile_url1(new FileManagement().upload(file, sessions)));
		Optional.ofNullable(attach_file2).ifPresent(file -> pictVO.setFile_url2(new FileManagement().upload(file, sessions)));
		Optional.ofNullable(attach_file3).ifPresent(file -> pictVO.setFile_url3(new FileManagement().upload(file, sessions)));
		
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
		
//		pictVO.setFile_url1(FileManagement.upload(attach_file1, sessions));
//		pictVO.setFile_url2(FileManagement.upload(attach_file2, sessions));
//		pictVO.setFile_url3(FileManagement.upload(attach_file3, sessions));
		
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
    	String uploadPath = "/user1/upload_file/metaverse_industry/";
    	
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