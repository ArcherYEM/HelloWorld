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
		
			<div style="display:flex; flex-direction: row; align-items: center;">
				<a href="<c:url value='/'/>"  style="width:20%">
					<img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
				</a>
				<ul>
					<li><a href="<c:url value='/store/minimiView'/>">상점</a></li>
					<li><a href="<c:url value='/notice/noticeView'/>">공지사항</a></li>
				</ul>
			</div>
			
			<div class="notice-default">
				<p>공지사항</p>
			</div>
			<div class="notice-info">
				<span>
					작성자:admin
				</span>
				<span class="notice-write-date">
					2023-12-06 16:58
				</span>
			</div>
			
			<div class="notice-info-group">
				<input class="notice-title" type="text" value="1. 첫번째 테스트 공지사항입니다." readonly>
				<p class="notice-info-content">
					첫번째 테스트 공지사항 글 내용부분 일단 p태그 사용하고 나중에 list로 가져와야함
				</p>
			</div>
			
			<form id="frmNotice" method="POST" action="">
				<div class="btn-container">
					<div class="btn-left">
						<input class="nd-btn-list" type="button" id="btnNoticeView" value="목록">					
					</div>
					<div class="btn-right">
						<input class="nd-btn-update" type="button" id="btnNoticeUpdate" value="수정">
						<input class="nd-btn-delete" type="button" id="btnNoticeDelete" value="삭제">				
					</div>
				</div>
			</form>
			
			<div class="bottom-fix">
				<hr>
				<h1>team core</h1>
			</div>
				
			</div>
		<script>
			document.getElementById('btnNoticeView').addEventListener('click', function() {
				location.href = '/notice/noticeView';
			});
		</script>
	</body>
</html>