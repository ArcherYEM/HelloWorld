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
		            <a href="<c:url value='/notice/noticeView'/>" class="index-a-notice press-btn">공지사항</a>
		            <a href="<c:url value='/index/mapView'/>" class="index-a-map">찾아오는 길</a>
		            <c:if test="${sessionScope.userId ne null }">
		            	<a id="storeLoginLogout" href="<c:url value="/index/member/logout" />" class="index-a-logout">로그아웃</a>
		            </c:if>
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
				<form>
					<div class="btn-container">
						<div class="btn-left">
							<input class="nd-btn-list" type="button" id="btnNoticeView" value="목록">					
						</div>
						<c:if test="${isAdmin eq '1'}">	
							<c:set var="type" value="button"></c:set>
						</c:if>
						<c:if test="${isAdmin eq '0'}">	
							<c:set var="type" value="hidden"></c:set>
						</c:if>
						<div class="btn-right">
							<input class="nd-btn-update" type="${type}" id="btnNoticeUpdate" value="수정">
							<input class="nd-btn-delete" type="${type}" id="btnNoticeDelete" value="삭제">				
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
				
			</div>
				
		</div>
		<jsp:include page="/WEB-INF/views/index/footer.jsp"></jsp:include>
		<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
		<script>
	function openMiniHomepage() {
	    // URL 정의
	    var url = "<c:url value='/mnHome/mainView/${sessionScope.userId.userNickname }' />";

	    // 크기 정의
	    var width = 1200;
	    var height = 720;

	    // 화면 중앙에 새 창을 위치시키기 위해 위치 계산
	    var left = (window.innerWidth - width) / 2;
	    var top = (window.innerHeight - height) / 2;

	    // 새 창 열기
	    var newWindow = window.open(url, 'MiniHomepage', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);

	    // 새 창이 열린 후, 현재 창을 그대로 유지하기 위해 기본 링크 동작 방지
	    if (newWindow) {
	        newWindow.focus(); // 새 창을 포커스합니다.
	    }
	    return false;
	}
	
// 	부모창 리로드 명령
	function reloadParentWindow() {
		location.href = "<c:url value="/index/member/logout" />"
	    location.reload();
	}

	</script>
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
			
			
		</script>
	</body>
</html>