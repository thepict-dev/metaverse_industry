const listItems = document.querySelectorAll('.listBody.boardlist > li');

listItems.forEach(item => {
    const detailsButton = item.querySelector('.details');
    const detailView = item.querySelector('.detail-view');
    
    detailsButton.addEventListener('click', function(e) {
        e.stopPropagation(); // 이벤트 버블링 방지
        
        // 현재 아이템의 상세 보기 토글
        item.classList.toggle('active');
        
        if (item.classList.contains('active')) {
            detailView.style.display = 'block';
            setTimeout(() => {
                detailView.style.maxHeight = detailView.scrollHeight + 'px';
                detailView.style.opacity = '1';
            }, 10);
        } else {
            detailView.style.maxHeight = '0px';
            detailView.style.opacity = '0';
            setTimeout(() => {
                detailView.style.display = 'none';
            }, 300);
        }
        
        // 다른 열린 아이템들 닫기
        listItems.forEach(otherItem => {
            if (otherItem !== item && otherItem.classList.contains('active')) {
                otherItem.classList.remove('active');
                const otherDetailView = otherItem.querySelector('.detail-view');
                otherDetailView.style.maxHeight = '0px';
                otherDetailView.style.opacity = '0';
                setTimeout(() => {
                    otherDetailView.style.display = 'none';
                }, 300);
            }
        });
    });
});