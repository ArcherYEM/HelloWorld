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
    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<div class="edit-frame-success">
		<div class="edit-success">
		<% Boolean loginStatus = (Boolean) request.getAttribute("loginStatus"); %>
		<% if (loginStatus == null || !loginStatus) { %>
			<div class="edit-text">로그인  후 이용해주세요.</div>
		<% } else { %> 
			<div class="edit-text">업로드에 실패했습니다.</div>
		<% } %>
			<div class="confirm-btn">
				<input type="button" value="확인" onclick="closeWindow()">
			</div>
		</div>
	</div>
	
<script>
	function closeWindow(){
		window.close();
	}
</script>
</body>
</html>
