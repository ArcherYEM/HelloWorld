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
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">


<style>
	.audioPlayerContainer {
		position: fixed;
		right: 0;
		top: 30%;
		transform: translateY(-50%);
		width: 280px;
		background-color: #ddd;
		border: 1px solid #ccc;
		padding: 10px;
		margin-right:15px;
	}
	
	.audioControls {
		display: flex;
	    justify-content: space-between;
	    align-items: center;
	    width: 100%;
	}
	
	.audioButton {
		width: 15px;
		height: 15px;
		border: none;
		background: none;
		cursor: pointer;
		display: inline-flex;
		align-items: center;
		justify-content: center;
		margin: 0 2px;
	}
	
	.audioVolumeContainer {
		display: flex;
		align-items: center;
		width:90px;
	}
	
	#audioVolumeControl {
		width: 100%; 
	}
	
	.nowPlaying {
	    overflow: hidden;
	    white-space: nowrap;
	    margin-bottom:5px;
	}

	.audioTitle {
	    display: inline-block;
	    padding-left: 100%;
	    animation: scrollText 10s linear infinite;
	}
	
	@keyframes scrollText {
		from {
			transform: translateX(0);
	    }
	    to {
	        transform: translateX(-100%);
	    }
	}
</style>
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
						<div>
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
											<li>푸르른 우리 위로 <span
												class="diary-cmt-info"><a href="#">(이정은)</a> 2023.12.22 </span>
											</li>
											<li>커다란 strawberry moon 한 스쿱 <span class="diary-cmt-info"><a
													href="#">(채승원)</a> 2023.12.22</span>
											</li>
											<li>나에게 너를 맡겨볼래<span class="diary-cmt-info"><a
													href="#">(이진우)</a> 2023.12.22</span>
											</li>
											<li> eh-oh  <span
												class="diary-cmt-info"><a href="#">(양은모)</a> 2023.12.22</span>
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
											<li>정해진 이별 따위는 없어 <span
												class="diary-cmt-info"><a href="#">(이정은)</a> 2023.12.22 </span>
											</li>
											<li>아름다웠던 그 기억에서 만나 <span class="diary-cmt-info"><a
													href="#">(채승원)</a> 2023.12.22 </span>
											</li>
											<li>Forever young<span class="diary-cmt-info"><a
													href="#">(이진우)</a> 2023.12.22</span>
											</li>
											<li> 우우우 우우우우 우우우 우우우우 <span
												class="diary-cmt-info"><a href="#">(양은모)</a> 2023.12.22</span>
											</li>
											
										</ul>
									</div>
								</div>
							
							
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
		<!-- <audio id="audioElement" autoplay></audio> -->
	    <div class="nowPlaying">
    	    <div class="audioTitle" id="songTitle">노래 제목</div>
    	</div>
    	<div class="audioControls">
			<button class="audioButton" id="audioPrev">
				<img src="../../../../resources/images/audioPlayer/audioPrev.png">
			</button>
			<button class="audioButton" id="audioPlay">
				<img src="../../../../resources/images/audioPlayer/audioPlay.png">
			</button>
			<button class="audioButton" id="audioPause">
				<img src="../../../../resources/images/audioPlayer/audioPause.png">
			</button>
			<button class="audioButton" id="audioNext">
				<img src="../../../../resources/images/audioPlayer/audioNext.png">
			</button>
			<div class="audioVolumeContainer">
				<input type="range" id="audioVolumeControl" min="0" max="100" value="50" step="1">
			</div>
		</div>
	</div>
	
	<script>
		// 현재 선택된 메뉴 아이템을 저장하는 변수
		var currentSelectedMenu = null;

		function changeClass(element) {
			// 현재 선택된 메뉴의 클래스 초기화
			if (currentSelectedMenu) {
				currentSelectedMenu.classList.remove("menu-content-clicked");
			}

			// 현재 선택된 메뉴를 업데이트하고 클래스를 토글
			currentSelectedMenu = element;
			element.classList.toggle("menu-content-clicked");
		}
		
		// 화면 사이즈 조절 방지
		var resizeTimeout;
		window.onresize = function() {
		  clearTimeout(resizeTimeout);
		  resizeTimeout = setTimeout(function() {
		    window.resizeTo(1200, 720);
		  }, 100);
		};
		
		// 오디오 관련 스크립트
		document.addEventListener('DOMContentLoaded', function() {
		    var playlist = [
		       {url:'../../../../resources/sounds/OneDrink.mp3', title: '소주 한 잔'} ,
		       {url:'../../../../resources/sounds/IBelieve.mp3', title: 'I Believe'} ,
		       {url:'../../../../resources/sounds/Confession.mp3', title: '고백'}
		    ];
		    var currentTrack = 0;
		    var audioElement = document.getElementById('audioElement');
		    var audioPlay = document.getElementById('audioPlay');
		    var audioPause = document.getElementById('audioPause');
		    var audioPrev = document.getElementById('audioPrev');
		    var audioNext = document.getElementById('audioNext');
		    var audioVolumeControl = document.getElementById('audioVolumeControl');

		    function loadTrack(trackNumber) {
		        if (trackNumber < 0) {
		            trackNumber = playlist.length - 1;
		        } else if (trackNumber >= playlist.length) {
		            trackNumber = 0;
		        }

		        currentTrack = trackNumber;
		        audioElement.src = playlist[currentTrack];
		        audioElement.load();
		        
		        var track = playlist[currentTrack];
		        audioElement.src = track.url;
		        document.getElementById('songTitle').textContent = track.title;
		    }

		    audioPrev.addEventListener('click', function() {
		        loadTrack(--currentTrack);
		        audioElement.play();
		        document.getElementById('songTitle').style.animationPlayState = 'running';
		        audioPlay.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPlayPress.png';
		        audioPause.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPause.png';
		    });

		    audioNext.addEventListener('click', function() {
		        loadTrack(++currentTrack);
		        audioElement.play();
		        document.getElementById('songTitle').style.animationPlayState = 'running';
		        audioPlay.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPlayPress.png';
		        audioPause.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPause.png';
		    });

		    audioPlay.addEventListener('click', function() {
		        audioElement.play();
		        document.getElementById('songTitle').style.animationPlayState = 'running';
		        this.classList.add('active');		        
		        this.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPlayPress.png';
		        audioPause.classList.remove('active');
		        audioPause.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPause.png';
		    });

		    audioPause.addEventListener('click', function() {
		        audioElement.pause();
		        document.getElementById('songTitle').style.animationPlayState = 'paused';
		        this.classList.add('active');
		        this.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPausePress.png';
		        audioPlay.classList.remove('active');
		        audioPlay.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPlay.png';
		    });

		    audioVolumeControl.addEventListener('input', function() {
		        audioElement.volume = this.value / 100;
		    });
		    
		    function loadTrack(trackNumber) {
		    	if (trackNumber < 0) { 
		            trackNumber = playlist.length - 1;
		        } else if (trackNumber >= playlist.length) {
		            trackNumber = 0;
		        }

		        currentTrack = trackNumber;
		        var track = playlist[currentTrack];
		        audioElement.src = track.url;
		        document.getElementById('songTitle').textContent = track.title;
		        audioElement.load();
		        audioElement.play();
		    }

		    loadTrack(currentTrack);
		    
		    audioElement.addEventListener('ended', function() {
		        loadTrack(++currentTrack);
		    });
		});
		
		
	</script>
</body>
</html>