 document.getElementById("search_add1").addEventListener("click", function () {
    new daum.Postcode({
        oncomplete: function (data) {
            document.getElementById("user_address1").value = data.address;
            document.getElementById("user_address2").focus();
       	 	}
    	}).open();
	});
	document.getElementById("search_add2").addEventListener("click", function () {
	    new daum.Postcode({
	        oncomplete: function (data) {
	            document.getElementById("company_address1").value = data.address;
	            document.getElementById("company_address2").focus();
	        }
	    }).open();
	});
	$('#basicModeButton').click(function () {
	    $('#modifyBasic').addClass('active');
	});
	$('#addModeButton').click(function () {
	    $('#modefyAdd').addClass('active');
	});
	$('.closeModalBasic').click(function () {
	    $('#modifyBasic').removeClass('active');
	});
	$('.closeModalAdd').click(function () {
	    $('#modefyAdd').removeClass('active');
	});
	$('.updateBasic').click(function () {
	    if ($('#name').val() == '') {
	        return window.alert('이름을 입력하세요.');
	    }
	    if ($('#mobile').val() == '') {
	        return window.alert('연락처를 입력하세요.');
	    }
	    if ($('#email').val() == '') {
	        return window.alert('이메일을 입력하세요.');
	    }
	    if ($('#birthday').val() == '') {
	        return window.alert('생년월일을 입력하세요.');
	    }
	    if ($('#user_address1').val() == '') {
	        return window.alert('주소를 입력하세요.');
	    }
	    
	    const formData = new FormData();
	    formData.append("name", $('#name').val());
	    formData.append("mobile", $('#mobile').val());
	    formData.append("birthday", $('#birthday').val());
	    formData.append("user_address1", $('#user_address1').val());
	    formData.append("user_address2", $('#user_address2').val());
	    
	    $.ajax({
	        url: '/api/update_user.do' // Replace with your actual endpoint
	        , type: "POST"
	        , data: formData
	        , contentType: false
          	, processData: false
	        , dataType: "json"
	        , async: true,
	        success: function (response) {
	            console.log(response);
	            if (response.rst) {
	                if (response.data.name !== '') {
	                    document.querySelector("._name ~ span").textContent = response.data.name;
	                }
	                if (response.data.mobile !== '') {
	                    document.querySelector("._mobile ~ span").textContent = response.data.mobile;
	                }
	                if (response.data.email !== '') {
	                    document.querySelector("._email ~ span").textContent = response.data.email;
	                }
	                if (response.data.birthday !== '') {
	                    document.querySelector("._birthday ~ span").textContent = response.data.birthday;
	                }
	                if (response.data.user_address1 !== '') {
	                    document.querySelector("._address ~ span").textContent = response.data.user_address1 + ' ' + response.data.user_address2;
	                }
	
	                $('#modifyBasic').removeClass('active');
	                return window.alert('수정되었습니다.');
	            } else {
	                return window.alert('수정에 실패하였습니다.');
	            }
	        },
	        error: function () {
	            // $('#idCheckResult').text('아이디 확인 중 오류가 발생했습니다.').css('color', 'red');
	        }
	    });
	
	    // $('#modifyBasic').removeClass('active');
	});
	$('.updateAdd').click(function () {
	    const formData = new FormData();
	    formData.append("company_nm", $('#company_nm').val());
	    formData.append("sa_eob_no", $('#sa_eob_no').val());
	    formData.append("position", $('#position').val());
	    formData.append("company_address1", $('#company_address1').val());
	    formData.append("company_address2", $('#company_address2').val());
	    if ($("#file")[0].files[0]) {
			
	    	formData.append("attach_file", $("#file")[0].files[0]);
		}
	    $.ajax({
	        url: '/api/update_user.do' // Replace with your actual endpoint
	        , type: "POST"
	        , data: formData
	        , contentType: false
          	, processData: false
	        , dataType: "json"
	        , async: true,
	        success: function (response) {
	            if (response.rst) {
	                const data = response.data;
	                if (data.company_nm !== '') {
	                    document.querySelector("._company_nm ~ span").textContent = data.company_nm;
	                }
	                if (data.sa_eob_no !== '') {
	                    document.querySelector("._sa_eob_no ~ span").textContent = data.sa_eob_no;
	                }
	                if (data.position !== '') {
	                    document.querySelector("._position ~ span").textContent = data.position;
	                }
	                if (data.company_address1 !== '') {
	                    document.querySelector("._company_address ~ span").textContent = data.company_address1 + ' ' + data.company_address2;
	                }
	                if (data.document_url !== '') {
	                    document.querySelector("._document_url ~ span").textContent = data.document_url;
	                }
	                $('#modefyAdd').removeClass('active');
	                return window.alert('수정되었습니다.');
	            } else {
	                return window.alert('수정에 실패하였습니다.');
	            }
	        },
	        error: function () {
	            // $('#idCheckResult').text('아이디 확인 중 오류가 발생했습니다.').css('color', 'red');
	        }
	    });
	
	});