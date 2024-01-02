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
<link rel="stylesheet" href="../../../../resources/css/minihome/miniroom.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
	<div id="test"></div>
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
								<c:set var="imagePath" value="/resources/images/${image}" />
								<img class="profile-image-img" src="/../../../../resources/images/download/${image}" alt="프로필 이미지" />
							</div>
							<div class="profile-dot">---------------------------------</div>
							<div class="profile-text font-kyobohand">
								<c:out value="${msg}" escapeXml="false"/>
							</div>
							<div class="profile-history">
								<a 
								  class="profile-edit" 
								  onclick="openNewWindowMinihomeProfileEdit()">Edit
								</a>
								<a
								  class="profile-hs"
								  onclick="openNewWindowMiniroomHistory()">History								
								</a>
							</div>
							<div class="profile-dot">---------------------------------</div>
							<div class="profile-username font-kyobohand"> ${sessionScope.userId.userName }&#128698;</div>
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
								https://www.helloworld.com/minihome/leejubin</div>
						</div>
						<div class="box content-box">
							<div class="box-title">
								Updated news <span class="box-title2">TODAY STORY</span>
							</div>
							<div class="news-flex-box">
								<div class="news-box">
									<div class="news-row">
										<div class="news-category category-post">게시판</div>
										<div class="news-title">
											<a href="/mnHome/boardView">HTML, CSS, JAVASCRIPT</a>
										</div>
									</div>
									<div class="news-row">
										<div class="news-category category-pic">사진첩</div>
										<div class="news-title">
											<a href="/mnHome/albumView">2023을 보내며...</a>
										</div>
									</div>
									<div class="news-row">
										<div class="news-category category-post">게시판</div>
										<div class="news-title">
											<a href="/mnHome/boardView">스프링이란 무엇인가</a>
										</div>
									</div>
									<div class="news-row">
										<div class="news-category category-post">게시판</div>
										<div class="news-title">
											<a href="/mnHome/boardView">Maven 과 Gradle 의 차이</a>
										</div>
									</div>
								</div>
								<div class="update-box">
									<div class="menu-row">
										<div class="menu-item">
											<a href="/mnHome/diaryView">다이어리<span class="menu-num">0/51</span></a>
										</div>
										<div class="menu-item">
											<a href="/mnHome/albumView">사진첩<span class="menu-num">1/88</span></a>
											<img src="../../../../resources/images/minihome/newIcon.png"
												alt="new Icon" class="minihome-nIcon">
										</div>
									</div>
									<div class="menu-row">
										<div class="menu-item">
											<a href="/mnHome/boardView">게시판<span class="menu-num">3/17</span></a>
											<img src="../../../../resources/images/minihome/newIcon.png"
												alt="new Icon" class="minihome-nIcon">
										</div>
										<div class="menu-item">
											<a href="/mnHome/visitView">방명록<span class="menu-num">25/500</span></a>
											<img src="../../../../resources/images/minihome/newIcon.png"
												alt="new Icon" class="minihome-nIcon">
										</div>
									</div>
								</div>
							</div>
							<div class="miniroom">
								<div>
									<span class="box-title miniroom-title">Miniroom</span>
									<a 
									  class="mnh-Edit" 
									  onclick="openNewWindowMiniroomEdit()">미니룸 설정
									</a>
								</div>
								<div class="miniroom-gif-box">
									<div class="miniroom-canvas" style="background-image:url('../../../..${background.backgroundPath}')">
									
										<c:forEach var = "minimi" items="${minimiList}">
											<img class="miniroom-minimi" src="../../../..${minimi.minimiPath}" style="left:${minimi.minimiLeft}; top:${minimi.minimiTop}"/>
										</c:forEach>
									</div>
								</div>
							</div>
							<br>
							<div class="main-cmt">
								<div class="main-cmt-write">
									일촌평 <input type="text" class="main-cmt-input">
									<button type="submit" value="확인">확인</button>
								</div>
								<div class="main-cmt-content">
									<ul>
										<li>GIF Anti-Aliasing 은 안하는게 더 고전적인 느낌을 주는거같아요 <span
											class="main-cmt-info"><a href="#">(이정은)</a> 2023.12.05</span>
										</li>
										<li>JSP 파일만 30개가 넘는다면서요?ㅋㅋ <span class="main-cmt-info"><a
												href="#">(채승원)</a> 2023.12.05</span>
										</li>
										<li>Git 으로 형상관리 하고계시죠? <span class="main-cmt-info"><a
												href="#">(이진우)</a> 2023.12.05</span>
										</li>
										<li>AWS 로 DB Server 풀 가동 하시는거죠? <span
											class="main-cmt-info"><a href="#">(양은모)</a> 2023.12.05</span>
										</li>
										<li>뭐라고요? 이주빈은 @Bean 을 2주동안 만들어서 이주빈이라고요? <span
											class="main-cmt-info"><a href="#">(금민재)</a> 2023.12.05</span>
										</li>
									</ul>
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
	
	<script src="../../../../resources/js/default.js"></script>
	<script src="<c:url value='/resources/js/ajaxTab.js'/>"></script>
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
	<script>
		// 미니룸 수정창
		function openNewWindowMiniroomEdit() {
		  var windowSettings = 'width=800, height=600, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50';
		  openNewWindow('/mnHome/miniroomEditView', windowSettings);
		}
		
		function openNewWindowMiniroomHistory() {
			  var windowSettings = 'width=800, height=600, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50';
			  openNewWindow('/mnHome/miniroomHistoryView', windowSettings);
			}
		
		function openNewWindow(url, settings) {
		  window.open(url, '_blank', settings);
		}
	</script>
	<script>
		// 대표 미니미 수정창 (setting page)
		function MinimiChange() {
		  var windowSettings = 'width=460, height=570, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50';
		  openNewWindow('/mnHome/mnhMinimiChangeView', windowSettings);
		}
		
		function openNewWindow(url, settings) {
		  window.open(url, '_blank', settings);
		}
	</script>
	
</body>
</html>

