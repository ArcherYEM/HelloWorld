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
	<link  href="/resources/css/index/signUp.css" rel="stylesheet">
	<link  href="/resources/css/index/find.css" rel="stylesheet">
	<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
</head>
	
<body>
	<div class="grid-container">
	  <div class="grid-item"></div>
	  
	  <div class="grid-item">
	  	<div id="divUserInfo">
				<img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
				<div class="findId-title">
			  	비밀번호 변경
			  </div>
			  <div class="find-tag">
			  	<label for="userPassword">새 비밀번호</label><br>
					<input type="password" id="userPassword" placeholder="새 비밀번호를 입력하세요." class="widthFull" oninput="checkPasswordMatch()"><br>
			  </div>
				<div class="find-tag">
					<label for="userPassword2">비밀번호 확인</label><span id="passwordMatchMessage"></span><br>
					<input type="password" id="userPassword2" placeholder="" class="widthFull" oninput="checkPasswordMatch()">
				</div>
				
				
				<div class="find-btn">
					<form action="/index/member/home" method="GET">
						<input type="submit" value="취소"> 
					</form>
					<form action="<c:url value='/'/>" method="GET"> 
						<input type="submit" value="변경"> 
					</form>
				</div>
				
	  	</div>
	  </div>
		  	
	 	<div class="grid-item"></div>  
	</div>
	
	<script>
	function checkPasswordMatch() {
	    var password = document.getElementById('userPassword').value;
	    var confirmPassword = document.getElementById('userPassword2').value;

	    if (password === confirmPassword) {
	        document.getElementById('passwordMatchMessage').innerHTML = '<span style="color: #008000;">비밀번호가 일치합니다.</span>';
	        /* document.getElementById('btnSignUp').disabled = false; */
	    } else {
	        document.getElementById('passwordMatchMessage').innerHTML ='<span style="color: red;">비밀번호가 일치하지 않습니다.</span>';
	        /* document.getElementById('btnSignUp').disabled = true; */
	    }
	}
	</script>
</body>