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
											<c:forEach items="${diaryList}" var="diary">
												<div class="album-db-group">
												    <div class="album-title">${diary.title}</div>
												    <div class="album-date">${diary.update_date}</div>
												    <div class="album-content">${diary.content}</div>
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
				<!-- 										댓글 작성자명 -->
														</span>
														<span class="board-comment-content">
				<!-- 										댓글내용 -->
														</span>
														<span class="board-comment-date">
				<!-- 										댓글 작성 일시 -->
														</span>
														<i class="fa-regular fa-rectangle-xmark icon-color btn-cmt-del"></i>
													</div>
												</div>
										</c:forEach>
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