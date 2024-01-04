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
								  <span class="setting-menu-title">개인정보</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-title" id="spanSetting" data-setting="/mnHome/settingView">개인정보변경</span></a></li>
								  </ul>
								  
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">미니홈피관리</span>
								  <ul class="tree">
								    <li><a><span class="setting-menu-title" id="spanSettingBgm" data-bgm="/mnHome/settingBgm">BGM설정</span></a></li>
								    <li><a><span class="setting-menu-title" id="spanSettingMenu" data-menu="/mnHome/settingMenu">메뉴탭설정</span></a></li>
								    <li><a><span class="setting-menu-title" id="spanSettingSkin" data-skin="/mnHome/settingSkin">스킨설정</span></a></li>
								  </ul>
								 
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">아이템/내역관리</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-title" id="spanSettingDotoriU" data-dotoriU="/mnHome/settingDotoriUse">도토리 사용내역</span></a></li>
									<li><a><span class="setting-menu-title" id="spanSettingDotoriC" data-dotoriC="/mnHome/settingDotoriCharge">도토리 구매내역</span></a></li>
								  </ul>
								  
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">인맥관리</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-title" id="spanSettingFriends" data-friends="/mnHome/settingFriends">일촌현황</span></a></li>
								  </ul>
								</div>
							</div>
								<div class="setting-devide-dot">---------------------------------</div>
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
						
							<div class="setting-bgm-frame">
							
							<div class="setting-menuTitle">현재 재생목록</div>
		
							
							
							<div class="setting-bgm-list-group setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>순번</div>
								<div>제목</div>
								<div>아티스트</div>
								<div>재생시간</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>1</div>
								<div>Super Star</div>
								<div>쥬얼리</div>
								<div>03:18</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>2</div>
								<div>죽을만큼 아파서</div>
								<div>mc몽</div>
								<div>03:38</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>3</div>
								<div>거짓말</div>
								<div>빅뱅</div>
								<div>03:58</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>4</div>
								<div>Tell me</div>
								<div>원더걸스</div>
								<div>04:10</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>5</div>
								<div>Gee</div>
								<div>소녀시대</div>
								<div>03:11</div>
								
							</div>
							
							
							<div class="setting-bgm-list-delete">
								<input type="button" value="삭제">
							</div>
							
						</div>
						
							<div id="setting-divDivideLine"></div>
							
							<div class="setting-bgm-frame setting-bgm-myList">
							
							<div class="setting-menuTitle">보유 BGM</div>
		
							<div class="setting-bgm-search-group">
								<input type="text" class="setting-bgm-search-input" placeholder="제목 혹은 가수명을 입력하세요" maxlength="18">
								<button class="setting-bgm-search-btn"></button> <!-- 돋보기 아이콘 css 처리 -->
								
							</div>
							
							<div class="setting-bgm-order-select">
									<select>
										<option>최근구매순</option>
										<option>제목오름차순</option>
										<option>가수오름차순</option>
									</select>
							</div>
							
							
							<div class="setting-bgm-list-group setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>순번</div>
								<div>제목</div>
								<div>아티스트</div>
								<div>재생시간</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>1</div>
								<div>Super Star</div>
								<div>쥬얼리</div>
								<div>03:18</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>2</div>
								<div>죽을만큼 아파서</div>
								<div>mc몽</div>
								<div>03:38</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>3</div>
								<div>거짓말</div>
								<div>빅뱅</div>
								<div>03:58</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>4</div>
								<div>Tell me</div>
								<div>원더걸스</div>
								<div>04:10</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>5</div>
								<div>Gee</div>
								<div>소녀시대</div>
								<div>03:11</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>6</div>
								<div>U</div>
								<div>슈퍼주니어</div>
								<div>04:11</div>
								
							</div>
							<div class="setting-bgm-list setting-bgm-grid">
								<div><input type="checkbox"></div>
								<div>7</div>
								<div>슬픈다짐</div>
								<div>다빈치</div>
								<div>03:17</div>
								
							</div>
							
							<div class="setting-bgm-list-add">
								<input type="button" value="재생목록추가">
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
	</div>
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
