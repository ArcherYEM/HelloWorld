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
		
	<body>
		<div class="grid-container">
		  <div class="grid-item"></div>
		  <div class="grid-item">
		  	<div id="divUserInfo">
		  		<div id="signUplogo">
					<img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
				</div>
				
			  	<h2 style="text-align : center">회원가입</h2>
			  	
				<form id="frmSignUp" method="POST" action="/index/member/signUpConfirm">
					<label for="userName">이름</label><br>
					<input type="text" id="userName" name="userName" placeholder="이름" class="widthFull"><br>
					<label for="userBirth">생년월일</label><br>
					<input type="number" id="userBirth" name="userBirth" placeholder="생년월일 ex)19931013"
						   class="widthFull" oninput="checkBirthLength()">
					<div class="divGender">
						<label>성별 : </label>
						<input type="radio" id="userGenderM" name="userGender" value="M" checked><label for="userGenderM">남자</label>
						<input type="radio" id="userGenderF" name="userGender" value="F"><label for="userGenderF">여자</label><br>
					</div>
					<label for="userEmail">이메일주소</label><br>
					<input type="email" id="userEmail" name="userEmail" placeholder="이메일주소" class="widthFull"><br>
					<label for="userPassword">비밀번호</label><br>
					<input type="password" id="userPassword" name="userPassword" placeholder="비밀번호" class="widthFull" oninput="checkPasswordMatch()"><br>
					<label for="userPassword2">비밀번호 확인  </label><span id="passwordMatchMessage"></span><br>
					<input type="password" id="userPassword2" name="userPassword2" placeholder="비밀번호" class="widthFull" oninput="checkPasswordMatch()"><br>
					<div id="passwordMatchMessage"></div>
					<label for="userNickname">닉네임</label><br>
					<input type="text" id="userNickname" name="userNickname" placeholder="닉네임" class="widthFull"><br>
					<label for="userPhone">핸드폰번호</label><br>
					<input type="number" id="userPhone" name="userPhone" placeholder="핸드폰번호"
						   class="widthFull" oninput="checkPhoneForm()"><br>
					<textarea style="width: 100%; height: 200px; margin-top:20px;resize: none;" value="안내문">개인정보수집동의</textarea>
					<br>
					<div class="confirm-group">
					    <input type="radio" id="confirm" name="confirm" value="confirm" checked>
					    <label for="confirm">동의</label>
					
					    <input type="radio" id="noConfirm" name="confirm" value="noConfirm">
					    <label for="noConfirm">비동의</label>
					</div>
					<br>
					<input style="width: 100%; height: 50px; " type="button" id="btnSignUp" value="회원가입">
				</form>
		  	</div>
			  	
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
			  var regex = /^010\d{8}$/;
			  
			  if (userPhone.length === 11 && !regex.test(userPhone)) {
			    alert('입력하신 핸드폰 번호를 확인해주세요.');
			    
			    $('#userBirth').val(userBirth.slice(0, 10));
			  }
			}
			 
		</script>
	</body>
</html>