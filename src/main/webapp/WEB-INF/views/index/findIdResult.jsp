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
		<link  href="/resources/css/index/findIdResult.css" rel="stylesheet">
	</head>
		
	<body>
		
		<div class="grid-container container1">
		  <div class="grid-item"></div>
		  <div class="grid-item">
		  	<div class="container2">
		  		<div id="signUplogo">
			  		 <a href="<c:url value='/'/>">
						<img id="mainLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
			  		 </a>
				</div>
				<div id="divFindIdResult">
					<p class="p-userInfo">양은모님의 아이디 입니다.</p>
					<p class="p-userEmail">DevYem@gmail.com</p>
					<div >
		               <a href="<c:url value='/'/>">로그인</a> / 
		               <a href="<c:url value='/index/member/findPw'/>">비밀번호 찾기</a>
		            </div>
					
				</div>
			  	
		  	</div>
			  	
		  </div>
		  <div class="grid-item"></div>  
		</div>
		
		
		
	</body>
</html>