<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<meta charset="ko">
<%@ include file="./include/head.jsp" %>
<style>
	.add_bag.active {
	    border: 2px solid #03B635;
					background: rgba(3, 182, 53, 0.10);
	}
</style>
<body>
	<%@ include file="./include/header.jsp" %>
    <div class="loginTitle">
        <h2>마이페이지</h2>
    </div>
    <ul class="tabNav">
        <li><a href="/mypage_account.do">계정 관리</a></li>
        <li><a href="/mypage_equip.do">장비 예약정보</a></li>
        <li><a href="/mypage_facil.do">시설 예약정보</a></li>
        <li class="active"><a href="/mypage_bag.do?type=equipment">장바구니</a></li>
    </ul>
    <div class="tabInner loginWrapper active">
        <form class="myBagContainer">
	    <ul class="tabNav sub">
	        <li class="<c:if test="${pictVO.type eq 'equipment'}">active</c:if>"><a href="/mypage_bag.do?type=equipment">장비</a></li>
	        <li class="<c:if test="${pictVO.type eq 'facility'}">active</c:if>"><a href="/mypage_bag.do?type=facility">시설</a></li>
	    </ul>
            <ul class="rentalItemList my">
            		<c:forEach var="item" items="${request_list}" varStatus="status">
						<li data-id="${item.id}">
		                    <input type="checkbox" name="equip" class="equipment_checkbox" id="equip_${item.id}">
		                    <label for="equip_${item.id}"></label>
		                    <div class="checkItem">
		                        <div class="itemImg">
		                            <img src="${item.image_url}" alt="">
		                            <span></span>
		                            <a href="#lnk" data-id="${item.id}" class="add_bag active"><img src="/img/user_img/bag.png" alt=""></a>
		                        </div>
		                        <div class="itemTitles">
		                            <span>${item.category}</span>
		                            <p>${item.name}</p>
		                        </div>
		                        <p>${item.description}</p>
		                    </div>
		                </li>			
					</c:forEach>
                
            </ul>
            <div class="fullButtonContainer bag">
                <button type="button" class="wt normal go-rental">예약페이지로 이동</button>
            </div>
        </form>
    </div>
	<%@ include file="./include/footer.jsp" %>
	<script>
		const type =  "<c:out value="${pictVO.type}"/>";
	</script>
	<script>
	    

		const onSubmit = () => {
			const rentalItems = document.querySelectorAll('.equipment_checkbox:checked');
			if (rentalItems.length === 0) {
				return window.alert("예약할 장비를 선택하세요.")
			}
			
			const form = document.createElement('form');
			form.method = 'POST';
			if (type === "equipment") {
				form.action = '/equipment_rental.do';
				rentalItems.forEach((_item, index) => {
					const item = _item.parentElement;
					console.log(item);
					const id = item.dataset.id;
					const count = "1";
					const type = item.querySelector(".itemTitles > span").textContent;
					const name = item.querySelector(".itemTitles > p").textContent;
					const idInput = document.createElement('input');
					idInput.type = 'hidden';
					idInput.name = "equipment[" + index + "][id]";
					idInput.value = id;
					form.appendChild(idInput);
		
					const countInput = document.createElement('input');
					countInput.type = 'hidden';
					countInput.name = "equipment["+ index +"][count]";
					countInput.value = count;
					form.appendChild(countInput);
		
					const typeInput = document.createElement('input');
					typeInput.type = 'hidden';
					typeInput.name = "equipment["+index+"][type]";
					typeInput.value = type;
					form.appendChild(typeInput);
		
					const nameInput = document.createElement('input');
					nameInput.type = 'hidden';
					nameInput.name = "equipment["+index+"][name]";
					nameInput.value = name;
					form.appendChild(nameInput);
				});
			} else if (type ==="facility") {
				form.action = '/facility_rental.do';
				rentalItems.forEach((_item, index) => {
					const item = _item.parentElement;
					const id = item.dataset.id;
					const count = "1";
					const name = item.querySelector(".itemTitles > p").textContent;
					const idInput = document.createElement('input');
					idInput.type = 'hidden';
					idInput.name = "equipment[" + index + "][id]";
					idInput.value = id;
					form.appendChild(idInput);

					const countInput = document.createElement('input');
					countInput.type = 'hidden';
					countInput.name = "equipment["+ index +"][count]";
					countInput.value = count;
					form.appendChild(countInput);
					
					
					
					const nameInput = document.createElement('input');
					nameInput.type = 'hidden';
					nameInput.name = "equipment["+index+"][name]";
					nameInput.value = name;
					form.appendChild(nameInput);
				});
			}
			
			
			document.body.appendChild(form);
			console.log(form);
			form.submit();
		}
		
		$(".go-rental").click(function () {
			return onSubmit()
		});
		
		$('.add_bag').click(function () {
			const id = $(this).data('id');
			const tag = $(this)
			console.log(id);
			let param = {
				key_id: id,
				type: type
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
						window.location.reload();
					} else if (res.msg === "deleted") {
						tag.removeClass('active');
						window.alert("장바구니에서 삭제되었습니다.");
						window.location.reload();
					}
				}
			})
		})
	</script>
</body>
</html>