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
		<link  href="/resources/css/index/main.css" rel="stylesheet">
		<link  href="/resources/css/index/store.css" rel="stylesheet">
		<link  href="/resources/css/index/notice.css" rel="stylesheet">
		<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
	</head>
	<body>
	
		<div class="index-frame">
		
			<div class="divIndexMenu index-header">
		      <div class="index-header-left">
		         <a class="logoATag" href="<c:url value='/'/>">
		           <img class="index-header-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
		         </a>
		       </div>
		       <div class="index-header-right">
		            <a href="<c:url value='/store/minimiView'/>" class="index-a-store">상점</a>
		            <a href="<c:url value='/notice/noticeView'/>" class="index-a-notice">공지사항</a>
		       </div>
	      </div>
			
			<div class="notice-write">
				<p>공지사항 글쓰기 </p>
			</div>
			
			<div class="notice-write-group">
				<input class="notice-write-title" id="noticeTitle" type="text" placeholder="제목을 입력하세요." form = "frmNotice" name="title">
				<textarea class="notice-write-content" id="noticeContent" placeholder="내용을 입력하세요." form = "frmNotice" name="content"></textarea>
			</div>
			
			<form>
				<div class="btn-container">
					<input class="nw-btn-list" type="button" id="btnNoticeView" value="목록">
					<input class="nw-btn-write" type="button" id="btnNoticeWrite" value="작성">
				</div>
			</form>
			
			
			<form id="frmNotice" method="POST" action="/notice/write">
				<input type="hidden" type="text" name="title" id="noticeHiddenTitle" >
				<input type="hidden" type="text" name="content" id="noticeHiddenContent" >
				<input type="hidden" type="text" name="userNickname" id="noticeUserNickname" value="<c:out value='${userNickname }'/>">
			</form>
			
			<div class="bottom-fix">
				<hr>
				<h1>team core</h1>
			</div>
				
			</div>
		<script>
			document.getElementById('btnNoticeWrite').addEventListener('click', function() {
				document.getElementById('noticeHiddenTitle').value = document.getElementById('noticeTitle').value;
				document.getElementById('noticeHiddenContent').value = document.getElementById('noticeContent').value;
				
				console.log(document.getElementById('noticeUserNickname').value);
				document.getElementById('frmNotice').submit();
			});
			document.getElementById('btnNoticeView').addEventListener('click', function() {
				location.href = '/notice/noticeView';
			});
		</script>
	</body>
</html>