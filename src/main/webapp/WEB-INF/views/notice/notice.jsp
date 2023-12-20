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
				<img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
			</div>
			<div>
				<h2 style="font-weight: bold;">공지사항</h2>
			</div>
			<div class="divNoticeBar">
				<span class="noticeNum">번호</span>
				<span class="noticeTitle">제목</span>
				<span class="noticeCDate">등록일</span><br>
			</div>
			<div class="divNoticeList">
			
				<p>1. 첫번째 테스트 공지사항입니다.(일단 보이기로 p태그사용함)      23.12.18</p>
					<br>
				<p>2. 두번째 테스트 공지사항입니다.(일단 보이기로 p태그사용함)      23.12.18</p>
					<br>
				<p>3. 세번째 테스트 공지사항입니다.(일단 보이기로 p태그사용함)      23.12.18</p>
					<br>
				<p>4. 네번째 테스트 공지사항입니다.(일단 보이기로 p태그사용함)      23.12.18</p>
					<br>
				<p>5. 다섯번째 테스트 공지사항입니다.(일단 보이기로 p태그사용함)      23.12.18</p>
					<br>
					
				<input type="button" class="btnNotice" id="btnDelete" value="삭제">
				<input type="button" class="btnNotice" id="btnWrite" value="등록">
			</div>
		</div>
		
		<script>
		document.getElementById('btnWrite').addEventListener('click', function() {
			location.href = '/notice/noticeWrite';
		});
		</script>
	</body>
</html>