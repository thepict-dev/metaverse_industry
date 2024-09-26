<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="imgModalWrapper" style="display:none" id="imgModalWrapper">
	<button type="button"><img src="/img/admin/close-wt.png" alt=""></button>
	<div class="imgModalInner">
		<img src="/img/admin/test.jpg" alt="" id="modal_img">
	</div>
</div>

<script>

    const modal = document.querySelector('.imgModalWrapper');
    const closeButton = modal.querySelector('button');
    
    // x 버튼 클릭 시 모달 닫기
    closeButton.addEventListener('click', function() {
        closeModal();
    });
    
    // 모달 바깥쪽 클릭 시 모달 닫기
    modal.addEventListener('click', function(event) {
        if (event.target === modal) {
            closeModal();
        }
    });
    
    function closeModal() {
        modal.style.display = 'none';
    }
    
</script>