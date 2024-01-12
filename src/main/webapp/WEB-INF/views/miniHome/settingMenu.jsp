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
<link rel="stylesheet" href="../../../../resources/css/minihome/settingMenu.css" />
<script type="text/javascript" src="../../../../resources/js/settingMenu.js"></script>
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
								<div class="devide-dot">---------------------------------</div>
								<div class="font-kyobohand setting-profile-username">${sessionScope.userId.userName }&#128698;</div>
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
						
					<div class="box content-box">
						<div class="set-menu-frame">
						
							<div class="set-menu-selected">
								<div class="set-menu-selected-span">
									<span>적용중인 메뉴</span>
								</div>
								<div class="set-menu-selected-menu" id="menu-item-color-select"
									style="
								     		width: 200px;
								            height: 30px;
								            margin-bottom: 10px;
								            margin-right: 5px;
								            border: 2px solid black;
								            border-radius: 5px;
								            background-color:
										<c:forEach var="onMenu" items="${onMenu}">
  												 <c:choose>
										        <c:when test="${onMenu.productName == 'red'}">red</c:when>
										        <c:when test="${onMenu.productName == 'yellow'}">yellow</c:when>
										        <c:when test="${onMenu.productName == 'black'}">black</c:when>
										        <c:when test="${onMenu.productName == 'blue'}">blue</c:when>
										        <c:when test="${onMenu.productName == 'purple'}">purple</c:when>
										        <c:when test="${onMenu.productName == 'white'}">white</c:when>
										        <c:when test="${onMenu.productName == 'green'}">green</c:when>
										        <c:when test="${onMenu.productName == 'lime'}">lime</c:when>
										        <c:when test="${onMenu.productName == 'navy'}">navy</c:when>
										        <c:when test="${onMenu.productName == 'rgb(42, 140, 168)'}">rgb(42, 140, 168)</c:when>
										    </c:choose>
										</c:forEach>;">
								</div>
							</div>
							
							<div class="set-menu-having">
								<div class="set-menu-p">
									<p>보유중인 메뉴</p>
								</div>
									<div class="set-menu-list">
											<c:forEach var="menuItem" items="${menuMap}">
												<div class="menu-item-group" id="menu-item-group-select">
													<div class="menu-item-color" id="menu-item-color-select" 
													data-user-nickname="${menuItem.userNickname}"
													data-category="${menuItem.category}"
													data-product-name="${menuItem.productName}"
													onclick="logClick()" 
													style="
												       width: 200px;
												       height: 30px;
												       margin-bottom: 10px;
												       margin-left: 20px;
												       border: 2px solid black;
		    										   border-radius: 5px;	
												       background-color: 
														<c:choose>
							                                <c:when test="${menuItem.productName == 'red'}">red</c:when>
							                                <c:when test="${menuItem.productName == 'yellow'}">yellow</c:when>
							                                <c:when test="${menuItem.productName == 'black'}">black</c:when>
							                                <c:when test="${menuItem.productName == 'blue'}">blue</c:when>
							                                <c:when test="${menuItem.productName == 'purple'}">purple</c:when>
							                                <c:when test="${menuItem.productName == 'white'}">white</c:when>
							                                <c:when test="${menuItem.productName == 'green'}">green</c:when>
							                                <c:when test="${menuItem.productName == 'lime'}">lime</c:when>
							                                <c:when test="${menuItem.productName == 'grey'}">gray</c:when>
							                                <c:when test="${menuItem.productName == 'navy'}">navy</c:when>
							                                <c:when test="${menuItem.productName == 'rgb(42, 140, 168)'}">rgb(42, 140, 168)</c:when>
							                            </c:choose>;
												       " >
											   </div>
											   <div class="menu-item-name">${menuItem.productName}</div>
										   </div>
										</c:forEach>
									</div>
							</div>
							
							<form action="/mnHome/settingMenu/menuChoice" >
								<div class="set-menu-btn">
									<input type="hidden" name="selectedProductName" id="selectedProductName" class="set-menu-select" />
									<input type="hidden" name="selectedCategory" id="selectedCategory" class="set-menu-select"/>
									<input type="hidden" name="nickname" id="nickname" class="set-menu-select"/>
									<input type="submit" class="set-menu-select apply-button" value="적용" />
								</div>
							</form>
							
						</div>
					</div>
						
				</div>
					
				<div class="menu-container">
               
					<div class="menu-content" data-tab="<c:url value='/mnHome/mainView/${userNickname }'/>"
						style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						홈
					</span>
					</div>
					<div class="menu-content" data-tab="<c:url value='/mnHome/diaryView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						다이어리
					</span>
					</div>
					<div class="menu-content" data-tab="<c:url value='/mnHome/albumView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						사진첩
					</span>
					</div>
					<div class="menu-content" data-tab="<c:url value='/mnHome/boardView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						게시판
					</span>
					</div>
					<div class="menu-content" data-tab="<c:url value='/mnHome/visitView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						방명록
					</span>
					</div>
					<c:if test="${sessionScope.userId.userNickname eq userNickname }">
						<div class="menu-content" data-tab="<c:url value='/mnHome/settingView/${userNickname }'/>"
						style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
							<span class="menu-content-span"
							style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						관리
					</span>
						</div>      
					</c:if>
                  
               </div>
					
			</div>
		</div>
	</div>
</div>
	
</body>
</html>
