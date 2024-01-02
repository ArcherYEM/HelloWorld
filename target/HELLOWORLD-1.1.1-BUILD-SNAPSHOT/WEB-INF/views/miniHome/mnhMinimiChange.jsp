<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizable:no">
<head>
    <meta charset="UTF-8">
    <title>미니미 설정</title>
    <link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>

	mnhMinimiChange page<br>
	<div style="color:blue">
	${sessionScope.userId}
	</div>
	<br>
	    <p>${userStorage.userNickname} 님이 보유하신 미니미 입니다.</p>
	
	<c:forEach items="${userStorageList}" var="userStorage">
	    <img src="<c:url value="${userStorage.contentPath }"/>" class="" style="width:100px;"/><br>
	    <span>이름 : ${userStorage.productName}</span><br>
	</c:forEach>
	
<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>

</body>
</html>
