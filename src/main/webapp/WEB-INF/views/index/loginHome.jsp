<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
		<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="Expires" content="0">
		<title>헬로월드</title>
	</head>
	<body>
		<div style="display:flex; flex-direction: row;">
			<span>
				<img id="loginLogo" src="<c:url value="/resources/images/helloworldIconFull.png"/>">
				<input type="button" class="IndexPageTab" id="btnStore" value="상점">
				<input type="button" class="IndexPageTab" id="btnAnnouncement" value="공지사항">
			</span>
		</div>
		
		<div id="divHiUser">
			<c:choose>
		        <c:when test="${sessionScope.userId != null}">
		            <h3 style="color: white; margin: 10px; font-size: 35px;">
		             	 ${sessionScope.userId.userEmail}님, 환영합니다.
		            </h3>
		        </c:when>
		        <c:otherwise>
		            <h3 style="color: white; margin: 10px; font-size: 35px;">
		              	  HelloWorld 에 오신 걸 환영합니다.
		            </h3>
		        </c:otherwise>
		    </c:choose>
		</div>
		
		<div style="display:flex; flex-direction: row;">
			<div id="divMainMinimi">
				<span>
					<img id="mainMinimi" src="<c:url value="/resources/images/PepeIcon.gif"/>">
				</span>
			</div>
			<div id="divMainSlide">
				<span>
					<img id="mainSlideImg" src="<c:url value="/resources/images/mainSlideImg1.jpg"/>">
				</span>
			</div>
			
		</div>
		<div>
        <form id="logoutForm" action="<c:url value='/main/member/logout' />" method="post">
            <input type="button" class="mainBtn" id="btnGoMinihome" value="내 미니홈피" onclick="openMinihome()">
            <input type="button" class="mainBtn" id="btnLogout" value="로그아웃" onclick="logout()">
        </form>
   	 </div>
		<!-- <hr style="border: 2px solid black; margin-top: 200px;">
		<div id="divTeamInfo">
			<h1 style="margin-left: 50px">team core</h1>
		</div> -->
		<jsp:include page="/WEB-INF/views/index/footer.jsp"></jsp:include>
	</body>
	
	<script>
	    function openMinihome() {
	        window.open('/mnHome/mainView', 'window_name', 'width=1200, height=750, location=no, status=no, scrollbars=yes');
	    }
	
	    function logout() {
	        document.getElementById('logoutForm').submit();
	    }
	</script>
</html>