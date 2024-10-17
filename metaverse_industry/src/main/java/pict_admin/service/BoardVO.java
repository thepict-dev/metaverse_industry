package pict_admin.service;

public class BoardVO {
	private String category;
	private String title;
	private String text;
	private String file_url1;
	private String file_url2;
	private String file_url3;
	
	public String getCategory() {
		return this.category;
	}
	public String getTitle() {
		return this.title;
	}
	public String getText() {
		return this.text;
	}
	
	public String getFileUrl1() {
		return this.file_url1;
	}
	public String getFileUrl2() {
		return this.file_url2;
	}
	public String getFileUrl3() {
		return this.file_url3;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setText(String text) {
		this.text = text;
	}
	public void setFileUrl1(String file_url) {
		this.file_url1 = file_url;
	}
	public void setFileUrl2(String file_url) {
		this.file_url2 = file_url;
	}
	public void setFileUrl3(String file_url) {
		this.file_url3 = file_url;
	}
}