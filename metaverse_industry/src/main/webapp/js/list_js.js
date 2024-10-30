$("#status").change(function(e) {
    let currentUrl = new URL(window.location.href);
    let params = new URLSearchParams(currentUrl.search);
    
    // status 파라미터 업데이트
    params.set('request_status', $(this).val());
    
    // 새로운 URL로 이동
    location.href = `/history/history_list.do?${params.toString()}`;
});

$("#category").change(function(e) {
    let currentUrl = new URL(window.location.href);
    let params = new URLSearchParams(currentUrl.search);
    
    // category 파라미터 업데이트
    params.set('category', $(this).val());
    
    // 새로운 URL로 이동
    location.href = `/history/history_list.do?${params.toString()}`;
});