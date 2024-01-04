<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizable:no">
<head>
    <meta charset="UTF-8">
    <title>미니미 설정</title>
    <link rel="stylesheet" href="../../../../resources/css/minihome/minimiChange.css" />
    <link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	
	<div class="mnm-change-success">
		적용에 성공했습니다!
		<div>
			<input type="button" value="확인" onclick="closeWindow()">
		</div>
	</div>		
<script>
function closeWindow() {
    if (window.opener && !window.opener.closed) {
        window.opener.location.reload(true); // 부모 창 (메인 홈페이지) 새로고침
    }
    window.close(); // 현재 창 닫기
}
</script>

</body>
</html>
