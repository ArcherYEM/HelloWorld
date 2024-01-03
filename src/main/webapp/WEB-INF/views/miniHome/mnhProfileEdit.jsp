<!-- views/miniHome/miniroomEdit -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizeable:no">
<head>
    <meta charset="UTF-8">
    <title>프로필 수정</title>
    <link rel="stylesheet" href="../../../../resources/css/minihome/mnhProfileEdit.css" />
    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
<form method="POST" action="<c:url value='/profile/download'/>" enctype="multipart/form-data">
	<div class="edit-frame">
		<div class="edit-pad">
			<div class="edit-container-over">
		    <div class="edit-file">
		   	  <input type="file" id="fileInput" name="file">
		    </div>
		    <div class="file-preview" id="preview-container"></div>
		  </div>
		  <div class="edit-container-under">
		  	<div class="edit-introduce">
		  		<textarea id="introduction" placeholder="자기소개 문구를 입력하세요" rows="3" name="msg"></textarea>
		  	</div>
		  </div>
		  <div class="edit-btn">
		 		<input type="submit" value="등록" id="btnUpload">
		 		<input type="button" value="취소" id="cancel-button">
                <!-- 숨겨진 필드 추가 -->
                <input type="hidden" id="fileStatus" name="fileStatus" value="noFile">
		  </div>
		</div>	
	</div>
</form>

<script>
  var fileInput = document.getElementById('fileInput');
  var previewContainer = document.getElementById('preview-container');
  var fileStatusInput = document.getElementById('fileStatus');

  fileInput.addEventListener('change', function () {
    var file = this.files[0];
    previewContainer.innerHTML = ''; // 기존 미리보기 삭제

    if (file) {
      var fileType = file.type;
      if (fileType.match(/^image\//)) {
        var reader = new FileReader();

        reader.onload = function (e) {
          var newDiv = document.createElement("div");
          newDiv.className = "preview-container";
          var newDiv2 = document.createElement("div");
          newDiv2.className = "image-container";

          var newImg = document.createElement("img");
          newImg.src = e.target.result;
          newImg.style.width = "200px";
          newImg.style.height = "auto";
          newDiv2.style.textAlign = "center";

          newDiv2.appendChild(newImg);
          newDiv.appendChild(newDiv2);

          previewContainer.appendChild(newDiv);
        };

        reader.readAsDataURL(file);
        fileStatusInput.value = "hasFile"; // 파일이 있을 때의 상태값 설정
      } else {
        alert('이미지 형식의 파일을 업로드해주세요.');
        fileInput.value = '';
        fileStatusInput.value = "noFile"; // 파일이 없을 때의 상태값 설정
      }
    }
  });

  var introductionTextarea = document.getElementById('introduction');
  introductionTextarea.addEventListener('input', function () {
    var lines = this.value.split('\n').length;
    if (lines > 3) {
      this.value = this.value.split('\n').slice(0, 3).join('\n');
      alert('자기소개는 3줄까지만 입력 가능합니다.');
    }
  });

  document.getElementById("cancel-button").addEventListener("click", function() {
    window.close();
  });
</script>
</body>
</html>
