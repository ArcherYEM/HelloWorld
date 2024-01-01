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
		    	<c:forEach items="${list}" var="list" varStatus="i">
		    		<tr class="notice-table-tr">
						<td><input type="checkbox" class="notice-cbx" form="frm1" name="<c:out value='${i.index}'/>" value="<c:out value='${list.seq}'/>"></td>
						<td>
							<c:out value="${list.seq}"/>
						</td>
						<td class="notice-td-title">
							<c:out value="${list.title}"/>
						</td>
						<td>
							<c:out value="${list.date}"/>
						</td>
					</tr>
		    	</c:forEach>
					
				</table>
			</div>
			<div class="btnNoticeGroup">
				<form id="frm1" method="POST" action="/notice/noticeDelete">
					<input type="button" class="btn-notice" id="btnDelete" value="삭제">
				
					<input type="button" class="btn-notice" id="btnWrite" value="등록">
				</form>
			</div>
			
			<!-- paging -->
	        <div class="minimi-paging">
	            <c:forEach var="page" begin="1" end="${totalPage}">
	                <span class="spanPage" data-page="${page}">
	                    [${page}]
	                </span>
	            </c:forEach>
	            
	            <form id="frm2" action="<c:url value='/notice/noticeView'/>" method="get">
					<input type="hidden" name="page" id="page" />
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
		
			document.getElementById('btnDelete').addEventListener('click', function() {
				/* document.getElementById('frm1').submit(); */
			});
			
			document.getElementById('btnWrite').addEventListener('click', function() {
				location.href = '/notice/noticeWrite';
			});
			
			$('.spanPage').on('click', function(){
				$('#page').val($(this).data('page'));
				$('#frm2').submit();
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