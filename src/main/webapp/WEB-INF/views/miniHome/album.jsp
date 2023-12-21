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
		<div class="side-right">
			<audio controls autoplay>
				<source src="../../../../resources/sounds/OneDrink.mp3"
					type="audio/mp3">
			</audio>
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
			
		</script>
	</body>
</html>
