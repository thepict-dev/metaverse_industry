/*
 * Copyright 2008-2009 the original author or authors.
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

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import pict_admin.service.AdminVO;
import pict_admin.service.PictDefaultVO;
import pict_admin.service.PictService;
import pict_admin.service.PictVO;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
 * @Modification Information
 * @
 *   @ 수정일 수정자 수정내용
 *   @ --------- --------- -------------------------------
 *   @ 2009.03.16 최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *      Copyright (C) by MOPAS All right reserved.
 */

@Service("pictService")
public class PictServiceImpl extends EgovAbstractServiceImpl implements PictService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PictServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	// @Resource(name = "pictDAO")
	// private PictDAO pictDAO;
	// TODO mybatis 사용
	@Resource(name = "pictMapper")
	private PictMapper pictMapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public Map<String, Object> get_url_settings(PictVO pictVO) throws Exception {

		return pictMapper.get_url_settings(pictVO);
	}

	@Override
	public void update_url_settings(PictVO pictVO) throws Exception {
		pictMapper.update_url_settings(pictVO);
	}

	// 팝업 리스트
	@Override
	public List<?> get_popup_list(PictVO pictVO) throws Exception {

		return pictMapper.get_popup_list(pictVO);
	}

	@Override
	public PictVO popup_list_one(PictVO pictVO) throws Exception {
		return pictMapper.popup_list_one(pictVO);
	}

	@Override
	public void popup_insert(PictVO pictVO) throws Exception {
		pictMapper.popup_insert(pictVO);

	}

	@Override
	public void popup_update(PictVO pictVO) throws Exception {
		pictMapper.popup_update(pictVO);

	}

	@Override
	public void popup_delete(PictVO pictVO) throws Exception {
		pictMapper.popup_delete(pictVO);

	}

	@Override
	public Integer get_popup_total_cnt(PictVO pictVO) throws Exception {
		return pictMapper.get_popup_total_cnt(pictVO);
	}

	// 유저

	@Override
	public List<Map<String, Object>> get_user_list(PictVO pictVO) throws Exception {

		return pictMapper.get_user_list(pictVO);
	}

	@Override
	public int usrCtn(PictVO pictVO) throws Exception {
		return pictMapper.usrCtn(pictVO);
	}

	@Override
	public void delete_user(Integer idx) throws Exception {
		pictMapper.delete_user(idx);

	}

	// 공지사항 관리
	@Override
	public List<?> board_list(PictVO pictVO) throws Exception {

		return pictMapper.board_list(pictVO);
	}

	@Override
	public Integer board_list_total_cnt(PictVO pictVO) throws Exception {
		return pictMapper.board_list_total_cnt(pictVO);
	}

	@Override
	public PictVO board_list_one(PictVO pictVO) throws Exception {
		return pictMapper.board_list_one(pictVO);
	}

	@Override
	public void board_update(PictVO pictVO) throws Exception {
		pictMapper.board_update(pictVO);

	}

	@Override
	public void board_insert(PictVO pictVO) throws Exception {
		pictMapper.board_insert(pictVO);
	}

	@Override
	public void board_delete(PictVO pictVO) throws Exception {
		pictMapper.board_delete(pictVO);

	}

	@Override
	public void board_file_delete(PictVO pictVO) throws Exception {
		pictMapper.board_file_delete(pictVO);
	}

	// 사업공고 관리
	@Override
	public List<?> biz_list(PictVO pictVO) throws Exception {

		return pictMapper.biz_list(pictVO);
	}

	@Override
	public Integer biz_list_total_cnt(PictVO pictVO) throws Exception {
		return pictMapper.biz_list_total_cnt(pictVO);
	}

	@Override
	public PictVO biz_list_one(PictVO pictVO) throws Exception {
		return pictMapper.biz_list_one(pictVO);
	}

	@Override
	public void biz_update(PictVO pictVO) throws Exception {
		pictMapper.biz_update(pictVO);

	}

	@Override
	public void biz_insert(PictVO pictVO) throws Exception {
		pictMapper.biz_insert(pictVO);
	}

	@Override
	public void biz_delete(PictVO pictVO) throws Exception {
		pictMapper.biz_delete(pictVO);

	}

	@Override
	public void biz_file_delete(PictVO pictVO) throws Exception {
		pictMapper.biz_file_delete(pictVO);

	}

	// 장비 관련

	@Override
	public List<PictVO> equipment_list(PictVO pictVO) throws Exception {
		return pictMapper.equipment_list(pictVO);
	}

	@Override
	public PictVO equipment_list_one(PictVO pictVO) throws Exception {
		return pictMapper.equipment_list_one(pictVO);
	}

	@Override
	public Integer equipment_list_total_cnt(PictVO pictVO) throws Exception {
		return pictMapper.equipment_list_total_cnt(pictVO);
	}

	@Override
	public List<Map<String, Object>> equipment_unavailable_date_list(PictVO pictVO) throws Exception {
		return pictMapper.equipment_unavailable_date_list(pictVO);
	}

	@Override
	public List<Map<String, Object>> get_closed_date() throws Exception {
		return pictMapper.get_closed_date();
	}

	@Override
	public List<Map<String, Object>> equipmentItemListByEquipmentId(PictVO pictVO) throws Exception {
		return pictMapper.equipmentItemListByEquipmentId(pictVO);
	}

	@Override
	public List<Map<String, Object>> equipment_item_list(PictVO pictVO) throws Exception {
		return pictMapper.equipment_item_list(pictVO);
	}

	@Override
	public void equipment_insert(PictVO pictVO) throws Exception {
		pictMapper.equipment_insert(pictVO);

	}

	@Override
	public void equipment_update(PictVO pictVO) throws Exception {
		pictMapper.equipment_update(pictVO);
	}

	@Override
	public void equipment_delete(Integer idx) throws Exception {
		pictMapper.equipment_delete(idx);
	}

	@Override
	public void equipment_cnt_delete(Integer idx) throws Exception {
		pictMapper.equipment_cnt_delete(idx);
	}

	@Override
	public PictVO equipment_item_one(PictVO pictVO) throws Exception {
		return pictMapper.equipment_item_one(pictVO);
	}

	@Override
	public void equipment_cnt_insert(PictVO pictVO) throws Exception {
		pictMapper.equipment_cnt_insert(pictVO);

	}

	@Override
	public void equipment_cnt_update(PictVO pictVO) throws Exception {
		pictMapper.equipment_cnt_update(pictVO);

	}

	@Override
	public void submit_rental_request(PictVO pictVO) throws Exception {
		pictMapper.submit_rental_request(pictVO);
		// pictMapper.update_equipment_item(pictVO);
	}

	@Override
	public List<PictVO> findEquipmentRequest() throws Exception {
		return pictMapper.findEquipmentRequest();
	}

	@Override
	public List<?> get_request_list(PictVO pictVO) throws Exception {
		return pictMapper.get_request_list(pictVO);
	}

	@Override
	public Integer request_total_cnt(PictVO pictVO) throws Exception {
		return pictMapper.request_total_cnt(pictVO);
	}

	@Override
	public Map<String, Object> get_request_detail(Integer idx) throws Exception {
		return pictMapper.get_request_detail(idx);
	}

	@Override
	public Map<String, Integer> equipmentApproveNum(int idx) throws Exception {
		return pictMapper.equipment_approve_num(idx);
	}

	@Override
	public void update_request_status(PictVO pictVO) throws Exception {
		pictMapper.update_request_status(pictVO);

	}

	@Override
	public Map<String, Object> get_user_by_request(PictVO pictVO) throws Exception {
		return pictMapper.get_user_by_request(pictVO);
	}

	@Override
	public Map<String, Object> get_user_by_faility_request(PictVO pictVO) throws Exception {
		return pictMapper.get_user_by_faility_request(pictVO);
	}

	@Override
	public List<PictVO> daily_mail_list() throws Exception {
		return pictMapper.daily_mail_list();
	}

	@Override
	public void mailingBackup(String data) throws Exception {
		pictMapper.mailing_backup(data);
	}

	@Override
	public List<Map<String, Object>> get_overdue_list() throws Exception {
		return pictMapper.get_overdue_list();
	}

	@Override
	public Map<String, Object> get_qr_code(PictVO pictVO) throws Exception {
		return pictMapper.get_qr_code(pictVO);
	}

	@Override
	public List<PictVO> rentalApprovedList(String serial_number) {
		return pictMapper.rentalApprovedList(serial_number);
	}

	@Override
	public PictVO findEquipmentRequestById(String id, String userId) throws Exception {
		return pictMapper.findEquipmentRequestById(id, userId);
	}

	// 시설물 관려

	@Override
	public List<?> facility_list(PictVO pictVO) throws Exception {
		return pictMapper.facility_list(pictVO);
	}

	@Override
	public PictVO facility_list_one(PictVO pictVO) throws Exception {
		return pictMapper.facility_list_one(pictVO);
	}

	@Override
	public Integer facility_list_total_cnt(PictVO pictVO) throws Exception {
		return pictMapper.facility_list_total_cnt(pictVO);
	}

	@Override
	public List<Map<String, Object>> facility_unavailable_date_list(PictVO pictVO) throws Exception {
		System.out.println("임플리먼트 id 조회 @@@@@@@@@@@@@@" + pictVO.getId());
		return pictMapper.facility_unavailable_date_list(pictVO);
	}

	@Override
	public List<Map<String, Object>> facility_item_list(PictVO pictVO) throws Exception {
		return pictMapper.facility_item_list(pictVO);
	}

	@Override
	public void facility_insert(PictVO pictVO) throws Exception {
		pictMapper.facility_insert(pictVO);

	}

	@Override
	public void facility_update(PictVO pictVO) throws Exception {
		pictMapper.facility_update(pictVO);
	}

	@Override
	public void facility_delete(Integer idx) throws Exception {
		pictMapper.facility_delete(idx);
	}

	@Override
	public void facility_cnt_delete(Integer idx) throws Exception {
		pictMapper.facility_cnt_delete(idx);
	}

	@Override
	public PictVO facility_item_one(PictVO pictVO) throws Exception {
		return pictMapper.facility_item_one(pictVO);
	}

	@Override
	public void facility_cnt_insert(PictVO pictVO) throws Exception {
		pictMapper.facility_cnt_insert(pictVO);

	}

	@Override
	public void facility_cnt_update(PictVO pictVO) throws Exception {
		pictMapper.facility_cnt_update(pictVO);
	}

	@Override
	public void submit_facility_request(PictVO pictVO) throws Exception {
		pictMapper.submit_facility_request(pictVO);
		// pictMapper.update_equipment_item(pictVO);
	}

	@Override
	public List<PictVO> findFacilityRequest() throws Exception {
		return pictMapper.findFacilityRequest();
	}

	@Override
	public List<?> get_facility_request_list(PictVO pictVO) throws Exception {
		return pictMapper.get_facility_request_list(pictVO);
	}

	@Override
	public Integer get_facility_request_total_cnt(PictVO pictVO) throws Exception {
		return pictMapper.get_facility_request_total_cnt(pictVO);
	}

	@Override
	public Map<String, Object> get_facility_request_detail(Integer idx) throws Exception {
		return pictMapper.get_facility_request_detail(idx);
	}

	@Override
	public Map<String, Integer> facilityApproveNum(int idx) throws Exception {
		return pictMapper.facility_approve_num(idx);
	}

	@Override
	public void update_facility_request_status(PictVO pictVO) throws Exception {
		pictMapper.update_facility_request_status(pictVO);

	}

	@Override
	public PictVO findFacilityRequestById(String id, String userId) throws Exception {
		return pictMapper.findFacilityRequestById(id, userId);
	}

	// 장바구니
	public Integer isBag(PictVO pictVO) throws Exception {
		return pictMapper.isBag(pictVO);
	}

	@Override
	public void add_bag(PictVO pictVO) throws Exception {
		pictMapper.add_bag(pictVO);
	}

	@Override
	public void delete_bag(PictVO pictVO) throws Exception {
		pictMapper.delete_bag(pictVO);
	}

	@Override
	public List<Map<String, Object>> getBagList(PictVO pictVO) throws Exception {
		return pictMapper.getBagList(pictVO);
	}

	// 교육신청
	@Override
	public void request_education(PictVO pictVO) throws Exception {
		pictMapper.request_education(pictVO);
	}

	@Override
	public List<Map<String, Object>> get_education_list(PictVO pictVO) throws Exception {
		return pictMapper.get_education_list(pictVO);
	}

	@Override
	public Map<String, Object> get_education_by_id(PictVO pictVO) throws Exception {
		return pictMapper.get_education_by_id(pictVO);
	}

	@Override
	public void update_education(PictVO pictVO) throws Exception {
		pictMapper.update_education(pictVO);
	}

	// 그외

	@Override
	public PictVO pemtour_select(PictVO pictVO) throws Exception {
		return pictMapper.pemtour_select(pictVO);
	}

	@Override
	public void pemtour_update(PictVO pictVO) throws Exception {
		pictMapper.pemtour_update(pictVO);

	}

	@Override
	public List<?> event_list(PictVO pictVO) throws Exception {
		return pictMapper.event_list(pictVO);
	}

	@Override
	public PictVO event_list_one(PictVO pictVO) throws Exception {
		return pictMapper.event_list_one(pictVO);
	}

	@Override
	public void event_update(PictVO pictVO) throws Exception {
		pictMapper.event_update(pictVO);

	}

	@Override
	public void event_insert(PictVO pictVO) throws Exception {
		pictMapper.event_insert(pictVO);

	}

	@Override
	public void event_delete(PictVO pictVO) throws Exception {
		pictMapper.event_delete(pictVO);

	}

	@Override
	public void event_file_delete(PictVO pictVO) throws Exception {
		pictMapper.event_file_delete(pictVO);

	}

	@Override
	public Integer video_location_list_cnt(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.video_location_list_cnt(pictVO);
	}

	@Override
	public List<PictVO> video_location_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.video_location_list(pictVO);
	}

	@Override
	public PictVO video_location_list_one(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.video_location_list_one(pictVO);
	}

	@Override
	public void location_apply_save(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		pictMapper.location_apply_save(pictVO);
	}

	@Override
	public Integer industry_list_cnt(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.industry_list_cnt(pictVO);
	}

	@Override
	public List<PictVO> industry_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.industry_list(pictVO);
	}

	@Override
	public List<PictVO> portfolio_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.portfolio_list(pictVO);
	}

	@Override
	public PictVO industry_list_one(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.industry_list_one(pictVO);
	}

	@Override
	public List<PictVO> movie_list(PictVO pictVO) throws Exception {
		// TODO Auto-generated method stub
		return pictMapper.movie_list(pictVO);
	}

}
