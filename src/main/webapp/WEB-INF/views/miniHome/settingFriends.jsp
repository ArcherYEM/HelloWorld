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
<link rel="stylesheet" href="../../../../resources/css/minihome/settingFriends.css" />
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
						<!-- 시점 -->
						<!-- 
						일촌친구 / 요청대기 / 수락대기
						 -->
						<div class="set-frd-frame">
							<div class="set-frd-search-frame">
									<div class="set-frd-search-title KyoboHand">
										친구찾기
									</div>
									<div class="set-frd-search">
										<input type="text" class="set-frd-search-input" id="searchInput" onkeyup="search()"placeholder="닉네임을 입력하세요" maxlength="18" autofocus>
										<input type="button" class="set-frd-search-btn" value="찾기">
									</div>
								<div class="set-frd-search-place">
									결과값 출력란
								</div>
							</div>
							<div class="set-frd-mid">
								<div class="set-frd-mid-btn">
								    <div class="set-frd-mid-bf">
								        <input type="button" class="set-frd-mid-bf-ipt" value="일촌친구" onclick="showFriendType('friend');">
								    </div>
								    <div class="set-frd-mid-request">
								        <input type="button" class="set-frd-mid-req-ipt" value="요청대기" onclick="showFriendType('request');">
								    </div>
								    <div class="set-frd-mid-accept">
								        <input type="button" class="set-frd-act-bf-ipt" value="수락대기" onclick="showFriendType('accept');">
								    </div>
								    <div class="set-frd-mid-search">
								    	<input type="text" class="set-frd-mid-input" placeholder="닉네임을 입력하세요" />
										<input type="button" value="찾기">
									</div>
								</div>
							
								<div class="set-frd-mid-bg">
									<div class="set-frd-bf-list">
										<table class="set-frd-bf-table">
									        <tr>
									            <td>강동원</td>
									            <td>동0</td>
									            <td>2008-05-01</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" onclick="confirmUnfriend()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>김태희</td>
									            <td>대Hee</td>
									            <td>2010-10-10</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" onclick="confirmUnfriend()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>문근영</td>
									            <td>달근0</td>
									            <td>2010-09-09</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" onclick="confirmUnfriend()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>양은모</td>
									            <td>Devyem</td>
									            <td>2023-08-30</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" onclick="confirmUnfriend()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>유승호</td>
									            <td>너는승호다</td>
									            <td>2011-11-11</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" onclick="confirmUnfriend()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>이정은</td>
									            <td>리정</td>
									            <td>2024-01-01</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" onclick="confirmUnfriend()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>이진우</td>
									            <td>지누짱</td>
									            <td>2023-10-30</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" onclick="confirmUnfriend()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>장나라</td>
									            <td>LongCountry</td>
									            <td>2006-06-01</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" onclick="confirmUnfriend()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>채승원</td>
									            <td>채피티</td>
									            <td>2013-01-09</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" onclick="confirmUnfriend()"/>
									            </td>
									        </tr>
									    </table>
									</div>
									<div class="set-frd-bf-request">
										<table class="set-frd-bf-table">
									        <tr>
									            <td>민경훈</td>
									            <td>민무늬토기</td>
									            <td>2023-10-31</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="취소하기" onclick="confirmCancle()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>이영애</td>
									            <td>20love</td>
									            <td>2006-02-01</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="취소하기" onclick="confirmCancle()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>김범수</td>
									            <td>KBS방송국</td>
									            <td>2013-11-09</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="취소끊기" onclick="confirmCancle()"/>
									            </td>
									        </tr>
									    </table>
									</div>
									<div class="set-frd-bf-accept">
										<table class="set-frd-bf-table">
									        <tr>
									            <td>이효리</td>
									            <td>2효2</td>
									            <td>2007-10-31</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="거절하기" onclick="confirmNope()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>김건모</td>
									            <td>김이마른모자</td>
									            <td>2006-04-01</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="거절하기" onclick="confirmNope()"/>
									            </td>
									        </tr>
									        <tr>
									            <td>손담비</td>
									            <td>토요일밤은일요일새벽</td>
									            <td>2013-11-19</td>
									            <td>
									            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
									            	<input type="button" class="set-frd-bf-tb-input" value="거절하기" onclick="confirmNope()"/>
									            </td>
									        </tr>
									    </table>
									</div>
								</div>
							</div>
						</div>
						<!-- 종점 -->	
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
		// 탭 화면 변경하기
		function showFriendType(type) {
		    var friendDiv = document.querySelector('.set-frd-bf-list');
		    var requestDiv = document.querySelector('.set-frd-bf-request');
		    var acceptDiv = document.querySelector('.set-frd-bf-accept');
		
		    if (type === 'friend') {
		        friendDiv.style.display = 'block';
		        requestDiv.style.display = 'none';
		        acceptDiv.style.display = 'none';
		    } else if (type === 'request') {
		        friendDiv.style.display = 'none';
		        requestDiv.style.display = 'block';
		        acceptDiv.style.display = 'none';
		    } else if (type === 'accept') {
		        friendDiv.style.display = 'none';
		        requestDiv.style.display = 'none';
		        acceptDiv.style.display = 'block';
		    }
		}
	</script>
	<script>
	// 일촌거절 확인
	function confirmUnfriend() {
	    var confirmResult = confirm("정말로 친구분이랑 절교하시겠습니까?");
	    
	    if (confirmResult) {
	        // 사용자가 확인(OK) 버튼을 클릭한 경우, 일촌을 끊는 작업을 수행합니다.
	        // 예를 들어, 서버로 일촌 끊기 요청을 보내거나, 특정 URL로 리다이렉션할 수 있습니다.
	        // 예시: window.location.href = "/unfriendAction"; 
	    } 
	}
	
	function confirmCancle() {
	    var confirmResult = confirm("일촌신청을 취소할까요?");
	    
	    if (confirmResult) {
	        // 사용자가 확인(OK) 버튼을 클릭한 경우, 일촌을 끊는 작업을 수행합니다.
	        // 예를 들어, 서버로 일촌 끊기 요청을 보내거나, 특정 URL로 리다이렉션할 수 있습니다.
	        // 예시: window.location.href = "/unfriendAction"; 
	    }
	}
	
	function confirmNope() {
	    var confirmResult = confirm("일촌신청을 거절할까요?");
	    
	    if (confirmResult) {
	        // 사용자가 확인(OK) 버튼을 클릭한 경우, 일촌을 끊는 작업을 수행합니다.
	        // 예를 들어, 서버로 일촌 끊기 요청을 보내거나, 특정 URL로 리다이렉션할 수 있습니다.
	        // 예시: window.location.href = "/unfriendAction"; 
	    }
	}
	
	</script>
</body>
</html>
