<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link  href="/resources/css/main.css" rel="stylesheet">
	</head>
		
	<body style="background-color: white">
		<div style="text-align: center;" id="signUplogo">
			<img id="loginLogo" src="<c:url value="/resources/images/helloworldIconFull.png"/>">
		</div>
		<div style="text-align: center;" id="divAfterUserId">
			<h3>이주빈님의 아이디 입니다.</h3>
			<br>
			<h4>abc123@naver.com</h4>
			<br>
			<h3>이주빈님의 비밀번호 입니다.</h3>
			<br>
			<form id="frmRePw" method="GET" action="<c:url value="/" />">
				<label for="userPw">비밀번호</label><br>
				<input type="text" id="userPw" placeholder="비밀번호"><br>
				<label for="userPw2">비밀번호 확인</label><br>
				<input type="text" id="userPw2" placeholder="비밀번호"><br>
				<input type="button" id="btnRePw" value="변경하기">
			</form>
		</div>
		
		<script>
			document.getElementById('btnRePw').addEventListener('click', function() {
				alert('비밀변호가 변경되었습니다.');
				document.getElementById('frmRePw').submit();
			});
		</script>
	</body>
</html>