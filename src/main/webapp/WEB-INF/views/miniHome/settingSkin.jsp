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
<link rel="stylesheet" href="../../../../resources/css/minihome/settingSkin.css" />
<script type="text/javascript" src="../../../../resources/js/settingSkin.js"></script>
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
							<div class="set-skin-frame">
							
								<div class="set-skin-selected">
									<div class="set-skin-selected-span">
										<span>적용중인 스킨</span>
									</div>
									<div class="set-skin-selected-skin" id="skin-item-color-select"
									     style="width: 90px;
									            height: 40px;
									            margin-bottom: 10px;
									            border: 5px solid black;
									            border-radius: 5px;
									            background-color:
								            <c:forEach var="onSkin" items="${onSkin}">
  												 <c:choose>
										        <c:when test="${onSkin.productName == 'red'}">red</c:when>
										        <c:when test="${onSkin.productName == 'yellow'}">yellow</c:when>
										        <c:when test="${onSkin.productName == 'black'}">black</c:when>
										        <c:when test="${onSkin.productName == 'blue'}">blue</c:when>
										        <c:when test="${onSkin.productName == 'purple'}">purple</c:when>
										        <c:when test="${onSkin.productName == 'white'}">white</c:when>
										        <c:when test="${onSkin.productName == 'green'}">green</c:when>
										        <c:when test="${onSkin.productName == 'lime'}">lime</c:when>
										        <c:when test="${onSkin.productName == 'gray'}">gray</c:when>
										        <c:otherwise>orange</c:otherwise>
										    </c:choose>
										</c:forEach>;">
									</div>
								</div>
								
								<div class="set-skin-having">
								    <div class="set-skin-p">
								        <p>보유중인 스킨</p>
								    </div>
								    <div class="set-skin-list">
										<c:forEach var="skinItem" items="${skinMap}">
											<div class="skin-item-group" id="skin-item-group-select">
												<div class="skin-item-color" id="skin-item-color-select" 
												data-user-nickname="${skinItem.userNickname}"
												data-category="${skinItem.category}"
												data-product-name="${skinItem.productName}"
												onclick="logClick()" 
												style="
											       width: 90px;
											       height: 40px;
											       margin-bottom: 10px;
											       border: 5px solid black;
	    										   border-radius: 5px;	
											       background-color: 
													<c:choose>
						                                <c:when test="${skinItem.productName == 'red'}">red</c:when>
						                                <c:when test="${skinItem.productName == 'yellow'}">yellow</c:when>
						                                <c:when test="${skinItem.productName == 'black'}">black</c:when>
						                                <c:when test="${skinItem.productName == 'blue'}">blue</c:when>
						                                <c:when test="${skinItem.productName == 'purple'}">purple</c:when>
						                                <c:when test="${skinItem.productName == 'white'}">white</c:when>
						                                <c:when test="${skinItem.productName == 'green'}">green</c:when>
						                                <c:when test="${skinItem.productName == 'lime'}">lime</c:when>
						                                <c:when test="${skinItem.productName == 'gray'}">gray</c:when>
						                            </c:choose>;
											       " >
										   </div>
										   <div class="skin-item-name">${skinItem.productName}</div>
										   </div>
										</c:forEach>
									</div>
								</div>
								
								<form action="/mnHome/settingSkin/skinChoice" >
									<div class="set-skin-btn">
										<input type="hidden" name="selectedProductName" id="selectedProductName" class="set-skin-select" />
										<input type="hidden" name="selectedCategory" id="selectedCategory" class="set-skin-select"/>
										<input type="hidden" name="nickname" id="nickname" class="set-skin-select"/>
										<input type="submit" class="set-skin-select apply-button" value="적용" />
									</div>
								</form>
								
							</div>
						</div>
						
					</div>
					
					<div class="menu-container">
					    <div class="menu-content" data-tab="<c:url value='/mnHome/mainView/${userNickname }'/>">
					        <a href="#">홈</a>
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
					    <c:if test="${sessionScope.userId.userNickname eq userNickname }">
						    <div class="menu-content" data-tab="<c:url value='/mnHome/settingView/${userNickname }'/>">
						        <a href="#">관리</a>
						    </div>		
						</c:if>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
