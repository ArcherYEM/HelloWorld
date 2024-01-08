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
<link rel="stylesheet" href="../../../../resources/css/minihome/visit.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
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
						<div class="profile-image">
							<c:set var="imagePath" value="/resources/images/${image}" />
							<img class="profile-image-img" src="/../../../../resources/images/download/${image}" alt="프로필 이미지" />
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="profile-text font-kyobohand">
								<c:out value="${msg}" escapeXml="false"/>
						</div>
						<div class="profile-history">
							<c:if test="${sessionScope.userId.userNickname eq userNickname }">
								<a 
								  class="profile-edit" 
								  onclick="openNewWindowMinihomeProfileEdit()">Edit
								</a>
							</c:if>
							<a
								class="profile-hs"
								onclick="openNewWindowMiniroomHistory()">History								
							</a>
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="profile-username font-kyobohand"> ${userName }&#128698;</div>
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
							 <div id="divHomeTitle" class="content-title-name"><c:out value="${title }"/></div>
							 <input id="newTitle" class="content-title-name"  type="hidden" value="${title }">
							 <input id="hiddenUserNickname" type="hidden" value="${userNickname }">
							 <c:if test="${sessionScope.userId.userNickname eq userNickname }">
								<div>
									<input type="button" id="btn-title-edit" class="btn-edit" value="수정">
									<input type="hidden" id="btn-title-save"class="btn-edit" value="저장">
								</div>
							 </c:if>
							<div class="content-title-url">
								https://www.helloworld.com/minihome/leejubin</div>
					</div>
					<div class="box content-box">
					
					<div class="visit-frame">
						<div class="visit-frame-write view-margin">
							<img class ="visit-minimi"
									src="../../../../${sessionScope.userMinimi}" />
							<div class="visit-write-text" contenteditable="true">
		    				<textarea id="visit-comment-insert" class="visit-view-inner" oninput="countCharacters()"></textarea>
													
							</div>						
						</div>
						<div id="char-count">0/5000</div>
						<div class="visit-frame-btn">
							<input type="button" value="등록" id="visit-comment-btn" onclick="insertComment()" />
						</div>
					</div>
					
					<c:forEach var = "visit" items="${visit}" varStatus="status">
						<div id="visit-${status.index}" data-userNickname="${visit.userNickname}">
							<div class="visit-line">
								<table>
									<tr>
										<td>No. ${status.index+1}</td>
										<td>${visit.userName}
											<img src="../../../../resources/images/minihome/homeIcon.png" class="visit-line-tbImg">
										</td>
										<td>${visit.update_date }</td>
										<td>비밀로하기</td>
										<c:if test="${sessionScope.userNickname==visit.userNickname}">
											<td onclick="btnModify(this)">수정</td>
											<td onclick="btnDelete(this)">삭제</td>
										</c:if>
									</tr>
								</table>
							</div>
							<div class="visit-frame-write view-margin">
								<img class ="visit-minimi"
										src="../../../..${visit.contentPath }" />
								<div class="visit-view">
			    				<input type="text" readonly class="visit-view-inner" value="${visit.content }" data-original-content="${visit.content}">
	
								</div>						
							</div>
						</div>
					</c:forEach>
					
					

					
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
					    <div id="menu-visit" class="menu-content" data-tab="<c:url value='/mnHome/visitView/${userNickname }'/>">
					        <a href="#">방명록</a>
					    </div>
					    <c:if test="${sessionScope.userId.userNickname eq userNickname }">
						    <div class="menu-content" data-tab="<c:url value='/mnHome/settingView/${userNickname }'/>">
						        <a href="#">관리</a>
						    </div>
					    </c:if>
					</div>
				<input type = "hidden" value="${sessionScope.userId.userNickname}" id="userNickname">
				<input type = "hidden" value="${userNickname}" id="targetNickname">				
			</div>
		</div>
	</div>
</div>

<script>
	// 미니홈피 프로필 수정창
	function openNewWindowMinihomeProfileEdit() {
	  var windowSettings = 'width=460, height=570, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50';
	  openNewWindow('/mnHome/mnhProfileEditView', windowSettings);
	}
	
	function openNewWindow(url, settings) {
	  window.open(url, '_blank', settings);
	}		
</script>
</body>
</html>
