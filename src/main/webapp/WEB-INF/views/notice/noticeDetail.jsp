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
			<!-- 시점 -->
			<div class="noticeDetail-container">
				<div class="notice-default">
					<p>공지사항</p>
				</div>
				<div class="noticeDetail-content-container">
					
					<div class="notice-info-group">
						<input class="notice-title" type="text" value="1. 첫번째 테스트 공지사항입니다." readonly>
						<div class="notice-info">
								작성자 : admin
							<div class="notice-write-date">
								2023-12-06 16:58
							</div>
						</div>
						<div class="notice-info-content">
							동해물과 백두산이 마르고 닳도록<br>
							하느님,부처님,예수님,마리아님이 보우하사 우리나라 만세.<br>
							무궁화 삼천리 화려강산<br>
							 대한사람 대한으로 길이 보전하세.<br>
							<br>
							남산위에 저 소나무 철갑을 두른 듯<br>
							바람서리 불변함은 우리 기상일세.<br>
							무궁화 삼천리 화려강산<br>
							대한사람 대한으로 길이 보전하세.<br>
							<br>
							가을 하늘 공활한데 높고 구름 없이<br>
							밝은 달은 우리 가슴 일편단심일세.<br>
							무궁화 삼천리 화려강산<br>
							대한사람 대한으로 길이 보전하세.<br>
							<br>
							이 기상과 이 맘으로 충성을 다하여<br>
							괴로우나 즐거우나 나라 사랑하세.<br>
							무궁화 삼천리 화려강산<br>
							대한사람 대한으로 길이 보전하세.<br>
						</div>
					</div>
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
			</div>
			<!-- 종점 -->
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