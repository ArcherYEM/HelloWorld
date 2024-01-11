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
<link rel="stylesheet" href="../../../../resources/css/minihome/board.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/album.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
								https://www.helloworld.com/minihome/${userNickname }</div>
						</div>
					<div class="box content-box">
					<div class="board-outer-container">
						<div class="board-detail-title">
							${list.get(0).title}
						</div>
					</div>
					<div class="board-write-container">
						<span class="board-writer">${list.get(0).userNickname}</span>
						<span class="board-write-date">${list.get(0).create_date}</span>						
					</div>
					<div class="board-content-container">
						${list.get(0).content}
					</div>
					<div class="board-detail-right">
						<button class="btn-boardlist" id="btnBoardView" data-boardView="<c:url value='/mnHome/boardView/${userNickname}'/>">목록</button>
						<%-- <c:if test="${sessionScope.userId.userNickname eq userNickname }">
							<button id="btnBoardUpdate">수정</button>
						</c:if> --%>
					</div>
					<div class="board-comment-write">
						<span>
							댓글
						</span>
						<input type="text" class="comment-content-write">
						<input type="button" value="확인">
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
