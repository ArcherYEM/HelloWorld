<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HelloWorld</title>
		<link  href="/resources/css/main.css" rel="stylesheet">
		<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
		<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="0">
	</head>
	<body>
		<div style="display:flex; flex-direction: row; align-items: center;">
			<a href="<c:url value='/'/>"  style="width:20%"><img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>"></a>
			<ul>
				<li><a href="<c:url value='/store/minimiView'/>">상점</a></li>
				<li><a href="<c:url value='/notice/noticeView'/>">공지사항</a></li>
			</ul>
		</div>
		
		<div id="divHiUser">
		    <c:choose>
		        <c:when test="${sessionScope.userId != null}">
		            <h3 style="color: white; margin: 10px; font-size: 35px;">
		             	   안녕하세요. ${sessionScope.userId.userEmail}님!!
		            </h3>
		        </c:when>
		        <c:otherwise>
		            <h3 style="color: white; margin: 10px; font-size: 35px;">
		              	  안녕하세요. HelloWorld에 오신 걸 환영합니다.
		            </h3>
		        </c:otherwise>
		    </c:choose>
		</div>
		
		<div style="display:flex; flex-direction: row;">
			<div id="divLogin">
				<div >
					<form style="text-align: center;" id="frmLogin" method="POST" action="/main/member/login">
						<!-- <label for="userEmail">아이디: </label> -->
						<input type="email" id="userEmail" name="userEmail" placeholder="Email"><br>
						<br>
						<!-- <label for="userPw">비밀번호: </label> -->
						<input type="password" id="userPw" name="userPassword" placeholder="Password"><br>
						<br>
						<input type="button" id="btnLogin" value="로그인"><br>
						<br>
						<!-- 슬라이드 이미지 추가하면 주석 풀기 <input type="button" style="width: 200px" id="btnNotice" value="공지사항"><br>
						<br> -->
					</form>
				</div>
				<div >
					<a href="/main/member/signUp" style="margin-right:50px">회원가입</a>
					<a href="/main/member/findId">아이디</a>/ 
					<a href="/main/member/findPw">비밀번호 찾기</a>
				</div>
				
			</div>
			
			<div id="divMainSlide">
				<div class="slideshow-container">

				<div class="mySlides fade">
				  <img src="<c:url value="/resources/images/mainSlideImg1.jpg"/>" style="width:100%">
				</div>
				
				<div class="mySlides fade">
				  <img src="<c:url value="/resources/images/sildeImg1.png"/>" style="width:100%">
				</div>
				
				<%-- <div class="mySlides fade">
				  <img src="<c:url value="/resources/images/mainSlideImg1.jpg"/>" style="width:100%">
				</div> --%>
			
				</div>
				<br>
				
				<div style="text-align:center">
				  <span class="dot"></span> 
				  <span class="dot"></span> 
				  <!-- <span class="dot"></span>  -->
				</div>
			</div>
			
		</div>
		
		<hr style="border: 2px solid black; margin-top: 50px;">
		<div id="divTeamInfo">
			<h1 style="margin-left: 50px">team core</h1>
			<a href="/mnHome/mainView" target="_blank" style="width:1200px; height:720px;">미니홈피 가기</a>
			<!-- 
			★★★추후 새창으로 변환 예정★★★
			<button id="targetElement" 
				onclick="window.open('/helloworld/minihome/main'
						, 'window_name', 'width=1200px, height=720px, location=no, status=no, scrollbars=yes');">미니홈피</button>
			 -->
		</div>
		
		<script>
			document.getElementById('btnLogin').addEventListener('click', function() {
				document.getElementById('frmLogin').submit();
			});
			
			<c:if test="${loginResult == 0}">
           		 alert("로그인에 실패했습니다. 다시 시도해주세요.");
      		</c:if>
			
			let slideIndex = 0;
			showSlides();
	
			function showSlides() {
			  let i;
			  let slides = document.getElementsByClassName("mySlides");
			  let dots = document.getElementsByClassName("dot");
			  for (i = 0; i < slides.length; i++) {
			    slides[i].style.display = "none";  
			  }
			  slideIndex++;
			  if (slideIndex > slides.length) {slideIndex = 1}    
			  for (i = 0; i < dots.length; i++) {
			    dots[i].className = dots[i].className.replace(" active", "");
			  }
			  slides[slideIndex-1].style.display = "block";  
			  dots[slideIndex-1].className += " active";
			  setTimeout(showSlides, 2000); // Change image every 2 seconds
			}
	</script>
	
	</body>
</html>
