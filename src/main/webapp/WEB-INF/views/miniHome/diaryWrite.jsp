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
<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
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
							<div id="datepicker"></div>
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
                        https://www.helloworld.com/minihome/${userNickname }
                     </div>
                  </div>
               <div class="box content-box">
                  <div class="board-overflow">
                     <div class="board-title-container">
                        <input type="text" placeholder="제목을 입력하세요" class="board-title" maxlength="30" id="diaryTitle">
                     </div>
                     <div class="board-write-container">
                        <span class="board-writer">  ${userName }(작성자)</span>
                     </div>
                      <!--인라인 스타일 외 적용불가하여 불가피하게 인라인css 적용 -->
                     <textarea placeholder="test" name="content" id="txtContent" rows="10" cols="100" form="frmDiary" style="width:500px; height:180px; min-width:500px; display:none;"></textarea>
                     <div class="btn-container">
                        <div class="btn-left">
                           <input class="btn-diarylist" type="button" id="btnBoardView" data-diaryView="<c:url value='/mnHome/diaryView/${userNickname}'/>" value="목록">
                        </div>
                        <div class="btn-right">
                           <input class="btn-write" type="button" id="btnBoardWrite" value="글쓰기" onclick="addDiary()">
                        </div>
                     </div>
                     <div id="preview-container"></div>
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