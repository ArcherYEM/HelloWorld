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
		<link rel="stylesheet" href="../../../../resources/css/album.css" />
		<link rel="stylesheet" href="../../../../resources/css/audio.css" />
		<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
		<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
	</head>
	<body>
		<div class="bookcover">
			<div class="bookdot">
				<div class="page">
					<div class="profile-container">
						<div class="header profile-title font-neo">
							TODAY 404 | TOTAL 500
						</div>
						<div class="box profile-box">
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
							<div id="albumTitle">
								앨범 게시물 제목
							</div>
							<div class="underLine">
							</div>
							<div id="writerAndDate">
								<span id="albumWriter">채승원(작성자)</span>
								<span id="albumWrite_date">2023.12.21 19:39</span>
							</div>
							<div id="writerUnderLine">
							</div>
							<div class="album-images">
								
						      <img src="<c:url value="/resources/images/album/albumImg1.jpg" />" alt="이미지 설명">
						    </div>
							  <div id="albumText">
							   	해당 사진에 추가한 글 내용이 들어가는 곳
							  </div>
						    <div class="underLine">
							</div>
							<div id="albumTitle">
								앨범 게시물 제목
							</div>
							<div class="underLine">
							</div>
							<div id="writerAndDate">
								<span id="albumWriter">채승원(작성자)</span>
								<span id="albumWrite_date">2023.12.20 20:52</span>
							</div>
							<div id="writerUnderLine">
							</div>
							<div class="album-images">
								
						      <img src="<c:url value="/resources/images/album/albumPuppy.jpg" />" alt="이미지 설명">
						    </div>
							  <div id="albumText">
							   	해당 사진에 추가한 글 내용이 들어가는 곳
							  </div>
						    <div class="underLine">
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
		<script src="../../../../resources/js/default.js"></script>
	</body>
</html>
