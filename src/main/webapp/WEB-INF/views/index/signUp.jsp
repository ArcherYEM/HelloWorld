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
		<div class="grid-container">
		  <div class="grid-item"></div>
		  <div class="grid-item">
		  	<div id="divUserInfo">
		  		<div id="signUplogo">
					<img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
				</div>
				
			  	<h2 style="text-align : center">회원가입</h2>
			  	
				<form id="frmSignUp" method="POST" action="/main/member/signUpConfirm">
					<label for="userName">이름</label><br>
					<input type="text" id="userName" name="userName" placeholder="이름" class="widthFull"><br>
					<label for="userBirth">생년월일</label><br>
					<input type="text" id="userBirth" name="userBirth" placeholder="생년월일" class="widthFull">
					<select id="userGender" name="userGender">
						<option name="M" value="M" selected="selected">남자</option>
						<option name="F" value="F">여자</option>
					</select><br>
					<label for="userEmail">이메일주소</label><br>
					<input type="email" id="userEmail" name="userEmail" placeholder="이메일주소" class="widthFull"><br>
					<label for="userPassword">비밀번호</label><br>
					<input type="password" id="userPassword" name="userPassword" placeholder="비밀번호" class="widthFull"><br>
					<label for="userPassword2">비밀번호 확인</label><br>
					<input type="password" id="userPassword2" name="userPassword2" placeholder="비밀번호" class="widthFull"><br>
					<label for="userNickName">닉네임</label><br>
					<input type="text" id="userNickname" name="userNickname" placeholder="닉네임" class="widthFull"><br>
					<label for="userPhone">핸드폰번호</label><br>
					<input type="text" id="userPhone" name="userPhone" placeholder="핸드폰번호" class="widthFull"><br>
					<textarea style="width: 100%; height: 200px; margin-top:20px;" value="안내문">개인정보수집동의</textarea>
					<br>
		
					 <input type="radio"  name="confirm" value="confirm"><label for="confirm">동의</label>
					 <input type="radio"  name="confirm" value="noConfirm"><label for="confirm">비동의</label><br>
					<br>
					<input style="width: 300px; height: 50px; " type="button" id="btnSignUp" value="회원가입">
				</form>
		  	</div>
			  	
		  </div>
		  <div class="grid-item"></div>  
		</div>
		

		
		<script>
			document.getElementById('btnSignUp').addEventListener('click', function() {
					document.getElementById('frmSignUp').submit();
			});
		</script>
	</body>
</html>