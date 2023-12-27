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
<link rel="stylesheet" href="../../../../resources/css/minihome/visit.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
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
						<div class="profile-image">
							<img class="profile-image-img"
								src="../../../../resources/images/profile.jpg" alt="프로필 이미지" />
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="profile-text font-kyobohand">
							안녕하세요 이주빈 입니다.<br />
							미모최강 풀스택 개발자 입니다.
						</div>
						<div class="profile-history">
							<a 
							  class="profile-edit" 
							  onclick="openNewWindowMinihomeProfileEdit()">Edit
							</a>
							<a href="#" class="profile-hs">History</a>
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="profile-username font-kyobohand">이주빈&#128698;</div>
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
					
					<div class="visit-frame">
						<div class="visit-frame-write">
							<img class ="visit-minimi"
								src="../../../../resources/images/icon/minimi/zombiIcon.gif" />
							<input type="text" />
						</div>
						<div class="visit-frame-btn">
							<input type="button" value="등록" />
						</div>
					</div>
					<div class="visit-line">
						<table>
							<tr>
								<td>No. 405</td>
								<td>양은모
									<img src="../../../../resources/images/icon/minihome/homeIcon.png" class="visit-line-tbImg">
								</td>
								<td>2023-12-21 21:01</td>
								<td>비밀로하기</td>
								<td>수정</td>
								<td>삭제</td>
							</tr>
						</table>
					</div>
					<div class="visit-frame-write view-margin">
						<img class ="visit-minimi"
								src="../../../../resources/images/icon/minimi/soulTeddyIcon.gif" />
						<div class="visit-view">
	    				<div class="visit-view-inner">
	     					이건 버그 맞아요<br>
	        			변명말고 고치세요 당장.
	    				</div>
						</div>						
					</div>
					<div class="visit-line">
						<table>
							<tr>
								<td>No. 404</td>
								<td>이진우
									<img src="../../../../resources/images/icon/minihome/homeIcon.png" class="visit-line-tbImg">
								</td>
								<td>2023-12-20 21:17</td>
								<td>비밀로하기</td>
								<td>수정</td>
								<td>삭제</td>
							</tr>
						</table>
					</div>
					<div class="visit-frame-write">
						<img class ="visit-minimi"
								src="../../../../resources/images/icon/minimi/Nova_2Icon.gif" />
						<div class="visit-view">
	    				<div class="visit-view-inner">
	     					이거 버그 아니에요<br>
	        			이건 그저 특징 이란말이에요
	    				</div>
						</div>						
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
					<div class="menu-content">
						<a href="/mnHome/boardView">게시판</a>
					</div>
					<div class="menu-content-clicked">
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
	// 미니홈피 프로필 수정창
	function openNewWindowMinihomeProfileEdit() {
	  var windowSettings = 'width=460, height=570, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50';
	  openNewWindow('/mnHome/mnhProfileEditView', windowSettings);
	}
	
	function openNewWindow(url, settings) {
	  window.open(url, '_blank', settings);
	}
</script>
</body>
</html>
