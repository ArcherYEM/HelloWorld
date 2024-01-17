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
							TODAY&nbsp;<span class="today-span">${todayCnt }</span>&nbsp;| TOTAL ${totalCnt }
						</div>
						<div class="box profile-box">
							<div class="setting-folder-group">
								<div>
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">개인정보</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-list" id="spanSetting" data-setting="/mnHome/settingView/${userNickname }">개인정보변경</span></a></li>
								  </ul>
								  
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">미니홈피관리</span>
								  <ul class="tree">
								    <li><a><span class="setting-menu-list" id="spanSettingBgm" data-bgm="/mnHome/settingBgm/${userNickname }">BGM설정</span></a></li>
								    <li><a><span class="setting-menu-list" id="spanSettingMenu" data-menu="/mnHome/settingMenu/${userNickname }">메뉴탭설정</span></a></li>
								    <li><a><span class="setting-menu-list" id="spanSettingSkin" data-skin="/mnHome/settingSkin/${userNickname }">스킨설정</span></a></li>
								  </ul>
								 
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">아이템/내역관리</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-list" id="spanSettingDotoriU" data-dotoriU="/mnHome/settingDotoriUse/${userNickname }">도토리 사용내역</span></a></li>
									<li><a><span class="setting-menu-list" id="spanSettingDotoriC" data-dotoriC="/mnHome/settingDotoriCharge/${userNickname }">도토리 구매내역</span></a></li>
								  </ul>
								  
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">인맥관리</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-list" id="spanSettingFriends" data-friends="/mnHome/settingFriends/${userNickname }">일촌현황</span></a></li>
								  </ul>
								</div>
							</div>
							<div class="setting-devide-dot">---------------------------------</div>
							<div class="font-kyobohand">
								<c:if test="${userGender eq 'M'}">
		                        	${userName }&#128102
								</c:if>
								<c:if test="${userGender eq 'F'}">
		                        	${userName }&#128103
								</c:if>
							</div>
							<div class="profile-dropDown">
								<select id="friendSelect" onchange="redirectToMainView()">
		                           <option value="" disabled selected hidden="">파도타기</option>
								    <c:forEach var="friend" items="${friend}" varStatus="status">
								        <option value="${friend.Name}">${friend.Name}(${friend.userEmail})</option>
								    </c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="content-container">
						<div class="header content-title">
							<div id="divHomeTitle" class="content-title-name">${title }</div>
							 <input id="newTitle" class="content-title-name"  type="hidden" value="${title }">
							 <input id="hiddenUserNickname" type="hidden" value="${userNickname }">
							 <c:if test="${sessionScope.userId.userNickname eq userNickname }">
									<div>
										<input type="button" id="btn-title-edit" class="btn-edit" value="수정">
										<input type="hidden" id="btn-title-save"class="btn-edit" value="저장">
									</div>
							</c:if>
							<div class="content-title-url">
								https://www.helloworld.com/minihome/${userNickname }
							</div>
						</div>
						<div class="box content-box set-line">
						
							<div class="divForTable">
								<div class="setting-myMinimi">
									<div class="setting-myMinimi-view">
										<div class="set-mnm-circle-frame">
											 <img src="../../../../${sessionScope.userMinimi}" class="settting-myMinimi-circle">
										 </div>
									</div>
									<div class="setting-myMinimi-Edit">
										<a class="setting-myMinimi-change" onclick="MinimiChange()">대표미니미 변경</a>
									</div>
								</div>
								<input type="hidden" id="userNickname" value=${userNickname }>
								<input type="hidden" id="userEmail" value=${sessionScope.userEmail }>
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
												<textarea class="textInfo" id="set-UserName" readonly>${userName}</textarea>
												<div class="set-info-name-a" onclick="changeName()">
													수정
												</div>
											</div>
											<div class="set-info-Nickname">
												<div class="set-info-Nickname-left">
													<span>&#128364;</span>닉네임
												</div>
												<textarea class="textInfo" id="set-UserNickname" readonly>${userNickname }</textarea>
												<div class="set-info-Nickname-a" onclick ="changeNickname()">
													수정
												</div>
											</div>		
											<div class="set-info-phone">
												<div class="set-info-phone-left">
													<span>&#128382;</span> 연락처
												</div>
												<textarea class="textInfo" id="set-UserPhone" readonly>${sessionScope.userId.userPhone }</textarea>
												<div class="set-info-phone-a" onclick="changeNumber()">
													수정
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
													<!-- <a 
													  onclick="openNewWindowMyProfileEdit()">수정
													</a> -->
												</div>
											</div>
										</div>
									</div>				
								</div>
							
							</div>
						</div>
					</div>
					
					<jsp:include page="/WEB-INF/views/miniHome/menuTab.jsp"></jsp:include>
					
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
