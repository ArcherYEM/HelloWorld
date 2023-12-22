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
		<link  href="/resources/css/store.css" rel="stylesheet">
		<link  href="/resources/css/notice.css" rel="stylesheet">
		<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
	</head>
	<body>
	<div class="index-frame">
		<div style="display:flex; flex-direction: row; align-items: center;">
			<a href="<c:url value='/'/>"  style="width:20%"><img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>"></a>
			<ul>
				<li><a href="<c:url value='/store/minimiView'/>">상점</a></li>
				<li><a href="<c:url value='/notice/noticeView'/>">공지사항</a></li>
			</ul>
		</div>
		
			<div class="divNoticeBar">
				<span style="margin: 0 auto;">공지사항 등록</span>
			</div>
			<br>
			<div>
				<form id="frmNotice" method="POST" action="">
					<label for="noticeTitle">제목:  </label>
					<input type="text" style="width: 30%; margin-left: 30px;" id="noticeTitle" placeholder="제목을 입력하세요.">
					<br>
					<br>
					<textarea style="width:45%; height: 300px;" value="noticeContent">글 내용을 작성</textarea>
					<br>
					<input type="button" id="btnNoticeView" value="목록">
					<input type="button" id="btnNoticeWrite" value="작성">
				</form>
			</div>
		</div>
		<script>
			document.getElementById('btnNoticeWrite').addEventListener('click', function() {
				document.getElementById('frmNotice').submit();
			});
			document.getElementById('btnNoticeView').addEventListener('click', function() {
				location.href = '/notice/noticeView';
			});
		</script>
	</body>
</html>