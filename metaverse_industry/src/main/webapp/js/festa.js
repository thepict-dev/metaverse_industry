let eventGague = 1;
let eventGague2 = 2;
const swiper = new Swiper(".main-events-slide", {
	autoplay : {
		delay : 3000
	},
	spaceBetween : 30,
	pagination : {
		el : ".swiper-pagination",
		type : "fraction",
	},
	breakpoints : {
		1024 : {			
			slidesPerView : 3,
		},
		600 : {
			slidesPerView : 2,
		},
		100 : {
			slidesPerView : 1,
		}
	},
	on : {
		init : function(sw) {
			eventGague = sw.snapGrid.length;
			const width = 100 / eventGague;
			document.querySelector(".gauge").style.width = width + "%";
		}
	}
});
swiper.on('slideChange', function(sw) {
	const width = (100 / eventGague) * (sw.realIndex);
	document.querySelector(".gauge").style.left = width + "%";
});

const swiper2 = new Swiper(".main-events-slide2", {
	autoplay : {
		delay : 3000
	},
	spaceBetween : 30,
	pagination : {
		el : ".swiper-pagination2",
		type : "fraction",
	},
	breakpoints : {
		1024 : {			
			slidesPerView : 3,
		},
		600 : {
			slidesPerView : 2,
		},
		100 : {
			slidesPerView : 1,
		}
	},
	on : {
		init : function(sw) {
			eventGague2 = sw.snapGrid.length;
			const width = 100 / eventGague2;
			document.querySelector(".gauge2").style.width = width + "%";
		}
	}
});
swiper2.on('slideChange', function(sw) {
	const width = (100 / eventGague2) * (sw.realIndex);
	document.querySelector(".gauge2").style.left = width + "%";
});

const buttons = document.querySelectorAll('.map-items-container');
const container = document.querySelector('.map-list-container');
const tail = document.querySelector('.triangle');
const breweryDetailList = document.querySelectorAll('.map-info-container');
const resetContainer = (id) => {
	breweryDetailList.forEach(el => el.dataset.id === id ? null : el.classList.remove('active'))
}
buttons.forEach(function(el){
	el.addEventListener('click', function(e){
		if (window.innerWidth <= 1024) {
			document.querySelector('.map-info-poz-container').classList.add('active')
		}
//		if (!tail.classList.contains('active')) {
			tail.classList.toggle('active');
//		}
		const tailPoz = Math.floor((el.getBoundingClientRect().top - container.getBoundingClientRect().top) + ((el.getBoundingClientRect().height - tail.getBoundingClientRect().height) / 2));
		tail.style.top = tailPoz + 'px';
		let id = el.dataset.id;
		resetContainer(id);
		if (!document.querySelector(`.map-info-container[data-id='${id}']`).classList.contains('active')) {
			document.querySelector(`.map-info-container[data-id='${id}']`).classList.add('active');	
			tail.classList.add('active');
		} else {
			document.querySelector(`.map-info-container[data-id='${id}']`).classList.remove('active');
			tail.classList.remove('active');
		}
		
	})
	el.addEventListener('mouseover', function(){
		let id = el.dataset.id;
		document.querySelectorAll('.root .map-circle-container').forEach(obj => obj.querySelector('.comments-container').classList.remove('active'));
		document.querySelector(`.root .map-circle-container.${id}`).querySelector('.comments-container').classList.add('active');
	})
})
document.querySelector('.root .map-list-container').addEventListener('mouseout', ()=> {
	document.querySelectorAll('.root .map-circle-container').forEach(obj => obj.querySelector('.comments-container').classList.remove('active'));
})

const navHandler = (section) => {
	let top;
	switch (section) {
		case "home":
			window.scrollTo({top: 0, behavior: "smooth"});
			break;
		case "info":
			top = document.querySelector('.event-info-container').offsetTop - 140;
			window.scrollTo({top, behavior: "smooth"});
			break;
		case "vr":
			top = document.querySelector('.vr-tour-container').offsetTop - 140;
			window.scrollTo({top, behavior: "smooth"});
			break;
		case "notice":
			top = document.querySelector('.main-events').offsetTop - 140;
			window.scrollTo({top, behavior: "smooth"});
			break;
		case "map":
			top = document.querySelector('.map-grid-container').offsetTop - 140;
			window.scrollTo({top, behavior: "smooth"});
			break;
		case "event":
			top = document.querySelector('.main-events2').offsetTop - 140;
			window.scrollTo({top, behavior: "smooth"});
			break;
		default:
			break;
	}
}

document.querySelectorAll('header nav ul li').forEach(el=> el.addEventListener('click', ()=> {
	// mobile
	if (window.innerWidth <= 1024) {
		document.querySelector('.mobile-menu').classList.remove('active');
		document.querySelector('header nav ul').classList.contains('active') ? document.querySelector('header nav ul').classList.remove('active') : null;
	}
	const id = el.dataset.id;
	navHandler(id);
}))

document.querySelector('.mobile-menu').addEventListener('click', (e) => {
	if (!document.querySelector('header nav ul').classList.contains('active')) {
		e.currentTarget.classList.add('active');
	} else {
		e.currentTarget.classList.remove('active');
	}
	document.querySelector('header nav ul').classList.toggle('active');

})

window.addEventListener("scroll", (event) => {
    let scrollY = this.scrollY;
	if (window.innerWidth > 1024) {
		if (scrollY === 0) {
			document.querySelector('header nav ul').classList.contains('active') ? document.querySelector('header nav ul').classList.remove('active') : null
		} else {
			document.querySelector('header nav ul').classList.contains('active') ? null : document.querySelector('header nav ul').classList.add('active')
		}
	}
});

window.addEventListener('resize', ()=> {
	eventGague = swiper.snapGrid.length;
	eventGague2 = swiper2.snapGrid.length;
	const width = 100 / eventGague;
	const width2 = 100 / eventGague2;
	document.querySelector(".gauge").style.width = width + "%";
	document.querySelector(".gauge2").style.width = width2 + "%";
})




document.querySelector('.cancel-map').addEventListener('click', function(){
	document.querySelector('.map-info-poz-container.active').classList.remove('active');
	document.querySelector('.map-info-container.active').classList.remove('active');
})