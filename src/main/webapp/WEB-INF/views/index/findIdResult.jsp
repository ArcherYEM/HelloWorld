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
		
	<body style="background-color: white">
		<div style="text-align: center;" id="signUplogo">
			<img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
		</div>
		<div style="text-align: center;" id="divUserInfo">
			<p>양은모님의 아이디 입니다.</p>
			<p>DevYem@gmail.com</p>
			<div >
               <a href="/index/member/findId">아이디</a>/ 
               <a href="/index/member/findPw">비밀번호 찾기</a>
            </div>
			
			
		</div>
		
		<script>
			document.getElementById('btnFindUp').addEventListener('click', function() {
				document.getElementById('frmFindId').submit();
			});
		</script>
		
	</body>
</html>