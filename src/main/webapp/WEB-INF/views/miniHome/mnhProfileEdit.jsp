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
    <link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
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
		  </div>
		</div>	
	</div>
</form>
	
<script>
  // 등록파일 미리보기
  var fileInput = document.getElementById('fileInput');
  var previewContainer = document.getElementById('preview-container');

  fileInput.addEventListener('change', function () {
    var file = this.files[0];
    previewContainer.innerHTML = ''; // 기존 미리보기 삭제

    if (file) {
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
        newImg.style.display = "inline-block"; // 이미지를 가운데 정렬하기 위한 스타일
        newDiv2.style.textAlign = "center"; // 이미지 컨테이너를 가운데 정렬하기 위한 스타일

        // 파일 이름을 표시하는 텍스트 노드 생성

        // div 안에 img와 텍스트 노드 추가
        newDiv2.appendChild(newImg);
        newDiv.appendChild(newDiv2);

        // 생성한 div를 preview-container에 추가
        previewContainer.appendChild(newDiv);
      };

      reader.readAsDataURL(file); // 파일 읽기 시작
    }
  });
</script>
<script>
// 자기소개문구 3줄이상 입력방지
  var introductionTextarea = document.getElementById('introduction');

  introductionTextarea.addEventListener('input', function () {
    var lines = this.value.split('\n').length;
    if (lines > 3) {
      // 3줄 이상의 입력을 방지
      this.value = this.value.split('\n').slice(0, 3).join('\n');
      alert('자기소개는 3줄까지만 입력 가능합니다.');
    }
  });
</script>
<script>
    // 취소 버튼을 클릭했을 때 창 닫기
    document.getElementById("cancel-button").addEventListener("click", function() {
        window.close();
    });
    
    document.getElementById("btnUpload").addEventListener("click",function(){
    	
    })
</script>
</body>
</html>
