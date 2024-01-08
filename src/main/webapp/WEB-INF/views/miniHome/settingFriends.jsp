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
									<li><a><span class="setting-menu-title" id="spanSetting" data-setting="/mnHome/settingView/${userNickname }">개인정보변경</span></a></li>
								  </ul>
								  
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">미니홈피관리</span>
								  <ul class="tree">
								    <li><a><span class="setting-menu-title" id="spanSettingBgm" data-bgm="/mnHome/settingBgm/${userNickname }">BGM설정</span></a></li>
								    <li><a><span class="setting-menu-title" id="spanSettingMenu" data-menu="/mnHome/settingMenu/${userNickname }">메뉴탭설정</span></a></li>
								    <li><a><span class="setting-menu-title" id="spanSettingSkin" data-skin="/mnHome/settingSkin/${userNickname }">스킨설정</span></a></li>
								  </ul>
								 
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">아이템/내역관리</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-title" id="spanSettingDotoriU" data-dotoriU="/mnHome/settingDotoriUse/${userNickname }">도토리 사용내역</span></a></li>
									<li><a><span class="setting-menu-title" id="spanSettingDotoriC" data-dotoriC="/mnHome/settingDotoriCharge/${userNickname }">도토리 구매내역</span></a></li>
								  </ul>
								  
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">인맥관리</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-title" id="spanSettingFriends" data-friends="/mnHome/settingFriends/${userNickname }">일촌현황</span></a></li>
								  </ul>
								</div>
							</div>
								<div class="devide-dot">---------------------------------</div>
								<div class="font-kyobohand setting-profile-username">${sessionScope.userId.userName }&#128698;</div>
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
										<input type="text" class="set-frd-search-input" id="searchInput" placeholder="닉네임을 입력하세요" maxlength="18" autofocus>
										<input type="button" id="btnSearchUser" class="set-frd-search-btn" value="찾기" onclick=searchUser()>
									</div>
								<div id="searchResult" class="set-frd-search-place popup">
								  
								</div>
							</div>
							<div class="set-frd-mid">
								<div class="set-frd-mid-btn">
								    <div class="set-frd-mid-bf">
								        <input type="button" class="set-frd-mid-bf-ipt" value="나의일촌" onclick="showFriendType('friend');">
								    </div>
								    <div class="set-frd-mid-request">
								        <input type="button" class="set-frd-mid-req-ipt" value="받은신청" onclick="showFriendType('request');">
								    </div>
								    <div class="set-frd-mid-accept">
								        <input type="button" class="set-frd-act-bf-ipt" value="신청목록" onclick="showFriendType('accept');">
								    </div>
								    <div class="set-frd-mid-search">
								    	<input type="text" class="set-frd-mid-input" placeholder="닉네임을 입력하세요" />
								    	
										<input type="button" value="찾기">
									</div>
								</div>
							
								<div class="set-frd-mid-bg">
									<div class="set-frd-bf-list">
										<c:if test="${empty bf}">
											 <span>아직 일촌이 없습니다.</span> 
										</c:if>
										<c:if test = " ${not empty bf}">										
											<table class="set-frd-bf-table">
												<c:forEach items="${bf}" var="bf">
													<tr>
														<c:if test="${bf.userNickname  eq userNickname}">
															<td>${bf.seq}</td>
												            <td>
												            	${friendNickname}
												            </td>
											            </c:if>
											            <c:if test="${bf.userNickname  ne userNickname}">
												            <td>
												            	${userNickname}
												            </td>
											            </c:if>
											            <td>userNickname</td>
											            <td>${bf.createDate}</td>
											            <td>
											            	<input type="button" class="set-frd-bf-tb-input" value="방문하기"/>
											            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" onclick="confirmUnfriend()"/>
											            </td>
										        	</tr>
												</c:forEach>
										    </table>
										</c:if>
									</div>
									<div class="set-frd-bf-request">
										<c:if test="${empty fRes}">
											 <span>앗! 아직 일촌 신청이 안왔어요.</span> 
										</c:if>
										<c:if test = "${not empty fRes}">
											<table class="set-frd-bf-table">
												
												 <c:forEach items="${fRes}" var="fRes">
													<tr>
														<td>${fRes.seq}</td>
														<c:if test="${fRes.userNickname  eq userNickname}">
												            <td>
												            	${fRes.friendNickname}
												            </td>
											            </c:if>
											            <c:if test="${fRes.userNickname  ne userNickname}">
												            <td>
												            	${fRes.userNickname}
												            </td>
											            </c:if>
											            <td>userNickname</td>
											            <td>${fRes.createDate}</td>
											            <td>
											            	<input type="hidden" value="${fRes.seq}" id="fSeq">
											            	<input type="button" class="set-frd-bf-tb-input" value="수락" onclick="accept()"/>
											            	<input type="button" class="set-frd-bf-tb-input" value="거절" onclick="confirmNope()"/>
											            </td>
										        	</tr>
												</c:forEach> 
										    </table>
										</c:if>
									</div> 
									<div class="set-frd-bf-accept">
										<c:if test="${empty fReq}">
											 <span>일촌 신청 목록이 없습니다.</span> 
										</c:if>
										<c:if test = "${not empty fReq}">
											<table class="set-frd-bf-table">
												<c:forEach items="${fReq}" var="fReq">
														<tr>
															<td>${fReq.seq}</td>
															<c:if test="${fReq.userNickname  eq userNickname}">
													            <td>
													            	${fReq.friendNickname}
													            </td>
												            </c:if>
												            <c:if test="${fReq.userNickname  ne userNickname}">
													            <td>
													            	${userNickname}
													            </td>
												            </c:if>
												            <td>userNickname</td>
												            <td>${fReq.createDate}</td>
												            <td>
												            	<input type="hidden" value="${fReq.seq}" id="fSeq">
												            	<input type="button" class="set-frd-bf-tb-input" value="취소" onclick="confirmCancle()"/>
												            </td>
											        	</tr>
												</c:forEach>
										        
										        
										    </table>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<!-- 종점 -->	
						</div>
					</div>
					
					<div class="menu-container">
					    <div class="menu-content-clicked">
					        <a href="<c:url value='/mnHome/mainView/${userNickname }'/>">홈</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/diaryView/${userNickname }'/>">
					        <a href="#">다이어리</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/albumView/${userNickname }'/>">
					        <a href="#">사진첩</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/boardView/${userNickname }'/>">
					        <a href="#">게시판</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/visitView/${userNickname }'/>">
					        <a href="#">방명록</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/settingView/${userNickname }'/>">
					        <a href="#">관리</a>
					    </div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
