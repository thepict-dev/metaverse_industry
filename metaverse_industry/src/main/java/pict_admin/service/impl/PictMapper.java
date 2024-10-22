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
	List<?> board_list(PictVO pictVO) throws Exception;
	
	Integer board_list_total_cnt(PictVO pictVO) throws Exception;
	
	Integer equipment_list_total_cnt(PictVO pictVO) throws Exception;

	PictVO board_list_one(PictVO pictVO) throws Exception;
	
	
	void board_update(PictVO pictVO) throws Exception;

	void board_insert(PictVO pictVO) throws Exception;

	void board_delete(PictVO pictVO) throws Exception;
	
	void board_file_delete(PictVO pictVO) throws Exception;
	
	List<?> equipment_list(PictVO pictVO) throws Exception;
	
	List<Map<String, Object>> equipment_item_list(PictVO pictVO) throws Exception;
	
	List<Map<String, Object>> equipment_unavailable_date_list(PictVO pictVO) throws Exception;
	
	PictVO equipment_list_one(PictVO pictVO) throws Exception;
	
	void equipment_update(PictVO pictVO) throws Exception;

	void equipment_insert(PictVO pictVO) throws Exception;
	
	
	PictVO equipment_item_one(PictVO pictVO) throws Exception;
	
	void equipment_cnt_update(PictVO pictVO) throws Exception;

	void equipment_cnt_insert(PictVO pictVO) throws Exception;
	
	void submit_rental_request(PictVO pictVO) throws Exception;
	
	void update_equipment_item(PictVO pictVO) throws Exception;
	
	List<?> get_request_list(PictVO pictVO) throws Exception;
	
	PictVO get_request_detail(PictVO pictVO) throws Exception;
	
	
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
