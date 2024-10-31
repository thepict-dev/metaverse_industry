var acodian = {
    click: function(target) {
        var _self = this,
        $target = $(target);
        
        // 페이지 로드시 저장된 상태 복원
        var activeIndex = localStorage.getItem('activeDepth1Index');
        if (activeIndex !== null) {
            $target.eq(activeIndex).addClass('active')
                   .next('.depth2').show();
        }

        $target.on('click', function() {
            var $this = $(this);
            var currentIndex = $target.index($this);  // 현재 클릭된 항목의 인덱스

            if ($this.next('.depth2').css('display') === 'none') {
                $('.depth2').slideUp();
                _self.onremove($target);
        
                $this.addClass('active');
                $this.next().slideDown();
                // 활성화된 항목의 인덱스 저장
                localStorage.setItem('activeDepth1Index', currentIndex);
            } else {
                $('.depth2').slideUp();
                _self.onremove($target);
                // active 상태가 해제되면 저장된 정보도 삭제
                localStorage.removeItem('activeDepth1Index');
            }
        });
    },
    onremove: function($target) {
        $target.removeClass('active');
    }
};
acodian.click('.depth1');
