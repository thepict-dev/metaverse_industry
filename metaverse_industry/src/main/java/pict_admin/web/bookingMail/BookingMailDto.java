package pict_admin.web.bookingMail;

public class BookingMailDto {
	private String name;
	
	private String theDate;
	
	private String rentalDate;
	
	private String user;
	private String mobile;
	
	public BookingMailDto(String name, String theDate, String rentalDate, String user, String mobile) {
		super();
		this.name = name;
		this.theDate = theDate;
		this.rentalDate = rentalDate;
		this.user = user;
		this.mobile = mobile;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTheDate() {
		return theDate;
	}
	public void setTheDate(String theDate) {
		this.theDate = theDate;
	}
	public String getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
}
