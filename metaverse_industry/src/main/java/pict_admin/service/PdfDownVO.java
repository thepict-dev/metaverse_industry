package pict_admin.service;

public class PdfDownVO {
	private String title;
	private String nowDate;
	private String rentalStartDate;
	private String rentalEndDate;
	private String rentalOnlyStartDate;
	private String rentalOnlyEndDate;
	private String requestDate;
	
	private PdfDownVO(String title, String nowDate, String rentalStartDate, String rentalEndDate, String rentalOnlyStartDate, String rentalOnlyEndDate, String requestDate) {
		this.title = title;
		this.nowDate = nowDate;
		this.rentalStartDate = rentalStartDate;
		this.rentalEndDate = rentalEndDate;
		this.rentalOnlyStartDate = rentalOnlyStartDate;
		this.rentalOnlyEndDate = rentalOnlyEndDate;
		this.requestDate = requestDate;
	}

    public static PdfDownVO of(String title, String nowDate, String rentalStartDate, String rentalEndDate, String rentalOnlyStartDate, String rentalOnlyEndDate, String requestDate) {
        return new PdfDownVO(title, nowDate, rentalStartDate, rentalEndDate, rentalOnlyStartDate, rentalOnlyEndDate, requestDate);
    }
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNowDate() {
		return nowDate;
	}
	public void setNowDate(String nowDate) {
		this.nowDate = nowDate;
	}
	public String getRentalStartDate() {
		return rentalStartDate;
	}
	public void setRentalStartDate(String rentalStartDate) {
		this.rentalStartDate = rentalStartDate;
	}
	public String getRentalEndDate() {
		return rentalEndDate;
	}
	public void setRentalEndDate(String rentalEndDate) {
		this.rentalEndDate = rentalEndDate;
	}
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getRentalOnlyStartDate() {
		return rentalOnlyStartDate;
	}

	public void setRentalOnlyStartDate(String rentalOnlyStartDate) {
		this.rentalOnlyStartDate = rentalOnlyStartDate;
	}

	public String getRentalOnlyEndDate() {
		return rentalOnlyEndDate;
	}

	public void setRentalOnlyEndDate(String rentalOnlyEndDate) {
		this.rentalOnlyEndDate = rentalOnlyEndDate;
	}
}
