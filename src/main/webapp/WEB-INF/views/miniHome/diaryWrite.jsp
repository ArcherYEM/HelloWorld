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
<link rel="stylesheet" href="../../../../resources/css/minihome/diary.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/jquery-ui(1.13.2).css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
<script src="https://kit.fontawesome.com/91b557f547.js" crossorigin="anonymous"></script> 
<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- date picker  -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- date picker  -->
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
							<div id="datepicker" style="width:80%"></div>
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="album-folder-group">
								<div class="album-folder">
									<img src="/resources/images/minihome/openFolderIcon.png">
									<a href="#" class="folder-name">전체보기</a>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#" class="folder-name">일상생활</a>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#" class="folder-name">개발 이야기</a>
								</div>
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
							https://www.helloworld.com/minihome/leejubin</div>
					</div>
					<div class="box content-box">
						<div class="board-overflow">
							<div class="board-title-container">
								<input type="text" placeholder="제목을 입력하세요" class="board-title" maxlength="30">
							</div>
							<div class="board-write-container">
								<span class="board-writer">  이정은(작성자)</span>
								<span class="board-write-date">2023.12.26 14:21</span>						
							</div>
							<textarea name="content" id="txtContent" rows="10" cols="100" style="width:500px; height:180px; min-width:500px; display:none;"></textarea><br>
							<br>
	
							<div class="btn-container">
								<div class="btn-left"></div>
								<div class="btn-right">
									<input class="btn-diarylist" type="button" id="btnBoardView" data-diaryView="<c:url value='/mnHome/diaryView'/>" value="목록">
									<input class="btn-write" type="button" id="btnBoardWrite" value="글쓰기">
								</div>
							</div>
							<div id="preview-container"></div>
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
	<script src="<c:url value='/resources/js/ajaxTab.js'/>"></script>
	<script src="../../../../resources/js/default.js"></script>
	
</body>
</html>