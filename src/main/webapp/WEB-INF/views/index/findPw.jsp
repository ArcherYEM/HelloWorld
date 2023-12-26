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
		<div style="text-align: center;" id="signUplogo">
			<img id="loginLogo" src="<c:url value="/resources/images/helloworldIconFull.png"/>">
		</div>
		<div style="text-align: center;" id="divUserInfo">
			<h2>비밀번호 찾기</h2>
			<form id="frmFindPw" method="GET" action="/member/afterFindPw">
				<label for="userEmail">아이디</label><br>
				<input type="text" id="userEmail" placeholder="아이디"> @ 
				<select id="mail" name="mail">
					<option value="gmail">gmail.com</option>
					<option value="naver">naver.com</option>
					<option value="nate">nate.com</option>
				</select>
				<br>
				<label for="userName">이름</label><br>
				<input type="text" id="userName" placeholder="userName"><br>
				<label for="userPhoneNum">핸드폰번호</label><br>
				<input type="text" id="userPhoneNum" placeholder="핸드폰번호"><br>
				<input style="witdh: 300px; height: 30px; margin-top: 10px" 
						type="button" id="btnFindPw" value="확인">
			</form>
			
		</div>
		
		<script>
			document.getElementById('btnFindPw').addEventListener('click', function() {
				document.getElementById('frmFindPw').submit();
			});
		</script>
		
	</body>
</html>