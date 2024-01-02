<!-- views/miniHome/main -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizeable:no">
<head>
<meta charset="UTF-8">
<title>미니홈피</title>
<link rel="stylesheet" href="../../../../resources/css/minihome/fonts.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/miniroom.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>

	<div class="miniroom-success">
		적용에 성공했습니다!
		<div>
			<input type="button" value="확인" onclick="closeWindow()">
		</div>
	</div>		
<script>
	function closeWindow() {
	    if (window.opener && !window.opener.closed) {
	        window.opener.location.reload(true);
	    }
	    window.close();
	}
</script>
</body>
</html>
