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
		<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
	</head>
		
	<body>
		<div class="grid-container">
		  <div class="grid-item"></div>
		  
		  <div class="grid-item">
		  	<div id="divUserInfo">
<!-- 		  		<div id="signUplogo"> -->
				<img class="index-header-logo otherPage-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
			</div>
				
			  	<h2 style="text-align : center">회원가입</h2>
			  	
				<form class="signUp-frame" id="frmSignUp" method="POST" action="/index/member/signUpConfirm">
					<div class="section">
						<label for="userName">이름</label><br>
						<input type="text" id="userName" name="userName" placeholder="이름" class="widthFull">
					</div>
					
					<div class="section">
						<label for="userBirth">생년월일</label>
						<input type="number" id="userBirth" name="userBirth" placeholder="생년월일 ex)19931013"
							   class="widthFull" oninput="checkBirthLength()">
					</div>
					
					<div class="section">
						<div class="divGender">
							<label>성별 : </label>
							<input type="radio" id="userGenderM" name="userGender" value="M" checked>
							<label for="userGenderM">남자</label>
							<input type="radio" id="userGenderF" name="userGender" value="F">
							<label for="userGenderF">여자</label><br>
						</div>
					</div>
					
					<div class="section">
						<label for="userEmail">이메일주소</label>
						<input type="button" id="btnEmailDuplcheck" value="중복체크"><br>
						<div class="MatchMessage" id="emailFormMessage"></div>
						<input type="email" id="userEmail" name="userEmail" placeholder="이메일주소" 
								class="widthFull" onblur="checkEmailForm()">
					</div>
					
					<div class="section">
						<label for="userPassword">비밀번호</label><br>
						<input type="password" id="userPassword" name="userPassword" placeholder="비밀번호" class="widthFull" oninput="checkPasswordMatch()">
					</div>
					
					<div class="section">
						<div class="divPwCheck">
							<label for="userPassword2">비밀번호 확인  </label><span id="passwordMatchMessage" class="MatchMessage"></span>
						</div>
						<input type="password" id="userPassword2" name="userPassword2" placeholder="비밀번호" class="widthFull" oninput="checkPasswordMatch()">
					</div>
					
					<div class="section">
						<label for="userNickname">닉네임</label>
						<input type="text" id="userNickname" name="userNickname" placeholder="닉네임" class="widthFull">
					</div>
					
					<div class="section">
						<label for="userPhone">핸드폰번호</label>
						<input type="number" id="userPhone" name="userPhone" placeholder="핸드폰번호"
							   class="widthFull" oninput="checkPhoneForm()">
					</div>
					
					<div class="section">
						<textarea style="width: 100%; height: 200px; margin-top:20px;resize: none;">개인정보수집동의</textarea>
					</div>
					
					<div class="section">
						<div class="confirm-group">
						    <input type="radio" id="confirm" name="confirm" value="confirm" checked>
						    <label for="confirm">동의</label>
						    <input type="radio" id="noConfirm" name="confirm" value="noConfirm">
						    <label for="noConfirm">비동의</label>
						</div>
					</div>
					
					<input style="width: 100%; height: 50px; " type="button" id="btnSignUp" value="회원가입">
				</form>
		  	</div>
			  	
		  <div class="grid-item"></div>  
		  </div>
		

		<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
		<script>
			document.getElementById('btnSignUp').addEventListener('click', function() {
				var confirmation = document.querySelector('input[name="confirm"]:checked');
		        
		        if (confirmation && confirmation.value === "noConfirm") {
		            alert("개인정보수집 약관에 동의하지 않았습니다.");
		            return;
		        }	
				
				document.getElementById('frmSignUp').submit();
			});						
			  
		  function checkPasswordMatch() {
			    var password = document.getElementById('userPassword').value;
			    var confirmPassword = document.getElementById('userPassword2').value;
	
			    if (password === confirmPassword) {
			        document.getElementById('passwordMatchMessage').innerHTML = '<span style="color: #008000;">비밀번호가 일치합니다.</span>';
			        document.getElementById('btnSignUp').disabled = false;
			    } else {
			        document.getElementById('passwordMatchMessage').innerHTML ='<span style="color: red;">비밀번호가 일치하지 않습니다.</span>';
			        document.getElementById('btnSignUp').disabled = true;
			    }
			}
			
		  function checkBirthLength() {
			  let userBirth = $('#userBirth').val();
			  
			  if (userBirth.length > 8) {
				  alert ('생년월일은 8자리를 초과할 수 없습니다.');
				  
				  $('#userBirth').val(userBirth.slice(0, 8));
			  };
		  };
		  
		  function checkPhoneForm() {
			    let userPhone = $('#userPhone').val();

			    if (userPhone.length > 11) {
			        alert('입력하신 핸드폰 번호를 확인해주세요.');
			        $('#userPhone').val(userPhone.slice(0, 11));
			        return;
			    }

			    if (userPhone.length >= 3 && userPhone.slice(0, 3) !== "010") {
			        alert('전화번호는 "010"으로 시작해야 합니다.');
			        $('#userPhone').val('');
			    }
			}
			
		  function checkEmailForm() {
			    var emailInput = document.getElementById('userEmail');
			    var emailFormMessage = document.getElementById('emailFormMessage');

			    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

			    if (!emailRegex.test(emailInput.value)) {
			    	emailFormMessage.innerHTML = '<span style="color: red;">올바른 이메일 주소를 입력하세요.</span>';
			    } else {
			    	emailFormMessage.innerHTML = '';
			    }
			}
		</script>
	</body>
</html>