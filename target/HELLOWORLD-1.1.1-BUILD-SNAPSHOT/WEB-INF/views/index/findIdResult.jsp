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
					<p class="p-userInfo"><c:out value="${userName }"/>님의 아이디 입니다.</p>
					<p class="p-userEmail"><c:out value="${findId }"/></p>
					<div class="after-link">
		               <a href="<c:url value='/'/>">로그인</a> / 
		               <a href="<c:url value='/index/member/findPw'/>">비밀번호 찾기</a>
		            </div>
					
				</div>
			  	
		  	</div>
			  	
		  </div>
		  <div class="grid-item"></div>  
		</div>
		
	<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
	<script>
		$(function(){
			if(${resultCode} == 0){
				alert('${msg}');
				location.href = "<c:url value='/index/member/findId'/>";
			}
		});
	</script>
	</body>
</html>