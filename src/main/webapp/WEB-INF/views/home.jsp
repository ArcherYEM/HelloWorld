<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>임시페이지</title>
	</head>
<body>
<h1>
	Hello world!  
</h1>

<a href="<c:url value='/helloworld/minihome/main'/>" target="_blank">내 미니홈피 </a>
<button onclick="window.open('/helloworld/minihome/main', 'window_name', 'width=1200, height=750, location=no, status=no, scrollbars=yes');">미니홈피</button>

</body>
</html>
