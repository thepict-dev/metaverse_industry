// 탭
const tabItem = document.querySelectorAll('.tabNav li')
const tabInner = document.querySelectorAll('.tabInner')

tabItem.forEach((tab, idx)=> {
    tab.addEventListener('click', function(e){
     	tabItem.forEach((item)=> {
		 	item.classList.remove('active')
        });
        
        tabInner.forEach((inner)=> {
            inner.classList.remove('active')
        });
        
        setTimeout(() => {
		    tabItem[idx].classList.add('active')
		}, 0);
      	
      	tabInner[idx].classList.add('active')
    });
});

// 스크롤 active
const sectionAll = document.querySelectorAll("div[id]");

window.addEventListener("scroll", () => {
    const scrollY = window.pageYOffset;

    sectionAll.forEach((current) => {
        const sectionHeight = current.offsetHeight;
        const sectionTop = current.offsetTop - 50;
        const sectionId = current.getAttribute("id");

        if (scrollY > sectionTop && scrollY < sectionTop + sectionHeight) {
            document.querySelector(`.${sectionId}`).classList.add("active");
        } else {
            document.querySelector(`.${sectionId}`).classList.remove("active");
        }
    });
});