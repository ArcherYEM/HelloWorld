<!-- views/miniHome/miniroomEdit -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizeable: no">
<head>
<meta charset="UTF-8">
<title>헬로월드</title>tle>
<link rel="stylesheet" href="../../../../resources/css/index/order.css" />
<link rel="stylesheet" href="../../../../resources/css/index/bgm.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>

<body>
	<div class="store-edit-frame">
		<div class="store-edit-pad">
			<div class="edit-container-over">
				<div class="store-edit-file">
					<div class="buySuccessComment">구입에 성공했습니다!</div>
					<div class="hello">
						<input type="button" value="확인" class="btnConfirm" onclick="closeWindow()">
					</div>
				</div>
				<div class="store-file-preview" id="preview-container"></div>
			</div>
			<div class="store-edit-container-under">
				<div class="store-edit-introduce"></div>
			</div>
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
