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
<link rel="stylesheet" href="../../../../resources/css/minihome/settingDotori.css" />
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
									<span>
										<img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>">
									</span>
									<span class="setting-menu-title">
										개인정보
									</span>
									<ul class="tree">
										<li>
											<a>
												<span class="setting-menu-list" id="spanSetting" data-setting="/mnHome/settingView/${userNickname }">
													개인정보변경
												</span>
											</a>
										</li>
									</ul>
									<span>
										<img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>">
									</span>
									<span class="setting-menu-title">
										미니홈피관리
									</span>
									<ul class="tree">
										<li>
											<a>
												<span class="setting-menu-list" id="spanSettingBgm" data-bgm="/mnHome/settingBgm/${userNickname }">
													BGM설정
												</span>
											</a>
										</li>
										<li>
											<a>
												<span class="setting-menu-list" id="spanSettingMenu" data-menu="/mnHome/settingMenu/${userNickname }">
													메뉴탭설정
												</span>
											</a>
										</li>
										<li>
											<a>
												<span class="setting-menu-list" id="spanSettingSkin" data-skin="/mnHome/settingSkin/${userNickname }">
													스킨설정
												</span>
											</a>
										</li>
									</ul>
									<span>
										<img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>">
									</span>
									<span class="setting-menu-title">
										아이템/내역관리
									</span>
									<ul class="tree">
										<li>
											<a>
												<span class="setting-menu-list set-on" id="spanSettingDotoriU" data-dotoriU="/mnHome/settingDotoriUse/${userNickname }">
													도토리 사용내역
												</span>
											</a>
										</li>
										<li>
											<a>
												<span class="setting-menu-list" id="spanSettingDotoriC" data-dotoriC="/mnHome/settingDotoriCharge/${userNickname }">
													도토리 구매내역
												</span>
											</a>
										</li>
									</ul>
									<span>
										<img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>">
									</span>
									<span class="setting-menu-title">
										인맥관리
									</span>
									<ul class="tree">
										<li>
											<a>
												<span class="setting-menu-list" id="spanSettingFriends" data-friends="/mnHome/settingFriends/${userNickname }">
													일촌현황
												</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="profile-dot">-----------------------------------</div>
                     			 <div class="left-3">
		                 		    <div class="profile-username font-kyobohand mainpopup" onclick="popupFunction()"> 
										<c:if test="${sessionScope.userId.userNickname == userNickname}"></c:if>
										<c:if test="${sessionScope.userId.userNickname != userNickname}">
								   			<div class="mainpopuptext" id="myPopup" onclick="requestFriendship('${userNickname}')"> 
								        	일촌신청 
									        <input type="hidden" id="requestUser" name="requestUser" value="${sessionScope.userId.userNickname}">
									        <input type="hidden" id="responseUser" name="responseUser" value="${userNickname}">
									    </div>
									</c:if>
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
									        <option value="${friend.Name}">
									        	${friend.Name}(${friend.userEmail})
									        </option>
									    </c:forEach>
									</select>
		                   		</div>
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
								http://corehelloworld.shop/mnHome/mainView/${userNickname }
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
													<th>카테고리</th>
													<th>세부항목</th>
													<th>사용 도토리</th>
													<th>사용 일시</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var = "dotori" items="${dotoriUse }">
												<tr>
													<td>${dotori.category }</td>
													<td>${dotori.detail }</td>
													<td>${dotori.dotoriUse }</td>
													<td>${dotori.formattedDotoriUseDate }</td>
												</tr>
											</c:forEach>												
											</tbody>
										</table>
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
