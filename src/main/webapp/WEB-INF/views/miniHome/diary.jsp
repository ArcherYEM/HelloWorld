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
					<div class="header profile-title font-neo">TODAY 404 | TOTAL
						500</div>
					<div class="box profile-box">
						<div class="profile-image">
							<div>달력자리</div>
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="profile-text font-kyobohand">
							폴더자리 
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
							https://www.helloworld.com/minihome/leejubin</div>
					</div>
					<div class="box content-box">
						<div id="div-btn-write">
							<button id="btn-write-diary">글쓰기</button> 
						</div>
						<div class="diary">
							
								<div class="diary-box">
									<div class="diary-date font-kyobohand">2023.12.21 23:50</div>
									<div class="diary-content font-kyobohand" style="align-items: center;">
										달이 익어가니 서둘러 젊은 피야<br>
		
										민들레 한 송이 들고<br>
										
										사랑이 어지러이 떠다니는 밤이야<br>
										
										날아가 사뿐히 이루렴<br>
										
										팽팽한 어둠 사이로<br>
										
										떠오르는 기분<br>
										
										이 거대한 무중력에 혹 휘청해도<br>
										
										두렵진 않을 거야<br>
									</div>
								</div>
								<div class="divForBtnDiary">
									<button id="">수정</button> 
									<button id="">삭제</button> 
								</div>
								
								<div class="main-cmt">
									<div class="main-cmt-write">
										댓글 <input type="text" class="main-cmt-input">
										<button type="submit" value="확인">확인</button>
									</div>
									<div class="diary-cmt-content">
										<ul class="diary-ul">
											<li>
												<span class="diary-cmt-info">
													<a href="#">이정은 : </a> 푸르른 우리 위로 (2023.12.22 09:35) <i class="fa-solid fa-delete-left"></i>
												</span>
											<li>
												<span class="diary-cmt-info">
													<a href="#">채승원 : </a> 커다란 strawberry moon 한 스쿱 (2023.12.22 10:35)
												</span>
											</li>
											<li>
												<span class="diary-cmt-info">
													<a href="#">이진우 : </a> 나에게 너를 맡겨볼래 (2023.12.22 12:35)
												</span>
											</li>
											<li>
												<span class="diary-cmt-info">
													<a href="#">양은모 : </a> eh-oh (2023.12.22 14:35)
												</span>
											</li>
											
										</ul>
									</div>
								</div>
								
								<div class="diary-box">
									<div class="diary-date font-kyobohand">2023.12.22 10:45</div>
									<div class="diary-content font-kyobohand" style="align-items: center;">
										So are you happy now<br>
										Finally happy now are you<br>
										뭐 그대로야 난<br>
										다 잃어버린 것 같아<br>
										모든 게 맘대로 왔다가 인사도 없이 떠나<br>
										이대로는 무엇도 사랑하고 싶지 않아<br>
										다 해질 대로 해져버린<br>
										기억 속을 여행해<br>
										우리는 오렌지 태양 아래<br>
										그림자 없이 함께 춤을 춰<br>
									</div>
								</div>
								<div class="divForBtnDiary">
									<button id="">수정</button> 
									<button id="">삭제</button> 
								</div>
								
								<div class="main-cmt">
									<div class="main-cmt-write">
										댓글 <input type="text" class="main-cmt-input">
										<button type="submit" value="확인">확인</button>
									</div>
									<div class="diary-cmt-content">
										<ul class="diary-ul">
											<li>
												<span class="diary-cmt-info">
													<a href="#">이정은 : </a> 정해진 이별 따위는 없어 (2023.12.22 16:35)
												</span>
											</li>
											<li>
												<span class="diary-cmt-info">
													<a href="#">채승원 : </a> 아름다웠던 그 기억에서 만나 (2023.12.22 20:35)
												</span>
											</li>
											<li>
												<span class="diary-cmt-info">
													<a href="#">이진우 : </a> Forever young (2023.12.22 21:35)
												</span>
											</li>
											<li>
												<span class="diary-cmt-info">
													<a href="#">양은모 : </a> 우우우 우우우우 우우우 우우우우 (2023.12.22 23:35)
												</span>
											</li>
											
										</ul>
									</div>
								</div>
							
						</div>
						
					</div>
				</div>
				
				<div class="menu-container">
					<div class="menu-content">
						<a href="/mnHome/mainView">홈</a>
					</div>
					<div class="menu-content-clicked">
						<a href="/mnHome/diaryView">다이어리</a>
					</div>
					<div class="menu-content">
						<a href="/mnHome/albumView">사진첩</a>
					</div>
					<div class="menu-content">
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
</body>
</html>