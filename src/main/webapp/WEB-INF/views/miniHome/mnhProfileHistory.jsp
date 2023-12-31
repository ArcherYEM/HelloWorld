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
<div class="edit-frame">
<c:forEach items="${profileHistory}" var="profile">
	<div class="profile-history">
		<div class="history-date">
			${profile.create_date}
		</div>
		<div class="history-image">
			<img src="/../../../../resources/images/download/${profile.image}">
		</div>
		<div class="history-msg">
			${profile.msg}
		</div>
	</div>
</c:forEach>
</div>

</body>
</html>
