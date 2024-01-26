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
		<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
			<div class="notice-write">
				<p>공지사항 글쓰기 </p>
			</div>
			<div class="notice-write-group">
				<input class="notice-write-title" id="noticeTitle" type="text" placeholder="제목을 입력하세요." form = "frmNotice" name="title">
				<textarea class="notice-write-content" name="content" id="txtContent" rows="10" cols="100" placeholder="내용을 입력하세요." form = "frmNotice" ></textarea>
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
				<!-- <hr>
				<h1>team core</h1> -->
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/index/footer.jsp"></jsp:include>
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
			document.getElementById('btnNoticeWrite').addEventListener('click', function() {
				document.getElementById('noticeHiddenTitle').value = document.getElementById('noticeTitle').value;
				
				console.log(document.getElementById('noticeUserNickname').value);
				oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
	    		//스마트 에디터 값을 텍스트컨텐츠로 전달
	    		/* var content = document.getElementById("smartEditor").value; */
	    		/* alert(document.getElementById("txtContent").value);  */
	    		// 값을 불러올 땐 document.get으로 받아오기
	    		let content = document.getElementById("txtContent").value.replace("\r\n","");
	    		
	    		document.getElementById('noticeHiddenContent').value = content;
	    		
				document.getElementById('frmNotice').submit();
			});
			document.getElementById('btnNoticeView').addEventListener('click', function() {
				location.href = '/notice/noticeView';
			});
			
			var oEditors=[];
			
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "txtContent",
				sSkinURI : "../../../../resources/smarteditor2/SmartEditor2Skin.html",
				fCreator : "createSEditor2"
			});
		</script>
	</body>
</html>