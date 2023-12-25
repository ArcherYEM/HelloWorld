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
		
			<div class="notice-table-title">
				<table class="notice-tanle">
		    	<colgroup>
		    		<col class="col-choice">
		        <col class="col-number">
		        <col class="col-title">
		        <col class="col-date">
		    	</colgroup>
		   		<tr>
		   			<th>선택</th>
		        <th>번호</th>
		        <th>제목</th>
		        <th>등록일</th>
		    	</tr>
				</table>
			</div>
			<div class="notice-table-title-mid">
				<table class="notice-tanle">
					<colgroup>
						<col class="col-choice">
		        <col class="col-number">
		        <col class="col-title">
		        <col class="col-date">
		    	</colgroup>
					<tr class="notice-table-tr">
						<td><input type="checkbox" class="notice-cbx"></td>
						<td>1</td>
						<td class="notice-td-title">싸이월드가 헬로월드로 새롭게 태어납니다</td>
						<td>2023-12-19</td>
					</tr>
					<tr class="notice-table-tr">
						<td><input type="checkbox" class="notice-cbx"></td>
						<td>2</td>
						<td class="notice-td-title">취업이 늦어지면 리액트 배워서 써보려고 합니다.</td>
						<td>2023-12-20</td>
					</tr>
					<tr class="notice-table-tr">
						<td><input type="checkbox" class="notice-cbx"></td>
						<td>3</td>
						<td class="notice-td-title">스프링 부트 너무 어려우니 스프링까지만 구현하고자 합니다.</td>
						<td>2023-12-21</td>
					</tr>
					<tr class="notice-table-tr">
						<td><input type="checkbox" class="notice-cbx"></td>
						<td>4</td>
						<td class="notice-td-title">크리스마스에 개발팀 전원 정발산동 에서 코딩합니다.</td>
						<td>2023-12-22</td>
					</tr>
					<tr class="notice-table-tr">
						<td><input type="checkbox" class="notice-cbx"></td>
						<td>5</td>
						<td><a href="<c:url value='/notice/noticeDetail'/>">게시글 보는 주소가 걸려있는 곳 입니다.</a></td>
						<td>2023-12-22</td>
					</tr>
				</table>
			</div>
			<div class="btnNoticeGroup">
				<input type="button" class="btn-notice" id="btnUpdate" value="수정">
				<input type="button" class="btn-notice" id="btnDelete" value="삭제">
				<input type="button" class="btn-notice" id="btnWrite" value="등록">
			</div>
			
			<div class="bottom-fix">
				<hr>
				<h1>team core</h1>
			</div>
		</div>
		
		<script>
			document.getElementById('btnWrite').addEventListener('click', function() {
				location.href = '/notice/noticeWrite';
			});
			
			var titles = document.getElementsByClassName('notice-td-title');

			for (var i = 0; i < titles.length; i++) {
			  titles[i].addEventListener('click', function() {
			    location.href = '/notice/noticeDetail';
			  });
			}

		</script>
	</body>
</html>