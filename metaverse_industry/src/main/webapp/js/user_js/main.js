(function ($) {
    $.fn.dragScroll = function () {
        var mouseDown = false;
        var startX, scrollLeft;

        var startDragging = function (e) {
            mouseDown = true;
            startX = e.pageX - $(this).offset().left;
            scrollLeft = $(this).scrollLeft();
        };

        var stopDragging = function (e) {
            mouseDown = false;
        };

        var move = function (e) {
            if (!mouseDown) { return; }
            e.preventDefault();
            var x = e.pageX - $(this).offset().left;
            var walk = (x - startX) * 2; // 스크롤 속도 조절
            $(this).scrollLeft(scrollLeft - walk);
        };

        $(this).on('mousedown', startDragging)
            .on('mouseup mouseleave', stopDragging)
            .on('mousemove', move);

        return this;
    };
})(jQuery);



let startWheel = false;
let clickedPoster = null;

window.addEventListener("wheel", (e) => {
    startWheel = true;
    if (startWheel) {

    }
})

$(".poster").click(function () {
    $(".poster").removeClass("active");
    console.log($(this))
    $(this).addClass("active");
}
)

$(document).ready(function () {
    $('.location-section').dragScroll();
    $('.poster-container').dragScroll();
});