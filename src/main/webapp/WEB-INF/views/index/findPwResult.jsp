<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link  href="/resources/css/index/main.css" rel="stylesheet">
	<link  href="/resources/css/index/signUp.css" rel="stylesheet">
	<link  href="/resources/css/index/find.css" rel="stylesheet">
	<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
	<title>헬로월드</title>
</head>
	
<body>
	<div class="grid-container">
	  <div class="grid-item"></div>
	  
	  <div class="grid-item">
	  	<div id="divUserInfo">
			<img class="findId-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
			<div class="findId-title">비밀번호 변경</div>
			<div class="find-tag">
			  	<label for="userPassword">새 비밀번호</label><br>
				<input type="password" id="userPassword" placeholder="새 비밀번호를 입력하세요." class="widthFull" oninput="checkPasswordMatch()"><br>
			</div>
			<div class="find-tag">
				<div class="pw-group">
					<div class="pw-left">
						<label for="userPassword2">비밀번호 확인</label>
					</div>
					<div class="pw-right">
						<span id="passwordMatchMessage"></span>
					</div>
				</div>
				<input type="password" id="userPassword2" placeholder="" class="widthFull" oninput="checkPasswordMatch()">
			</div>
				
				
				<div class="find-btn">
					<button id="btnCancle">취소</button>
					<button id="btnSubmit">확인</button>
				</div>
				
	  	</div>
	  </div>
		  	
	 <div class="grid-item"></div>  
	 	
	 <form id="frm1" action="/index/member/findPw" method="POST">
	  	<input id="hiddenUserId" type="hidden" name="userId">
	  	<input id="hiddenNewPw" type="hidden" name="newPw">
	 </form>
	</div>
	
	<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
	<script>
	
	$(function(){
		let result = '${updateResult}';
		let resultmsg = '' + '${msg}';
		if(result == 0 && result != ''){
			alert(resultmsg);
			location.href = "<c:url value='/index/member/findPwView'/>";
		}else if(result == 1 && result != ''){
			alert(resultmsg);
			location.href = "<c:url value='/'/>";
		}
	});
	
	
	document.getElementById('btnSubmit').addEventListener('click',function(){
		document.getElementById('hiddenUserId').value = "${findId}";
		document.getElementById('hiddenNewPw').value = document.getElementById('userPassword').value;
		document.getElementById('frm1').submit();
		
	});
	
	function checkPasswordMatch() {
	    var password = document.getElementById('userPassword').value;
	    var confirmPassword = document.getElementById('userPassword2').value;

	    if (password === confirmPassword) {
	        document.getElementById('passwordMatchMessage').innerHTML = '<span style="color: #008000;">비밀번호가 일치합니다.</span>';
	    } else {
	        document.getElementById('passwordMatchMessage').innerHTML ='<span style="color: red;">비밀번호가 일치하지 않습니다.</span>';
	    }
	}
	
	$('#btnCancle').on('click',function(){
		location.href = "<c:url value='/index/member/home'/>";
	});
	</script>
</body>