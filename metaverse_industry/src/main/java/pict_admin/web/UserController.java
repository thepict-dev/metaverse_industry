package pict_admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import pict_admin.service.UserService;
import pict_admin.service.UserVO;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/api")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    
    @Autowired
    private UserService userService;

    @RequestMapping("/checkUserId.do")
	@ResponseBody
	public HashMap<String, Object> get_scout_mod(@ModelAttribute("searchVO") UserVO userVO, ModelMap model, HttpServletRequest request, @RequestBody Map<String, Object> param) throws Exception {
    	System.out.println("들어는 오는가??????????? 새로만든데~~~");
		String userId = param.get("userId").toString();
		System.out.println(userId+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		userVO.setUser_id(userId);
		
		userVO = userService.isUserIdAvailable(userVO);
		//userVO.getName();
		//중
		if(userVO != null) {
			map.put("rst",false);
			return map;
		}
		//가입가
		else {
			map.put("rst",true);
			return map;
		}
    	/*
        logger.info("Received request to check userId: {}", userId);  // 로깅 추가
        boolean isAvailable = userService.isUserIdAvailable(userId);
        logger.info("UserId {} availability: {}", userId, isAvailable);
        return Collections.singletonMap("available", isAvailable);
        */
    }
}