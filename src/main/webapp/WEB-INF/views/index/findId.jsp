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
	<link  href="/resources/css/index/find.css" rel="stylesheet">
	<link  href="/resources/css/index/signUp.css" rel="stylesheet">
	<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
	<title>Hello World</title>
</head>
	
<body>
	<div class="grid-container">
	  <div class="grid-item"></div>
	  
	  <div class="grid-item">
	  	<div id="divUserInfo">
				<img class="index-header-logo otherPage-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
				<div class="findId-title">
			  		아이디 찾기
			  </div>
			  <div class="find-tag">
			  	<label for="userName">이름</label><br>
					<input type="text" id="userName" placeholder="이름" class="widthFull"><br>
				</div>
				<!-- <div class="find-tag">
					<label for="userBirth">생년월일</label><br>
					<input type="text" id="userBirth" placeholder="ex)19940830" class="widthFull">
				</div> -->
				<div class="find-tag">
					<label for="userPhone">연락처</label><br>
					<input type="text" id="userPhone" placeholder="ex)01012341234" class="widthFull">
				</div>
				
				<div class="find-btn">
					
					<!-- <form action="/index/member/home" method="GET">
						<input type="submit" value="취소"> 
					</form>
					<form action="" method="POST">
						<input type="submit" value="찾기"> 
					</form> -->
					<button id="btnCancle">취소</button>
					<button id="btnSubmit">찾기</button>
				</div>
				
	  	</div>
	  	
	  	 <form id="frm1" action="/index/member/afterFindId" method="POST">
	  	 	<input id="hiddenUserName" type="hidden" name="userName">
	  	 	<input id="hiddenUserPhone" type="hidden" name="userPhone">
	  	 </form>
	  </div>
		  	
	 	<div class="grid-item"></div>  
	</div>
	
	<script>
		
		document.getElementById('btnSubmit').addEventListener('click',function(){
			/* let phonePattern = /[\s-]/g; 공백 및 하이픈 입력 확인 */
			let phonePattern = /^\d+$/;
			let numPattern = /\d+/;
			let namePattern = /^[가-힣a-zA-Z]+$/i;
			
			let phoneNum = document.getElementById('userPhone').value;
			let userName = document.getElementById('userName').value;
			
			if(phoneNum.length<1 || userName.length<1){
				alert('모든 내용을 입력해주세요.');
			}else if(!phoneNum.match(phonePattern)){
				alert('숫자만 입력해주세요.');
			}else if(phoneNum.length > 11 || phoneNum.length < 10){
				alert('입력하신 번호를 확인해주세요.');
			}else{
				document.getElementById('hiddenUserPhone').value = phoneNum;
			}
			
			if(userName.length <2){
				alert('입력하신 이름을 확인해주세요.');
			}else if(userName.match(numPattern)){
				alert('이름은 숫자를 포함할 수 없습니다.');
			}else{
				document.getElementById('hiddenUserName').value = userName;
			}
			
			document.getElementById('frm1').submit();
		});
		
		$('btnCancle').on('click',function(){
			location.href = "<c:url value='/index/member/home'/>";
		});
	</script>
</body>