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
<link rel="stylesheet" href="../../../../resources/css/board.css" />
<link rel="stylesheet" href="../../../../resources/css/audio.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
<script type="text/javascript" src="../../../../resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
					
					<div class="board-outer-container">
						<div class="board-inner-container">
							<div class="board-detail-left">
								<span class="board-detail-title">  크리스마스</span>
							</div>
							<div class="board-detail-right">
								<button id="btnBoardView">목록</button>
								<button id="btnBoardUpdate">수정</button>
							</div>
						</div>
					</div>
					<div class="board-write-container">
						<span class="board-writer">  채승원(작성자)</span>
						<span class="board-write-date">2023.12.10 14:21</span>						
					</div>
					<div class="board-content-container">
						<p class="board-detail-content">
							첫번째 테스트 공지사항 글 내용부분 일단 p태그 사용하고 나중에 list로 가져와야함
						</p>
					</div>
					<div class="board-comment-container">
						<div class="board-comment">
							<span class="board-comment-writer">
								이진우
							</span>
							<span class="board-comment-content">
								성공하면 혁명 실패하면 반역 아닙니까
							</span>
							<span class="board-comment-date">
								(2023.12.24 13:25)
							</span>
						</div>
						<div class="board-comment">
							<span class="board-comment-writer">
								양은모
							</span>
							<span class="board-comment-content">
								신나는 코딩
							</span>
							<span class="board-comment-date">
								(2023.12.24 15:20)
							</span>
						</div>
						<div class="board-comment">
							<span class="board-comment-writer">
								채승원
							</span>
							<span class="board-comment-content">
								롤하고 싶다.
							</span>
							<span class="board-comment-date">
								(2023.12.24 20:15)
							</span>
						</div>
						<div class="board-comment-write">
							<span>
								댓글
							</span>
							<input type="text" class="comment-content-write">
							<input type="button" value="확인">
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
	<script src="../../../../resources/js/default.js"></script>
	<script>
		var checkboxAll=document.getElementById('checkbox-all');
	
		function selectAll() {
		  var checkboxes = document.querySelectorAll('.td-checkbox input[type="checkbox"]');
		  var allChecked = checkboxAll.checked;

		  checkboxes.forEach(function(checkbox) {
		    checkbox.checked = allChecked;
		  });
		}
		
		document.getElementById('btnBoardView').addEventListener('click', function() {
			location.href = '/miniHome/board';
		});
	</script>
	<script id="smartEditor" type="text/javascript"> 
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
			    oAppRef: oEditors,
			    elPlaceHolder: "txtContent",  //textarea ID 입력
			    sSkinURI: "../../../../resources/smarteditor/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
			    fCreator: "createSEditor2",
			    htParams : { 
			    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
			        bUseToolbar : true, 
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseVerticalResizer : false, 
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
				bUseModeChanger : false 
			    }
			});
	</script>
	
</body>
</html>