<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<meta charset="ko">
<%@ include file="./include/head.jsp" %>
<body>
	<%@ include file="./include/header.jsp" %>
    <div class="loginTitle">
        <h2>마이페이지</h2>
    </div>
    <ul class="tabNav">
        <li><a href="/mypage_account.do">계정 관리</a></li>
        <li><a href="/mypage_equip.do">장비 예약정보</a></li>
        <li><a href="/mypage_facil.do">시설 예약정보</a></li>
        <li class="active"><a href="/mypage_bag.do">장바구니</a></li>
    </ul>
    <div class="tabInner loginWrapper active">
        <form class="myBagContainer">
	    <ul class="tabNav sub">
	        <li class="active"><a href="">장비</a></li>
	        <li><a href="">시설</a></li>
	    </ul>
            <ul class="rentalItemList my">
                <li>
                    <input type="checkbox" name="equip" id="equip_1">
                    <label for="equip_1"></label>
                    <div class="checkItem">
                        <div class="itemImg">
                            <img src="/img/user_img/pro-eye.png" alt="">
                            <span></span>
                            <a href="#lnk"><img src="/img/user_img/bag.png" alt=""></a>
                        </div>
                        <div class="itemTitles">
                            <span>정보없음</span>
                            <p>이름이 진짜 긴 장비를 넣으면은 말줄임 표시해야돼</p>
                        </div>
                        <p>360도캠코더 / 5.7K / 30프레임 / 화각:200도 / 촬영시간:60분 / CMOS센서 / 센서크기:0.43인치(1/2.3) / 무게:115g / 배터리:1200mAh / USB-C / WiFi(무선전송) / 블루투스 / GPS내장 / 손떨림보정 / 타임랩스(인터벌촬영) / 슬로우모션(고속촬영) / 라이브스트리밍 / RAW사진 / HDR사진 / 방수(케이스착용) / 수중촬영30m / 이중어안렌즈탑재 / 시네마틱저속모드 / 하이퍼랩스기능 / 탈착식배</p>
                    </div>
                </li>
            </ul>
            <div class="fullButtonContainer bag">
                <a href="#lnk" class="wt normal">예약페이지로 이동</a>
            </div>
        </form>
    </div>
	<%@ include file="./include/footer.jsp" %>
</body>
</html>