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
								<select id="friendSelect" onchange="redirectToMainView()">
		                           <option value="" disabled selected hidden="">파도타기</option>
								    <c:forEach var="friend" items="${friend}" varStatus="status">
								        <option value="${friend.Name}">${friend.Name}(${friend.userEmail})</option>
								    </c:forEach>
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
							<div class="album-overflow">
							
								<div class="album-container3">
									<div class="album-container2">
										<div class="album-container1">
											<div class="album-title albumWrite-title">
												<input type="text" placeholder="제목을 입력하세요" id="albumTitle">
											</div>
											
										   <div id="preview-container"></div>
										   
										  <div class="album-content albumWrite-content">
										  	<input type="file" name="albumFile" class="albumWirte-file fileupload" multiple="multiple" onchange="multiFiles(this.files)">
										  	<div id="preview-container"></div>
										  	<textarea placeholder="내용을 입력하세요" id="albumContent"></textarea>
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
								  		<a  class="album-under-left" id="albumView" data-albumView="<c:url value='/mnHome/albumView/${userNickname}'/>">목록</a>
								  		<a  class="album-under-right" onclick="writeAlbum()">등록</a>
								  	</div>
								  </div>
							  </div>
							  
							  
							  
						  </div>
						</div>
						
					</div>
					
					<div class="menu-container">
               
					<div class="menu-content" data-tab="<c:url value='/mnHome/mainView/${userNickname }'/>"
						style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						홈
					</span>
					</div>
					<div class="menu-content" data-tab="<c:url value='/mnHome/diaryView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						다이어리
					</span>
					</div>
					<div class="menu-content" data-tab="<c:url value='/mnHome/albumView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						사진첩
					</span>
					</div>
					<div class="menu-content" data-tab="<c:url value='/mnHome/boardView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						게시판
					</span>
					</div>
					<div class="menu-content" data-tab="<c:url value='/mnHome/visitView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						방명록
					</span>
					</div>
					<c:if test="${sessionScope.userId.userNickname eq userNickname }">
						<div class="menu-content" data-tab="<c:url value='/mnHome/settingView/${userNickname }'/>"
						style=" background-color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">red</c:when>
									<c:when test="${menuProductName == 'yellow' }">yellow</c:when>
									<c:when test="${menuProductName == 'black' }">black</c:when>
									<c:when test="${menuProductName == 'blue' }">blue</c:when>
									<c:when test="${menuProductName == 'purple' }">purple</c:when>
									<c:when test="${menuProductName == 'white' }">white</c:when>
									<c:when test="${menuProductName == 'green' }">green</c:when>
									<c:when test="${menuProductName == 'lime' }">lime</c:when>
									<c:when test="${menuProductName == 'grey' }">grey</c:when>
									<c:when test="${menuProductName == 'navy' }">navy</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
							<span class="menu-content-span"
							style=" color: 
								<c:choose>
									<c:when test="${menuProductName == 'red' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'yellow' }">navy</c:when>
									<c:when test="${menuProductName == 'black' }">white</c:when>
									<c:when test="${menuProductName == 'blue' }">orange</c:when>
									<c:when test="${menuProductName == 'purple' }">lightgreen</c:when>
									<c:when test="${menuProductName == 'white' }">black</c:when>
									<c:when test="${menuProductName == 'green' }">red</c:when>
									<c:when test="${menuProductName == 'lime' }">pink</c:when>
									<c:when test="${menuProductName == 'grey' }">brown</c:when>
									<c:when test="${menuProductName == 'navy' }">yellow</c:when>
									<c:when test="${menuProductName == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						관리
					</span>
						</div>      
					</c:if>
                  
               </div>
					
				</div>
			</div>
		</div>
	</div>
	</body>
</html>