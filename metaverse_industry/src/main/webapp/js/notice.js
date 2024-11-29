// 카테고리 텍스트 변환 함수
function getCategoryText(category) {
    switch(category) {
        case '1': return '센터소식';
        case '2': return '행사안내';
        case '3': return '보도자료';
        case '4': return '기타공고';
        default: return '';
    }
}

// 탭 시스템 초기화
function initTabSystem() {
    const tabItems = document.querySelectorAll('.tabNav li');
    
    tabItems.forEach(tab => {
        tab.addEventListener('click', async function(e) {
            e.preventDefault();
            
            // 이전 활성 탭 제거
            tabItems.forEach(item => item.classList.remove('active'));
            this.classList.add('active');
            
            // URL에서 type 파라미터 추출
            const href = this.querySelector('a').getAttribute('href');
            const url = new URL(href, window.location.origin);
            const type = url.searchParams.get('type') || '';
            
            try {
                // Ajax로 해당 카테고리 공지사항 목록 가져오기
                const response = await fetch(`/api/noticeApi.do?type=${type}`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                });
                
                const result = await response.json();
                
                // 공지사항 목록 업데이트
                updateNoticeList(result.data, result.totalCount);
                
                // URL 업데이트 (페이지 새로고침 없이)
                window.history.pushState({}, '', href);
                
            } catch (error) {
                console.error('공지사항 목록 로드 실패:', error);
            }
        });
    });
}

// 공지사항 목록 업데이트 함수
function updateNoticeList(noticeList, totalCount) {
    const listContainer = document.querySelector('.notice');
    
    // 공지사항 목록 HTML 생성
    const listHtml = noticeList.map((notice, index) => `
        <li>
            <a href="/notice_view.do?idx=${notice.idx}">
                <p class="ntInfos">
                    <span class="category">${getCategoryText(notice.category)}</span>
                    <span class="ntIndex">${index + 1}</span>
                    <span class="ntTitle">${notice.title}</span>
                </p>
                <p class="ntDate">${notice.reg_date}<img src="/img/user_img/list-link.webp" alt=""></p>
            </a>
        </li>
    `).join('');
    
    // 페이지네이션 HTML 생성
    const paginationHtml = generatePagination(totalCount);
    
    // HTML 업데이트
    listContainer.innerHTML = listHtml;
    document.querySelector('.pagination').innerHTML = paginationHtml;
    
    // 페이지네이션 이벤트 리스너 추가
    addPaginationClickEvents();
}

// 페이지네이션 HTML 생성 함수
function generatePagination(totalCount) {
    const currentPage = parseInt(new URLSearchParams(window.location.search).get('pageNumber')) || 1;
    const totalPages = Math.ceil(totalCount / 20);
    const type = new URLSearchParams(window.location.search).get('type') || '';
    
    let html = '';
    
    // 이전 페이지 버튼
    if (currentPage > 1) {
        html += `<li><a href="/notice.do?type=${type}&pageNumber=${currentPage - 1}"><img src="/img/admin/prev.webp" alt=""></a></li>`;
    }
    
    // 페이지 번호
    for (let i = Math.max(1, currentPage - 4); i <= Math.min(totalPages, currentPage + 5); i++) {
        if (i === currentPage) {
            html += `<li><a class="active" href="/notice.do?type=${type}&pageNumber=${i}">${i}</a></li>`;
        } else {
            html += `<li><a href="/notice.do?type=${type}&pageNumber=${i}">${i}</a></li>`;
        }
    }
    
    // 다음 페이지 버튼
    if (currentPage < totalPages) {
        html += `<li><a href="/notice.do?type=${type}&pageNumber=${currentPage + 1}"><img src="/img/admin/next.webp" alt=""></a></li>`;
    }
    
    return html;
}

// 페이지네이션 이벤트 리스너 추가
function addPaginationClickEvents() {
    const pageLinks = document.querySelectorAll('.pagination a');
    
    pageLinks.forEach(link => {
        link.addEventListener('click', async function(e) {
            e.preventDefault();
            const href = this.getAttribute('href');
            const url = new URL(href, window.location.origin);
            const type = url.searchParams.get('type') || '';
            const pageNumber = url.searchParams.get('pageNumber') || '1';
            
            try {
                const response = await fetch(`/api/noticeApi.do?type=${type}&pageNumber=${pageNumber}`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                });
                
                const result = await response.json();
                updateNoticeList(result.data, result.totalCount);
                window.history.pushState({}, '', href);
            } catch (error) {
                console.error('공지사항 목록 로드 실패:', error);
            }
        });
    });
}

// 페이지 로드 시 초기화
document.addEventListener('DOMContentLoaded', function() {
    initTabSystem();
});