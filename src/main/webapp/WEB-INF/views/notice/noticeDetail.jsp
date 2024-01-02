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
	      
			<div class="noticeDetail-container">
				<div class="notice-default">
					<p>공지사항</p>
				</div>
				<div class="noticeDetail-content-container">
					
					<div class="notice-info-group">
						<input class="notice-title" type="text" value="${list[0].seq }. ${list[0].title}" readonly>
						<div class="notice-info">
								작성자 : ${list[0].writer }
							<div class="notice-write-date">
								${list[0].date }
							</div>
						</div>
						<div class="notice-info-content">
							${list[0].content }
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