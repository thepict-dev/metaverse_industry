package pict_admin.service;

import java.util.List;

public interface UserService {

	UserVO isUserIdAvailable(UserVO userVO) throws Exception;
	
	void signUp(UserVO userVO) throws Exception;
	
	UserVO getUserInfo(UserVO userVO) throws Exception;
	
	void updateUser(UserVO userVO) throws Exception;
	// 장비
	List<?> get_request_list(PictVO pictVO) throws Exception;
	
	Integer get_request_total_cnt(PictVO pictVO) throws Exception;
	
	
	void updateRequestStatus(PictVO pictVO) throws Exception;
	
	void retryRequest(PictVO pictVO) throws Exception;
	// 시설
	List<?> get_facility_request_list(PictVO pictVO) throws Exception;
	
	Integer get_facility_request_total_cnt(PictVO pictVO) throws Exception;
	
	void updateFacilityRequestStatus(PictVO pictVO) throws Exception;
	
	void retryFacilityRequest(PictVO pictVO) throws Exception;
}
