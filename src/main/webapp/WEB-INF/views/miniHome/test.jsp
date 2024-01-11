<!-- views/miniHome/main -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizable:no">
<head>
<meta charset="UTF-8">
<title>TEST</title>
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<h2>테스트 목적의 page 입니다</h2>
	
	<%-- Loop through bgmMap and display the data --%>
<c:forEach items="${bgmMap}" var="bgm">
    <p>Title: ${bgm.title}</p>
    <p>Artist: ${bgm.artist}</p>
    <p>Running Time: ${bgm.runningTime}</p>
    <p>Content Path: ${bgm.contentPath}</p>
    <!-- Add more fields as needed -->
</c:forEach>
	
	
</body>
</html>