$('.active-sub-depth').hover(
    function () {
        // 마우스가 요소 위에 있을 때 실행될 코드
        $('.header .menu-depth li .sub-depth').slideDown(200);
        $('.header .header-back').slideDown(200);
    },
)
$('.header').hover(() => {

},
    function (e) {
        // 마우스가 요소에서 벗어났을 때 실행될 코드
        $('.header .header-back').slideUp(200);
        $('.header .menu-depth li .sub-depth').slideUp(200);

    }
)

let mobileMenuSlided = false;

$(".mobile-menu .use-depth").click(function () {
    if (!mobileMenuSlided) {
        $('.mobile-menu ul.depth .sub-depth').slideDown(200)
        mobileMenuSlided = true;
    } else {
        $('.mobile-menu ul.depth .sub-depth').slideUp(200)
        mobileMenuSlided = false;
    }
})

$(".hamburger").click(function () {
    $('.mobile-menu').addClass("active");
    $('body').addClass("no-scroll");
})

$('.menu-close').click(function () {
    $('.mobile-menu').removeClass("active")
    $('body').removeClass("no-scroll");
})


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