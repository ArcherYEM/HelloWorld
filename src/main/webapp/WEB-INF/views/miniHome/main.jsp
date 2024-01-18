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
  <div id="test"></div>
   <div class="main-frame-skin" id="skin-item-color-select" 
		style="background-color: 
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
                     TODAY&nbsp;<span class="today-span">${todayCnt }</span>&nbsp;| TOTAL ${totalCnt }
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
                        <c:forEach var = "current" items="${current}">
							<div class="news-row">
                              <div class="${current.category}">${current.tableName }</div>
                              <input type="hidden" id="currentUrl">
                              <div class="news-title" data-url="${current.url }">
                                 ${current.title }
                              </div>
							</div>
                        </c:forEach>
                        </div>
                        <div class="update-box">
                           <div class="menu-row">
                              <div class="menu-item" onclick="quickDiary()">
                                 	다이어리<span class="menu-num">${tabs.RecentDiaryCount}/${tabs.TotalDiaryCount }</span>
                                 <c:if test="${tabs.RecentDiaryCount>0 }">
                                 	<img src="../../../../resources/images/minihome/newIcon.png"
                                 		alt="new Icon" class="minihome-nIcon">
                                 </c:if>
                                 
                              </div>
                              <div class="menu-item" onclick="quickAlbum()">
                                 	사진첩<span class="menu-num">${tabs.RecentAlbumCount}/${tabs.TotalAlbumCount }</span>
                                 <c:if test="${tabs.RecentAlbumCount>0 }">
                                 	<img src="../../../../resources/images/minihome/newIcon.png"
                                 		alt="new Icon" class="minihome-nIcon">
                                 </c:if>
                              </div>
                           </div>
                           <div class="menu-row">
                              <div class="menu-item" onclick="quickBoard()">
                                 	게시판<span class="menu-num">${tabs.RecentBoardCount}/${tabs.TotalBoardCount }</span>
                                 <c:if test="${tabs.RecentBoardCount>0 }">
                                 	<img src="../../../../resources/images/minihome/newIcon.png"
                                 		alt="new Icon" class="minihome-nIcon">
                                 </c:if>
                              </div>
                              <div class="menu-item" onclick="quickVisit()">
                                 	방명록<span class="menu-num">${tabs.RecentVisitCount}/${tabs.TotalVisitCount }</span>
                                 <c:if test="${tabs.RecentVisitCount>0 }">
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
                           <c:if test="${friendCheck==0 }">
	                           <input type="text" id="friendCmt" class="main-cmt-input" value="일촌이 아니기 때문에 일촌평을 작성할 수 없습니다." readonly>
                           </c:if>
                           <c:if test="${friendCheck==1 }">
	                           <input type="text" id="friendCmt" class="main-cmt-input">
                           </c:if>
                           <c:if test="${friendCheck==2 }">
	                           <input type="text" id="friendCmt" class="main-cmt-input" value="자기 자신은 일촌평을 작성할 수 없습니다.." readonly>
                           </c:if>
                           <button type="button" id="btnFriendCmt" value="확인">확인</button>
                        </div>
                        <div class="main-cmt-content">
						    <ul>
						        <c:forEach var="list" items="${friendCmtList}" varStatus="i">
						            <li>${list.content}
						                <span class="main-cmt-info">
						                    <a href="<c:url value='/mnHome/mainView/${list.userNickname}' />">${list.userNickname}</a> ${list.createDate}
						                </span>
						            </li>
						        </c:forEach>
						    </ul>
						</div>
                        <div>
                        	<form id="frmFriendCmt" action="<c:url value="mnHome/mainView" />">
                        		<input type="hidden" id="frdTargetNickname" value="${userNickname }">
                        		<input type = "hidden" id="userNickname" value="${sessionScope.userId.userNickname}" >
                        	</form>
                        </div>
                     </div>
                  </div>
               </div>
               <jsp:include page="/WEB-INF/views/miniHome/menuTab.jsp"></jsp:include>
            </div>
         </div>
      </div>
      <div class="audioPlayerContainer">
         <audio id="audioElement" autoplay preload="auto"></audio>
         <div class="audioPlayingContainer">
            <div class="audioPlayingDiv">
               <img id="audioPlayingImg" src="../../../../resources/images/audioPlayer/nowPlaying.png">
            </div>
            <div class="audioPlayingMargin">            
            </div>         
             <div class="nowPlaying">
                 <div class="audioTitle" id="songTitle">노래 없음</div>
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
   <div class="main-under-bar font-neo">
		<div class="main-udb-myhome">
			<input type="button" class="udb-myhome-a font-neo" value="내 미니홈피" onclick="goToMyHome()">
		</div>
		<div class="main-udb-notice">
		    <div id="notice-container">
		        <div class="rolling-notice-container">
		            <c:forEach var="notice" items="${noticeMap}" varStatus="loop">
		                <div class="rolling-notice">${notice.title}</div>
		            </c:forEach>
		        </div>
		    </div>
		</div>
		<div class="main-udb-past">
			이전에 방문한 홈피
		</div>
		<div class="main-udb-logout">
			<input type="button" class="udb-logout-a font-neo" value="로그아웃" onclick="cancel()">
		</div>
   </div>
   <div id="testUnder"></div>
   </div>
   <c:forEach var = "playList" items="${playList}">
   		<input type="hidden" class="bgmTitle" value="${playList.title }">
   		<input type="hidden" class="bgmPath" value="${playList.contentPath }">
   </c:forEach>
   <script src="../../../../resources/js/default.js"></script>
   <script src="<c:url value='/resources/js/ajaxTab.js'/>"></script>
   <script>
    var notices = document.querySelectorAll(".rolling-notice");
    var currentIndex = 0;
    var initialDelay = 1700; 
    var transitionDuration = 300; 
    var reducedDelayFactor = 0.2; 

    function showNextNotice() {
        if (currentIndex > 0) {
            notices[currentIndex - 1].classList.remove("active");
        }
        if (currentIndex < notices.length) {
            notices[currentIndex].classList.add("active");
            currentIndex++;
        } else {
            currentIndex = 0; 
        }

        var delay = currentIndex === 0 ? initialDelay : initialDelay + transitionDuration * notices.length * reducedDelayFactor;
        setTimeout(showNextNotice, delay); 
    }

    showNextNotice();
</script>


   <script>
//    내 미니홈피 가기
	function goToMyHome() {
	    var userNickname = "<c:out value='${sessionScope.userId.userNickname}' />";
	    var url = "<c:url value='/mnHome/mainView/' />" + userNickname;
	    window.location.href = url;
	}

function cancel() {
        window.opener.reloadParentWindow();
	    window.close();
	}
	</script>
   <script>
   	  document.getElementById('btnFriendCmt').addEventListener('click', function() {
   		  if(${friendCheck}==0){
   			  alert("일촌이 아니기 때문에 일촌평을 작성할 수 없습니다.");
   			  return;
   		  } else if(${friendCheck}==2){
   			  alert("자기 자신은 일촌평을 작성할 수 없습니다.");
   			  return;
   		  }
   		  
   		
   		  let userNickname = $("#userNickname").val();
   		  let friendNickname = $('#frdTargetNickname').val();
   		  let content = $('#friendCmt').val();
   		  
   		  let jsonData = {
   	           "userNickname": userNickname
   	           ,"friendNickname": friendNickname
   	           ,"content": content
   	        };
   		  
	   		$.ajax({
	            method: 'POST',
	            url: "<c:url value='/mnHome/friendCmt' />",
	            contentType: 'application/json',
	            data: JSON.stringify(jsonData)
	         }).done(function (newCommentList) {
	         	console.log(newCommentList);
	         	
	         	let commentListHTML = '';
	            for (let i = 0; i < newCommentList.length; i++) {
	                let comment = newCommentList[i];
	                commentListHTML += '<li>' + comment.content +
	                    '<span class="main-cmt-info">' +
	                    '<a href="/mnHome/mainView/' + comment.userNickname + '">' + comment.userNickname + '</a> ' + comment.createDate +
	                    '</span>' +
	                    '</li>';
	            }

	            $('.main-cmt-content ul').html(commentListHTML);  
	            $('#friendCmt').val('');
	   	  		});
   	  });
   	  
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
   <script>
  	function quickHome(){
   		var tabHome = document.getElementById("tabHome");
   		tabHome.click();
   	}
   	function quickDiary(){
   		var tabDiary = document.getElementById("tabDiary");
		tabDiary.click();
   	}
   	function quickAlbum(){
   		var tabAlbum = document.getElementById("tabAlbum");
   		tabAlbum.click();
   	}
   	function quickBoard(){
   		var tabBoard = document.getElementById("tabBoard");
   		tabBoard.click();
   	}
   	function quickVisit(){
   		var tabVisit = document.getElementById("tabVisit");
   		tabVisit.click();
   	}
   	function onChildButtonClick() {
   	    quickHome();
   	}
   </script>
</body>
</html>
