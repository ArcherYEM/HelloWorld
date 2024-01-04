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
<link rel="stylesheet" href="../../../../resources/css/minihome/diary.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/jquery-ui(1.13.2).css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
<!-- date picker  -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- date picker  -->
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
							<div id="datepicker" style="width:80%"></div>
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="album-folder-group">
								<div class="album-folder">
									<img src="/resources/images/minihome/openFolderIcon.png">
									<a href="#" class="folder-name">전체보기</a>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#" class="folder-name">일상생활</a>
								</div>
								<div class="album-folder">
									<img src="/resources/images/minihome/closeFolderIcon.png">
									<a href="#" class="folder-name">개발 이야기</a>
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
								https://www.helloworld.com/minihome/leejubin</div>
						</div>
					<div class="box content-box">
						<div class=" album-submit">
							<c:if test="${sessionScope.userId.userNickname eq userNickname }">
								<input type="button" id="btnUpload" class="btnDiaryWrite" data-diaryWrite="<c:url value='/mnHome/diaryWriteView/${userNickname}'/>" value="글쓰기">
							</c:if>
						</div>
								<div class="album-overflow">
							
								<div class="album-container3">
									<div class="album-container2">
										<div class="album-container1">
											<div class="album-title">
												2023.12.21 23:50
											</div>
											
											
										  <div class="album-content">
											달이 익어가니 서둘러 젊은 피야<br>
		
											민들레 한 송이 들고<br>
										
											사랑이 어지러이 떠다니는 밤이야<br>
										
											날아가 사뿐히 이루렴<br>
										
											팽팽한 어둠 사이로<br>
										
											떠오르는 기분<br>
										
											이 거대한 무중력에 혹 휘청해도<br>
										
											두렵진 않을 거야<br>
										  </div>
									  </div>
									  <c:if test="${sessionScope.userId.userNickname eq userNickname }">
										  <div class="album-public">
										  	<div class="album-dropDown ">
										  		<span>공개설정 :</span>
													<select>
														<option value="" disabled selected hidden="">전체공개</option>
														<option value="temp1">비공개</option>
														<option value="temp2">전체공개</option>
													</select>
													
													
											</div>
											<div class="album-under">
										  		<a href="#" class="album-under-right">이동</a>
										  		<a href="#" class="album-under-right">수정</a>
										  		<a href="#" class="album-under-right">삭제</a>
										  	</div>
										  </div>
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
											푸르른 우리 위로
										</span>
										<span class="board-comment-date">
											(2023.12.24 13:25)
										</span>
										<i class="fa-regular fa-rectangle-xmark icon-color btn-cmt-del"></i>
									</div>
									<div class="board-comment">
										<span class="board-comment-writer">
											양은모
										</span>
										<span class="board-comment-content">
											커다란 strawberry moon 한 스쿱
										</span>
										<span class="board-comment-date">
											(2023.12.24 15:20)
										</span>
										<i class="fa-regular fa-rectangle-xmark icon-color btn-cmt-del"></i>
									</div>
									<div class="board-comment">
										<span class="board-comment-writer">
											채승원
										</span>
										<span class="board-comment-content">
											나에게 너를 맡겨볼래
										</span>
										<span class="board-comment-date">
											(2023.12.24 20:15)
										</span>
										<i class="fa-regular fa-rectangle-xmark icon-color btn-cmt-del"></i>
									</div>
								</div>
							  </div>
							  
							  <div class="album-container3">
									<div class="album-container2">
										<div class="album-container1">
											<div class="album-title">
												2023.12.22 10:45
											</div>
											
											
										  <div class="album-content">
										   	So are you happy now<br>
											Finally happy now are you<br>
											뭐 그대로야 난<br>
											다 잃어버린 것 같아<br>
											모든 게 맘대로 왔다가 인사도 없이 떠나<br>
											이대로는 무엇도 사랑하고 싶지 않아<br>
											다 해질 대로 해져버린<br>
											기억 속을 여행해<br>
											우리는 오렌지 태양 아래<br>
											그림자 없이 함께 춤을 춰<br>
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
											<div class="album-under">
										  		<a href="#" class="album-under-left"></a>
										  		<a href="#" class="album-under-right">이동</a>
										  		<a href="#" class="album-under-right">수정</a>
										  		<a href="#" class="album-under-right">삭제</a>
										  	</div>
									  	</div>
									</div>
									<div class="album-container-under">
								  	
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
													정해진 이별 따위는 없어
												</span>
												<span class="board-comment-date">
													(2023.12.24 13:25)
												</span>
												<i class="fa-regular fa-rectangle-xmark icon-color btn-cmt-del"></i>
											</div>
											<div class="board-comment">
												<span class="board-comment-writer">
													양은모
												</span>
												<span class="board-comment-content">
													아름다웠던 그 기억에서 만나
												</span>
												<span class="board-comment-date">
													(2023.12.24 15:20)
												</span>
												<i class="fa-regular fa-rectangle-xmark icon-color btn-cmt-del"></i>
											</div>
											<div class="board-comment">
												<span class="board-comment-writer">
													채승원
												</span>
												<span class="board-comment-content">
													Forever young
												</span>
												<span class="board-comment-date">
													(2023.12.24 20:15)
												</span>
												<i class="fa-regular fa-rectangle-xmark icon-color btn-cmt-del"></i>
											</div>
										</div>
								  </div>
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