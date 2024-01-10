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
									<a href="#">전체보기</a><br/>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#">~ 2014.10.11</a><br/>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#">우리가족 ~♡</a><br/>
								</div>
							</div>
							<div class="album-dot">---------------------------------</div>
							<div class="font-kyobohand album-profile-username"> ${sessionScope.userId.userName }&#128698;</div>
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
							<div class="album-overflow">
							
								<div class="album-container3">
									<div class="album-container2">
										<div class="album-container1">
											<div class="album-title albumWrite-title">
												<input type="text" placeholder="제목을 입력하세요">
											</div>
											
										   <div id="preview-container"></div>
										   
										  <div class="album-content albumWrite-content">
										  	<input type="file" class="albumWirte-file fileupload" multiple="multiple" onchange="multiFiles(this.files)">
										  	<div id="preview-container"></div>
										  	<textarea placeholder="내용을 입력하세요"></textarea>
										  </div>
									  </div>
									  <div class="album-public">
									  	<div class="album-dropDown">
									  		<span>공개설정 :</span>
												<select>
													<option value="" disabled selected hidden="">전체공개</option>
													<option value="temp1">비공개</option>
													<option value="temp2">전체공개</option>
												</select>
											</div>
									  </div>
								  </div>
								  <div class="album-container-under">
								  	<div class="album-under">
								  		<a href="/mnHome/albumView" class="album-under-left" data-albumView="<c:url value='/mnHome/albumView/${userNickname}'/>">목록</a>
								  		<a href="/mnHome/albumView" class="album-under-right">등록</a>
								  	</div>
								  </div>
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