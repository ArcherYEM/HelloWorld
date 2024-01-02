<!-- views/miniHome/miniroomEdit -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizeable:no">
<head>
    <meta charset="UTF-8">
    <title>프로필 수정</title>
    <link rel="stylesheet" href="../../../../resources/css/minihome/mnhProfileEdit.css" />
    <link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
<% Boolean loginStatus = (Boolean) request.getAttribute("loginStatus"); %>
<% if (loginStatus == null || !loginStatus) { %>
	<div class="edit-frame-success">
		<div class="history-fail">
			<div class="fail-text">로그인  후 이용해주세요.</div>
			<div class="fail-btn">
				<input type="button" value="확인" onclick="closeWindow()">
			</div>
		</div>
	</div>
<% } else { %>    
<div class="edit-frame">
    <c:if test="${not empty historyMessage}">
    	<div class="history-fail">
     		<div class="fail-text">${historyMessage}</div>
     	</div>
    </c:if>
	<c:forEach items="${profileHistory}" var="profile">
		<div class="profile-history">
			<div class="history-date">
				${profile.create_date}
			</div>
			<div class="history-image">
				<img src="/../../../../resources/images/download/${profile.image}">
			</div>
			
			<div class="history-msg">
				<c:out value="${profile.msg}" escapeXml="false"/>
			</div>
		</div>
	</c:forEach>
</div>
<% } %>
<script>
	function closeWindow(){
		window.close();
	}
</script>
</body>
</html>
