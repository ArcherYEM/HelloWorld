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
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/miniroom.css" />
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>

<!-- 적용시킬예정    -->
  <div id="test"></div>
   <div class="main-frame-skin" id="skin-item-color-select" 
		style="width: 100%; height: 100%;
	       background-color: 
			<c:choose>
               <c:when test="${bgProductName == 'red'}">red</c:when>
               <c:when test="${bgProductName == 'yellow'}">yellow</c:when>
               <c:when test="${bgProductName == 'black'}">black</c:when>
               <c:when test="${bgProductName == 'blue'}">blue</c:when>
               <c:when test="${bgProductName == 'purple'}">purple</c:when>
               <c:when test="${bgProductName == 'white'}">white</c:when>
               <c:when test="${bgProductName == 'green'}">green</c:when>
               <c:when test="${bgProductName == 'lime'}">lime</c:when>
               <c:when test="${bgProductName == 'grey'}">gray</c:when>
               <c:when test="${bgProductName == 'navy'}">navy</c:when>
               <c:when test="${bgProductName == 'rgb(42, 140, 168)'}">rgb(42, 140, 168)</c:when>
           </c:choose>
           ;
	       " >
   
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
                        ${userName }&#128698;
                     </div>
<%--                      <div class="profile-username font-kyobohand"> ${sessionScope.userId.userName }&#128698;</div> --%>

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
                        https://www.helloworld.com/minihome/${userNickname }
                     </div>
                  </div>
                  <div class="box content-box">
                     <div class="box-title">
                        Updated news <span class="box-title2">TODAY STORY</span>
                     </div>
                     <div class="news-flex-box">
                        <div class="news-box">
                           <div class="news-row">
                              <div class="news-category category-post">게시판</div>
                              <div class="news-title">
                                 <a href="/mnHome/boardView">HTML, CSS, JAVASCRIPT</a>
                              </div>
                           </div>
                           <div class="news-row">
                              <div class="news-category category-pic">사진첩</div>
                              <div class="news-title">
                                 <a href="/mnHome/albumView">2023을 보내며...</a>
                              </div>
                           </div>
                           <div class="news-row">
                              <div class="news-category category-post">게시판</div>
                              <div class="news-title">
                                 <a href="/mnHome/boardView">스프링이란 무엇인가</a>
                              </div>
                           </div>
                           <div class="news-row">
                              <div class="news-category category-post">게시판</div>
                              <div class="news-title">
                                 <a href="/mnHome/boardView">Maven 과 Gradle 의 차이</a>
                              </div>
                           </div>
                        </div>
                        <div class="update-box">
                           <div class="menu-row">
                              <div class="menu-item">
                                 <a href="/mnHome/diaryView">다이어리<span class="menu-num">${newCount.DiaryCount}/${count.DiaryCount }</span></a>
                                 <c:if test="${newCount.DiaryCount>0 }">
                                 	<img src="../../../../resources/images/minihome/newIcon.png"
                                 		alt="new Icon" class="minihome-nIcon">
                                 </c:if>
                                 
                              </div>
                              <div class="menu-item">
                                 <a href="/mnHome/albumView">사진첩<span class="menu-num">0/0</span></a>
                                 <c:if test="${newCount.AlbumCount>0 }">
                                 	<img src="../../../../resources/images/minihome/newIcon.png"
                                 		alt="new Icon" class="minihome-nIcon">
                                 </c:if>
                              </div>
                           </div>
                           <div class="menu-row">
                              <div class="menu-item">
                                 <a href="/mnHome/boardView">게시판<span class="menu-num">${newCount.BoardCount}/${count.BoardCount }</span></a>
                                 <c:if test="${newCount.BoardCount>0 }">
                                 	<img src="../../../../resources/images/minihome/newIcon.png"
                                 		alt="new Icon" class="minihome-nIcon">
                                 </c:if>
                              </div>
                              <div class="menu-item">
                                 <a href="/mnHome/visitView">방명록<span class="menu-num">${newCount.VisitCount}/${count.VisitCount }</span></a>
                                 <c:if test="${newCount.VisitCount>0 }">
                                 	<img src="../../../../resources/images/minihome/newIcon.png"
                                 		alt="new Icon" class="minihome-nIcon">
                                 </c:if>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="miniroom">
                        <div class="mnr-group">
                           <div class="mnr-title">
                              <span class="box-title miniroom-title">Miniroom</span>
                           </div>
                           <div class="mnr-edit">
                           <c:if test="${sessionScope.userId.userNickname eq userNickname }">
                                 <a 
                                   class="mnh-Edit" 
                                   onclick="openNewWindowMiniroomEdit()">미니룸 설정
                                 </a>
                           </c:if>
                              <!-- <a 
                                class="mnh-Edit" 
                                onclick="openNewWindowMiniroomEdit()">미니룸 설정
                              </a> -->
                           </div>
                        </div>
                        <%-- <div class="miniroom-gif-box">
                           <% Boolean loginStatus = (Boolean) request.getAttribute("loginStatus"); %>
                           <% if (loginStatus == null || !loginStatus) { %>
                           <div class="miniroom-canvas" style="background-image:url('/../../../../resources/images/miniroom${background.backgroundPath}')">
                                 <img class="miniroom-minimi" src="/../../../../resources/images/minimi${minimiList.minimiPath}" style="left:${minimiList.minimiLeft}; top:${minimiList.minimiTop}"/>
                           </div>
                           <% } else { %>   
                           <div class="miniroom-canvas" style="background-image:url('../../../..${background.backgroundPath}')">
                              <c:forEach var = "minimi" items="${minimiList}">
                                 <img class="miniroom-minimi" src="../../../..${minimi.minimiPath}" style="left:${minimi.minimiLeft}; top:${minimi.minimiTop}"/>
                              </c:forEach>
                           </div>
                           <% } %>
                        </div> --%>
                        
                        <div class="miniroom-gif-box">
                           <div class="miniroom-canvas" style="background-image:url('../../../..${background.backgroundPath}')">
                              <c:forEach var = "minimi" items="${minimiList}">
                                 <img class="miniroom-minimi" src="../../../..${minimi.minimiPath}" style="left:${minimi.minimiLeft}; top:${minimi.minimiTop}"/>
                              </c:forEach>
                           </div>
                        </div>
                     </div>
                     <br>
                     <div class="main-cmt">
                        <div class="main-cmt-write">
                           일촌평
                           <input type="text" id="friendCmt" class="main-cmt-input">
                           <button type="button" id="btnFriendCmt" value="확인"></button>
                        </div>
                        <div class="main-cmt-content">
                           <ul>
                              <li>AWS 로 DB Server 풀 가동 하시는거죠?
                                 <span class="main-cmt-info"> <a href="#">(이정은)</a> 2023.12.25</span>
                              </li>
                              <li>JSP 파일만 30개가 넘는다면서요?ㅋㅋ 
                                 <span class="main-cmt-info"><a href="#">(채승원)</a> 2023.12.15</span>
                              </li>
                              <li>Git 으로 형상관리 하고계시죠? 
                                 <span class="main-cmt-info"> <a href="#">(이진우)</a> 2023.12.05</span>
                              </li>
                              <li>400 은 행복입니다. 다된거죠. 500은..하
                                 <span class="main-cmt-info"> <a href="#">(양은모)</a> 2023.12.01</span>
                              </li>
                              <li>뭐라고요? 이주빈은 @Bean 을 2주동안 만들어서 이주빈이라고요? 
                                 <span class="main-cmt-info"> <a href="#">(금민재)</a> 2023.11.05</span>
                              </li>
                           </ul>
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
      
      <div class="audioPlayerContainer">
<!--          <audio id="audioElement" autoplay></audio> -->
         <div class="audioPlayingContainer">
            <div class="audioPlayingDiv">
               <img id="audioPlayingImg" src="../../../../resources/images/audioPlayer/nowPlaying.png">
            </div>
            <div class="audioPlayingMargin">            
            </div>         
             <div class="nowPlaying">
                 <div class="audioTitle" id="songTitle">노래 제목</div>
             </div>
          </div>
          <div class="audioControlsContainer">
             <div class="audioBtnContainer">
               <button class="audioBtn" id="audioPrev">
                  <img src="../../../../resources/images/audioPlayer/audioPrev.png">
               </button>
               <button class="audioBtn" id="audioPlay">
                  <img src="../../../../resources/images/audioPlayer/audioPlay.png">
               </button>
               <button class="audioBtn" id="audioPause">
                  <img src="../../../../resources/images/audioPlayer/audioPause.png">
               </button>
               <button class="audioBtn" id="audioNext">
                  <img src="../../../../resources/images/audioPlayer/audioNext.png">
               </button>
            </div>
            <div class="audioVolumeContainer">
               <button id="audioVolumeBtn">
                  <img src="../../../../resources/images/audioPlayer/audioVolume.png" style="margin-right:5px;">
               </button>
               <input type="range" id="audioVolumeControl" min="0" max="100" value="50" step="1">
            </div>
         </div>
      </div>
   </div>
   <div id="testUnder"></div>
   
   </div> <!-- backgourn div -->
   <script src="../../../../resources/js/default.js"></script>
   <script src="<c:url value='/resources/js/ajaxTab.js'/>"></script>
   <script>
   	  document.getElmentById('btnFriendCmt').addEventListener('click', function() {
   		
   		  let jsonData = {
   	           "userEmail": userEmail,
   	           "userPassword": userPassword
   	        };
   		  
	   		$.ajax({
	            method: 'POST',
	            url: "<c:url value='/mnHome/mainView/${userNickname}' />",
	            contentType: 'application/json',
	            data: JSON.stringify(jsonData)
	         }).done(function (json) {
	         	console.log(json);
	   	  		})
   	  })
   	  
      // 미니홈피 프로필 수정창
      function openNewWindowMinihomeProfileEdit() {
       var windowSettings = 'width=460, height=570, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50';
        openNewWindow('/mnHome/mnhProfileEditView', windowSettings);
      }
   
      // 미니룸 수정창
      function openNewWindowMiniroomEdit() {
        var windowSettings = 'width=800, height=600, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50';
        openNewWindow('/mnHome/miniroomEditView', windowSettings);
      }
      
      function openNewWindowMiniroomHistory() {
		window.open('', 'miniroomWindow', 'width=800, height=600, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50');
		document.getElementById("frmHistory").submit();
      }
      
      function openNewWindow(url, settings) {
        window.open(url, '_blank', settings);
      }
   </script>
   <script>
      // 대표 미니미 수정창 (setting page)
      function MinimiChange() {
        var windowSettings = 'width=460, height=570, scrollbars=no, resizable=no, toolbars=no, menubar=no, left=100, top=50';
        openNewWindow('/mnHome/mnhMinimiChangeView', windowSettings);
      }
      
      function openNewWindow(url, settings) {
        window.open(url, '_blank', settings);
      }
   </script>
   <script>
     var bgColor = "${bgSkin}";
     document.body.style.backgroundColor = bgColor;
   </script>  
</body>
</html>
