<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>헬로월드</title>
		<link  href="/resources/css/index/main.css" rel="stylesheet">
		<link  href="/resources/css/index/store.css" rel="stylesheet">
		<link  href="/resources/css/index/notice.css" rel="stylesheet">
		<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
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
		            <h5 class="right" id="userDotori"><img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"><span id="userDotoriCnt">${dotori}</span>개</h5>
		            <a href="<c:url value='/store/minimiView'/>" class="index-a-store">상점</a>
		            <a href="<c:url value='/notice/noticeView'/>" class="index-a-notice">공지사항</a>
		            <a id="storeLoginMyhome" href="<c:url value='/mnHome/mainView/${sessionScope.userId.userNickname }' />" class="index-a-mnh">내 미니홈피</a>
		            <a id="storeLoginLogout" href="<c:url value="/index/member/logout" />" class="index-a-logout">로그아웃</a>
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
							<td class="notice-td-title" data-seq="<c:out value='${list.seq}'/>">
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
				</form>
					<input type="button" class="btn-notice" id="btnWrite" value="등록">
			</div>
			
			<!-- paging -->
	        <div class="notice-paging">
	            <c:forEach var="page" begin="1" end="${totalPage}">
	                <span class="spanPage" data-page="${page}">
	                    [${page}]
	                </span>
	            </c:forEach>
	            
	            <form id="frm2" action="<c:url value='/notice/noticeView'/>" method="get">
					<input type="hidden" name="page" id="page" />
				</form>
				
	            <form id="frm3" action="<c:url value='/notice/noticeDetail'/>" method="get">
					<input type="hidden" name="detailSeq" id="detailSeq" />
				</form>
		
	        </div>
			
			<div class="bottom-fix">
				<hr>
				<h1>team core</h1>
			</div>
		</div>
		
		<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
		<script>
		
			window.onload = function() {
				
		        let userDotoriElement = document.getElementById('userDotori');
		        let storeLoginMyhome = document.getElementById('storeLoginMyhome');
		        let storeLoginLogout = document.getElementById('storeLoginLogout');
		        let btnDelete = document.getElementById('btnDelete');
		        let btnWrite = document.getElementById('btnWrite');
		        let userDotoriCnt = '<c:out value="${dotori}" />' || '';
		
		        if (userDotoriCnt.trim() !== '') {
		            userDotoriElement.style.display = 'block';
		            storeLoginMyhome.style.display = 'block';
		            storeLoginLogout.style.display = 'block';
		            btnDelete.style.display = 'block';
		            btnWrite.style.display = 'block';
		        } else {
		            userDotoriElement.style.display = 'none';
		            storeLoginMyhome.style.display = 'none';
		            storeLoginLogout.style.display = 'none';
		            btnDelete.style.display = 'none';
		            btnWrite.style.display = 'none';
		        }
			}
		
			$(function(){
				let result = '' + '${msg}';
				if(result != ""){
					alert(result);
				}
				
				
				var titles = document.getElementsByClassName('notice-td-title');

				for (var i = 0; i < titles.length; i++) {
				  titles[i].addEventListener('click', function() {
					  
					  /* $('#detailSeq').val($(this).val()); */
					  
					  let url = "/notice/noticeDetail?seq=" + $(this).data('seq');
					  console.log(url);
				      location.href = url; 
				  });
				}
			});
		
			document.getElementById('btnDelete').addEventListener('click', function() {
				if(confirm('정말 삭제하시겠습니까?')){
					document.getElementById('frm1').submit();
				}
			});
			
			
			document.getElementById('btnWrite').addEventListener('click', function() {
				location.href = '/notice/noticeWrite';
			});
			
			$('.spanPage').on('click', function(){
				$('#page').val($(this).data('page'));
				$('#frm2').submit();
			});
		</script>
	</body>
</html>