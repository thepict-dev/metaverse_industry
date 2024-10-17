package pict_admin.service;

public interface UserService {

	UserVO isUserIdAvailable(UserVO userVO) throws Exception;
	
	void signUp(UserVO userVO) throws Exception;
	
	UserVO getUserInfo(UserVO userVO) throws Exception;
}
