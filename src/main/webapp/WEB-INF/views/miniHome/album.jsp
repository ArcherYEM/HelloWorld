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
							<div class="content-title-name">지구 최강 미모 이주빈 입니다</div>
							<div>
								<button class="btn-edit">수정</button>
							</div>
							<div class="content-title-url">
								https://www.helloworld.com/minihome/leejubin
							</div>
						</div>
						
						<div class="box content-box">
							<div class=" album-submit">
								<input type="button" class="btnAlbumWrite" id="btnUpload" data-albumWrite="<c:url value="/mnHome/albumWriteView" />" value="사진올리기">
							</div>
							<div class="album-overflow">
							
								<div class="album-container3">
									<div class="album-container2">
										<div class="album-container1">
											<div class="album-title">
												싸이월드가 헬로월드로 새롭게 바뀌었습니다!
											</div>
											<div class="album-wd">
												<span class="album-writer">
													채승원
												</span>
												<span class="album-date">
													2023-12-24 16:33
												</span>
											</div>
											<div class="album-images">
									      <img src="<c:url value="/resources/images/album/albumImg1.jpg" />" alt="이미지 설명">
									    </div>
										  <div class="album-content">
											<!--임시글 -->
											바야흐로 2008년,,<br />
											우zi는 ㄱr끔 눈물을 흘렸ㄷr...☆
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
								  		<a href="#" class="album-under-left">스크랩하기</a>
								  		<a href="#" class="album-under-right">이동</a>
								  		<a href="#" class="album-under-right">수정</a>
								  		<a href="#" class="album-under-right">삭제</a>
								  	</div>
								  </div>
							  </div>
							  
							  <div class="album-container3">
									<div class="album-container2">
										<div class="album-container1">
											<div class="album-title">
												[스크랩] 어느덧 이만큼 자란 우리 뽀삐
											</div>
											<div class="album-wd">
												<span class="album-writer">
													채승원
												</span>
												<span class="album-date">
													2023.12.20 20:52
												</span>
											</div>
											<div class="album-images">
									      <img src="<c:url value="/resources/images/album/albumPuppy.jpg" />" alt="이미지 설명">
									    </div>
										  <div class="album-content">
										   	<!--임시글 -->
												벌써 1년<br />
												너와 함께 한 지난 세월이 무색하구나
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
								  		<a href="#" class="album-under-left">스크랩하기</a>
								  		<a href="#" class="album-under-right">이동</a>
								  		<a href="#" class="album-under-right">수정</a>
								  		<a href="#" class="album-under-right">삭제</a>
								  	</div>
								  </div>
							  </div>
							  
						  </div>
						</div>
					</div>
					
					<div class="menu-container">
					    <div class="menu-content-clicked">
					        <a href="<c:url value='/mnHome/mainView'/>">홈</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/diaryView'/>">
					        <a href="#">다이어리</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/albumView'/>">
					        <a href="#">사진첩</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/boardView'/>">
					        <a href="#">게시판</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/visitView'/>">
					        <a href="#">방명록</a>
					    </div>
					    <div class="menu-content" data-tab="<c:url value='/mnHome/settingView'/>">
					        <a href="#">관리</a>
					    </div>
					</div>
					
				</div>
			</div>
		</div>
			
	</div>
</body>
</html>