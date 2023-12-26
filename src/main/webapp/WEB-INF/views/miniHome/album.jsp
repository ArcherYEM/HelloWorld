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
	<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<div class="main-frame">
		<div class="bookcover">
			<div class="bookdot">
				<div class="page">
					<div class="profile-container">
						<div class="header profile-title font-neo">
							TODAY 404 | TOTAL 500
						</div>
						<div class="box profile-box">
							<div class="album-folder-group">
								<div class="album-folder">
									<img src="/resources/images/icon/minihome/openFolderIcon.png">
									<a href="#">전체보기</a><br/>
								</div>
								<div class="album-folder">
									<img src="/resources/images/icon/minihome/closeFolderIcon.png">
									<a href="#">~ 2014.10.11</a><br/>
								</div>
								<div class="album-folder">
									<img src="/resources/images/icon/minihome/closeFolderIcon.png">
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
							<div class=" album-submit">
								<input type="button" id="btnUpload" value="사진올리기">
							</div>
							<div class="album-overflow">
							
								<div class="album-container3">
									<div class="album-container2">
										<div class="album-container1">
											<div class="album-title">
												싸이월드가 헬로월드로 새롭게 바뀌었습니다!
											</div>
											<div class="album-wd">
												<span class="album-writer">
													채승원
												</span>
												<span class="album-date">
													2023-12-24 16:33
												</span>
											</div>
											<div class="album-images">
									      <img src="<c:url value="/resources/images/album/albumImg1.jpg" />" alt="이미지 설명">
									    </div>
										  <div class="album-content">
											<!--임시글 -->
											바야흐로 2008년,,<br />
											우zi는 ㄱr끔 눈물을 흘렸ㄷr...☆
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
								  		<a href="#" class="album-under-left">스크랩하기</a>
								  		<a href="#" class="album-under-right">이동</a>
								  		<a href="#" class="album-under-right">수정</a>
								  		<a href="#" class="album-under-right">삭제</a>
								  	</div>
								  </div>
							  </div>
							  
							  <div class="album-container3">
									<div class="album-container2">
										<div class="album-container1">
											<div class="album-title">
												[스크랩] 어느덧 이만큼 자란 우리 뽀삐
											</div>
											<div class="album-wd">
												<span class="album-writer">
													채승원
												</span>
												<span class="album-date">
													2023.12.20 20:52
												</span>
											</div>
											<div class="album-images">
									      <img src="<c:url value="/resources/images/album/albumPuppy.jpg" />" alt="이미지 설명">
									    </div>
										  <div class="album-content">
										   	<!--임시글 -->
												벌써 1년<br />
												너와 함께 한 지난 세월이 무색하구나
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
								  		<a href="#" class="album-under-left">스크랩하기</a>
								  		<a href="#" class="album-under-right">이동</a>
								  		<a href="#" class="album-under-right">수정</a>
								  		<a href="#" class="album-under-right">삭제</a>
								  	</div>
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
						<div class="menu-content-clicked">
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
	</div>
	<script src="../../../../resources/js/default.js"></script>
	<script>
	  document.getElementById('btnUpload').addEventListener('click', function() {
	    window.location.href = '/mnHome/albumWrite';
	  });
	</script>
</body>
</html>
