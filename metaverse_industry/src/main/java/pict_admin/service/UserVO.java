package pict_admin.service;

public class UserVO {
	private String user_id;
	private String password;
	private String password_confirm;
	private String name;
	private String mobile;
	private String email;
	private String birthday;
	private String user_address1;
	private String user_address2;
	private String company_address1;
	private String company_address2;
	private String company_nm;
	private String sa_eob_no;
	private String position;
	private String document_url;

	public UserVO() {
	}

	private UserVO(String user_id) {
		this.user_id = user_id;
	}
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getUser_address1() {
		return user_address1;
	}
	public void setUser_address1(String address1) {
		this.user_address1 = address1;
	}

	public String getCompany_nm() {
		return company_nm;
	}
	public void setCompany_nm(String company_nm) {
		this.company_nm = company_nm;
	}
	public String getSa_eob_no() {
		return sa_eob_no;
	}
	public void setSa_eob_no(String sa_eob_no) {
		this.sa_eob_no = sa_eob_no;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDocument_url() {
		return document_url;
	}
	public void setDocument_url(String document_url) {
		this.document_url = document_url;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public static UserVO of(String user_id) {
		return new UserVO(user_id);
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword_confirm() {
		return password_confirm;
	}
	public void setPassword_confirm(String password_confirm) {
		this.password_confirm = password_confirm;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser_address2() {
		return user_address2;
	}
	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}
	public String getCompany_address2() {
		return company_address2;
	}
	public void setCompany_address2(String company_address2) {
		this.company_address2 = company_address2;
	}
	public String getCompany_address1() {
		return company_address1;
	}
	public void setCompany_address1(String company_address1) {
		this.company_address1 = company_address1;
	}
	
}
