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
    <div class="introSection" id="introSection">
        <img src="/img/user_img/swiper-img1.png" alt="" class="pcBack">
        <img src="/img/user_img/mb-back.png" alt="" class="mbBack">
        <div class="introSecContents">
            <h2><img src="/img/user_img/logo-sub.png" alt=""></h2>
            <span>'강원 메타버스 지원센터'는</span>
            <p>강원특별자치도의<br>미래 시대 콘텐츠 산업을<br>선도합니다</p>
            <div class="scroll">Scroll Down<img src="/img/user_img/down.png" alt=""></div>
        </div>
    </div>
	<%@ include file="./include/header.jsp" %>
    <main>
	    <c:if test="${totalCnt > 0}">
			<div class="mainPopup">
		        <div class="mainPopupInner">
		            <button type="button" onclick="closePopup()"><img src="/user_img/close-popup.png" alt=""></button>
		            <div class="swiper popup">
		                <div class="swiper-wrapper">
		                    <c:forEach var="item" items="${popupList}" varStatus="status">
			                    <div class="swiper-slide">
			                    	<c:if test="${item.link_url != null and item.link_url != ''}">
				                        <a href="${item.link_url}">
				                            <img src="${item.image_url}" alt="팝업이미지">
				                        </a>
			                    	</c:if>
			                    	<c:if test="${item.link_url == null or item.link_url == ''}">
			                            <img src="${item.image_url}" alt="팝업이미지">
			                    	</c:if>
			                    </div>
		                    </c:forEach>
		                </div>
		            </div>
		            <div class="mainPopupButtons">
		                <button type="button" onclick="todayClosePopup()">오늘 하루 보지 않기</button>
		                <button type="button" onclick="closePopup()">닫기</button>
		            </div>
		            <div class="swiper-pagination popup"></div>
		        </div>
		    </div>
		</c:if>
    
    
    
    
        <div class="section1" id="section1">
            <div class="eduSection">
                <span><img src="/img/user_img/edu-poster.jpeg" alt=""></span>
                <div class="eduPosTexts">
                    <div class="eduPosTitle">
                        <p>메타버스 현장 체험교육</p>
                        <span>강원지역 초·중·고등학생 대상 VR·AR 현장체험교육을 통한 메타버스 산업의 이해를 높이기 위한 체험교육입니다</span>
                    </div>
                    <ul class="eduPosText">
                        <li>
                            <p><img src="/img/user_img/location.png" alt="">장소안내</p>
                            <span>강원 메타버스 지원센터(강원특별자치도 춘천시 박사로 854 창작발전소 1층)</span>
                        </li>
                        <li>
                            <p><img src="/img/user_img/user.png" alt="">신청대상</p>
                            <span>강원지역 초·중·고등학생(초등학생 4학년 이상 가능)</span>
                        </li>
                        <li>
                            <p><img src="/img/user_img/calendar.png" alt="">교육일정</p>
                            <span>일주일 전 신청필수</span>
                        </li>
                    </ul>
                    <a href="/education.do" class="blueButton dot">신청하기</a>
                </div>
            </div>
            <div class="swiperSection">
                <div class="swiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="/img/user_img/swiper-img1.png" alt="">
                            <div class="swiperTexts first">
                                <span>강원 메타버스 지원센터는</span>
                                <p>강원특별자치도의 미래 시대<br>
                                    콘텐츠 산업을 선도합니다</p>
                                <a href="#lnk">보러가기
                                	<img src="/img/user_img/linkto.png" alt="">
                                	<img src="/img/user_img/linkto-hover.png" alt="" class="hover">
                               	</a>
                            </div>
                        </div>
                        <div class="swiper-slide"> 
                            <img src="/img/user_img/swiper-img2.png" alt="">
                            <div class="swiperTexts second">
                                <span>강원 메타버스 지원센터</span>
                                <p>VR·AR 시설 및<br>
                                    장비 무상 지원</p>
                                <a href="#lnk">
	                                보러가기
	                                <img src="/img/user_img/linkto.png" alt="">
                                	<img src="/img/user_img/linkto-hover.png" alt="" class="hover">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="buttonsWrapper">
                        <div class="swiperButtons">
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-pause"></div>
                            <div class="swiper-button-prev"></div>
                        </div>
                        <div class="autoplay-progress">
                            <svg viewBox="0 0 48 48">
                                <circle cx="24" cy="24" r="20"></circle>
                                <circle cx="24" cy="24" r="20"></circle>
                            </svg>
                            <span></span>
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="bookingNotice">
                    <div class="bookingSection">
                        <h2 class="mainSubTitle">Book now</h2>
                        <ul class="bookingLinks">
                            <li>
                                <a href="/facility.do">
                                    <p><span>시설사용</span>바로가기</p>
                                </a>
                            </li>
                            <li>
                                <a href="/equipment.do">
                                    <p><span>장비사용</span>바로가기</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="noticeContainer">
                        <h2 class="mainSubTitle">Notice</h2>
                        <ul class="notice main">
                        	<c:forEach var="notice" items="${noticeList}" varStatus="status">
	                            <li>
	                                <a href="/notice_view.do?idx=${notice.idx}">
	                                    <p class="ntInfos">
	                                        <span class="category">
		                               	        <c:choose>
									                <c:when test="${notice.category eq '1'}">
									                    센터소식
									                </c:when>
									                <c:when test="${notice.category eq '2'}">
									                    행사안내
									                </c:when>
									                <c:when test="${notice.category eq '3'}">
									                    보도자료
									                </c:when>
									                <c:when test="${notice.category eq '4'}">
									                    기타공고
									                </c:when>
									            </c:choose>
	                                        </span>
	                                        
	                                        <span class="ntIndex">${notice.idx}</span>
	                                        <span class="ntTitle">${notice.title}</span>
	                                    </p>
	                                    <p class="ntDate">${notice.reg_date}<img src="/img/user_img/list-link.png" alt=""></p>
	                                </a>
	                            </li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="cardSection">
            <ul class="cardLists">
                <li class="active">
                    <span><img src="/img/user_img/intro1.png" alt=""></span>
                    <div class="cardContents">
                        <span class="cardSub">콘텐츠 제작 지원</span>
                        <p>메타버스 융합콘텐츠<br>제작 지원 사업</p>
                        <span class="cardDesc">강원도 내 메타버스 관련 기업을 지원하여 레저·휴양과 의료 분야의 혁신적 콘텐츠 제작을 목표로 하는 사업입니다. 지원 대상은 메타버스 기술 또는 서비스를 보유한 강원특별자치도 소재 기업으로, 자세한 내용은 홈페이지를 참고하세요.</span>
                        <a href="${setting.content_url}" class="linkButton blk">
                        	보러가기
                       		<img src="/img/user_img/list-link.png" alt="">
                            <img src="/img/user_img/arr-hover2.png" alt="" class="hover">
                       	</a>
                    </div>
                </li>
                <li>
                    <span><img src="/img/user_img/intro2.png" alt=""></span>
                    <div class="cardContents">
                        <span class="cardSub">전문인력 양성</span>
                        <p>메타버스 전문인력<br>양성 교육 사업</p>
                        <span class="cardDesc">강원지역 메타버스 산업의 요구사항을 반영한 실무형 교육을 통해 산업 종사자 및 취업 희망자의 직무 능력을 향상시키고 인재를 발굴하는 사업입니다. 지원 대상은 강원 소재 기업 재직자, 미취업자, 대학생으로, 교육장소는 추후 공지됩니다. 자세한 내용은 사업공고일에 확인하세요.</span>
                        <a href="${setting.professional_url}" class="linkButton blk">
                        	보러가기
                       		<img src="/img/user_img/list-link.png" alt="">
                            <img src="/img/user_img/arr-hover2.png" alt="" class="hover">
                     	</a>
                    </div>
                </li>
                <li>
                    <span><img src="/img/user_img/intro3.png" alt=""></span>
                    <div class="cardContents">
                        <span class="cardSub">인프라 지원</span>
                        <p>강원 메타버스 지원센터<br>인프라(시설·장비) 지원</p>
                        <span class="cardDesc">메타버스 콘텐츠 제작에 필요한 인프라(시설·장비)를 강원특별자치도 내 메타버스 기업 및 유관기관에 지원합니다. 사용 방법은 홈페이지를 통한 예약신청 후 방문입니다. 지원대상은 강원특별자치도의 메타버스 관련 기업, 유관기관 임직원 및 메타버스 관련 창업·취업 준비자입니다.</span>
                        <a href="${setting.infra_url}" class="linkButton blk">
                        	보러가기
                        	<img src="/img/user_img/list-link.png" alt="">
                            <img src="/img/user_img/arr-hover2.png" alt="" class="hover">
                       	</a>
                    </div>
                </li>
            </ul>
        </div>
        <div class="videoSection">
	        <div class="iframeContainer">
			  <iframe src="${setting.video_url}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen ></iframe>
			</div>
          	<a href="${setting.channel_url}" target="blank" title="새창이동">채널 바로가기 <img src="/img/user_img/arrow-right.png" alt=""></a>
        </div>
    </main>
	<%@ include file="./include/footer.jsp" %>
    <script>
        // GSAP 애니메이션 설정
        gsap.registerPlugin(ScrollTrigger);

        const introSection = document.querySelector('.introSection');
        const swiperSection = document.querySelector('.swiperSection');
        const header = document.querySelector('header');
        const main = document.querySelector('main');

        // Swiper 관련 요소
        const progressCircle = document.querySelector(".autoplay-progress svg");
        const pauseButton = document.querySelector(".swiper-button-pause");
        const nextButton = document.querySelector(".swiper-button-next");
        const prevButton = document.querySelector(".swiper-button-prev");
        let isPlaying = false;

        // 초기 설정
        gsap.set(introSection, { 
            position: 'fixed', 
            top: 0, 
            left: 0, 
            width: '100%', 
            height: '100vh', 
            zIndex: 15 
        });

        gsap.set([header, main], { 
            position: 'relative',
            //zIndex: 1
        });

        let isAnimationTriggered = false;
        let swiper;
        const autoplayDuration = 5000; // 5초

        // intro 섹션 애니메이션 생성
        const introAnimation = gsap.timeline({ paused: true });

        introAnimation
        .to(introSection, {
            width: () => swiperSection.offsetWidth,
            height: () => swiperSection.offsetHeight,
            top: () => swiperSection.getBoundingClientRect().top,
            left: () => swiperSection.getBoundingClientRect().left,
            duration: 1,
            ease: 'power2.inOut'
        })
        .to(introSection.querySelector('.introSecContents'), {
            opacity: 0,
            duration: 0.3,
            ease: 'power2.inOut'
        }, "-=0.3")
        .to(introSection, {
            opacity: 0,
            duration: 0.3,
            ease: 'none',
            onComplete: () => {
            introSection.style.display = 'none';
            document.body.style.overflow = 'auto';
            initSwiper();
            
            }
        });

        function initSwiper() {
        	const popupSwiper = new Swiper('.swiper.popup', {
  	    	  autoplay: {
  	    	    delay: 3000,
  	    	    disableOnInteraction: false
  	    	  },
  	    	  loop: true,	// 무한 루�� 적용
  	    	  speed: 2000, 
  	    	  pagination: {
  	    	    el: ".swiper-pagination.popup",
  	    	    clickable: true,
  	    	  },
  	    	});
        	
            swiper = new Swiper(".swiperSection .swiper", {
                centeredSlides: true,
                loop: true,
                allowTouchMove: window.innerWidth <= 1024 ? false : true, // 모바일에서 터치 슬라이드 비활성화
                autoplay:{
                    delay: autoplayDuration,
                    disableOnInteraction: false,
                },
                fadeEffect: {
                    crossFade: true
                },
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev"
                },
                on: {
                    autoplayTimeLeft(s, time, progress) {
                        progressCircle.style.setProperty("--progress", 1 - progress);
                    }
                }
            });

            isPlaying = true;
            updatePlayPauseButton();
        }

        function toggleAutoplay() {
            if (isPlaying) {
                swiper.autoplay.stop();
            } else {
                swiper.autoplay.start();
            }
            isPlaying = !isPlaying;
            updatePlayPauseButton();
        }

        function updatePlayPauseButton() {
            pauseButton.style.backgroundImage = isPlaying ? 'url(/img/user_img/pause.png)' : 'url(/img/user_img/play.png)';
        }

        function handleAnimationTrigger() {
            if (!isAnimationTriggered) {
                isAnimationTriggered = true;
                introAnimation.play();
                window.removeEventListener('wheel', handleAnimationTrigger);
                window.removeEventListener('touchstart', handleAnimationTrigger);
            }
        }

        // 이벤트 리스너 등록
        window.addEventListener('wheel', handleAnimationTrigger, { passive: false });
        window.addEventListener('touchstart', handleAnimationTrigger, { passive: false });

        // 초기 스크롤 방지
        document.body.style.overflow = 'hidden';

        // Swiper 컨트롤 기능
        pauseButton.addEventListener('click', toggleAutoplay);
        
        
        $( document ).ready(function() {
	        var cookiedata = document.cookie;
	        if (cookiedata.indexOf("ncookie=done") < 0) {
	            document.querySelector('.mainPopup').style.display = "flex";
	        }
	        else {
	            document.querySelector('.mainPopup').style.display = "none";    // 팝업창 아이디
	        }
	    });

	    function setCookie( name, value, expiredays ) { 
	        var todayDate = new Date(); 
	        todayDate.setDate( todayDate.getDate() + expiredays );
	        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	    }

	    function closePopup() { 
	        document.querySelector('.mainPopup').style.display = "none";    // 팝업창 아이디
	    }

	    function todayClosePopup() { 
	        setCookie( "ncookie", "done" , 1 );     // 저장될 쿠키명 , 쿠키 value값 , 기간( ex. 1은 하루, 7은 일주일)
	        document.querySelector('.mainPopup').style.display = "none";    // 팝업창 아이디
	    }
	    
	    
	    
        
    </script>
</body>
</html>