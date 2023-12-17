<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상점</title>
		<link  href="/resources/css/main.css" rel="stylesheet">
	</head>
	
	<body>
		<div style="display:flex; flex-direction: row;">
			<div>
				<img id="loginLogo" src="<c:url value="/resources/images/helloworldIconFull.png"/>">
			</div>
			<div>
				<h5>내 도토리: 1234개</h5>
				<a href="<c:url value="/helloworld/minihome/main" />">내 미니홈피</a>
				<a href="<c:url value="/" />">로그아웃</a>
			</div>
		</div>
		
		<div id="divHiUser">
			<a class='storeAtag' href="">미니미</a>
			<a class='storeAtag' href="">스킨</a>
			<a class='storeAtag' href="">메뉴</a>
			<a class='storeAtag' href="">도토리</a>
			<a class='storeAtag' href="">bgm</a>
		</div>
		
		<div style="text-align:center; flex-direction: row;" >
			<div>
				<img class="storeMinimi" src="<c:url value="/resources/images/icon/minimi/slimeIcon.gif" />">
				<img class="storeMinimi" src="<c:url value="/resources/images/icon/minimi/orangeMushroomIcon.gif" />">
				<img class="storeMinimi" src="<c:url value="/resources/images/icon/minimi/balokIcon.gif" />">
				<img class="storeMinimi" src="<c:url value="/resources/images/icon/minimi/grupinIcon.gif" />">
				<img class="storeMinimi" src="<c:url value="/resources/images/icon/minimi/duckyFamilyIcon.gif" />">
			</div>
			
			<div>
				<img class="storeMinimi" src="<c:url value="/resources/images/icon/minimi/horangIcon.gif" />">
				<img class="storeMinimi" src="<c:url value="/resources/images/icon/minimi/starPixieIcon.gif" />">
				<img class="storeMinimi" src="<c:url value="/resources/images/icon/minimi/greiIcon.gif" />">
				<img class="storeMinimi" src="<c:url value="/resources/images/icon/minimi/stonGolemIcon.gif" />">
				<img class="storeMinimi" src="<c:url value="/resources/images/icon/minimi/scubaPepeIcon.gif" />">
			</div>
		</div>
	</body>
</html>