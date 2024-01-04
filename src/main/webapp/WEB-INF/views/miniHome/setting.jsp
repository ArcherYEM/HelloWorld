<!-- views/miniHome/main -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizable:no">
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
						<div class="box content-box set-line">
						
							<div class="divForTable">
								<div class="setting-myMinimi">
									<div class="setting-myMinimi-view">
										 <img src="../../../../${sessionScope.userMinimi}" class="settting-myMinimi-circle">
									</div>
									<div class="setting-myMinimi-Edit">
										<a class="setting-myMinimi-change" onclick="MinimiChange()">대표미니미 변경</a>
									</div>
								</div>
								
								<div class="set-info-group">
									<div class="set-info">
										<div class="set-info-title">
											프로필
										</div>
										<div class="set-info-db">
											<div class="set-info-name">
												<div class="set-info-name-left">
													<span>&#128394;</span> 이름
												</div>
												<div class="set-info-name-right" id="set-UserName">
													${sessionScope.userId.userName }
												</div>
												<div class="set-info-name-a">
													<a 
													  onclick="openNewWindowMyProfileEdit()">수정
													</a>
												</div>
											</div>
											<div class="set-info-Nickname">
												<div class="set-info-Nickname-left">
													<span>&#128364;</span>닉네임
												</div>
												<div class="set-info-Nickname-right" id="set-UserNickname">
													${sessionScope.userId.userNickname }
												</div>
												<div class="set-info-Nickname-a">
													<a 
													  onclick="openNewWindowMyProfileEdit()">수정
													</a>
												</div>
											</div>		
											<div class="set-info-phone">
												<div class="set-info-phone-left">
													<span>&#128382;</span> 연락처
												</div>
												<div class="set-info-phone-right" id="set-UserPhone">
													${sessionScope.userId.userPhone }
												</div>
												<div class="set-info-phone-a">
													<a 
													  onclick="openNewWindowMyProfileEdit()">수정
													</a>
												</div>
											</div>
											<div class="set-info-date">
												<div class="set-info-date-left">
													<span>&#128464;</span> 가입일
												</div>
												<div class="set-info-date-right" id="set-UserDate">
													${sessionScope.userId.createDate }
												</div>
												<div class="set-info-date-a">
													<a 
													  onclick="openNewWindowMyProfileEdit()">수정
													</a>
												</div>
											</div>
										</div>
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
	</div>
	<script>
	    // 대표 미니미 수정창
	    function MinimiChange() {
	        var windowSettings = 'width=460, height=570, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50';
	        openNewWindow('/mnHome/mnhMinimiChangeView', windowSettings);
	    }
	    
	    // 개인정보 수정창
	    function openNewWindowMyProfileEdit() {
	        var windowSettings = 'width=400, height=200, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=300, top=250';
	        openNewWindow('/mnHome/settingInfoEditView', windowSettings);
	    }
	    
	    function openNewWindow(url, settings) {
	        window.open(url, '_blank', settings);
	    }
	</script>

</body>
</html>
