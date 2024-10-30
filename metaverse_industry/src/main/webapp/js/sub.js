const subContents = document.querySelector('.subContents');
const lenis = new Lenis({
    duration: 1.5,  // 스크롤 애니메이션 지속 시간
    easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)), // 이징 함수
    smooth: true
});

if (subContents) {
    let hasScrolled = false;

    window.addEventListener('scroll', () => {
        if (!hasScrolled) {
            const targetPosition = subContents.offsetTop;
            lenis.scrollTo(targetPosition, {
                duration: 1,  // 스크롤 지속시간 (초)
                easing: (t) => t === 1 ? 1 : 1 - Math.pow(2, -10 * t) // 부드러운 이징
            });
            hasScrolled = true;
        }
    }, { once: true });
}

function raf(time) {
    lenis.raf(time);
    requestAnimationFrame(raf);
}

requestAnimationFrame(raf); 