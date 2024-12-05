$(document).ready(function() {
  // 초기 상태 설정
  $('.gnbNav, .gnbBack').hide();

  // gnb에 마우스오버 시 이벤트
  $('.nav, .gnbBack').on('mouseenter', function() {
      $('.gnbNav, .gnbBack').stop().slideDown(300);
  });

  // gnb에서 마우스아웃 시 이벤트
  $('.nav, .gnbBack').on('mouseleave', function() {
      $('.gnbNav, .gnbBack').stop().slideUp(300);
  });
});

// 스크롤 이벤트 핸들러 추가
$(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
        $('header').addClass('active');
    } else {
        $('header').removeClass('active');
    }
});

// 서브 메뉴 토글
$(".mobile-menu ul.depth > li > a, .mobile-menu ul.depth > li > span").click(function(e) {
	var $parentLi = $(this).parent('li');
	var $subDepth = $parentLi.find('.sub-depth');

    // 다른 모든 메뉴 항목의 active 클래스 제거 및 서브메뉴 닫기
    $(".mobile-menu ul.depth > li").not($parentLi).removeClass("active").find('.sub-depth').slideUp(200);

    // 클릭된 메뉴 항목 토글
    $parentLi.toggleClass("active");
    $subDepth.slideToggle(200);
});

$(".mbMenuBtn").click(function () {
    $('.mobile-menu').addClass("active");
    $('body').addClass("no-scroll");
})

$('.menu-close').click(function () {
    $('.mobile-menu').removeClass("active")
    $('body').removeClass("no-scroll");
})

$('.cardLists li').click(function() {
    // 모바일에서는 클릭 이벤트 무시
    if (window.innerWidth <= 1366) {
        return;
    }
    
    // 클릭한 li가 이미 active 상태인지 확인
    if ($(this).hasClass('active')) {
        // 이미 active 상태라면 아무것도 하지 않음
        return;
    }
    
    // 모든 li에서 active 클래스 제거
    $('.cardLists li').removeClass('active');
    
    // 클릭한 li에 active 클래스 추가
    $(this).addClass('active');
    
    // 모든 카드 내용 숨기기
    $('.cardContents').hide();
    
    // 선택된 카드의 내용만 표시
    $(this).find('.cardContents').fadeIn(500);
});

// famDrop 버튼 클릭 시 active 클래스 토글
$('.famDrop button').click(function(event) {
    event.stopPropagation();
    $(this).parent('.famDrop').toggleClass('active');
});

// famDrop 내부의 링크 클릭 시 드롭다운 닫기
$('.famDrop .famLists a').click(function() {
    $(this).closest('.famDrop').removeClass('active');
});

// 문서의 다른 부분 클릭 시 active 클래스 제거
$(document).click(function(event) {
    if (!$(event.target).closest('.famDrop').length) {
        $('.famDrop').removeClass('active');
    }
});

//탭
// const tabItem = document.querySelectorAll('.tabNav li');
// const tabInner = document.querySelectorAll('.tabInner');

// function activateTab(items, index) {
//     tabInner.forEach((inner) => {
//         inner.classList.remove('active');
//     });

//     items.forEach((item) => {
//         item.classList.remove('active');
//     });

//     items[index].classList.add('active');
//     tabInner[index].classList.add('active');
// }

// tabItem.forEach((tab, idx) => {
//     tab.addEventListener('click', function() {
//         activateTab(tabItem, idx);
//     });
// });


// 모바일 메뉴
// $('.headerInner button').click(function(){
//   $('.mbNavWrap').show();
// });
// $('.mbNavTop button').click(function(){
//   $('.mbNavWrap').hide();
// });


// 사이트맵 모달
// $('.gnbRight button').click(function(){
//   $('.siteMap').show();
// });
// $('.siteMapTop button').click(function(){
//   $('.siteMap').hide();
// });


// 예약신청 모달 열기
// $('.bookingBtn button').click(function(){
//   $('.modal').show();
// });
// $('.modalWrapper button').click(function(){
//   $('.modal').hide();
// });

