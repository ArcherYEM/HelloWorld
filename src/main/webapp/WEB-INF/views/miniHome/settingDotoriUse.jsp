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
<link rel="stylesheet" href="../../../../resources/css/minihome/settingDotoriU.css" />
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
								<div class="setting-folder-group">
									<div>
									  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
									  <a href="<c:url value='/miniHome/setting'/>"><span class="setting-menu-title">개인정보변경</span></a><br>
									  
									  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
									  <span class="setting-menu-title">미니홈피관리</span>
									  
									  <ul class="tree">
									    <li><a href="<c:url value='/miniHome/settingBgm'/>">BGM설정</a></li>
									    <li><a href="<c:url value='/miniHome/settingMenu'/>">메뉴탭설정</a></li>
									    <li><a href="<c:url value='/miniHome/settingSkin'/>">스킨설정</a></li>
									  </ul>
									  
									 
									  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
									  <span class="setting-menu-title">아이템/내역관리</span>
									  <ul class="tree">
									    <li><a href="<c:url value='/miniHome/settingDotoriUse'/>">도토리 사용내역</a></li>
									    <li><a href="<c:url value='/miniHome/settingDotoriCharge'/>">도토리 충전내역</a></li>
									  </ul>
									  
									  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
									  <a href="<c:url value='/miniHome/settingFriends'/>"><span class="setting-menu-title">인맥관리</span></a>
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
						
							<div class="set-dtr-use-frame">
								<div class="set-dtr-use-title">
									전체 사용내역
								</div>
								<div class="set-dtr-use-list">
									<div class="set-dtr-use-list-header">
										<table class="set-dtr-use-list-table">
											<thead>
												<tr>
													<th>카데코리</th>
													<th>세부항목</th>
													<th>사용 도토리</th>
													<th>사용 일시</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>미니미</td>
													<td>주황 버섯</td>
													<td>50</td>
													<td>2023-12-31 09:01</td>
												</tr>
												<tr>
													<td>메뉴</td>
													<td>빨강</td>
													<td>100</td>
													<td>2024-01-01 11:11</td>
												</tr>
												<tr>
													<td>BGM</td>
													<td>Listen(비욘세)</td>
													<td>100</td>
													<td>2024-01-01 03:09</td>
												</tr>
											</tbody>
										</table>
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
	<script>
// 		전체선택 기능
		var checkboxAll=document.getElementById('checkbox-all');
	
		function selectAll() {
		  var checkboxes = document.querySelectorAll('.td-checkbox input[type="checkbox"]');
		  var allChecked = checkboxAll.checked;

		  checkboxes.forEach(function(checkbox) {
		    checkbox.checked = allChecked;
		  });
		}
		
		var titles = document.getElementsByClassName('td-title');

		for (var i = 0; i < titles.length; i++) {
		  titles[i].addEventListener('click', function() {
		    location.href = '/miniHome/boardDetail';
		  });
		}
	</script>
	
</body>
</html>
