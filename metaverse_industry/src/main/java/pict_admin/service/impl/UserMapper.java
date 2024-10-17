package pict_admin.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import pict_admin.service.UserVO;


@Mapper("userMapper")
public interface UserMapper {
//	List<Map<String, Object>> isUserIdAvailable(String userId) throws Exception;
	UserVO isUserIdAvailable(UserVO userVO) throws Exception;
	
	void signUp(UserVO userVO) throws Exception;
}