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
						
						<div class="board-container">
							<table class="board-table">
								<thead>
									<tr>
										<c:if test="${sessionScope.userId.userNickname eq userNickname }">
											<th class="th-checkbox"><input type="checkbox" id="checkbox-all" onclick="selectAll()"></th>
										</c:if>
										<th class="th-title">제목</th>
										<th class="th-writer">작성자</th>
										<th class="th-view">조회</th>
									</tr>
								</thead>							
								<tbody>							
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">[스크랩]너는 내 운명<img src="../../../../resources/images/minihome/newIcon.png" class="newIcon"></td>
										<td class="td-writer">채승원</td>
										<td class="td-view">21</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">테스트용 게시물</td>
										<td class="td-writer">채승원</td>
										<td class="td-view">12</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">Board Test</td>
										<td class="td-writer">이진우</td>
										<td class="td-view">33</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">댓글이 달린 게시글[15]</td>
										<td class="td-writer">양은모</td>
										<td class="td-view">121</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">이미지가 달린 게시글</td>
										<td class="td-writer">이정은</td>
										<td class="td-view">46</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">댓글이 달린 게시글 <span class="comment">[15]</span></td>
										<td class="td-writer">양은모</td>
										<td class="td-view">121</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">이미지가 달린 게시글 <img src="../../../../resources/images/minihome/photoIcon.png" class="photoIcon"></td>
										<td class="td-writer">이정은</td>
										<td class="td-view">46</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">소환사의 협곡에 오신것을 환영합니다</td>
										<td class="td-writer">라이엇 게임즈</td>
										<td class="td-view">863</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">미리 메리크리스마스</td>
										<td class="td-writer">아이유</td>
										<td class="td-view">9513</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">Board Test</td>
										<td class="td-writer">이진우</td>
										<td class="td-view">33</td>
									</tr>
									
									<tr>
										<td class="td-checkbox"><input type="checkbox"></input></td>
										<td class="td-title">Board Test</td>
										<td class="td-writer">이진우</td>
										<td class="td-view">33</td>
									</tr>								
								</tbody>						
							</table>	
							<div class="board-btn">
								<c:if test="${sessionScope.userId.userNickname eq userNickname }">
									<input type="button" value="이동">
									<input type="button" value="삭제">
									<input type="button" class="btnBoardWrite" value="등록" data-boardWrite="<c:url value='/mnHome/boardWriteView/${userNickname}'/>">
								</c:if>
							</div>	
							<div class="board-pages">
								<span class="board-page">| 1</span>
								<span class="board-page">| 2</span>
								<span class="board-page">| 3</span>
								<span class="board-page">| 4</span>
								<span class="board-page">| 5</span>
								<span class="board-page">| 6</span>
								<span class="board-page">| 7</span>
								<span class="board-page">| 8</span>
								<span class="board-page">| 9</span>
								<span class="board-page">| 10</span>
								<span class="board-page">| >></span>
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