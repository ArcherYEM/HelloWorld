<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
   <head>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afa149d5091d552ae811a96e9423ecce"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afa149d5091d552ae811a96e9423ecce&libraries=services,clusterer,drawing"></script>
      <meta charset="UTF-8">
      <title>헬로월드</title>
      <link  href="/resources/css/index/main.css" rel="stylesheet">
      <link  href="/resources/css/index/map.css" rel="stylesheet">
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
					<span id="userDotoriCnt">${dotori}</span>개
				</h5>
				<a href="<c:url value='/store/minimiView'/>" class="index-a-store">상점</a>
				<a href="<c:url value='/notice/noticeView'/>" class="index-a-notice">공지사항</a>
				<a href="<c:url value='/index/mapView'/>" class="index-a-map">찾아오는 길</a>
				<a id="linkLogout" href="<c:url value='/index/member/logout' />" class="index-a-logout">로그아웃</a>
			</div>
		</div>
		<div id="divHiUser">
			<p class="hello-message" id="helloMessage">
				HelloWorld 에 오신 걸 환영합니다.
			</p>
		</div>
<!--       작업시점 -->
		<div class="map-frame">
			<div id="map"></div>
			<p>
				<button class="map-rocation" onclick="setBounds()">
					Core 위치로 돌아가기
				</button> 
			</p>
		</div>
<!-- 		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afa149d5091d552ae811a96e9423ecce"></script> -->
<!-- 		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=afa149d5091d552ae811a96e9423ecce&libraries=services,clusterer,drawing"></script> -->
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(37.659937, 126.770906),
				level: 3
			};
			var map = new kakao.maps.Map(container, options);
			
			var points = [
			    new kakao.maps.LatLng(37.659937, 126.770906)
			];
	
			var bounds = new kakao.maps.LatLngBounds();    
	
			var i, marker;
			for (i = 0; i < points.length; i++) {
			    marker =     new kakao.maps.Marker({ position : points[i] });
			    marker.setMap(map);
			    
			    bounds.extend(points[i]);
			}
	
			function setBounds() {
			    map.setBounds(bounds);
			}
			
			marker.setMap(map);
			var iwContent = 
					'<a href="#" class="map-find" onclick="openKakaoMap(); return false;" style="margin-left: 30px; color: red; font-weight: bold; text-align: center;" target="_blank">Core 길찾기</a>',
			    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667);

			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			infowindow.open(map, marker); 
			
			function openKakaoMap() {
			    window.open("https://map.kakao.com/link/to/Core%20팀 만나러가기!,37.659937,126.770906", "KakaoMap", "width=1200, height=720");
			}
		</script>
<!--       작업종점 -->
    </div>
	<div class="bottom-fix">
		<hr>
		<h1>team core</h1>
      </div>
	<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
	<script>
    // Ajax 유저 로그인
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
   </body>
</html>