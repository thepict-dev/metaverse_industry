<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/head.jsp">
    	<c:param name="pageTitle" value="설정"/>
    </c:import>
    <body>
	    
		<%@include file="../main/lnb.jsp" %>
		<c:import url="../main/header.jsp">
	    	<c:param name="title" value="홈페이지"/>
	    	<c:param name="subtitle" value="링크 설정"/>
	    </c:import>
	    <div class="contentsContainer">
	        <div class="listContainer">
	            <div class="listInner">
	            	<form action="" id="register" name="register" method="post" enctype="multipart/form-data" class="boardForm">
	                    <div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">콘텐츠 제작지원 링크</p>
	                            <input type="text" name="content_url" id="content_url" placeholder="콘텐츠 제작지원 링크 클릭시 이동한 URL을 입력해주세요." value="${pictVO.content_url}">
	                        </div>
	                    </div>
	                   
	                    <div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">전문인력 양성 링크</p>
	                            <input type="text" name="professional_url" id="professional_url" placeholder="전문인력 양성 링크 클릭시 이동한 URL을 입력해주세요." value="${pictVO.professional_url}">
	                        </div>
	                    </div>
	                    
	                    <div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">인프라 지원 링크</p>
	                            <input type="text" name="infra_url" id="infra_url" placeholder="인프라 지원 링크 클릭시 이동한 URL을 입력해주세요." value="${pictVO.professional_url}">
	                        </div>
	                    </div>
	                    <div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">홍보영상 링크</p>
	                            <input type="text" name="video_url" id="video_url" placeholder="페이지에 표출될 영상의 URL을 입력해주세요." value="${pictVO.video_url}">
	                        </div>
	                    </div>
	                    <div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">채널 링크</p>
	                            <input type="text" name="channel_url" id="channel_url" placeholder="채널 바로가기 클릭시 이동할 URL을 입력해주세요." value="${pictVO.channel_url}">
	                        </div>
	                    </div>
	                    <!-- 
	                    <div class="inputsContainer">
	                        <div class="inputBox">
		                    	<p class="inputCaption">썸네일 미리보기*
		                           </p>
		                        <div class="prev_img">
		                        	<img src="${pictVO.video_thumb}" />
		                        </div>
	                        </div>
	                    </div>
	                    <div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">홍보영상 썸네일*
	                                <label for="attach_file">이미지 변경</label>
	                                <input type="file" id="attach_file" name="attach_file" multiple style="display: none;">
	                            </p>
	                            <div class="fileList">
	                                <p></p>
	                                <button><img src="/img/admin/close2.png" alt=""></button>
	                            </div>
	                            <p class="fileCaption">첨부 파일은 10MB 아래의 확장자 파일만 가능합니다.<br>
	                                (jpeg, png, gif, bmp, tif)</p>
	                        </div>
	                    </div>
	                     -->
	                    <div class="btnContainer">
	                        <a href="#lnk" onclick="button1_click()" class="basicButton blue"><img src="/img/admin/add2.png" alt="완료">적용</a>
	                    </div>
	                    
	                    <input type='hidden' name="saveType" id="saveType" value='${pictVO.saveType}' /> 
	                </form>
	            </div>
	        </div>
	    </div>
	    <script>
			/*
		    $(document).ready(function() {
		        // 첨부파일 관련 코드
		        var fileInputs = ['attach_file'];
	
		        $.each(fileInputs, function(index, inputId) {
		            var $fileInput = $('#' + inputId);
		            var $fileList = $fileInput.closest('.inputBox').find('.fileList');
		            var $fileName = $fileList.find('p');
		            var $deleteButton = $fileList.find('button');
	
		            $fileInput.on('change', function() {
		                if (this.files.length > 0) {
		                    var fileName = this.files[0].name;
		                    $fileName.text(fileName);
		                    $fileList.css('display', 'flex');
		                }
		            });
	
		            $deleteButton.on('click', function(e) {
		                e.preventDefault();
		                $fileName.text('');
		                $fileInput.val('');
		                $fileList.hide();
		            });
	
		            // 초기 상태에서 fileList 숨김
		            $fileList.hide();
		        });
		    });
		    
		    $("#attach_file").change(function (e) {
		    	if (e.target.files && e.target.files[0]) {
		    		var reader = new FileReader();

		    		reader.onload = function (e) {
		    			console.log("e.target.result @@@@@@@@@@@", e.target.result);
		    			$(".prev_img img").attr("src", e.target.result);
		    		}
		    		reader.readAsDataURL(e.target.files[0]);
		    	}
		    });
		    */
		    $("#order_val").change(function(){
		        // 현재 입력된 값
		        let value = $(this).val();
		        
		        // 숫자가 아닌 문자 제거
		        value = value.replace(/[^0-9]/g, '');
		        
		        // 앞의 0들 제거
		        value = value.replace(/^0+/, ''); 
		        $(this).val(value);

		    })
		    
			function button1_click() {
				var text = "등록하시겠습니까?";
				if (saveType == 'update') {
					text = "수정하시겠습니까?"
				}
				if (confirm(text)) {
					$("#register").attr("action", "/setting/settings_save.do");
					$("#register").submit();
				}
			}
		</script>
	</body>
	
</html>