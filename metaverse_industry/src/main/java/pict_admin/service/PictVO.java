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
package pict_admin.service;

import java.util.List;
import java.util.Map;

import org.stringtemplate.v4.compiler.CodeGenerator.primary_return;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
/**
 * @Class Name : SampleVO.java
 * @Description : SampleVO Class
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
public class PictVO extends PictDefaultVO {

	private static final long serialVersionUID = 1L;

	private int idx;
	private String user_name;
	private boolean api;
	private String saveType;
	private int order_val;
	private String user_id;
	private String max_idx;
	private String target_table;
	private String reg_date;
	private String key_id;
	private String title;
	private String content;
	private String coin_text;
	private String type;
	private String password;
	private String name;
	private String position_x;
	private String position_y;
	private String position_z;
	private String rotation_x;
	private String rotation_y;
	private String rotation_z;
	private String cloth_id;
	private String face_id;
	private String hair_id;
	private String shoes_id;
	private String body;

	private String cloth;
	private String face;
	private String hair;
	private String shoes;

	private String use_at;
	private String link_url;
	private String professor;
	private String reg_id;
	private String std_num;
	private String lecture_id;

	private String in_date;
	private String out_date;
	private String in_out;
	private String timediff;
	private String category;
	private String category_id;
	private String category_cnt;
	private String week;
	private String id;
	private String email;
	private String nick_name;
	private String mobile;
	private String search_category;
	private String search_name;
	private String search_title;

	private String search_id;
	private String search_nickname;
	private String search_mobile;
	private String search_email;

	private String whole_timediff;
	private String search_text;
	private String order_by;
	private String active_ty;
	private String campus;
	private String text;
	private String professor_id;
	private String campus_id;
	private String week_cha;
	private String week_count;
	private String zoom_no;
	private String zoom_pw;
	private String time;
	private String url;
	private String file;
	private String video_type;
	private String img_url;
	private String depart;
	private String img_url2;
	private String wish_id;
	private String reply;
	private String title1;
	private String title2;
	private String img_url1;
	private String link_url1;
	private String link_url2;
	private String pemtour_url;
	private String subtitle;
	private String maintitle;
	private String from_date;
	private String to_date;
	// 현재 페이지
	private int pageNumber;
	private int startNumber;

	private int totalPage;
	
	private int lastPage;
	private int startPage;
	private int endPage;
	private int limit_cnt;

	private String address;
	private String control;
	private String drone;
	private String electricity;
	private String elevator;
	private String etc;
	private String fee;
	private String holiyday;
	private String img_thumb;
	private String img_url3;
	private String img_url4;
	private String img_url5;
	private String introduce;
	private String keyword;
	private String light;
	private String lighting;
	private String location_category;
	private String night;
	private String parking;
	private String person_cnt;
	private String pet;
	private String sound;
	private String tel;
	private String toilet;
	private String wating;
	private String width;
	private String wifi;
	private String file_url;
	private String location_id;
	private String start_date;
	private String end_date;
	private String company;
	private double lat;
	private double lng;
	private String flag;
	private String scale;
	private String logo_url;
	private String main_img_url;
	private String img_1;
	private String img_2;
	private String img_3;
	private String main_subject1;
	private String main_subject2;
	private String main_subject3;
	private String main_subject4;
	private String main_subject5;
	private String main_subject6;

	private String certificate_category1;
	private String certificate_category2;
	private String certificate_category3;
	private String certificate_category4;
	private String certificate_category5;
	private String certificate_category6;
	private String scale1;
	private String scale2;
	private String scale3;
	private String portfolio_link;
	private String portfolio_thumb;
	private String portfolio_title;
	private String homepage_url;
	private String ceo;
	private String establishment_date;
	private String certificate;
	private String open_date;
	private String file_url1;
	private String file_url2;
	private String file_url3;

	private String description;
	private String image_url;
	private String bujajae;
	private String serial_number;
	private String status;
	private String equipment_id;
	private int avaliable_equipment_cnt;

	private Boolean isOnlyAvailable;
	private String unavailable_date;
	// 재고의 아이디
	private String equipment_type_id;
	// 렌탈 신청 시작날짜
	private String rental_start_date;
	// 렌탈 신청 종료날짜
	private String rental_end_date;
	// 렌탈 신청 수량 cnt로 사용
	private String rental_cnt;
	// 렌탈 신청 타입(개인/기업)
	private String rental_type;
	// 장비사용계획
	private String equipment_plan;

	// 회사 이름
	private String company_nm;
	// 사업자번호
	private String sa_eob_no;
	// 직책
	private String position;
	// 회사주소1
	private String company_address1;
	// 회사주소2
	private String company_address2;
	// 장비대여 신청일자
	private String request_date;
	
	private String request_status;
	private String equipment_type;
	private int offset;
	private int totalCnt;
	private String reject_msg;
	private boolean isAll;
	
	private String birthday;
	private String address1;
	private String address2;
	// 시설물
	private String facility_type_id;
	private String facility_id;
	private String facility_plan;
	private String avaliable_facility_cnt;
	private String facility_type;
	private String facility_list;
	private String equipment_list;
    private transient List<Map<String, Object>> facilityListObject;  // 변환된 객체
    private transient List<Map<String, Object>> equipmentListObject;
    private String isLike;
    
    // 교육신청서
    private String team;
    private String visit_date;
    private String school;
    private String grade;
    
    private String content_url;
    private String professional_url;
    private String infra_url;
    private String video_url;
    private String video_thumb;
    
    
    
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public String getBujajae() {
		return bujajae;
	}

	public void setBujajae(String bujajae) {
		this.bujajae = bujajae;
	}

	public String getFile_url1() {
		return file_url1;
	}

	public void setFile_url1(String file_url1) {
		this.file_url1 = file_url1;
	}

	public String getFile_url2() {
		return file_url2;
	}

	public void setFile_url2(String file_url2) {
		this.file_url2 = file_url2;
	}

	public String getFile_url3() {
		return file_url3;
	}

	public void setFile_url3(String file_url3) {
		this.file_url3 = file_url3;
	}

	public String getOpen_date() {
		return open_date;
	}

	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getEstablishment_date() {
		return establishment_date;
	}

	public void setEstablishment_date(String establishment_date) {
		this.establishment_date = establishment_date;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public String getHomepage_url() {
		return homepage_url;
	}

	public void setHomepage_url(String homepage_url) {
		this.homepage_url = homepage_url;
	}

	public String getPortfolio_link() {
		return portfolio_link;
	}

	public void setPortfolio_link(String portfolio_link) {
		this.portfolio_link = portfolio_link;
	}

	public String getPortfolio_thumb() {
		return portfolio_thumb;
	}

	public void setPortfolio_thumb(String portfolio_thumb) {
		this.portfolio_thumb = portfolio_thumb;
	}

	public String getPortfolio_title() {
		return portfolio_title;
	}

	public void setPortfolio_title(String portfolio_title) {
		this.portfolio_title = portfolio_title;
	}

	public String getScale1() {
		return scale1;
	}

	public void setScale1(String scale1) {
		this.scale1 = scale1;
	}

	public String getScale2() {
		return scale2;
	}

	public void setScale2(String scale2) {
		this.scale2 = scale2;
	}

	public String getScale3() {
		return scale3;
	}

	public void setScale3(String scale3) {
		this.scale3 = scale3;
	}

	public String getMain_subject1() {
		return main_subject1;
	}

	public void setMain_subject1(String main_subject1) {
		this.main_subject1 = main_subject1;
	}

	public String getMain_subject2() {
		return main_subject2;
	}

	public void setMain_subject2(String main_subject2) {
		this.main_subject2 = main_subject2;
	}

	public String getMain_subject3() {
		return main_subject3;
	}

	public void setMain_subject3(String main_subject3) {
		this.main_subject3 = main_subject3;
	}

	public String getMain_subject4() {
		return main_subject4;
	}

	public void setMain_subject4(String main_subject4) {
		this.main_subject4 = main_subject4;
	}

	public String getMain_subject5() {
		return main_subject5;
	}

	public void setMain_subject5(String main_subject5) {
		this.main_subject5 = main_subject5;
	}

	public String getMain_subject6() {
		return main_subject6;
	}

	public void setMain_subject6(String main_subject6) {
		this.main_subject6 = main_subject6;
	}

	public String getCertificate_category1() {
		return certificate_category1;
	}

	public void setCertificate_category1(String certificate_category1) {
		this.certificate_category1 = certificate_category1;
	}

	public String getCertificate_category2() {
		return certificate_category2;
	}

	public void setCertificate_category2(String certificate_category2) {
		this.certificate_category2 = certificate_category2;
	}

	public String getCertificate_category3() {
		return certificate_category3;
	}

	public void setCertificate_category3(String certificate_category3) {
		this.certificate_category3 = certificate_category3;
	}

	public String getCertificate_category4() {
		return certificate_category4;
	}

	public void setCertificate_category4(String certificate_category4) {
		this.certificate_category4 = certificate_category4;
	}

	public String getCertificate_category5() {
		return certificate_category5;
	}

	public void setCertificate_category5(String certificate_category5) {
		this.certificate_category5 = certificate_category5;
	}

	public String getCertificate_category6() {
		return certificate_category6;
	}

	public void setCertificate_category6(String certificate_category6) {
		this.certificate_category6 = certificate_category6;
	}

	public String getMain_img_url() {
		return main_img_url;
	}

	public void setMain_img_url(String main_img_url) {
		this.main_img_url = main_img_url;
	}

	public String getLogo_url() {
		return logo_url;
	}

	public void setLogo_url(String logo_url) {
		this.logo_url = logo_url;
	}

	public String getImg_1() {
		return img_1;
	}

	public void setImg_1(String img_1) {
		this.img_1 = img_1;
	}

	public String getImg_2() {
		return img_2;
	}

	public void setImg_2(String img_2) {
		this.img_2 = img_2;
	}

	public String getImg_3() {
		return img_3;
	}

	public void setImg_3(String img_3) {
		this.img_3 = img_3;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getFile_url() {
		return file_url;
	}

	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}

	public String getLocation_id() {
		return location_id;
	}

	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getControl() {
		return control;
	}

	public void setControl(String control) {
		this.control = control;
	}

	public String getDrone() {
		return drone;
	}

	public void setDrone(String drone) {
		this.drone = drone;
	}

	public String getElectricity() {
		return electricity;
	}

	public void setElectricity(String electricity) {
		this.electricity = electricity;
	}

	public String getElevator() {
		return elevator;
	}

	public void setElevator(String elevator) {
		this.elevator = elevator;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getHoliyday() {
		return holiyday;
	}

	public void setHoliyday(String holiyday) {
		this.holiyday = holiyday;
	}

	public String getImg_thumb() {
		return img_thumb;
	}

	public void setImg_thumb(String img_thumb) {
		this.img_thumb = img_thumb;
	}

	public String getImg_url3() {
		return img_url3;
	}

	public void setImg_url3(String img_url3) {
		this.img_url3 = img_url3;
	}

	public String getImg_url4() {
		return img_url4;
	}

	public void setImg_url4(String img_url4) {
		this.img_url4 = img_url4;
	}

	public String getImg_url5() {
		return img_url5;
	}

	public void setImg_url5(String img_url5) {
		this.img_url5 = img_url5;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getLight() {
		return light;
	}

	public void setLight(String light) {
		this.light = light;
	}

	public String getLighting() {
		return lighting;
	}

	public void setLighting(String lighting) {
		this.lighting = lighting;
	}

	public String getLocation_category() {
		return location_category;
	}

	public void setLocation_category(String location_category) {
		this.location_category = location_category;
	}

	public String getNight() {
		return night;
	}

	public void setNight(String night) {
		this.night = night;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getPerson_cnt() {
		return person_cnt;
	}

	public void setPerson_cnt(String person_cnt) {
		this.person_cnt = person_cnt;
	}

	public String getPet() {
		return pet;
	}

	public void setPet(String pet) {
		this.pet = pet;
	}

	public String getSound() {
		return sound;
	}

	public void setSound(String sound) {
		this.sound = sound;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getToilet() {
		return toilet;
	}

	public void setToilet(String toilet) {
		this.toilet = toilet;
	}

	public String getWating() {
		return wating;
	}

	public void setWating(String wating) {
		this.wating = wating;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getWifi() {
		return wifi;
	}

	public void setWifi(String wifi) {
		this.wifi = wifi;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getStartNumber() {
		return startNumber;
	}

	public void setStartNumber(int startNumber) {
		this.startNumber = startNumber;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getLimit_cnt() {
		return limit_cnt;
	}

	public void setLimit_cnt(int limit_cnt) {
		this.limit_cnt = limit_cnt;
	}

	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public String getTo_date() {
		return to_date;
	}

	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}

	public String getMaintitle() {
		return maintitle;
	}

	public void setMaintitle(String maintitle) {
		this.maintitle = maintitle;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public String getPemtour_url() {
		return pemtour_url;
	}

	public void setPemtour_url(String pemtour_url) {
		this.pemtour_url = pemtour_url;
	}

	public String getLink_url1() {
		return link_url1;
	}

	public void setLink_url1(String link_url1) {
		this.link_url1 = link_url1;
	}

	public String getLink_url2() {
		return link_url2;
	}

	public void setLink_url2(String link_url2) {
		this.link_url2 = link_url2;
	}

	public String getTitle1() {
		return title1;
	}

	public void setTitle1(String title1) {
		this.title1 = title1;
	}

	public String getTitle2() {
		return title2;
	}

	public void setTitle2(String title2) {
		this.title2 = title2;
	}

	public String getImg_url1() {
		return img_url1;
	}

	public void setImg_url1(String img_url1) {
		this.img_url1 = img_url1;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getWish_id() {
		return wish_id;
	}

	public void setWish_id(String wish_id) {
		this.wish_id = wish_id;
	}

	public String getImg_url2() {
		return img_url2;
	}

	public void setImg_url2(String img_url2) {
		this.img_url2 = img_url2;
	}

	public String getDepart() {
		return depart;
	}

	public void setDepart(String depart) {
		this.depart = depart;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getVideo_type() {
		return video_type;
	}

	public void setVideo_type(String video_type) {
		this.video_type = video_type;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getZoom_no() {
		return zoom_no;
	}

	public void setZoom_no(String zoom_no) {
		this.zoom_no = zoom_no;
	}

	public String getZoom_pw() {
		return zoom_pw;
	}

	public void setZoom_pw(String zoom_pw) {
		this.zoom_pw = zoom_pw;
	}

	public String getWeek_cha() {
		return week_cha;
	}

	public void setWeek_cha(String week_cha) {
		this.week_cha = week_cha;
	}

	public String getWeek_count() {
		return week_count;
	}

	public void setWeek_count(String week_count) {
		this.week_count = week_count;
	}

	public String getCampus_id() {
		return campus_id;
	}

	public void setCampus_id(String campus_id) {
		this.campus_id = campus_id;
	}

	public String getProfessor_id() {
		return professor_id;
	}

	public void setProfessor_id(String professor_id) {
		this.professor_id = professor_id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getCampus() {
		return campus;
	}

	public void setCampus(String campus) {
		this.campus = campus;
	}

	public String getActive_ty() {
		return active_ty;
	}

	public void setActive_ty(String active_ty) {
		this.active_ty = active_ty;
	}

	public String getOrder_by() {
		return order_by;
	}

	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}

	public String getSearch_text() {
		return search_text;
	}

	public void setSearch_text(String search_text) {
		this.search_text = search_text;
	}

	public String getWhole_timediff() {
		return whole_timediff;
	}

	public void setWhole_timediff(String whole_timediff) {
		this.whole_timediff = whole_timediff;
	}

	public String getSearch_id() {
		return search_id;
	}

	public void setSearch_id(String search_id) {
		this.search_id = search_id;
	}

	public String getSearch_nickname() {
		return search_nickname;
	}

	public void setSearch_nickname(String search_nickname) {
		this.search_nickname = search_nickname;
	}

	public String getSearch_mobile() {
		return search_mobile;
	}

	public void setSearch_mobile(String search_mobile) {
		this.search_mobile = search_mobile;
	}

	public String getSearch_email() {
		return search_email;
	}

	public void setSearch_email(String search_email) {
		this.search_email = search_email;
	}

	public String getSearch_category() {
		return search_category;
	}

	public void setSearch_category(String search_category) {
		this.search_category = search_category;
	}

	public String getSearch_name() {
		return search_name;
	}

	public void setSearch_name(String search_name) {
		this.search_name = search_name;
	}

	public String getSearch_title() {
		return search_title;
	}

	public void setSearch_title(String search_title) {
		this.search_title = search_title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getCategory_cnt() {
		return category_cnt;
	}

	public void setCategory_cnt(String category_cnt) {
		this.category_cnt = category_cnt;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTimediff() {
		return timediff;
	}

	public void setTimediff(String timediff) {
		this.timediff = timediff;
	}

	public String getIn_out() {
		return in_out;
	}

	public void setIn_out(String in_out) {
		this.in_out = in_out;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

	public String getOut_date() {
		return out_date;
	}

	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}

	public String getLecture_id() {
		return lecture_id;
	}

	public void setLecture_id(String lecture_id) {
		this.lecture_id = lecture_id;
	}

	public String getStd_num() {
		return std_num;
	}

	public void setStd_num(String std_num) {
		this.std_num = std_num;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getProfessor() {
		return professor;
	}

	public void setProfessor(String professor) {
		this.professor = professor;
	}

	public String getUse_at() {
		return use_at;
	}

	public void setUse_at(String use_at) {
		this.use_at = use_at;
	}

	public String getLink_url() {
		return link_url;
	}

	public void setLink_url(String link_url) {
		this.link_url = link_url;
	}

	public String getCloth() {
		return cloth;
	}

	public void setCloth(String cloth) {
		this.cloth = cloth;
	}

	public String getFace() {
		return face;
	}

	public void setFace(String face) {
		this.face = face;
	}

	public String getHair() {
		return hair;
	}

	public void setHair(String hair) {
		this.hair = hair;
	}

	public String getShoes() {
		return shoes;
	}

	public void setShoes(String shoes) {
		this.shoes = shoes;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition_x() {
		return position_x;
	}

	public void setPosition_x(String position_x) {
		this.position_x = position_x;
	}

	public String getPosition_y() {
		return position_y;
	}

	public void setPosition_y(String position_y) {
		this.position_y = position_y;
	}

	public String getPosition_z() {
		return position_z;
	}

	public void setPosition_z(String position_z) {
		this.position_z = position_z;
	}

	public String getRotation_x() {
		return rotation_x;
	}

	public void setRotation_x(String rotation_x) {
		this.rotation_x = rotation_x;
	}

	public String getRotation_y() {
		return rotation_y;
	}

	public void setRotation_y(String rotation_y) {
		this.rotation_y = rotation_y;
	}

	public String getRotation_z() {
		return rotation_z;
	}

	public void setRotation_z(String rotation_z) {
		this.rotation_z = rotation_z;
	}

	public String getCloth_id() {
		return cloth_id;
	}

	public void setCloth_id(String cloth_id) {
		this.cloth_id = cloth_id;
	}

	public String getFace_id() {
		return face_id;
	}

	public void setFace_id(String face_id) {
		this.face_id = face_id;
	}

	public String getHair_id() {
		return hair_id;
	}

	public void setHair_id(String hair_id) {
		this.hair_id = hair_id;
	}

	public String getShoes_id() {
		return shoes_id;
	}

	public void setShoes_id(String shoes_id) {
		this.shoes_id = shoes_id;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getKey_id() {
		return key_id;
	}

	public void setKey_id(String key_id) {
		this.key_id = key_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCoin_text() {
		return coin_text;
	}

	public void setCoin_text(String coin_text) {
		this.coin_text = coin_text;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getTarget_table() {
		return target_table;
	}

	public void setTarget_table(String target_table) {
		this.target_table = target_table;
	}

	public String getMax_idx() {
		return max_idx;
	}

	public void setMax_idx(String max_idx) {
		this.max_idx = max_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getOrder_val() {
		return order_val;
	}

	public void setOrder_val(int order_val) {
		this.order_val = order_val;
	}

	public String getSaveType() {
		return saveType;
	}

	public void setSaveType(String saveType) {
		this.saveType = saveType;
	}

	public boolean isApi() {
		return api;
	}

	public boolean api() {
		return api;
	}

	public void setApi(boolean api) {
		this.api = api;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSerial_number() {
		return serial_number;
	}

	public void setSerial_number(String serial_number) {
		this.serial_number = serial_number;
	}

	public String getEquipment_id() {
		return equipment_id;
	}

	public void setEquipment_id(String equipment_id) {
		this.equipment_id = equipment_id;
	}

	public int getAvaliable_equipment_cnt() {
		return avaliable_equipment_cnt;
	}

	public void setAvaliable_equipment_cnt(int avaliable_equipment_cnt) {
		this.avaliable_equipment_cnt = avaliable_equipment_cnt;
	}

	public boolean isOnlyAvailable() {
		return isOnlyAvailable;
	}

	public void setOnlyAvailable(Boolean isOnlyAvailable) {
		this.isOnlyAvailable = isOnlyAvailable;
	}

	public String getUnavailable_date() {
		return unavailable_date;
	}

	public void setUnavailable_date(String unavailable_date) {
		this.unavailable_date = unavailable_date;
	}

	public String getEquipment_type_id() {
		return equipment_type_id;
	}

	public void setEquipment_type_id(String equipment_type_id) {
		this.equipment_type_id = equipment_type_id;
	}

	public String getRental_cnt() {
		return rental_cnt;
	}

	public void setRental_cnt(String rental_cnt) {
		this.rental_cnt = rental_cnt;
	}

	public String getRental_type() {
		return rental_type;
	}

	public void setRental_type(String rental_type) {
		this.rental_type = rental_type;
	}

	public String getEquipment_plan() {
		return equipment_plan;
	}

	public void setEquipment_plan(String equipment_plan) {
		this.equipment_plan = equipment_plan;
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

	public String getCompany_address1() {
		return company_address1;
	}

	public void setCompany_address1(String company_address1) {
		this.company_address1 = company_address1;
	}

	public String getCompany_address2() {
		return company_address2;
	}

	public void setCompany_address2(String company_address2) {
		this.company_address2 = company_address2;
	}

	public String getRental_start_date() {
		return rental_start_date;
	}

	public void setRental_start_date(String rental_start_date) {
		this.rental_start_date = rental_start_date;
	}

	public String getRental_end_date() {
		return rental_end_date;
	}

	public void setRental_end_date(String rental_end_date) {
		this.rental_end_date = rental_end_date;
	}

	public String getRequest_date() {
		return request_date;
	}

	public void setRequest_date(String request_date) {
		this.request_date = request_date;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getRequest_status() {
		return request_status;
	}

	public void setRequest_status(String request_status) {
		this.request_status = request_status;
	}

	public String getEquipment_type() {
		return equipment_type;
	}

	public void setEquipment_type(String equipment_type) {
		this.equipment_type = equipment_type;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public String getReject_msg() {
		return reject_msg;
	}

	public void setReject_msg(String reject_msg) {
		this.reject_msg = reject_msg;
	}

	public boolean isAll() {
		return isAll;
	}

	public void setAll(boolean isAll) {
		this.isAll = isAll;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getFacility_type_id() {
		return facility_type_id;
	}

	public void setFacility_type_id(String facility_type_id) {
		this.facility_type_id = facility_type_id;
	}

	public String getFacility_id() {
		return facility_id;
	}

	public void setFacility_id(String facility_id) {
		this.facility_id = facility_id;
	}

	public String getFacility_plan() {
		return facility_plan;
	}

	public void setFacility_plan(String facility_plan) {
		this.facility_plan = facility_plan;
	}

	public String getFacility_type() {
		return facility_type;
	}

	public void setFacility_type(String facility_type) {
		this.facility_type = facility_type;
	}

	public String getAvaliable_facility_cnt() {
		return avaliable_facility_cnt;
	}

	public void setAvaliable_facility_cnt(String avaliable_facility_cnt) {
		this.avaliable_facility_cnt = avaliable_facility_cnt;
	}

	public String getFacility_list() {
		return facility_list;
	}

	public void setFacility_list(String facility_list) {
		this.facility_list = facility_list;
	}
	
	public List<Map<String, Object>> getFacilityListObject() {
        if (facilityListObject == null && facility_list != null) {
            try {
                ObjectMapper mapper = new ObjectMapper();
                facilityListObject = mapper.readValue(
                    facility_list,
                    new TypeReference<List<Map<String, Object>>>(){}
                );
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return facilityListObject;
    }
	
	
	public List<Map<String, Object>> getEquipmentListObject() {
        if (equipmentListObject == null && equipment_list != null) {
            try {
                ObjectMapper mapper = new ObjectMapper();
                equipmentListObject = mapper.readValue(
                    equipment_list,
                    new TypeReference<List<Map<String, Object>>>(){}
                );
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return equipmentListObject;
    }

	public String getEquipment_list() {
		return equipment_list;
	}

	public void setEquipment_list(String equipment_list) {
		this.equipment_list = equipment_list;
	}

	public String getIsLike() {
		return isLike;
	}

	public void setIsLike(String isLike) {
		this.isLike = isLike;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}



	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getInfra_url() {
		return infra_url;
	}

	public void setInfra_url(String infra_url) {
		this.infra_url = infra_url;
	}

	public String getProfessional_url() {
		return professional_url;
	}

	public void setProfessional_url(String professional_url) {
		this.professional_url = professional_url;
	}

	public String getContent_url() {
		return content_url;
	}

	public void setContent_url(String content_url) {
		this.content_url = content_url;
	}

	public String getVideo_url() {
		return video_url;
	}

	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}

	public String getVideo_thumb() {
		return video_thumb;
	}

	public void setVideo_thumb(String video_thumb) {
		this.video_thumb = video_thumb;
	}
}
