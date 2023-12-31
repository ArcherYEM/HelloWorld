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
mnhMinimiChange page

<div> 접속계정 : ${sessionScope.userId.userName }</div>
<p class="1111"><c:out value="${contentPath }"/>미니미 그림</p>
<%-- 세션에서 값을 가져와서 출력 --%>
<% Object sessionValue = session.getAttribute("sessionKey"); %>
세션 값: <%= sessionValue %>



<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>

</body>
</html>