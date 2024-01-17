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
						TODAY&nbsp;<span class="today-span">${todayCnt }</span>&nbsp;| TOTAL ${totalCnt }
					</div>
					<div class="box profile-box diary-box">
						<div class="profile-image">
							<div id="datepicker" style="width:80%"></div>
						</div>
						<div class="profile-dot">---------------------------------</div>
						<div class="profile-username font-kyobohand mainpopup" onclick="popupFunction()"> 
						<c:if test="${sessionScope.userId.userNickname == userNickname}">
						</c:if>
						<c:if test="${sessionScope.userId.userNickname != userNickname}">
						    <div class="mainpopuptext" id="myPopup" onclick="requestFriendship('${userNickname}')"> 
						        일촌신청 
						        <input type="hidden" id="requestUser" name="requestUser" value="${sessionScope.userId.userNickname}">
						        <input type="hidden" id="responseUser" name="responseUser" value="${userNickname}">
						    </div>
						</c:if>
						<c:if test="${userGender eq 'M'}">
                        	${userName }&#128102
						</c:if>
						<c:if test="${userGender eq 'F'}">
                        	${userName }&#128103
						</c:if>
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
							<div class=" album-submit">
								<c:if test="${sessionScope.userId.userNickname eq userNickname }">
									<c:if test="${nullCheck}">
										<input type="button" id="btnUpload" class="btnDiaryWrite" data-diaryWrite="<c:url value='/mnHome/diaryWriteView/${userNickname}'/>" value="글쓰기">
									</c:if>
									<c:if test="${!nullCheck}">
										<input type="button" onclick="already()" value="글쓰기">
									</c:if>
								</c:if>
							</div>
							<div class="album-overflow">
								<div class="album-container3">
									<div class="album-container2">
										<div class="diary-container1">
											<div class="album-db-group">
									            <div id="diaryTitle" class="diary-title">${diary.title}</div>
									            <div id="diaryDate" class="diary-date-right">${formatted_update_date}</div>
									            <div id="diaryContent" class="diary-content">${diary.content}</div>
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
														<!-- <a href="#" class="album-under-right">이동</a> -->
														<a href="#" class="album-under-right">수정</a>
														<a href="#" class="album-under-right">삭제</a>
													</div>
												</div>
											</c:if>
											<div class="board-comment-write" id="cmtInputContainer">
												<span>댓글</span>
												<input type="text" class="comment-content-write" id="cmtContent${diary.seq}">
												<input type="hidden" value="${sessionScope.userId.userNickname}" class="cmtWriter">
												<input type="hidden" value="${diary.seq}" id="cmtSeq">
												<input type="button" value="확인" onclick="addCmt()">
											</div>
											<div class="board-comment-container" id="diaryCmtContainer">
												<c:forEach var="commentEntry" items="${cmtList}">
										            <c:set var="commentDiarySeq" value="${commentEntry.key}" />
										            <c:if test="${commentDiarySeq eq diary.seq}">
										                <c:set var="comments" value="${commentEntry.value}" />
										                <c:if test="${not empty comments}">
										                    <c:forEach var="comment" items="${comments}">
										                        <div class="board-comment">
										                            <span class="board-comment-writer">${comment.commentUserNickname}</span>
										                            <span class="board-comment-content">${comment.commentContent}</span>
										                            <span class="board-comment-date">${comment.commentCreateDate}</span>
										                        </div>
										                    </c:forEach>
										                </c:if>
										            </c:if>
										        </c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				<jsp:include page="/WEB-INF/views/miniHome/menuTab.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
</body>
</html>
