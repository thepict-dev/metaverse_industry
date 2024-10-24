$('.smButton').click(function() {
    // 로딩 표시 (선택사항)
    
    
    const element = $('.detailCardInner')[0];
    
    // html2canvas 옵션
    const options = {
        scale: 1,  // 해상도 향상
        useCORS: true,  // 외부 이미지 허용
        backgroundColor: '#ffffff',  // 배경색
        logging: false,  // 디버그 로깅 비활성화
        allowTaint: true,  // 외부 이미지 허용
        letterRendering: true,  // 텍스트 렌더링 품질 향상
    };
    
    html2canvas(element, options).then(function(canvas) {
        try {
            // 이미지 품질 설정
            const imgData = canvas.toDataURL('image/png', 1.0);
            
            // 현재 날짜시간으로 파일명 생성
            const date = new Date();
            const fileName = `detail_card_${date.getFullYear()}${(date.getMonth()+1).toString().padStart(2,'0')}${date.getDate().toString().padStart(2,'0')}_${date.getHours().toString().padStart(2,'0')}${date.getMinutes().toString().padStart(2,'0')}.png`;
            
            // 다운로드
            const downloadLink = document.createElement('a');
            downloadLink.href = imgData;
            downloadLink.download = fileName;
            
            document.body.appendChild(downloadLink);
            downloadLink.click();
            document.body.removeChild(downloadLink);
            
            // 성공 메시지 (선택사항)
            alert('이미지가 저장되었습니다.');
            
        } catch (error) {
            console.error('이미지 저장 중 오류 발생:', error);
            alert('이미지 저장 중 오류가 발생했습니다.');
        } finally {
         
        }
    }).catch(function(error) {
        console.error('캡처 중 오류 발생:', error);
        alert('이미지 캡처 중 오류가 발생했습니다.');
        
    });
});