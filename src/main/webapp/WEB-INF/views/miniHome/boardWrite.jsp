<!-- views/miniHome/main -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizeable:no">
<head>
<meta charset="UTF-8">
<title>미니홈피</title>
<link rel="stylesheet" href="../../../../resources/css/minihome/fonts.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/frame.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/board.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/album.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
<div class="main-frame">
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
				<div class="profile-container">
					<div class="header profile-title font-neo">
						TODAY&nbsp;<span class="today-span">404</span>&nbsp;| TOTAL 500
					</div>
					<div class="box profile-box">
							<div class="album-folder-group">
								<div class="album-folder">
									<img src="/resources/images/icon/minihome/openFolderIcon.png">
									<a href="#">전체보기</a><br/>
								</div>
								<div class="album-folder">
									<img src="/resources/images/icon/minihome/closeFolderIcon.png">
									<a href="#">일상생활</a><br/>
								</div>
								<div class="album-folder">
									<img src="/resources/images/icon/minihome/closeFolderIcon.png">
									<a href="#">개발 이야기</a><br/>
								</div>
							</div>
							<div class="album-dot">---------------------------------</div>
							<div class="font-kyobohand album-profile-username">이주빈&#128698;</div>
							<div class="profile-dropDown">
								<select>
									<option value="" disabled selected hidden="">파도타기</option>
									<option value="temp1">이정은(jungeun@gmail.com)</option>
									<option value="temp2">이진우(junwoo@naver.com)</option>
									<option value="temp3">채승원(seungwon@daum.net)</option>
									<option value="temp4">양은모(eunmo@nate.com)</option>
								</select>
							</div>
						</div>
				</div>
				<div class="content-container">
					<div class="header content-title">
						<div class="content-title-name">지구 최강 미모 이주빈 입니다</div>
						<div>
							<button class="btn-edit">수정</button>
						</div>
						<div class="content-title-url">
							https://www.helloworld.com/minihome/leejubin
						</div>
					</div>
					<div class="box content-box">
					
					<div class="board-overflow">
						<div class="board-title-container">
							<input type="text" placeholder="     제목을 입력하세요" class="board-title" maxlength="30">
						</div>
						<div class="board-write-container">
							<span class="board-writer">  채승원(작성자)</span>
							<span class="board-write-date">2023.12.10 14:21</span>						
						</div>
						<textarea name="content" id="txtContent" rows="10" cols="100" style="width:500px; height:180px; min-width:500px; display:none;"></textarea><br>
						<br>

						<div class="btn-container">
							<div class="btn-left">
								<input type="file" multiple="multiple" onchange="multiFiles(this.files)" class="fileUpload">
							</div>
							<div class="btn-right">
								<input class="btn-list" type="button" id="btnBoardView" value="목록">
								<input class="btn-write" type="button" id="btnBoardWrite" value="등록">
							</div>
						</div>
						<div id="preview-container"></div>
					</div>
					
					</div>
				</div>
				
				<div class="menu-container">
					<div class="menu-content">
						<a href="/mnHome/mainView">홈</a>
					</div>
					<div class="menu-content">
						<a href="/mnHome/diaryView">다이어리</a>
					</div>
					<div class="menu-content">
						<a href="/mnHome/albumView">사진첩</a>
					</div>
					<div class="menu-content-clicked">
						<a href="/mnHome/boardView">게시판</a>
					</div>
					<div class="menu-content">
						<a href="/mnHome/visitView">방명록</a>
					</div>
					<div class="menu-content">
						<a href="/mnHome/settingView">관리</a>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<div class="audioPlayerContainer">
<!-- 		<audio id="audioElement" autoplay></audio> -->
		<div class="audioPlayingContainer">
			<div class="audioPlayingDiv">
				<img id="audioPlayingImg" src="../../../../resources/images/audioPlayer/nowPlaying.png">
			</div>
			<div class="audioPlayingMargin">				
			</div>			
		    <div class="nowPlaying">
	    	    <div class="audioTitle" id="songTitle">노래 제목</div>
	    	</div>
	    </div>
    	<div class="audioControlsContainer">
	    	<div class="audioBtnContainer">
				<button class="audioBtn" id="audioPrev">
					<img src="../../../../resources/images/audioPlayer/audioPrev.png">
				</button>
				<button class="audioBtn" id="audioPlay">
					<img src="../../../../resources/images/audioPlayer/audioPlay.png">
				</button>
				<button class="audioBtn" id="audioPause">
					<img src="../../../../resources/images/audioPlayer/audioPause.png">
				</button>
				<button class="audioBtn" id="audioNext">
					<img src="../../../../resources/images/audioPlayer/audioNext.png">
				</button>
			</div>
			<div class="audioVolumeContainer">
				<button id="audioVolumeBtn">
					<img src="../../../../resources/images/audioPlayer/audioVolume.png" style="margin-right:5px;">
				</button>
				<input type="range" id="audioVolumeControl" min="0" max="100" value="50" step="1">
			</div>
		</div>
	</div>
</div>
	<script src="../../../../resources/js/default.js"></script>
	<script>
	// 여러파일 업로드
	function multiFiles(input) {
		  var previewContainer = document.getElementById('preview-container');

		  if (input && input.length) {
		    for (var i = 0; i < input.length; i++) {
		      (function(file) {
		        var reader = new FileReader();
		        
		        reader.onload = function(e) {
		       	  var newDiv = document.createElement("div");
				      newDiv.className = "image-container";
				      newDiv.style.position = "relative";
		          var newDiv2 = document.createElement("div");
		          newDiv2.className = "name-container";
							
		          // 파일이미지
		          var newImg = document.createElement("img");
		          newImg.src = e.target.result;
		          newImg.style.width = "50%"; // 이미지 크기 설정
		          newImg.style.height = "auto";
		          newImg.style.marginBottom = "20px";

		          // 파일 이름을 표시하는 텍스트 노드 생성
		          var imageName = document.createTextNode(file.name);
		          
		          // 취소버튼
		          var newBtn = document.createElement("button");
		          newBtn.className="removeBtn";
		          newBtn.style.position = "absolute";
		          newBtn.style.top = "0";
		          newBtn.style.right = "0";
		          newBtn.onclick = function() {
					if(confirm("선택된 사진을 삭제하시겠습니까?")==true){
						previewContainer.removeChild(newDiv);
						 removeFile(document.querySelector('.fileUpload'));
					}else{
						return false;
					}
	          };

	          // div 안에 img와 텍스트 노드 추가
	          newDiv.appendChild(newDiv2);
	          newDiv.appendChild(newBtn);
	          newDiv2.appendChild(imageName); 
	          newDiv.appendChild(newImg);

	          // 생성한 div를 preview-container에 추가
	          previewContainer.appendChild(newDiv);
	        };

	        reader.readAsDataURL(file); // 파일 읽기 시작
	      })(input[i]);
	    }
	  }
	}

	var oEditors=[];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "txtContent",
		sSkinURI : "../../../../resources/smarteditor2/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});

</script>
	
</body>
</html>
