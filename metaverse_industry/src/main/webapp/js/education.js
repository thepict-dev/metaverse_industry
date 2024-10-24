document.getElementById("search_add1").addEventListener("click", function () {
    new daum.Postcode({
        oncomplete: function (data) {
            document.getElementById("address1").value = data.address;
            $('#address2').css("display", "block");
            document.getElementById("address2").focus();
        }
    }).open();
});



const callBookingApi = () => {
    const formData = new FormData();
    const team = $("#team").val();
    const address1 = $("#address1").val();
    const address2 = $("#address2").val();
    const tel = $("#tel").val();
    const position = $("#position").val();
    const mobile = $("#mobile").val();
    const email = $("#email").val();
    const type = $("input[name='type']").val();
    const totalCnt = $("#totalCnt").val();
    const visit_date = $("#visit_date").val();
    const school = $("#school").val();
    const grade = $("#grade").val();
    if (team === "") {
        window.alert("단체명을 입력해주세요.");
        return;
    }
    if (address1 === "") {
        window.alert("주소를 입력해주세요.");
        return;
    }

    if (position === "") {
        window.alert("직책을 입력해주세요.");
        return;
    }
    if (mobile === "") {
        window.alert("전화번호를 입력해주세요.");
        return;
    }
    if (email === "") {
        window.alert("이메일을 입력해주세요.");
        return;
    }
    if (type === "") {
        window.alert("신청 교육을 선택해주세요.");
        return;
    }
    if (totalCnt === "") {
        window.alert("총 인원을 입력해주세요.");
        return;
    }
    if (tel === "") {
        window.alert("연락처를 입력해주세요.");
        return;
    }
    if (visit_date === "") {
        window.alert("방문 날짜를 선택해주세요.");
        return;
    }

    if (school === "") {
        window.alert("학교명을 입력해주세요.");
        return;
    }
    if (grade === "") {
        window.alert("학년을 입력해주세요.");
        return;
    }
    
    if (!$("#agree1").is(':checked')) {
		window.alert("개인식별정도 동의를 체크해주세요.");
        return;
	}
	if (!$("#agree2").is(':checked')) {
		window.alert("제3자 정보제공 동의를 체크해주세요.");
        return;
	}

    
    formData.append("team", team);
    formData.append("address1", address1);
    formData.append("address2", address2);
    formData.append("tel", tel);
    formData.append("position", position);
    formData.append("mobile", mobile);
    formData.append("email", email);
    formData.append("type", type);
    formData.append("totalCnt", totalCnt);
    formData.append("visit_date", visit_date);
    formData.append("school", school);
    formData.append("grade", grade);

    $.ajax({
        url: '/submit_education.do'
        , type: "POST"
        , data: formData
        , processData: false
        , contentType: false
        , async: true,
        success: function (response) {
            console.log(response);
            if (response.msg === "ok") {
				window.alert("신청이 완료되었습니다.")
				eduModal.classList.remove('active');
	            document.body.classList.remove('no-scroll');  // body에서 no-scroll 클래스 제거
	            lenis.start();  // Lenis 활성화
	           
            }
        },
        error: function (e) {
            console.log(e);
            
        }
    })
}

$(".submit-form").click(function () {
    callBookingApi();
});