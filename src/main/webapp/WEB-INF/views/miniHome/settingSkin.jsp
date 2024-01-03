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
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/setting.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/settingSkin.css" />
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
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
								<div class="setting-folder-group">
									<div>
									  <span><img class="setting-skin-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
									  <a href="<c:url value='/miniHome/setting'/>"><span class="setting-skin-title">개인정보변경</span></a><br>
									  
									  <span><img class="setting-skin-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
									  <span class="setting-skin-title">미니홈피관리</span>
									  
									  <ul class="tree">
									    <li><a href="<c:url value='/miniHome/settingBgm'/>">BGM설정</a></li>
									    <li><a href="<c:url value='/miniHome/settingMenu'/>">메뉴탭설정</a></li>
									    <li><a href="<c:url value='/miniHome/settingSkin'/>">스킨설정</a></li>
									  </ul>
									  
									 
									  <span><img class="setting-skin-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
									  <span class="setting-skin-title">아이템/내역관리</span>
									  <ul class="tree">
									    <li><a href="<c:url value='/miniHome/settingDotoriUse'/>">도토리 사용내역</a></li>
									    <li><a href="<c:url value='/miniHome/settingDotoriCharge'/>">도토리 충전내역</a></li>
									  </ul>
									  
									  <span><img class="setting-skin-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
									  <a href="<c:url value='/miniHome/settingFriends'/>"><span class="setting-skin-title">인맥관리</span></a>
									</div>
									
								</div>
								<div class="devide-dot">---------------------------------</div>
								<div class="font-kyobohand setting-profile-username">이주빈&#128698;</div>
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
							<div class="set-skin-frame">
							
								<div class="set-skin-selected">
									<div class="set-skin-selected-span">
										<span>적용중인 스킨</span>
									</div>
									<div class="set-skin-selected-skin">
									</div>
								</div>
								
								<div class="set-skin-having">
									<div class="set-skin-p">
										<p>보유중인 스킨</p>
									</div>
									<div class="set-skin-list">
										<div class="temp1"></div>
										<div class="temp2"></div>
										<div class="temp3"></div>
										<div class="temp4"></div>
										<div class="temp5"></div>
										<div class="temp6"></div>
									</div>
								</div>
								
								<form action="">
									<div class="set-skin-btn">
										<input type="button" class="set-skin-select" value="적용" />
									</div>
								</form>
								
							</div>
						</div>
						
					</div>
					
					<div class="menu-container">
					    <div class="menu-content-clicked">
					        <a href="<c:url value='/mnHome/mainView'/>">홈</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/diaryView'/>">
					        <a href="#">다이어리</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/albumView'/>">
					        <a href="#">사진첩</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/boardView'/>">
					        <a href="#">게시판</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/visitView'/>">
					        <a href="#">방명록</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/settingView'/>">
					        <a href="#">관리</a>
					    </div>
					</div>
					
				</div>
			</div>
		</div>
		<div class="audioPlayerContainer">
<!-- 			<audio id="audioElement" autoplay></audio> -->
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
	<script src="<c:url value='/resources/js/ajaxTab.js'/>"></script>
	<script src="../../../../resources/js/default.js"></script>
	
</body>
</html>
