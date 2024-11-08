<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="/js/HuskyEZCreator.js" charset="utf-8"></script>

<!DOCTYPE html>
<html lang="ko">
	<c:import url="../main/head.jsp">
    	<c:param name="pageTitle" value="게시물"/>
    </c:import>
    <body>
	    
		<%@include file="../main/lnb.jsp" %>
		<c:import url="../main/header.jsp">
	    	<c:param name="title" value="게시물"/>
	    	<c:param name="subtitle" value="공지사항 등록"/>
	    </c:import>
	    <div class="contentsContainer">
	        <div class="listContainer">
	            <div class="listInner">
	            	<form action="" id="register" name="register" method="post" enctype="multipart/form-data" class="boardForm">
		            	<div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">카테고리*</p>
	                            <select name="category" id="category" class="lgThinInput">
	                                <option value="1" <c:if test="${pictVO.category eq '1'}">selected</c:if>>센터소식</option>
	                                <option value="2" <c:if test="${pictVO.category eq '2'}">selected</c:if>>행사안내</option>
	                                <option value="3" <c:if test="${pictVO.category eq '3'}">selected</c:if>>보도자료</option>
	                                <option value="4" <c:if test="${pictVO.category eq '4'}">selected</c:if>>기타공고</option>
	                            </select>
	                        </div>
	                    </div>
	                    
	                    <div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">제목*</p>
	                            <input type="text" name="title" id="title" placeholder="내용을 입력하세요…" value="${pictVO.title}">
	                        </div>
	                    </div>
	                    
	                    <div class="inputsContainer">
	                        <div class="inputBox" style="width:100%">
	                            <p class="inputCaption">내용*</p>
	                            <textarea name="text" id="text" cols="50" rows="10" class="txt" style="width:100%;">${pictVO.text}</textarea>
                            	<!-- 에디터 설정 -->
								<script type="text/javascript">
									var oEditors = [];
									nhn.husky.EZCreator.createInIFrame({
										oAppRef: oEditors,
										elPlaceHolder: "text", //textarea에서 지정한 id와 일치해야 합니다.
										sSkinURI: "/js/SmartEditor2Skin.html",
										fCreator: "createSEditor2"
									});
								</script>
	                        </div>
	                    </div>
	 
	                    
	                    <div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">첨부파일
	                                <label for="file_1">파일추가</label>
	                                <input type="file" id="file_1" name="file_1" multiple style="display: none;" class="jy_input">
	                            </p>
	                            <div class="fileList">
	                                <p id="file_name_1"></p>
	                                <button onclick="fn_file_delete('1')"><img src="/img/admin/close2.png" alt=""></button>
	                            </div>
	                            <p class="fileCaption">첨부 파일은 10MB 아래의 확장자 파일만 가능합니다.<br>
	                                (jpeg, png, gif, bmp, tif)</p>
	                        </div>
	                    </div>
	                    
	                    <div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">첨부파일
	                                <label for="file_2">파일추가</label>
	                                <input type="file" id="file_2" name="file_2" multiple style="display: none;" class="jy_input">
	                            </p>
	                            <div class="fileList">
	                                <p id="file_name_2"></p>
	                                <button onclick="fn_file_delete('2')"><img src="/img/admin/close2.png" alt=""></button>
	                            </div>
	                            <p class="fileCaption">첨부 파일은 10MB 아래의 확장자 파일만 가능합니다.<br>
	                                (jpeg, png, gif, bmp, tif)</p>
	                        </div>
	                    </div>
	                    
	                    <div class="inputsContainer">
	                        <div class="inputBox">
	                            <p class="inputCaption">첨부파일
	                                <label for="file_3">파일추가</label>
	                                <input type="file" id="file_3" name="file_3" multiple style="display: none;" class="jy_input">
	                            </p>
	                            <div class="fileList">
	                                <p id="file_name_3"></p>
	                                <button onclick="fn_file_delete('3')"><img src="/img/admin/close2.png" alt=""></button>
	                            </div>
	                            <p class="fileCaption">첨부 파일은 10MB 아래의 확장자 파일만 가능합니다.<br>
	                                (jpeg, png, gif, bmp, tif)</p>
	                        </div>
	                    </div>
	                    
	                    <div class="btnContainer">
	                        <a href="/board/board_list.do" class="normalButton white">목록으로</a>
	                        <a href="#lnk" onclick="button1_click()" class="basicButton blue"><img src="/img/admin/add2.png" alt="완료">완료</a>
	                    </div>
	                    
	                    <input type='hidden' name="saveType" id="saveType" value='${pictVO.saveType}' /> 
						<input type='hidden' name="idx" id="idx" value='${pictVO.idx}' />
    					<input type='hidden' name="fileidx" id="fileidx"/> 
	                </form>
	            </div>
	        </div>
	    </div>
	    <script>
			$(document).ready(function(){
				var file1 = '${pictVO.file_url1}'
				var file2 = '${pictVO.file_url2}'
				var file3 = '${pictVO.file_url3}'
				
				if(file1 != '' && file1 != undefined && file1 != null) 
					$('#file_name_1').text(file1.split("/user1/upload_file/metaverse_industry/")[1])
				if(file2 != '' && file2 != undefined && file2 != null) 
					$('#file_name_2').text(file2.split("/user1/upload_file/metaverse_industry/")[1])
				if(file3 != '' && file3 != undefined && file3 != null) 
					$('#file_name_3').text(file3.split("/user1/upload_file/metaverse_industry/")[1])
			})

			$(".jy_input").on('change', function(){
				const fileInput = this;
                const fileIndex = fileInput.id.split('_')[1];
                
                if (fileInput.files.length > 0) {
                    const fileName = fileInput.files[0].name;
					$("#file_name_"+fileIndex).text(fileName);	
				}
			})
			
			function fn_file_delete(fileidx) {
				if(confirm("해당 첨부파일을 삭제하시겠습니까?")) {

					$("#file_name_" + fileidx).text("");
					$("#file_" + fileidx).val("");
					
					if($("#idx").val()) {
						$('#fileidx').val(fileidx);
						$("#register").attr("action", "/board/board_file_delete.do");
						$("#register").submit();
					}
				}
				return false; // 이벤트 전파 방지
			}
		    
			function button1_click() {
				var title = $('#title').val();
				
				if (title == "" || title == undefined) {
					window.alert("제목을 입력해주세요.");
					$('#title').focus();
					return false;
				}

				var text = "등록하시겠습니까?";
				if (saveType == 'update') {
					text = "수정하시겠습니까?"
				}
				oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
				if (confirm(text)) {
					$("#register").attr("action", "/board/board_save.do");
					$("#register").submit();
				}
			}
		</script>
	</body>
	
</html>