<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>프로필 수정</title>
    <link rel="stylesheet" href="../../../../resources/css/minihome/mnhProfileEdit.css" />
    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<div class="edit-frame-success">
		<div class="edit-success">
		    <div class="loading-container" id="loadingBar">
		        <div class="donut"></div>
		    </div>
			<div class="edit-text">업로드에 성공했습니다.</div>
			<div class="confirm-btn">
				<input type="button" value="확인" id="confirmButton" onclick="closeWindow()" disabled>
			</div>
		</div>
	</div>
<script>
	function startLoading() {
	    document.getElementById('loadingBar').style.display = 'flex'; // 로딩바 표시
	}
	
	function finishLoading() {
	    document.getElementById('loadingBar').style.display = 'none'; // 로딩바 숨김
	    document.getElementById('confirmButton').disabled = false; // '확인' 버튼 활성화
	}
	
	function closeWindow() {
	    if (window.opener && !window.opener.closed) {
	        window.opener.location.reload(true); // 부모 창 (메인 홈페이지) 새로고침
	    }
	    window.close(); // 현재 창 닫기
	}
	
	window.onload = function() {
	    startLoading(); // 페이지가 로드될 때 로딩 시작
	    setTimeout(finishLoading, 3000); // 3초 후에 로딩 완료 함수 호출
	};
</script>
</body>
</html>
