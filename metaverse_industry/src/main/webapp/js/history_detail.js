// HTML2PDF 라이브러리 추가 (CDN)
function addHTML2PDFScript() {
    const script = document.createElement('script');
    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js';
    document.head.appendChild(script);
}

// select와 date input 요소를 텍스트로 변환
function convertFormElements() {
    // disabled된 select 요소 변환
    const selects = document.querySelectorAll('select[disabled]');
    selects.forEach(select => {
        const selectedOption = select.options[select.selectedIndex];
        const span = document.createElement('span');
        span.className = 'bindingText';
        span.textContent = selectedOption.textContent;
        select.parentNode.replaceChild(span, select);
    });
    
    // disabled된 input[type="date"] 변환
    const dateInputs = document.querySelectorAll('input[type="date"][disabled]');
    dateInputs.forEach(input => {
        const span = document.createElement('span');
        span.className = 'bindingText';
        span.textContent = input.value;
        input.parentNode.replaceChild(span, input);
    });
}

// PDF 생성 및 다운로드
function generatePDF() {
    // PDF에 포함될 내용을 담을 컨테이너 생성
    const pdfContent = document.createElement('div');
    
    // 사용자 정보, 장비 정보, 대여 상태 섹션만 복사
    const sections = document.querySelectorAll('.listWrapper');
    sections.forEach((section, index) => {
        if (index < 3) { // 마지막 버튼 섹션 제외
            const sectionClone = section.cloneNode(true);
            pdfContent.appendChild(sectionClone);
        }
    });

    // PDF 설정
    const opt = {
        margin: 15,
        filename: '장비대여신청서.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
    };

    // PDF 생성 및 다운로드
    html2pdf().set(opt).from(pdfContent).save();
}

// PDF 다운로드 버튼 이벤트 리스너 설정
function initPDFDownload() {
    addHTML2PDFScript();
    const pdfButton = document.querySelector('.smButton');
    if (pdfButton) {
        pdfButton.addEventListener('click', function(e) {
            e.preventDefault();
            generatePDF();
        });
    }
}

// 페이지 로드 시 초기화
document.addEventListener('DOMContentLoaded', () => {
    convertFormElements(); // 페이지 로드 시 form 요소들을 텍스트로 변환
    initPDFDownload();
});