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
<link rel="stylesheet" href="../../../../resources/css/minihome/visit.css" />
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
								TODAY&nbsp;<span class="today-span">${todayCnt }</span>&nbsp;| TOTAL ${totalCnt }
						</div>
						<div class="box profile-box">
						<div class="left-1">
							<div class="profile-image">
                      			<c:set var="imagePath" value="/resources/images/${image}" />
                        		<img class="profile-image-img" src="/../../../../resources/images/download/${image}" alt="프로필 이미지" />
                     		</div>
                     	</div>
                     	<div class="profile-dot">-----------------------------------</div>
                    	 <div class="left-2">
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
                    	 </div>
                   		 <div class="profile-dot">-----------------------------------</div>
                     	 <div class="left-3">
		                     <div class="profile-username font-kyobohand mainpopup" onclick="popupFunction()"> 
								<c:if test="${sessionScope.userId.userNickname == userNickname}"></c:if>
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
	               		     <div class="profile-dropDown">
								<select id="friendSelect" onchange="redirectToMainView()">
		                           <option value="" disabled selected hidden="">파도타기</option>
								    <c:forEach var="friend" items="${friend}" varStatus="status">
								        <option value="${friend.Name}">
								        	${friend.Name}(${friend.userEmail})
								        </option>
								    </c:forEach>
								</select>
	                   		</div>
                     	</div>
                  	</div>
				</div>
				<div class="content-container">
					<div class="header content-title">
						 <div id="divHomeTitle" class="content-title-name"><c:out value="${title }"/></div>
						 <input id="newTitle" class="content-title-name"  type="hidden" value="${title }">
						 <input id="hiddenUserNickname" type="hidden" value="${userNickname }">
						 <c:if test="${sessionScope.userId.userNickname eq userNickname }">
							<div>
								<input type="button" id="btn-title-edit" class="btn-edit" value="수정">
								<input type="hidden" id="btn-title-save"class="btn-edit" value="저장">
							</div>
						 </c:if>
						<div class="content-title-url">
							https://www.helloworld.com/minihome/${userNickname }
						</div>
					</div>
					<div class="box content-box">
						<div class="visit-overflow">
							<div class="visit-frame">
								<div class="visit-frame-write view-margin">
									<img class ="visit-minimi"
										src="../../../../${sessionScope.userMinimi}" />
									<div class="visit-write-text" contenteditable="true">
				    					<textarea id="visit-comment-insert" class="visit-view-inner" oninput="countCharacters()"></textarea>
									</div>						
								</div>
								<div id="char-count">0/5000</div>
								<div class="visit-frame-btn">
									<input type="button" value="등록" id="visit-comment-btn" onclick="insertComment()" />
								</div>
							</div>
							<c:forEach var = "visit" items="${visit}" varStatus="status">
								<div id="visit-${status.index}" data-userNickname="${visit.userNickname}">
									<div class="visit-line">
										<table>
											<tr>
												<td>No. ${visit.number}</td>
												<td>${visit.userName}
													<a href="<c:url value="/mnHome/mainView/${visit.userNickname }" />"><img src="../../../../resources/images/minihome/homeIcon.png" class="visit-line-tbImg"></a>
												</td>
												<td>${visit.update_date }</td>
												<td>비밀로하기</td>
												<c:if test="${sessionScope.userNickname==visit.userNickname}">
													<td onclick="btnModify(this)">수정</td>
													<td onclick="btnDelete(this)">삭제</td>
												</c:if>
											</tr>
										</table>
									</div>
									<div class="visit-frame-write view-margin">
										<img class ="visit-minimi" src="../../../..${visit.contentPath }" />
										<div class="visit-view">
					    					<input type="text" readonly class="visit-view-inner" value="${visit.content }" data-original-content="${visit.content}">
										</div>						
									</div>
								</div>
							</c:forEach>
							<div class="page-container">
								<c:forEach var="page" begin="1" end="${totalPage}">
									<span class="visit-page" data-page="/mnHome/visitView/${userNickname }?page=${page}" >${page}</span>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="/WEB-INF/views/miniHome/menuTab.jsp"></jsp:include>
				<input type = "hidden" value="${sessionScope.userId.userNickname}" id="userNickname">
				<input type = "hidden" value="${userNickname}" id="targetNickname">				
			</div>
		</div>
	</div>
</div>
<script>
	// 미니홈피 프로필 수정창
	function openNewWindowMinihomeProfileEdit() {
	  var windowSettings = 'width=460, height=570, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50';
	  openNewWindow('/mnHome/mnhProfileEditView', windowSettings);
	}
	
	function openNewWindow(url, settings) {
	  window.open(url, '_blank', settings);
	}		
</script>
</body>
</html>