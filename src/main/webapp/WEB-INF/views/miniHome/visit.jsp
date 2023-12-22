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
<link rel="stylesheet" href="../../../../resources/css/visit.css" />
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
							안녕하세요 이주빈 입니다.<br />
							미모최강 풀스택 개발자 입니다.
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
