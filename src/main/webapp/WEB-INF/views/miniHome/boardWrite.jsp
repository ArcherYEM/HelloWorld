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
<link rel="stylesheet" href="../../../../resources/css/fonts.css" />
<link rel="stylesheet" href="../../../../resources/css/frame.css" />
<link rel="stylesheet" href="../../../../resources/css/board.css" />
<link rel="stylesheet" href="../../../../resources/css/audio.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
				<div class="profile-container">
					<div class="header profile-title font-neo">TODAY 404 | TOTAL
						500</div>
					<div class="box profile-box">
						<div class="profile-image">
							<img class="profile-image-img"
								src="../../../../resources/images/profile.jpg" alt="프로필 이미지" />
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="profile-text font-kyobohand">
							안녕하세요 이주빈 입니다.<br /> 미모최강 풀스택 개발자 입니다.
						</div>
						<div class="profile-history">
							<a href="#" class="profile-hs-edit">▶Edit</a> <a href="#"
								class="profile-hs-hs">▶History</a>
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="profile-username font-kyobohand">이주빈&#128698;</div>
						<div class="profile-dropDown">
							<select>
								<option value="" disabled selected hidden>파도타기</option>
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
					
					<div class="board-title-container">
						<input type="text" placeholder="     제목을 입력하세요" class="board-title" maxlength="30">
					</div>
					<div>
						<input type="text" value="  채승원(작성자)" class="board-writer">
					</div>
					
						
					</div>
				</div>
				<div class="menu-frame">
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/mainView">홈</a>
					</div>
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/diaryView">다이어리</a>
					</div>
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/albumView">사진첩</a>
					</div>
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/boardView">게시판</a>
					</div>
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/visitView">방명록</a>
					</div>
					<div class="menu-content" onclick="changeClass(this)">
						<a href="/mnHome/settingView">관리</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="audioPlayerContainer">
		<audio id="audioElement" autoplay></audio>
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
	<script src="../../../../resources/js/default.js"></script>
	<script>
		var checkboxAll=document.getElementById('checkbox-all');
	
		function selectAll() {
		  var checkboxes = document.querySelectorAll('.td-checkbox input[type="checkbox"]');
		  var allChecked = checkboxAll.checked;

		  checkboxes.forEach(function(checkbox) {
		    checkbox.checked = allChecked;
		  });
		}
	</script>
	
</body>
</html>
