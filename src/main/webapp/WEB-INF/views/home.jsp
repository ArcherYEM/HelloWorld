<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HelloWorld</title>
		<link  href="/resources/css/main.css" rel="stylesheet">
	</head>
	<body>
		<button onclick="window.open('/helloworld/minihome/main', 'window_name', 'width=1200px, height=720px, location=no, status=no, scrollbars=yes');">미니홈피</button>

		<div style="display:flex; flex-direction: row;">
			<span>
				<img id="loginLogo" src="<c:url value="/resources/images/helloworldIconFull.png"/>">
				<input type="button" class="IndexPageTab" id="btnStore" value="상점">
				<input type="button" class="IndexPageTab" id="btnAnnouncement" value="공지사항">
			</span>
		</div>
		
		<div id="divHiUser">
			<h3 style="color: white; margin: 10px; font-size: 20px;"> 안녕하세요. 이주빈님!!</h3>
		</div>
		
		<div style="display:flex; flex-direction: row;">
			<div id="divLogin">
				<form style="text-align: center;" id="frmLogin" method="POST" action="">
					<label for="userEmail">아이디: </label>
					<input type="text" id="userEmail" name="userEmail" placeholder="아이디"><br>
					<br>
					<label for="userPw">비밀번호: </label>
					<input type="text" id="userPw" name="userPw" placeholder="비밀번호"><br>
					<br>
					<input type="button" style="width: 200px" id="btnLogin" value="로그인"><br>
					<br>
					<input type="button" style="width: 200px" id="btnNotice" value="공지사항"><br>
					<br>
					<a style="margin: 30px;" href="/member/signUp">회원가입</a>
					<a href="/member/findId">아이디</a> / 
					<a href="/member/findPw">비밀번호 찾기</a>
				</form>
			</div>
			<div id="divMainSlide">
				<span>
					<img id="mainSlideImg" src="<c:url value="/resources/images/mainSlideImg1.jpg"/>">
				</span>
			</div>
			
		</div>
		
		<hr style="border: 2px solid black; margin-top: 50px;">
		<div id="divTeamInfo">
			<h1 style="margin-left: 50px">team core</h1>
		</div>
		
		<script>
			document.getElementById('btnStore').addEventListener('click', function() {
				location.href = '/store/minimiView';
			});
	</script>
	</body>
</html>
