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
<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
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
							<div class="album-folder-group">
								<div class="album-folder">
									<img src="/resources/images/minihome/openFolderIcon.png">
									<a href="#">전체보기</a>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#">일상생활</a>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#">개발 이야기</a>
								</div>
							</div>
							<div class="album-dot">---------------------------------</div>
							<div class="font-kyobohand album-profile-username"> ${userName }&#128698;</div>
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
								https://www.helloworld.com/minihome/leejubin</div>
					</div>
					<div class="box content-box">
					
					<div class="board-overflow">
						<div class="board-title-container">
							<input type="text" placeholder="     제목을 입력하세요" class="board-title" maxlength="30">
						</div>
						<div class="board-write-container">
							<span class="board-writer">  채승원(작성자)</span>
							<span class="board-write-date">2023.12.10 14:21</span>						
						</div>
						<textarea name="content" id="txtContent" rows="10" cols="100" style="width:500px; height:180px; min-width:500px; display:none;"></textarea><br>
						<br>

						<div class="btn-container">
							<div class="btn-left">
								<input type="file" multiple="multiple" onchange="multiFiles(this.files)" class="fileUpload">
							</div>
							<div class="btn-right">
								<input class="btn-boardlist" type="button" id="btnBoardView" data-boardView="<c:url value='/mnHome/boardView/${userNickname}'/>" value="목록">
								<input class="btn-write" type="button" id="btnBoardWrite" value="등록">
							</div>
						</div>
						<div id="preview-container"></div>
					</div>
					
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