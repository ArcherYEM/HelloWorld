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
		<div style="text-align: center;" id="divUserInfo">
			<h2>아이디 찾기</h2>
			<form id="frmFindId" method="POST" action="/member/afterFindId">
				<label for="userName">이름</label><br>
				<input type="text" id="userName" placeholder="이름"><br>
				<label for="userName">생년월일</label><br>
				<input type="text" id="userName" placeholder="생년월일"><br>
				<label for="userPhoneNum">핸드폰번호</label><br>
				<input type="text" id="userPhoneNum" placeholder="핸드폰번호"><br>
				<input style="witdh: 300px; height: 30px; margin-top: 10px" 
						type="button" id="btnFindUp" value="찾기">
			</form>
			
		</div>
		
		<script>
			document.getElementById('btnFindUp').addEventListener('click', function() {
				document.getElementById('frmFindId').submit();
			});
		</script>
		
	</body>
</html>