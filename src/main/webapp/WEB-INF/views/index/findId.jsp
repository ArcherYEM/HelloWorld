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
	<link  href="/resources/css/index/signUp.css" rel="stylesheet">
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
					<input type="text" id="userName" placeholder="이름" class="widthFull"><br>
				</div>
				<!-- <div class="find-tag">
					<label for="userBirth">생년월일</label><br>
					<input type="text" id="userBirth" placeholder="ex)19940830" class="widthFull">
				</div> -->
				<div class="find-tag">
					<label for="userPhone">연락처</label><br>
					<input type="text" id="userPhone" placeholder="ex)01012341234" class="widthFull">
				</div>
				
				<div class="find-btn">
					<form action="/index/member/home" method="GET">
						<input type="submit" value="취소"> 
					</form>
					<form action="" method="POST">
						<input type="submit" value="찾기"> 
					</form>
					<button id="btnSubmit">찾기</button>
				</div>
				
	  	</div>
	  	
	  	 <form id="frm1" action="/index/member/afterFindId" method="POST">
	  	 	<input id="hiddenUserName" type="hidden" name="userName">
	  	 	<input id="hiddenUserPhone" type="hidden" name="userPhone">
	  	 </form>
	  </div>
		  	
	 	<div class="grid-item"></div>  
	</div>
	
	<script>
		document.getElementById('btnSubmit').addEventListener('click',function(){
			document.getElementById('hiddenUserName').value = document.getElementById('userName').value;
			document.getElementById('hiddenUserPhone').value = document.getElementById('userPhone').value;
			
			document.getElementById('frm1').submit();
		});
	</script>
</body>