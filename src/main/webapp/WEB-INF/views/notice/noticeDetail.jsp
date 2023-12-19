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
		<link  href="/resources/css/store.css" rel="stylesheet">
	</head>
	
	<body>
		<div class="divNotice">
			<div>
				<img id="loginLogo" src="<c:url value="/resources/images/helloworldIconFull.png"/>">
			</div>
			<div class="divNoticeBar">
				<span style="margin: 0 auto;">공지사항</span>
			</div>
			<br>
			<div>
				<form id="frmNotice" method="POST" action="">
					<label for="noticeTitle">제목:  </label>
					<p>1. 첫번째 테스트 공지사항입니다.</p>
					<br>
					<br>
					<p> 첫번째 테스트 공지사항 글 내용부분 일단 p태그 사용하고 나중에 list로 가져와야함</p>
					<br>
					<input type="button" id="btnDNoticeView" value="목록">
					<input type="button" id="btnDNoticeUpdate" value="수정">
					<input type="button" id="btnDNoticeDelete" value="삭제">
				</form>
			</div>
		</div>
		
		<script>
			document.getElementById('btnDNoticeView').addEventListener('click', function() {
				location.href = '/notice/noticeView';
			});
		</script>
	</body>
</html>