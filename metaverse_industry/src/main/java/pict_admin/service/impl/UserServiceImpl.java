package pict_admin.service.impl;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import pict_admin.service.UserService;
import pict_admin.service.UserVO;

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

@Service("userService")
public class UserServiceImpl extends EgovAbstractServiceImpl implements UserService {

	
	private static final Logger LOGGER = LoggerFactory.getLogger(PictServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
//	@Resource(name = "pictDAO")
//	private PictDAO pictDAO;
	// TODO mybatis 사용
    @Resource(name="userMapper")
	private UserMapper userMapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public UserVO isUserIdAvailable(UserVO userVO) throws Exception {
		return userMapper.isUserIdAvailable(userVO);
	}
    @Override
    public void signUp(UserVO userVO) throws Exception {
    	userMapper.signUp(userVO);
	}
    @Override
    public UserVO getUserInfo(UserVO userVO) throws Exception {
		return userMapper.isUserIdAvailable(userVO);
	}
    
    @Override
    public void updateUser(UserVO userVO) throws Exception {
    	userMapper.updateUser(userVO);
	}
    
	@Override
	public List<?> get_request_list(PictVO pictVO) throws Exception {
		return userMapper.get_request_list(pictVO);
	}
    
	@Override
	public Integer get_request_total_cnt(PictVO pictVO) throws Exception {
		return userMapper.get_request_total_cnt(pictVO);
	}
	
	
    @Override
    public void updateRequestStatus(PictVO pictVO) throws Exception {
    	userMapper.updateRequestStatus(pictVO);
	}
    
    
    @Override
    public void retryRequest(PictVO pictVO) throws Exception {
    	userMapper.retryRequest(pictVO);
	}
}
