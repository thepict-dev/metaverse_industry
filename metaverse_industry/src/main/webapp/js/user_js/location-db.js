function logGlobalVar() {
	(function ($) {
	    $.fn.dragScroll = function () {
	        var mouseDown = false;
	        var startX, scrollLeft;
	
	        var startDragging = function (e) {
	            mouseDown = true;
	            startX = e.pageX - $(this).offset().left;
	            scrollLeft = $(this).scrollLeft();
	        };
	
	        var stopDragging = function (e) {
	            mouseDown = false;
	        };
	
	        var move = function (e) {
	            if (!mouseDown) { return; }
	            e.preventDefault();
	            var x = e.pageX - $(this).offset().left;
	            var walk = (x - startX) * 2; // 스크롤 속도 조절
	            $(this).scrollLeft(scrollLeft - walk);
	        };
	
	        $(this).on('mousedown', startDragging)
	            .on('mouseup mouseleave', stopDragging)
	            .on('mousemove', move);
	
	        return this;
	    };
	})(jQuery);
	
	
	$(document).ready(function () {
		
	    $('.navigator').dragScroll();
	});
	
	
	var data = globalVar
/*
	const data = [
    {
        idx: 1,
        type: "공공/기관",
        placeName: "더픽트",
        lat: 37.87520275487296,
        lng: 127.73536032930221
    },
    {
        idx: 2,
        type: "관광/공원/카페",
        placeName: "춘천시청",
        lat: 37.87503690943473,
        lng: 127.73522797367336
    },
    {
        idx: 3,
        placeName: "한림대학교",
        lat: 37.8751155770855,
        lng: 127.73489346354333
    },
    {
        idx: 4,
        placeName: "강원대학교",
        lat: 37.87475260167056,
        lng: 127.73531039116618
    },
    {
        idx: 5,
        placeName: "두미르2차",
        lat: 37.87563921885048,
        lng: 127.73507767905943
    },
    {
        idx: 6,
        placeName: "현진에버빌 3차",
        lat: 37.875542370896255,
        lng: 127.73579845110147
    }
]
*/
	/**
	 * 주어진 좌표 리스트의 중심 좌표를 계산하는 함수
	 * @param {Array} data - 좌표 데이터 배열
	 * @returns {Object} 중심 좌표 {lat, lng}
	 */
	function calculateCenterCoordinates(data) {
	
	    // 유효한 좌표가 있는 항목만 필터링
	    const validCoordinates = data.filter(item =>
	        typeof item.lat === 'number' && !isNaN(item.lat) &&
	        typeof item.lng === 'number' && !isNaN(item.lng)
	    );
	
	    // 유효한 좌표가 없는 경우
	    if (validCoordinates.length === 0) {
	        return null;
	    }
	
	    // 위도와 경도의 합 계산
	    const sum = validCoordinates.reduce((acc, curr) => {
	        return {
	            lat: acc.lat + curr.lat,
	            lng: acc.lng + curr.lng
	        };
	    }, { lat: 0, lng: 0 });
	
	    // 평균 계산
	    const center = {
	        lat: sum.lat / validCoordinates.length,
	        lng: sum.lng / validCoordinates.length
	    };
	
	    return center;
	}
	
	const center = calculateCenterCoordinates(data);
	const container = document.querySelector(".map");
	const options = {
	    center: new kakao.maps.LatLng(center.lat, center.lng),
	    level: 3
	};
	
	const map = new kakao.maps.Map(container, options);
	const bounds = new kakao.maps.LatLngBounds();
	
	// 커스텀 오버레이에 표시할 내용입니다     
	// HTML 문자열 또는 Dom Element 입니다 
	var content = `
	    <div class ="overlay-container">
	        <span class="left"></span>
	        <span class="center">카카오!</span>
	        <span class="right"></span>
	    </div>
	`;
	
	// 커스텀 오버레이가 표시될 위치입니다 
	var position = new kakao.maps.LatLng(33.450701, 126.570667);
	
	// 커스텀 오버레이를 생성합니다
	var customOverlay = new kakao.maps.CustomOverlay({
	    position: position,
	    content: content,
	    // xAnchor: 0.3,
	    yAnchor: 1.4
	});
	
	data.map(obj => {
	
	    const point = new kakao.maps.LatLng(obj.lat, obj.lng);
	    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	    const marker = new kakao.maps.Marker({
	        position: point,
	        clickable: true
	    });
	
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function () {
	        customOverlay.setPosition(point);
	        customOverlay.setContent(`
	        <div class ="overlay-container" >
	        <span class="overlay-title">${obj.title}</span>
	        <a href="/location_view.do?idx=${obj.idx}">상세보기</a>
	        <div class="tail">
	            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="17" viewBox="0 0 14 17" fill="none">
	                <path d="M8.87266 15.0062C8.22378 16.7366 5.77622 16.7366 5.12734 15.0062L0.513343 2.70225C0.02303 1.39475 0.989589 7.26231e-07 2.386 8.48309e-07L11.614 1.65505e-06C13.0104 1.77712e-06 13.977 1.39475 13.4867 2.70225L8.87266 15.0062Z" fill="white"/>
	            </svg>
	        </div>
	    </div>
	        `)
	    });
	    customOverlay.setMap(map); // 지도에 올린다.
	    marker.setMap(map);
	    // LatLngBounds 객체에 좌표를 추가합니다
	    bounds.extend(point);
	})
	map.setBounds(bounds);
		
}

