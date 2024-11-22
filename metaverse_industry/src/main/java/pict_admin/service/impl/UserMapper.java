package pict_admin.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import pict_admin.service.PictVO;
import pict_admin.service.UserVO;


@Mapper("userMapper")
public interface UserMapper {
//	List<Map<String, Object>> isUserIdAvailable(String userId) throws Exception;
	UserVO isUserIdAvailable(UserVO userVO);
	
	Map<String, Object> find_id_pwd(UserVO userVO) throws Exception;

	Map<String, String> findEquipmentRequestId(@Param("itemId") String itemId, @Param("userId") String userId, @Param("satrtDate") String satrtDate, @Param("endDate") String endDate);

	Map<String, String> findFacilityRequestId(@Param("itemId") String itemId, @Param("userId") String userId, @Param("satrtDate") String satrtDate, @Param("endDate") String endDate);
	
	void signUp(UserVO userVO) throws Exception;
	
	void updateUser(UserVO userVO) throws Exception;
	
	void set_new_password(UserVO userVO) throws Exception;
	
	
	
	
	
	//내가 신청한 장비 예약 리스트
	List<?> get_request_list(PictVO pictVO) throws Exception;
	
	// 신청 폼 카운트 상태별
	Integer get_request_total_cnt(PictVO pictVO) throws Exception;
	
	// 취소처리
	void updateRequestStatus(PictVO pictVO) throws Exception;
	
	// 반려된 예약 재신청
	void retryRequest(PictVO pictVO) throws Exception;
	
	
	
	//내가 신청한 시설 예약 리스트
	List<?> get_facility_request_list(PictVO pictVO) throws Exception;
	
	// 신청 폼 카운트 상태별
	Integer get_facility_request_total_cnt(PictVO pictVO) throws Exception;
	
	// 취소처리
	void updateFacilityRequestStatus(PictVO pictVO) throws Exception;
	
	// 반련된 시설 예약 재신청
	
	void retryFacilityRequest(PictVO pictVO) throws Exception;

	
}