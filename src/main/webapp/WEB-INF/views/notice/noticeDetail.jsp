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
							${list[0].content}
						</div>
					</div>
				</div>
				<form >
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
				
				<form id="noticeModify" method="post" action="/notice/modifyView">
					<input type="hidden" name="seq" id="hiddenSeq">
					<input type="hidden" name="title" id="hiddenTitle">
					<input type="hidden" name="writer" id="hiddenWriter">
					<input type="hidden" name="date" id="hiddenDate">
					<input type="hidden" name="content" id="hiddenContent">
				</form>
				<form id="deleteNotice" method="post" action="/notice/noticeDelete">
					<input type="hidden" name="seq" value="${list[0].seq }">
				</form>
			</div>
			<div class="bottom-fix">
				<hr>
				<h1>team core</h1>
			</div>
				
		</div>
		<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
		<script>
			$(function(){
				let result = '' + '${msg}';
				if(result != ""){
					alert(result);
				}
			});
			document.getElementById('btnNoticeView').addEventListener('click', function() {
				location.href = '/notice/noticeView';
			});
			
			$('#btnNoticeUpdate').on('click', function(){
				
				let content = '${list[0].content}'.replace("\r\n","");
				
				$('#hiddenSeq').val('${list[0].seq }');
				$('#hiddenTitle').val('${list[0].title }');
				$('#hiddenWriter').val('${list[0].writer }');
				$('#hiddenDate').val('${list[0].date }');
				$('#hiddenContent').val(content);
 				$('#hiddenContent').val('${list[0].content}'); 
				
				$('#noticeModify').submit();
				
			});
			
			$('#btnNoticeDelete').on('click', function(){
				if(confirm('정말 삭제하시겠습니까?')){
					$('#deleteNotice').submit();
				}
				
			});
			
			
		</script>
	</body>
</html>