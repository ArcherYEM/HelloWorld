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
	</head>
	
	<body>
		<button onclick="window.open('/helloworld/minihome/main', 'window_name', 'width=1200, height=750, location=no, status=no, scrollbars=yes');">미니홈피</button>
		
		<div style="display:flex; flex-direction: row;">
			<span>
				<img id="loginLogo" src="<c:url value="/resources/images/helloworldIconFull.png"/>">
				<input type="button" class="IndexPageTab" id="btnStore" value="상점">
				<input type="button" class="IndexPageTab" id="btnAnnouncement" value="공지사항">
			</span>
		</div>
		
		<div id="divHiUser">
			<h3 style="color: white; margin: 10px; font-size: 35px;"> 안녕하세요. 이주빈님!!</h3>
		</div>
		
		<div style="display:flex; flex-direction: row;">
			<div id="divMainMinimi">
				<span>
					<img id="mainMinimi" src="<c:url value="/resources/images/PepeIcon.gif"/>">
				</span>
			</div>
			<div id="divMainSlide">
				<span>
					<img id="mainSlideImg" src="<c:url value="/resources/images/mainSlideImg1.jpg"/>">
				</span>
			</div>
			
		</div>
		<div>
			<input type="button" class="mainBtn" id="btnGoMinihome" value="내 미니홈피">
			<input type="button" class="mainBtn" id="btnLogout" value="로그아웃">
		</div>
		<hr style="border: 2px solid black; margin-top: 200px;">
		<div id="divTeamInfo">
			<h1 style="margin-left: 50px">team core</h1>
		</div>
		
	</body>
</html>