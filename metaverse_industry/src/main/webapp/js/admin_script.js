$(document).ready(function() {
    $('select').niceSelect();
});

$('.lnb').mouseover(function(){
    $('.header h1').addClass('active');
});
$('.lnb').mouseleave(function(){
    $('.header h1').removeClass('active');
});

var acodian = {
    click: function(target) {
        var _self = this,
        $target = $(target);
        $target.on('click', function() {
            var $this = $(this);
            if ($this.next('.depth2').css('display') === 'none') {
            $('.depth2').slideUp();
            _self.onremove($target);
    
            $this.addClass('active');
            $this.next().slideDown();
            } else {
            $('.depth2').slideUp();
            _self.onremove($target);
            }
        });
    },
    onremove: function($target) {
        $target.removeClass('active');
    }
};
acodian.click('.depth1');

$('.lnb').mouseleave(function(){
    $('.depth2').css('display', 'none');
});

// const tabItem = document.querySelectorAll('.formTabNav li');
// const tabInner = document.querySelectorAll('.fomrTabContent');

// tabItem.forEach((tab, idx)=> {
//     tab.addEventListener('click', function(){
//         tabInner.forEach((inner)=> {
//             inner.classList.remove('active')
//         });

//         tabItem.forEach((item)=> {
//             item.classList.remove('active')
//         });

//         tabItem[idx].classList.add('active')
//         tabInner[idx].classList.add('active')
//     });
// });