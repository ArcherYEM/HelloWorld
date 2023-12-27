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
<link rel="stylesheet" href="../../../../resources/css/minihome/board.css" />
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
							TODAY&nbsp;<span class="today-span">404</span>&nbsp;| TOTAL 500
						</div>
						<div class="box profile-box">
								<div class="album-folder-group">
									<div class="album-folder">
										<img src="/resources/images/icon/minihome/openFolderIcon.png">
										<a href="#">전체보기</a><br/>
									</div>
									<div class="album-folder">
										<img src="/resources/images/icon/minihome/closeFolderIcon.png">
										<a href="#">일상생활</a><br/>
									</div>
									<div class="album-folder">
										<img src="/resources/images/icon/minihome/closeFolderIcon.png">
										<a href="#">개발 이야기</a><br/>
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
						
						<div class="board-container">
							<table class="board-table">
								<thead>
									<tr>
										<th class="th-checkbox"><input type="checkbox" id="checkbox-all" onclick="selectAll()"></th>
										<th class="th-title">제목</th>
										<th class="th-writer">작성자</th>
										<th class="th-view">조회</th>
									</tr>
								</thead>							
								<tbody>							
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">[스크랩]너는 내 운명<img src="../../../../resources/images/icon/minihome/newIcon.png" class="newIcon"></td>
										<td class="td-writer">채승원</td>
										<td class="td-view">21</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">테스트용 게시물</td>
										<td class="td-writer">채승원</td>
										<td class="td-view">12</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">Board Test</td>
										<td class="td-writer">이진우</td>
										<td class="td-view">33</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">댓글이 달린 게시글[15]</td>
										<td class="td-writer">양은모</td>
										<td class="td-view">121</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">이미지가 달린 게시글</td>
										<td class="td-writer">이정은</td>
										<td class="td-view">46</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">댓글이 달린 게시글 <span class="comment">[15]</span></td>
										<td class="td-writer">양은모</td>
										<td class="td-view">121</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">이미지가 달린 게시글 <img src="../../../../resources/images/icon/minihome/photoIcon.png" class="photoIcon"></td>
										<td class="td-writer">이정은</td>
										<td class="td-view">46</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">소환사의 협곡에 오신것을 환영합니다</td>
										<td class="td-writer">라이엇 게임즈</td>
										<td class="td-view">863</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">미리 메리크리스마스</td>
										<td class="td-writer">아이유</td>
										<td class="td-view">9513</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">Board Test</td>
										<td class="td-writer">이진우</td>
										<td class="td-view">33</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">Board Test</td>
										<td class="td-writer">이진우</td>
										<td class="td-view">33</td>
									</tr>								
								</tbody>						
							</table>	
							<div class="board-btn">
								<input type="button" value="이동">
								<input type="button" value="삭제">
								<input type="button" value="등록" onclick="location.href='/miniHome/boardWriteView'">
							</div>	
							<div class="board-pages">
								<span class="board-page">| 1</span>
								<span class="board-page">| 2</span>
								<span class="board-page">| 3</span>
								<span class="board-page">| 4</span>
								<span class="board-page">| 5</span>
								<span class="board-page">| 6</span>
								<span class="board-page">| 7</span>
								<span class="board-page">| 8</span>
								<span class="board-page">| 9</span>
								<span class="board-page">| 10</span>
								<span class="board-page">| >></span>
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
						<div class="menu-content">
							<a href="/mnHome/albumView">사진첩</a>
						</div>
						<div class="menu-content-clicked">
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
