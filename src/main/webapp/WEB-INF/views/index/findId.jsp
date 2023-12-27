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
	</head>
		
	<body style="background-color: white">
		<div class="grid-container">
		  <div class="grid-item"></div>
		  <div class="grid-item">
		  	<div id="divUserInfo">
		  		<div id="signUplogo">
					<img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
				</div>
				
			  	<h2 style="text-align : center">아이디 찾기</h2>
			  	
				<form id="frmFindId" class="frmFindId" method="POST" action="/index/member/signUpConfirm">
					<label for="userName">이름</label><br>
					<input type="text" id="userName" name="userName" placeholder="이름" class="widthFull"><br>
					<label for="userBirth">생년월일</label><br>
					<input type="text" id="userBirth" name="userBirth" placeholder="생년월일 ex)19931013" class="widthFull">
					<label for="userPhone">핸드폰번호</label><br>
					<input type="text" id="userPhone" name="userPhone" placeholder="핸드폰번호" class="widthFull"><br>
					
					<input type="button" value="확인" class="confirm-btn">
					<input type="button" value="취소" class="cancel-btn">
				</form>
		  	</div>
			  	
		  </div>
		  <div class="grid-item"></div>  
		</div>
		
	</body>
</html>