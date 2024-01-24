<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>헬로월드</title>
	<link  href="/resources/css/index/main.css" rel="stylesheet">
	<link  href="/resources/css/index/notice.css" rel="stylesheet">
	<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
	<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Expires" content="0">
</head>
<body>
	<div class="index-frame">
      	<div class="divIndexMenu index-header">
	      	<div class="index-header-left">
	         	<a class="logoATag" href="<c:url value='/'/>">
	           		<img class="index-header-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
	        	</a>
			</div>
			<div class="index-header-right">
				<h5 class="right" id="userDotori"><img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />">
					<span id="userDotoriCnt">${dotori}</span>
				</h5>
				<a href="<c:url value='/store/minimiView'/>" class="index-a-store">상점</a>
				<a href="<c:url value='/notice/noticeView'/>" class="index-a-notice">공지사항</a>
				<a href="<c:url value='/index/mapView'/>" class="index-a-map">찾아오는 길</a>
				<a id="linkLogout" href="<c:url value='/index/member/logout' />" class="index-a-logout">로그아웃</a>
			</div>
		</div>
		<div id="divHiUser">
			<p class="hello-message" id="helloMessage" onmousedown="return false;" style="cursor: default;">
				HelloWorld 에 오신 걸 환영합니다.
			</p>
		</div>
		<div class="divIndexMain">
			<div id="divHome" class="divLogin">
            	<div >
	                <form class="frmLogin" id="frmLogin" method="POST" action="/index/member/login">
		                <input type="email" id="userEmail" name="userEmail" placeholder="Email">
		                <input type="password" id="userPassword" name="userPassword" placeholder="Password">
		                <input type="button" id="btnLogin" value="로그인">
	               </form>
            	</div>
	            <div onmousedown="return false;" style="cursor: default;">
					<a class="signUpATag idx-su" href="/index/member/signUp">회원가입</a>
					<a href="/index/member/findId" class="idx-id">아이디</a> 
					<span class="index-idpw-span" onmousedown="return false;" style="cursor: default;">/</span>
					<a href="/index/member/findPwView" class="idx-pw">비밀번호 찾기</a>
	            </div>
         	</div>
<!--          로그인후 시점 -->
			<div id="divLogin" class="divLogin">
				<div class="login-frame">
					<div class="login-top">
						<div class="login-top-left">
							<span id="userNickname" onmousedown="return false;" style="cursor: default;"><c:out value='${sessionScope.userId.userNickname}'/></span>
						</div>
						<div class="login-top-right">
							<span class="login-top-right-imz">&#127752;</span>일촌 ON <span id="spanOnfriendCnt" class="login-top-right-bfCnt"></span>
						</div>
					</div>
					<div class="login-profile-frame">
						<div class="login-profile-minimi" id="divMainMinimi">
							<img class="index-my-minimi" id="mainMinimi" src="<c:url value='${sessionScope.userMinimi}'/>"/>
						</div>
						<div class="login-profile-information">
							<div class="login-profile-info">
								<div class="login-profile-section2">
									<span>&#128099;</span>
									<span>오늘방문자</span>
									<span id="todayCnt" class="login-profile-info-2"></span>
								</div>
								<div class="login-profile-section3">
									<span>&#128203;</span>
									<span>새게시물</span>
									<span class="login-profile-info-3" id="newContent"></span>
								</div>
								<div class="login-profile-section4">
									<span>&#128149;</span>
									<span>일촌신청</span>
									<span class="login-profile-info-4" id="newFriend"></span>
								</div>
							</div>
							<div class="my-btn">
					    	    <input type="button" class="mainBtn1" id="btnGoMinihome" value="내 미니홈피" onclick="openMiniHomepage()" target="_blank">
					        	<input type="button" class="mainBtn2" id="btnLogout" value="로그아웃">
					        </div>
				        </div>
					</div>
				</div>
			</div>
<!--          로그인후 종점 -->
	         <div id="divMainSlide">
	            <div class="slideshow-container">
	            	<div class="btnContainer">
	            		<div class="btnLeft">
							<a class="btnClick" onclick="moveSlide(-1)">&#10094;</a>
						</div>
						<div class="btnRight">
							<a class="btnClick" onclick="moveSlide(1)">&#10095;</a>
						</div>
	   				</div>
	               <div class="mySlides fade">
	                 <img src="<c:url value="/resources/images/mainSlideImg1.jpg"/>" >
	               </div>
	               <div class="mySlides fade">
	                 <img src="<c:url value="/resources/images/slideImg1.png"/>" >
	               </div>
	               <div class="mySlides fade">
	                 <img src="<c:url value="/resources/images/slideImg2.png"/>" >
	               </div>
	               <div class="divdot">
					<span class="dot" data-slide-to="1" onclick="currentSlide(1)"></span>
					<span class="dot" data-slide-to="2" onclick="currentSlide(2)"></span>
					<span class="dot" data-slide-to="3" onclick="currentSlide(3)"></span>
	               </div>
	           </div>
	        </div>
		</div>
	</div>
	<div class="bottom-fix">
		<!-- <hr>
		<h1>team core</h1> -->
    </div>
      <jsp:include page="/WEB-INF/views/index/footer.jsp"></jsp:include>
	<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
	<script>
	function openMiniHomepage() {
	    var url = "<c:url value='/mnHome/mainView/${sessionScope.userId.userNickname }' />";
	    var width = 1200;
	    var height = 720;
	    var left = (window.innerWidth - width) / 2;
	    var top = (window.innerHeight - height) / 2;
	    // 새 창 열기
	    var newWindow = window.open(url, 'MiniHomepage', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
	    // 새 창이 열린 후, 현재 창을 그대로 유지하기 위해 기본 링크 동작 방지
	    if (newWindow) {
	        newWindow.focus(); // 새 창을 포커스합니다.
	    }
	    return false;
	}
// 	부모창 리로드 명령
	function reloadParentWindow() {
		location.href = "<c:url value="/index/member/logout" />"
	    location.reload();
	}
	</script>
    <script>
    // Ajax 유저 로그인
     document.getElementById('frmLogin').addEventListener('keydown', function (e) {
         if (e.key === 'Enter') {
            loginUser();
         }
     });
     document.getElementById('btnLogin').addEventListener('click', loginUser);

     function loginUser() {
        let userEmail = document.getElementById('userEmail').value;
        let userPassword = document.getElementById('userPassword').value;

        let jsonData = {
           "userEmail": userEmail,
           "userPassword": userPassword
        };

        $.ajax({
           method: 'POST',
           url: "<c:url value='/index/member/login' />",
           contentType: 'application/json',
           data: JSON.stringify(jsonData)
        }).done(function (json) {
        	
           let helloMessage = document.getElementById('helloMessage');
           let userDotori = document.getElementById('userDotori');
           let userMinimiElement = document.getElementById('mainMinimi');
           let spanOnfriendCnt = document.getElementById('spanOnfriendCnt');

           if (json.resultCode === '1') {
              helloMessage.innerText = json.userNickname + '  님 환영합니다.';
              userDotori.innerText = '내 도토리 : ' + json.userDotoriCnt + ' 개';
              userMinimiElement.src = "<c:url value='" + json.contentPath + "'/>";
              spanOnfriendCnt.innerText = json.friendCnt;
              document.getElementById('linkLogout').style.display = 'block';
              divHome.style.display = 'none';
              divLogin.style.display = 'block';
              location.href="/";
           } else {
              alert('아이디와 비밀번호를 다시 확인해 주세요.');
              helloMessage.innerText = '안녕하세요. HelloWorld에 오신 걸 환영합니다.';
              divHome.style.display = 'block';
              divLogin.style.display = 'none';
           }
        });
     }
       
     let slideIndex = 1;
     showSlides(slideIndex);

	function moveSlide(n) {
		showSlides(slideIndex += n);
	}
     
    function currentSlide(n) {
    	showSlides(slideIndex = n);
    }
     function showSlides(n) {
   	    let slides = document.getElementsByClassName("mySlides");
   	    let dots = document.getElementsByClassName("dot");

   	    if (n > slides.length) {slideIndex = 1}
   	    if (n < 1) {slideIndex = slides.length}
   	    
   	    // 모든 슬라이드를 비활성화하고, 화면 왼쪽으로 이동
   	    for (let i = 0; i < slides.length; i++) {
   	        slides[i].style.transform = "translateX(-100%)";
   	        slides[i].style.zIndex = 0;  // z-index를 초기화
   	    }

   	    // 현재 슬라이드를 활성화하고, 화면 중앙으로 이동
   	    slides[slideIndex-1].style.transform = "translateX(0)";
   	    slides[slideIndex-1].style.zIndex = 1;  // 현재 슬라이드를 최상위로

   	    // dots 업데이트
   	    for (let i = 0; i < dots.length; i++) {
   	        dots[i].className = dots[i].className.replace(" active", "");
   	    }
   	    dots[slideIndex-1].className += " active";
   	}

     // 자동 슬라이드 쇼
     setInterval(function() {
         moveSlide(1);
     }, 5000); // Change image every 2 seconds
        
    
    document.getElementById('btnLogout').addEventListener('click', function() {
       location.href = "<c:url value="/index/member/logout" />"
    });
    
    function showUserInfo() {
        let userEmail = '<c:out value="${sessionScope.userId.userEmail}" />';
        let linkLogout = document.getElementById('linkLogout');
        let userDotoriElement = document.getElementById('userDotori');
        let userDotoriCnt = '${dotori}';
        let helloMessage = document.getElementById('helloMessage');
        let divHome = document.getElementById('divHome');
        let divLogin = document.getElementById('divLogin');

        if (userEmail !== '') {
           linkLogout.style.display = 'block';
           divHome.style.display = 'none';
           divLogin.style.display = 'block';
           helloMessage.innerText = '<c:out value="${sessionScope.userId.userNickname}" />' + ' 님 환영합니다.';
           document.getElementById('indexDotoriImg').style.display = 'inline-block';
        
        } else {
            linkLogout.style.display = 'none';
            divHome.style.display = 'block';
            divLogin.style.display = 'none';
            helloMessage.innerText = 'HelloWorld에 오신 걸 환영합니다.';
            document.getElementById('indexDotoriImg').style.display = 'none';
        }

        if (userDotoriElement) {
           if (userDotoriCnt.trim() !== '' && userDotoriCnt !== 'null') {
        	   userDotoriElement.innerHTML = '<img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"> ' + userDotoriCnt + ' 개';
               userDotoriElement.style.display = 'block';
           } else {
        	   userDotoriElement.innerHTML = '<img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"> 0 개';
               userDotoriElement.style.display = 'none';
           }
        }
        
     }
    window.onload = function () {
        showUserInfo();
        newContent();
     };
	</script>
	<script>
		let popup;
		let friendListContainer;
	
		document.addEventListener('DOMContentLoaded', function () {
		    // 초기에 한 번만 friendListContainer를 생성
		    friendListContainer = document.createElement("div");
		    friendListContainer.setAttribute("id", "friendListContainer");
	
		    document.getElementById('spanOnfriendCnt').addEventListener('click', function (e) {
		        console.log('Click Event - PageX:', e.pageX, 'PageY:', e.pageY);

		        // 클릭할 때마다 friendListContainer를 초기화
		        friendListContainer.innerHTML = '';

		        // newContent 함수를 호출하여 friendListContainer에 내용 추가
		        newContent();

		        // 클릭한 위치에 팝업을 표시
				
				friendListContainer.style.position = 'fixed';
				friendListContainer.style.visibility = 'visible';
				friendListContainer.style.left = '41%';
				friendListContainer.style.top = '23%';
				

		        // friendListContainer를 body에 추가
		        document.body.appendChild(friendListContainer);
		    });
		});
	function newContent() {
	    let userNickname = '<c:out value="${sessionScope.userId.userNickname}" />';
	    let newContent = document.getElementById('newContent');
	    let newFriend = document.getElementById('newFriend');
	    let todayCnt = document.getElementById('todayCnt');
	    let onFriendCnt = document.getElementById('spanOnfriendCnt');

	    if (userNickname == 'null' || userNickname == '') {
	        // 로그인되지 않은 경우에 대한 처리
	    } else {
	        let jsonData = {
	            "userNickname": userNickname
	        };

	        $.ajax({
	            method: 'POST',
	            url: "/index/member/getNew",
	            contentType: 'application/json',
	            data: JSON.stringify(jsonData)
	        }).done(function (json) {
	            newContent.innerText = json.newContent;
	            newFriend.innerText = json.newFriend;
	            todayCnt.innerText = json.todayCnt;
	            onFriendCnt.innerText = json.onFriendCnt;

	            if (json.friendList && json.friendList.length > 0) {
	                for (let i = 0; i < json.friendList.length; i++) {
	                    let friendElement = document.createElement("div");
	                    friendElement.innerText = json.friendList[i];
	                    friendListContainer.appendChild(friendElement);
	                }
	            }
	        });
	    }
	}

	function showFriendListPopup(friendList) {
	    // 팝업 엘리먼트 생성
	    let popup = document.createElement("div");
	    popup.setAttribute("class", "popup-container"); // .popup-container 클래스 추가
	    popup.setAttribute("id", "myPopup");

	    // 닫기 버튼 추가
	    let closeButton = document.createElement("span");
	    closeButton.innerHTML = "&times;"; // X 아이콘
	    closeButton.setAttribute("class", "close-button");
	    closeButton.addEventListener("click", function () {
	        document.body.removeChild(popup); // 팝업 닫기
	    });

	    popup.appendChild(closeButton); // 닫기 버튼을 팝업에 추가

	    // 친구 목록을 팝업에 추가
	    for (let i = 0; i < friendList.length; i++) {
	        let friendElement = document.createElement("div");
	        friendElement.innerHTML = friendList[i];
	        popup.appendChild(friendElement);
	    }

	    // 부모 container 생성
	    let parentContainer = document.createElement("div");

	    // 부모 container에 자식들을 추가
	    parentContainer.appendChild(popup);

	    // 문서에 부모 container 추가
	    document.body.appendChild(parentContainer);
	}

	function popupFunction() {
	    // friendListContainer의 클래스를 조작하여 show 클래스를 토글
	    var friendListContainer = document.getElementById("friendListContainer");
	    friendListContainer.classList.toggle("show");
	}
	</script>
   </body>
</html>