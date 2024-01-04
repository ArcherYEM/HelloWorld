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
<script type="text/javascript" src="../../../../resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
									<a href="#">전체보기</a><br/>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#">일상생활</a><br/>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#">개발 이야기</a><br/>
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
					<div class="board-outer-container">
						<div class="board-detail-title">
							크리스마스
						</div>
					</div>
					<div class="board-write-container">
						<span class="board-writer">채승원(작성자)</span>
						<span class="board-write-date">2023.12.10 14:21</span>						
					</div>
					<div class="board-content-container">
						웹사이트의 모습을 기술하기 위한 마크업 언어.<br><br>
						
						프로그래밍 언어가 아니라 마크업 정보를 표현하는 마크업 언어로 문서의 내용 이외의 문서의 구조나 서식 같은 것을 포함한다. 
						보면 알겠지만 애초에 이름 HTML의 ML이 마크업 언어라는 뜻이다. 
						웹사이트에서 흔히 볼 수 있는 htm이나 html 확장자가 바로 이 언어로 작성된 문서다.<br><br>
						
						최초 제안자는 CERN의 물리학자 티머시 J. 버너스리이다.
						URL, HTTP, WWW의 전신인 Enquire 등도 그가 세트로 개발하고 제안했다. 
						TCP/IP 통신규약을 만든 빈턴 G. 서프(Vinton Gray Cerf)와 함께 인터넷의 아버지로 불린다.<br><br>
						
						나무위키에서는 아래와 같이 내용을 집어넣어 HTML을 적용시킬 수 있지만 도움말은 권장하지 않는 문법이고,
						지원 종료 가능성이 있는 문법이므로 나무위키에서는 HTML 태그를 사용하지 않는 것을 추천한다.<br><br>
					</div>
					<div class="board-detail-right">
						<button id="btnBoardView">목록</button>
						<c:if test="${sessionScope.userId.userNickname eq userNickname }">
							<button id="btnBoardUpdate">수정</button>
						</c:if>
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
