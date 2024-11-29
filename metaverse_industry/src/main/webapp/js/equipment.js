// 예약 컨텐츠 컨테이너
const rentalCountContainer = document.querySelector('.rentalCountContainer');
// 예약 리스트 컨테이너
const rentalListContainer = document.querySelector('.rentalListContainer');
// 체크박스
const checkboxes = document.querySelectorAll('.rentalItemList input[type="checkbox"]');
// 수량 버튼
const decreaseBtn = document.querySelector('.numInput .pr');
const increaseBtn = document.querySelector('.numInput .ne');
// 수량 입력
const input = document.querySelector('.numInput input');

// 체크박스 선택 active
const updateContainerClasses = (e) => {
	console.log(e.target.parentElement);
	const liContainer = e.target.parentElement;
	const id = liContainer.dataset.id;
	const cnt = liContainer.dataset.cnt;
	console.log(e.target.checked);
	const checked = e.target.checked;
	if (checked) {
		const currentSelected = document.querySelectorAll('.rentalCountItem').length;
		if (currentSelected >= 4) {
			e.target.checked = false;
			window.alert("최대 4개까지 선택 가능합니다.");
			return;
		}
		
		const newItem = document.createElement("li");
		newItem.dataset.id = id;
		newItem.classList.add("rentalCountItem");
		let imgSrc = liContainer.querySelector(".itemImg img").src;
		let type = liContainer.querySelector(".itemTitles > span").textContent;
		let name = liContainer.querySelector(".itemTitles > p").textContent;
		newItem.innerHTML = `
           			<span><img src="${imgSrc}" alt=""></span>
	                <div class="itemTexts">
	                    <span>${type}</span>
	                    <p>${name}</p>
	                    <div class="numInput">
	                        <button type="button" class="pr" disabled=""><span></span></button>
	                        <input type="number" name="count_equip" id="count_equip" value="1" min="1" max="${cnt}">
	                        <button type="button" class="ne"><span></span></button>
	                    </div>
	                </div>
	                <button class="deleteItem" type="button"><img src="/img/user_img/delete.webp" alt=""></button>
           		`
		// 컨테이너 추가
		document.querySelector(".rentalItemsContainer").appendChild(newItem);
		// 수량 버튼
		const decreaseBtn = newItem.querySelector('.numInput .pr');

		const increaseBtn = newItem.querySelector('.numInput .ne');

		// 수량 입력
		const input = newItem.querySelector('.numInput input');

		// 장바구니 삭제
		const deleteBtn = newItem.querySelector(".deleteItem");
		deleteBtn.addEventListener("click", function () {
			newItem.remove();
			document.querySelector(`.rentalItemList li[data-id='${id}'] input`).checked = false;
			checkCart();
			updateTotalCnt();
		});
		if (input.max === "1") {
			increaseBtn.disabled = true;
		}
		// 수량 입력 이벤트 등록
		input.addEventListener('change', function (e) {
			if (this.value > this.max) {
				this.value = this.max;
				return window.alert("신청할 수 있는 최대 갯수를 초과했습니다.");
			} else if (this.value < this.min) {
				this.value = "1";
			}
		});

		decreaseBtn.addEventListener('click', function () {
			console.log(input.min, input.max);
			if (input.value > input.min) {
				let newValue = `${Number(input.value) - 1}`;
				input.value = newValue;
				if (newValue === input.min) {
					this.disabled = true
				}
				if (newValue < input.max) {
					increaseBtn.disabled = false
				}
			}
		});
		increaseBtn.addEventListener('click', function () {
			if (input.value < input.max) {
				let newValue = `${Number(input.value) + 1}`;
				input.value = newValue;
				if (newValue === input.max) {
					this.disabled = true
				}
				if (newValue > input.min) {
					decreaseBtn.disabled = false
				}
			}

		});


		// 선택된 총 갯수 수
		updateTotalCnt();
		const isAnyChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
		[rentalCountContainer, rentalListContainer].forEach(container => {
			container.classList.toggle('active', isAnyChecked);
		});
		return;
	} else {
		// 장바구니 삭제
		const deleteItem = document.querySelector(`.rentalCountItem[data-id="${id}"]`)
		deleteItem.remove();
		checkCart();
		updateTotalCnt();

	}

};

// 수량 업뎃
const updateButtonStates = () => {
	const value = parseInt(input.value);
	decreaseBtn.disabled = value <= parseInt(input.min);
	increaseBtn.disabled = value >= parseInt(input.max);
};

// 수량 변경
const changeQuantity = (delta, input) => {
	const newValue = parseInt(input.value) + delta;
	if (newValue >= parseInt(input.min) && newValue <= parseInt(input.max)) {
		input.value = newValue;
		updateButtonStates();
	}
};

//장바구니 리셋
const checkCart = () => {
	let totalCnt = $(".rentalCountItem").length;
	if (totalCnt === 0) {
		rentalCountContainer.classList.remove("active");

	}
}

// 이벤트 리스너
checkboxes.forEach(checkbox => checkbox.addEventListener('change', updateContainerClasses));


// 초기화
// updateContainerClasses();
// updateButtonStates();

// 상세 보기 버튼 클릭 이벤트
const detailViewBtn = document.querySelector('.rentalSumButtons .mb');
detailViewBtn.addEventListener('click', () => {
	rentalCountContainer.classList.add('show');
});

// 뒤로 가기 버튼 클릭 이벤트
const backBtn = document.querySelector('.rentalListTitle .mb');
backBtn.addEventListener('click', () => {
	rentalCountContainer.classList.remove('show');
});

const deleteAll = () => {
	document.querySelectorAll(".rentalCountItem").forEach(el => el.remove());
	checkboxes.forEach(el => el.checked = false);
	updateTotalCnt();
}

document.querySelector(".removeAll").addEventListener("click", () => {
	console.log("삭제;;")
	const rentalItems = document.querySelectorAll('.rentalCountItem');
	if (rentalItems.length > 0) {
		if (window.confirm("전체 삭제하시겠습니까?")) {
			deleteAll();
			checkCart();
			rentalCountContainer.classList.remove('show');
		}
	}
})

const updateTotalCnt = () => {
	let totalCnt = $(".rentalCountItem").length;
	$(".selectedCnt").text(totalCnt);
}


const onSubmit = () => {
	const form = document.createElement('form');
	form.method = 'POST';
	form.action = '/equipment_rental.do';

	const rentalItems = document.querySelectorAll('.rentalCountItem');

	rentalItems.forEach((item, index) => {
		const id = item.dataset.id;
		const count = item.querySelector('input[name="count_equip"]').value;
		const type = item.querySelector(".itemTexts > span").textContent;
		const name = item.querySelector(".itemTexts > p").textContent;
		const idInput = document.createElement('input');
		idInput.type = 'hidden';
		idInput.name = `equipment[${index}][id]`;
		idInput.value = id;
		form.appendChild(idInput);

		const countInput = document.createElement('input');
		countInput.type = 'hidden';
		countInput.name = `equipment[${index}][count]`;
		countInput.value = count;
		form.appendChild(countInput);

		const typeInput = document.createElement('input');
		typeInput.type = 'hidden';
		typeInput.name = `equipment[${index}][type]`;
		typeInput.value = type;
		form.appendChild(typeInput);

		const nameInput = document.createElement('input');
		nameInput.type = 'hidden';
		nameInput.name = `equipment[${index}][name]`;
		nameInput.value = name;
		form.appendChild(nameInput);


	});
	document.body.appendChild(form);
	form.submit();


}

document.querySelector(".rentalSubmit").addEventListener("click", () => {
	console.log("예약하기 버")
	onSubmit()
});


$('.add_bag').click(function () {
	console.log("장바구니 추가");
	const id = $(this).data('id');
	const tag = $(this)
	console.log(id);
	let param = {
		key_id: id,
		type: "equipment"
	};

	$.ajax({
		url: "/api/toggle_bag.do",
		method: "POST",
		data: JSON.stringify(param),
		contentType: "application/json",
		dataType: "json",
		success: function (res) {
			console.log(res);
			if (res.msg === "added") {
				tag.addClass('active');
				window.alert("장바구니에 추가되었습니다.");
			} else if (res.msg === "deleted") {
				tag.removeClass('active');
				window.alert("장바구니에서 삭제되었습니다.");
			}
		}
	})
})

// 마우스 휠 이벤트 처리
const rentalItemsContainer = document.querySelector('.rentalItemsContainer');

// 마우스가 컨테이너 위에 있을 때
rentalItemsContainer.addEventListener('mouseenter', function() {
    document.body.style.overflow = 'hidden'; // 페이지 스크롤 비활성화
    lenis.stop(); // Lenis 스크롤 비활성화
});

// 마우스가 컨테이너를 벗어날 때
rentalItemsContainer.addEventListener('mouseleave', function() {
    document.body.style.overflow = 'auto'; // 페이지 스크롤 다시 활성화
    lenis.start(); // Lenis 스크롤 다시 활성화
});

rentalItemsContainer.addEventListener('wheel', function(e) {
    e.preventDefault(); // 기본 페이지 스크롤 방지
    
    const delta = e.deltaY || e.detail || e.wheelDelta;
    this.scrollTop += delta;
}, { passive: false });

// 선택 가능한 최대 개수 표시 텍스트 수정
const rentalSum = document.querySelector('.rentalSum');
rentalSum.querySelector('p span:last-child').textContent = '0';

// 탭 관련 기능 추가
function initTabSystem() {
    const tabItems = document.querySelectorAll('.tabNav.rental li');
    
    tabItems.forEach(tab => {
        tab.addEventListener('click', async function(e) {
            e.preventDefault();
            
            // 이전 활성 탭 제거
            tabItems.forEach(item => item.classList.remove('active'));
            this.classList.add('active');
            
            // URL에서 type 파라미터 추출
            const href = this.querySelector('a').getAttribute('href');
            const type = new URL(href, window.location.origin).searchParams.get('type') || 'all';
            
            try {
                // Ajax로 해당 카테고리 장비 목록 가져오기
                const response = await fetch(`/api/equipment/list.do?type=${type}`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                });
                
                const data = await response.json();
                
                // 장비 목록 업데이트
                updateEquipmentList(data.resultList);
                
                // URL 업데이트 (페이지 새로고침 없이)
                window.history.pushState({}, '', href);
                
            } catch (error) {
                console.error('장비 목록 로드 실패:', error);
            }
        });
    });
}

// 장비 목록 업데이트 함수
function updateEquipmentList(equipmentList) {
    const listContainer = document.querySelector('.rentalItemList');
    
    const html = equipmentList.map(item => `
        <li data-id="${item.id}" data-cnt="${item.avaliable_equipment_cnt}">
            <input type="checkbox" name="equip" id="equip_${item.idx}">
            <label for="equip_${item.idx}"></label>
            <div class="checkItem">
                <div class="itemImg">
                    <img src="${item.image_url}" alt="">
                    <span></span>
                    <a href="#lnk" data-id="${item.id}" class="add_bag ${item.isLike === '1' ? 'active' : ''}">
                        <img src="/img/user_img/bag.webp" alt="">
                    </a>
                </div>
                <div class="itemTitles">
                    <span>${item.type}</span>
                    <p>${item.name}</p>
                </div>
                <p>${item.description}</p>
            </div>
        </li>
    `).join('');
    
    listContainer.innerHTML = html;
    
    // 이벤트 리스너 재설정
    reinitializeEventListeners();
}

// 이벤트 리스너 재설정 함수
function reinitializeEventListeners() {
    // 체크박스 이벤트 리스너 재설정
    const checkboxes = document.querySelectorAll('.rentalItemList input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
        checkbox.addEventListener('change', updateContainerClasses);
    });
    
    // 장바구니 버튼 이벤트 리스너 재설정
    $('.add_bag').click(function() {
        console.log("장바구니 추가");
        const id = $(this).data('id');
        const tag = $(this);
        // ... 기존 장바구니 추가 로직 ...
    });
}

// 페이지 로드 시 초기화
document.addEventListener('DOMContentLoaded', function() {
    initTabSystem();
});