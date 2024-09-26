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
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("pictService")
public class PictServiceImpl extends EgovAbstractServiceImpl implements PictService {

	private static final Logger LOGGER = LoggerFactory.getLogger(PictServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
//	@Resource(name = "pictDAO")
//	private PictDAO pictDAO;
	// TODO mybatis 사용
    @Resource(name="pictMapper")
	private PictMapper pictMapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;



	@Override
	public List<?> board_list(PictVO pictVO) throws Exception {
		return pictMapper.board_list(pictVO);
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
