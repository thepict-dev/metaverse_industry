package pict_admin.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import pict_admin.service.PictVO;
import pict_admin.service.UserVO;


@Mapper("userMapper")
public interface UserMapper {
//	List<Map<String, Object>> isUserIdAvailable(String userId) throws Exception;
	UserVO isUserIdAvailable(UserVO userVO) throws Exception;
	
	void signUp(UserVO userVO) throws Exception;
	
	void updateUser(UserVO userVO) throws Exception;
	
	void updateRequestStatus(PictVO pictVO) throws Exception;
	
	void retryRequest(PictVO pictVO) throws Exception;
	
	List<?> get_request_list(PictVO pictVO) throws Exception;
	
	Integer get_request_total_cnt(PictVO pictVO) throws Exception;	
	
}