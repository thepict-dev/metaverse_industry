const subContents = document.querySelector('.subContents');

if (subContents) {
    setTimeout(() => {
        subContents.scrollIntoView({ behavior: 'smooth' });
    }, 1000); // 5000ms = 5초
}

// Lenis 부드러운 스크롤 초기화
const lenis = new Lenis()

function raf(time) {
    lenis.raf(time)
    requestAnimationFrame(raf)
}

requestAnimationFrame(raf)
