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
		<link rel="stylesheet" href="../../../../resources/css/minihome/album.css" />
		<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
		<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
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
							<div class="album-folder-group">
								<div class="album-folder">
									<img src="/resources/images/minihome/openFolderIcon.png">
									<a href="#">전체보기</a><br/>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#">~ 2014.10.11</a><br/>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#">우리가족 ~♡</a><br/>
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
							<div class="album-overflow">
							
								<div class="album-container3">
									<div class="album-container2">
										<div class="album-container1">
											<div class="album-title albumWrite-title">
												<input type="text" placeholder="제목을 입력하세요">
											</div>
										  <div class="album-content albumWrite-content">
										  	<textarea placeholder="내용을 입력하세요"></textarea>
										  	<input type="file" class="albumWirte-file">
										  </div>
									  </div>
									  <div class="album-public">
									  	<div class="album-dropDown">
									  		<span>공개설정 :</span>
												<select>
													<option value="" disabled selected hidden="">전체공개</option>
													<option value="temp1">비공개</option>
													<option value="temp2">전체공개</option>
												</select>
											</div>
									  </div>
								  </div>
								  <div class="album-container-under">
								  	<div class="album-under">
								  		<a href="/mnHome/albumView" class="album-under-left">목록</a>
								  		<a href="/mnHome/albumView" class="album-under-right">등록</a>
								  	</div>
								  </div>
							  </div>
							  
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
