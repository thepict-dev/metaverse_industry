/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package pict_admin.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import pict_admin.service.AdminVO;
import pict_admin.service.PictDefaultVO;
import pict_admin.service.PictVO;

/**
 * sample에 관한 데이터처리 매퍼 클래스
 *
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 *
 * </pre>
 */
@Mapper("pictMapper")
public interface PictMapper {
	// 세팅
	Map<String, Object> get_url_settings(PictVO pictVO) throws Exception;
	
	void update_url_settings(PictVO pictVO) throws Exception;
	
	// 팝업 리스트
	List<?> get_popup_list(PictVO pictVO) throws Exception;
	
	PictVO popup_list_one(PictVO pictVO) throws Exception;
	
	void popup_insert(PictVO pictVO) throws Exception;
	
	void popup_update(PictVO pictVO) throws Exception;
	
	void popup_delete(PictVO pictVO) throws Exception;
	
	Integer get_popup_total_cnt(PictVO pictVO) throws Exception;
	
	// 유저 정보
	List<Map<String, Object>> get_user_list(PictVO pictVO) throws Exception; 
	
	int usrCtn(PictVO pictVO) throws Exception; 
	
	void delete_user(@Param("idx") Integer idx) throws Exception;
	
	// 공지사항
	List<?> board_list(PictVO pictVO) throws Exception;
	
	Integer board_list_total_cnt(PictVO pictVO) throws Exception;
	
	PictVO board_list_one(PictVO pictVO) throws Exception;
	
	void board_update(PictVO pictVO) throws Exception;

	void board_insert(PictVO pictVO) throws Exception;

	void board_delete(PictVO pictVO) throws Exception;
	
	void board_file_delete(PictVO pictVO) throws Exception;
	
	
	// 사업 공고
	List<?> biz_list(PictVO pictVO) throws Exception;
	
	Integer biz_list_total_cnt(PictVO pictVO) throws Exception;

	PictVO biz_list_one(PictVO pictVO) throws Exception;
	
	void biz_update(PictVO pictVO) throws Exception;

	void biz_insert(PictVO pictVO) throws Exception;

	void biz_delete(PictVO pictVO) throws Exception;
	
	void biz_file_delete(PictVO pictVO) throws Exception;
	
	// 장비 관련 매
	
	List<PictVO> equipment_list(PictVO pictVO) throws Exception;
	
	List<Map<String, Object>> equipment_item_list(PictVO pictVO) throws Exception;
	
	List<Map<String, Object>> equipment_unavailable_date_list(PictVO pictVO) throws Exception;
	
	PictVO equipment_list_one(PictVO pictVO) throws Exception;
	
	void equipment_update(PictVO pictVO) throws Exception;

	void equipment_insert(PictVO pictVO) throws Exception;
	
	void equipment_delete(Integer idx) throws Exception;
	
	PictVO equipment_item_one(PictVO pictVO) throws Exception;
	
	List<PictVO> daily_mail_list() throws Exception;
	
	void mailing_backup(String data) throws Exception;
	
	List<Map<String, Object>> get_overdue_list() throws Exception;
	
	void equipment_cnt_update(PictVO pictVO) throws Exception;

	void equipment_cnt_insert(PictVO pictVO) throws Exception;
	
	void equipment_cnt_delete(Integer idx) throws Exception;
	
	void submit_rental_request(PictVO pictVO) throws Exception;
	
	void update_equipment_item(PictVO pictVO) throws Exception;
	
	List<PictVO> findEquipmentRequest() throws Exception;
	
	List<?> get_request_list(PictVO pictVO) throws Exception;
	
	
	Integer request_total_cnt(PictVO pictVO) throws Exception;
	
	Map<String, Object> get_request_detail(@Param("idx") Integer idx) throws Exception;
	
	Map<String, Integer> equipment_approve_num(@Param("idx") int idx) throws Exception;
	
	
	void update_request_status(PictVO pictVO) throws Exception;
	
	Map<String, Object> get_user_by_request(PictVO pictVO) throws Exception; 
	
	Map<String, Object> get_user_by_faility_request(PictVO pictVO) throws Exception; 
	
	Integer equipment_list_total_cnt(PictVO pictVO) throws Exception;
	
	Map<String, Object> get_qr_code(PictVO pictVO) throws Exception;
	
	List<PictVO> rentalApprovedList(String serial_number);
	
	PictVO findEquipmentRequestById(@Param("id") String id, @Param("user_id") String userId) throws Exception;

	
	// 시설물 관리 매퍼
	
	List<?> facility_list(PictVO pictVO) throws Exception;
	
	List<Map<String, Object>> facility_item_list(PictVO pictVO) throws Exception;
	
	List<Map<String, Object>> facility_unavailable_date_list(PictVO pictVO) throws Exception;
	
	PictVO facility_list_one(PictVO pictVO) throws Exception;
	
	void facility_update(PictVO pictVO) throws Exception;

	void facility_insert(PictVO pictVO) throws Exception;
	
	void facility_delete(Integer idx) throws Exception;
	
	PictVO facility_item_one(PictVO pictVO) throws Exception;
	
	void facility_cnt_update(PictVO pictVO) throws Exception;

	void facility_cnt_insert(PictVO pictVO) throws Exception;
	
	void facility_cnt_delete(Integer idx) throws Exception;
	
	void submit_facility_request(PictVO pictVO) throws Exception;
	
	void update_facility_item(PictVO pictVO) throws Exception;
	
	List<PictVO> findFacilityRequest() throws Exception;
	
	List<?> get_facility_request_list(PictVO pictVO) throws Exception;
	
	
	Integer get_facility_request_total_cnt(PictVO pictVO) throws Exception;

	
	Map<String, Object> get_facility_request_detail(@Param("idx") Integer idx) throws Exception;
	
	Map<String, Integer> facility_approve_num(@Param("idx") int idx) throws Exception;
	
	void update_facility_request_status(PictVO pictVO) throws Exception;
	
	PictVO findFacilityRequestById(@Param("id") String id, @Param("user_id") String userId) throws Exception;
	
	Integer facility_list_total_cnt(PictVO pictVO) throws Exception;
	
	
	// 장바구니
	Integer isBag(PictVO pictVO) throws Exception;
	
	void add_bag(PictVO pictVO) throws Exception;
	
	void delete_bag(PictVO pictVO) throws Exception;
	
	List<Map<String, Object>> getBagList(PictVO pictVO) throws Exception;
	
	// 교육신청
	void request_education(PictVO pictVO) throws Exception;
	
	List<Map<String, Object>> get_education_list(PictVO pictVO) throws Exception;
	
	Map<String, Object> get_education_by_id(PictVO pictVO) throws Exception;
	
	
	void update_education(PictVO pictVO) throws Exception;


	// 그 외
	
	PictVO pemtour_select(PictVO pictVO) throws Exception;

	void pemtour_update(PictVO pictVO) throws Exception;

	List<?> event_list(PictVO pictVO) throws Exception;

	PictVO event_list_one(PictVO pictVO) throws Exception;

	void event_update(PictVO pictVO) throws Exception;

	void event_insert(PictVO pictVO) throws Exception;

	void event_delete(PictVO pictVO) throws Exception;
	
	void event_file_delete(PictVO pictVO) throws Exception;

	Integer video_location_list_cnt(PictVO pictVO) throws Exception;

	List<PictVO> video_location_list(PictVO pictVO) throws Exception;

	PictVO video_location_list_one(PictVO pictVO) throws Exception;

	void location_apply_save(PictVO pictVO) throws Exception;

	Integer industry_list_cnt(PictVO pictVO) throws Exception;

	List<PictVO> industry_list(PictVO pictVO) throws Exception;

	List<PictVO> portfolio_list(PictVO pictVO) throws Exception;

	PictVO industry_list_one(PictVO pictVO) throws Exception;

	List<PictVO> movie_list(PictVO pictVO) throws Exception;

}
