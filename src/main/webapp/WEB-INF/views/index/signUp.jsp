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
		<link  href="/resources/css/main.css" rel="stylesheet">
	</head>
		
	<body style="background-color: white">
		<div style="text-align: center;" id="signUplogo">
			<img id="loginLogo" src="<c:url value="/resources/images/helloworldIconFull.png"/>">
		</div>
		<div style="text-align: center;" id="divUserInfo">
			<h2>회원가입</h2>
			<form id="frmSignUp" method="POST" action="/main/member/signUpConfirm">
				<label for="userName">이름</label><br>
				<input type="text" id="userName" name="userName" placeholder="이름"><br>
				<label for="userBirth">생년월일</label><br>
				<input style="margin-left: 53px;" type="text" id="userBirth" name="userBirth" placeholder="생년월일">
				<select id="userGender" name="userGender">
					<option name="M" value="M" selected="selected">남자</option>
					<option name="F" value="F">여자</option>
				</select><br>
				<label for="userEmail">이메일주소</label><br>
				<input type="text" id="userEmail" name="userEmail" placeholder="이메일주소"><br>
				<label for="userPassword">비밀번호</label><br>
				<input type="text" id="userPassword" name="userPassword" placeholder="비밀번호"><br>
				<label for="userPassword2">비밀번호 확인</label><br>
				<input type="text" id="userPassword2" name="userPassword2" placeholder="비밀번호"><br>
				<label for="userNickName">닉네임</label><br>
				<input type="text" id="userNickname" name="userNickname" placeholder="닉네임"><br>
				<label for="userPhone">핸드폰번호</label><br>
				<input type="text" id="userPhone" name="userPhone" placeholder="핸드폰번호"><br>
				<textarea style="width: 50%; height: 200px;" value="안내문">개인정보수집동의</textarea>
				<br>
				<input type="radio" class="confirm" value="confirm">동의
				<input type="radio" class="confirm" value="noConfirm">비동의
				<br>
				<input style="witdh: 300px; height: 50px; margin-top: 50px" type="button" id="btnSignUp" value="회원가입">
			</form>
		</div>
		
		<script>
			document.getElementById('btnSignUp').addEventListener('click', function() {
					document.getElementById('frmSignUp').submit();
			});
		</script>
	</body>
</html>