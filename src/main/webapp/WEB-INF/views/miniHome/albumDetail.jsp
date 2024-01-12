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
								<form action="/mnHome/miniroomHistoryView" method="POST" id="frmHistory" target="miniroomWindow">
									<input type="hidden" name="targetNickname" id="targetNickname" value=${userNickname }>
								</form>
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
						<c:if test="${sessionScope.userId.userNickname eq userNickname }">
							<div class=" album-submit">
								<input type="button" class="btnAlbumWrite" id="btnUpload" data-albumWrite="<c:url value="/mnHome/albumWriteView/${userNickname}" />" value="사진올리기">
							</div>
						</c:if>
							<div class="album-overflow">
							
								<div class="album-container3">
									<div class="album-container2">
										<div class="album-container1">
											<div class="album-title">
												${list.title}
											</div>
											<div class="album-wd">
												<span class="album-writer">
													${list.writer}
												</span>
												<span class="album-date">
													${list.create_date}
												</span>
											</div>
											
											<c:forEach items="${imageParts}" var="image">
												<div class="album-images">
											      <img src="<c:url value="/../../../../resources/images/download/${image}" />" alt="이미지 설명">
											    </div>
											</c:forEach>
										    
										    
										  <div class="album-content">
											${list.content}
										  </div>
									  </div>
									  <div class="album-public">
									  	<div class="album-dropDown">
									  	<c:if test="${sessionScope.userId.userNickname eq userNickname }">
									  		<span>공개설정 :</span>
												<select>
													<option value="" disabled selected hidden="">전체공개</option>
													<option value="temp1">비공개</option>
													<option value="temp2">전체공개</option>
												</select>
										</c:if>
										</div>
									  </div>
								  </div>
								  <div class="album-container-under">
								  	<div class="album-under">
								  		<!-- <a href="#" class="album-under-left">스크랩하기</a> -->
								  		<a class="album-under-left" id="albumView" data-albumView="<c:url value='/mnHome/albumView/${userNickname}'/>">목록</a>
								  		<c:if test="${sessionScope.userId.userNickname eq userNickname }">
									  		<!-- <a href="#" class="album-under-right">이동</a> -->
									  		<!-- <a href="#" class="album-under-right">수정</a> -->
									  		<a class="album-under-right" onclick="deleteAlbum(${list.seq})">삭제</a>
								  		</c:if>
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