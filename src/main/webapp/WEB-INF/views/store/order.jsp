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
    <link rel="stylesheet" href="../../../../resources/css/index/order.css" />
    <link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>

<body>
<form method="POST" action="<c:url value=''/>" >
	<div class="store-edit-frame">
		<div class="store-edit-pad">
			<div class="edit-container-over">
		    <div class="store-edit-file">
		   	  
		    </div>
		    <div class="store-file-preview" id="preview-container"></div>
		  </div>
		  <div class="store-edit-container-under">
		  	<div class="store-edit-introduce">
		  		
		  		<div>주문 내역</div>
		  		<div>
		  			<div> <input type="checkbox"> </div>
			  		<div>번호</div>
			  		<div>상품 사진</div>
			  		<div>상품명</div>
			  		<div>가격</div>
			  		<div>삭제</div>
		  		</div>
		  		
		  		<div>
		  			<div> <input type="checkbox"> </div>
			  		<div>1</div>
			  		<div> <img src="<c:url value="/resources/images/store/dotoriBuy10.png" />"> </div>
			  		<div>도토리 10개</div>
			  		<div>1100원</div>
			  		<div><img src="<c:url value="/resources/images/minihome/removeIcon.png" />"> </div>
		  		</div>
		  		
		  		
		  		
		  		<div>총 결제 예상 금액</div>
		  		
		  		
		  		
		  	</div>
		  </div>
		  <div class="store-edit-btn">
		 		<input type="submit" value="구매" id="btnUpload">
		 		<input type="button" value="취소" id="cancel-button">
                <!-- 숨겨진 필드 추가 -->
                <input type="hidden" id="fileStatus" name="fileStatus" value="noFile">
		  </div>
		</div>	
	</div>
</form>

<script>
  document.getElementById("cancel-button").addEventListener("click", function() {
    window.close();
  });
</script>
</body>
</html>
