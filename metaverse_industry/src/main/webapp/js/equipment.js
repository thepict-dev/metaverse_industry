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
	                <button class="deleteItem" type="button"><img src="/img/user_img/delete.png" alt=""></button>
           		`
           		// 컨테이너 추가
				document.querySelector(".rentalItemsContainer").appendChild(newItem);
			    // 수량 버튼
			    const decreaseBtn = newItem.querySelector('.numInput .pr');
			    console.log(decreaseBtn)
			    const increaseBtn = newItem.querySelector('.numInput .ne');
			    console.log(increaseBtn)
			    // 수량 입력
			    const input = newItem.querySelector('.numInput input');
			    
			    // 장바구니 삭제
			    const deleteBtn = newItem.querySelector(".deleteItem");
			    deleteBtn.addEventListener("click", function() {
					newItem.remove();
					document.querySelector(`.rentalItemList li[data-id='${id}'] input`).checked = false;

					checkCart();
				});
				if (input.max === "1") {
					increaseBtn.disabled = true;
				}
			    // 수량 입력 이벤트 등록
			    input.addEventListener('change', function(e){
					if (this.value > this.max) {
						this.value = this.max;
						return window.alert("신청할 수 있는 최대 갯수를 초과했습니다.");
					} else if (this.value < this.min) {
						this.value = "1";
					}
				});
				
	            decreaseBtn.addEventListener('click', function(){
					console.log(input.min, input.max);
					if (input.value > input.min) {
						let newValue = `${Number(input.value) - 1}`;
						input.value =  newValue;
						if (newValue === input.min) {
							this.disabled = true
						}
						if (newValue < input.max) {
							increaseBtn.disabled = false
						}
					}
				});
        		increaseBtn.addEventListener('click', function(){
					if (input.value < input.max) {
						let newValue = `${Number(input.value) + 1}`;
						input.value =  newValue;
						if (newValue === input.max) {
							this.disabled = true
						}
						if (newValue > input.min) {
							decreaseBtn.disabled = false
						}
					}
					
				});
        		
        		
           		// 선택된 총 갯수 수
           		let totalCnt = $(".rentalCountItem").length;
           		$(".selectedCnt").text(totalCnt);
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