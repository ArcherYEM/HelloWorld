<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hello World</title>
	<link  href="/resources/css/index/main.css" rel="stylesheet">
	<link  href="/resources/css/index/find.css" rel="stylesheet">
	<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
</head>
	
<body>
	<div class="grid-container">
	  <div class="grid-item"></div>
	  
	  <div class="grid-item">
	  	<div id="divUserInfo">
				<img class="index-header-logo otherPage-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
				<div class="findId-title">
			  	아이디 찾기
			  </div>
			  <div class="find-tag">
			  	<label for="userName">이름</label><br>
					<input type="text" id="userName"placeholder="이름" class="widthFull"><br>
				</div>
				<div class="find-tag">
					<label for="userBirth">생년월일</label><br>
					<input type="text" id="userBirth" placeholder="ex)19940830" class="widthFull">
				</div>
				
				<div class="find-btn">
					<form action="/index/member/home" method="GET">
						<input type="submit" value="취소"> 
					</form>
					<form action="아이디 찾은 화면 utl 넣을예정" method="POST">
						<input type="submit" value="찾기"> 
					</form>
				</div>
				
	  	</div>
	  </div>
		  	
	 	<div class="grid-item"></div>  
	</div>
</body>