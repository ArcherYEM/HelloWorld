<!-- views/miniHome/miniroomEdit -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizeable:no">
<head>
    <meta charset="UTF-8">
    <title>헬로월드</title>
    <link rel="stylesheet" href="../../../../resources/css/index/order.css" />
    <link rel="stylesheet" href="../../../../resources/css/index/bgm.css" />
    <link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>

<body>
<div class="store-edit-frame">
	<div class="store-edit-pad">
		<div class="edit-container-over">
	    <div class="store-edit-file">
	   	  
	    </div>
	    <div class="store-file-preview" id="preview-container"></div>
	  </div>
	  <div class="store-edit-container-under">
	  	<div class="store-edit-introduce">
	  		<div class="buyDotoriContainer">
	  			<div class="buyDotoriImage">
	  				<img id = "buyDotoriImage" src="">
	  			</div>
	  		</div>
	  		<div class="buyDotoriInfo">
	  			<table class="styled-table">
	  				<thead>
				        <tr>
				            <th>상품명</th>
				            <th>충전 개수</th>
				            <th>원가</th>
				            <th>할인율</th>
				            <th>결제 금액</th>
				        </tr>
				    </thead>
				    <tbody>
				        <tr>
				            <td>도토리 충전</td>
				            <td id="buyDotoriCount"></td>
				            <td id="buyDotoriOriginalPrice"></td>
				            <td id="buyDotoriDiscount"></td>
				            <td id="buyDotoriPrice"></td>
				        </tr>
				    </tbody>
	  			</table>
	  		
	  			<div id="buyDotoriName">
	  				
	  			</div>
	  		</div>

	  		<div class="payMethod">결제 수단</div>
	  		<div class="payMethodContainer">
	  			<div class="payMethods">
					<select id="mySelect" class="simple-select">
	  					<option value="문화상품권">문화상품권</option>
	  					<option value="휴대폰">휴대폰</option>
	  					<option value="카카오페이">카카오페이</option>
	  					<option value="신용/체크카드">신용/체크카드</option>
	  					<option value="무통장 입금">무통장 입금</option>
	  				</select>
	  			</div>
	  		</div>
	  	</div>
	  </div>
	  <div class="store-edit-btn">
	 		<input type="submit" value="구매" id="btnUpload" onclick="requestPay()" class="btn">
	 		<input type="button" value="취소" id="cancel-button" class="btn">
	  </div>
	</div>	
</div>

<form id="frmPurchase" action="<c:url value='/store/dotoriBuy'/>" method="post">
	<input type="hidden" name="content" id="content" value="">
	<input type="hidden" name="method" id="method" value="">
	<input type="hidden" name="price" id="price" value="">
</form>

<script>
		var IMP = window.IMP;
		IMP.init("imp85702711");
		
			// 세션에서 userId를 가져옵니다.
		<%
		Object userIdObj = session.getAttribute("userId");
		
		if (userIdObj == null || !(userIdObj instanceof Map)) {
		    // 사용자가 로그인되어 있지 않은 경우
		    out.println("alert('로그인 후 이용해주세요.');");
		    out.println("window.close();"); // 현재 창을 닫습니다.
		} else {
		    Map userMap = (Map) userIdObj;
		    String userPhone = (String) userMap.get("userPhone");
		    String userName = (String) userMap.get("userName");
		    String userEmail = (String) session.getAttribute("userEmail");
		
		    if (userEmail == null) {
		        out.println("alert('이메일이 없습니다.');");
		    }
		%>
		var userPhone = '<%= userPhone %>';
		var userName = '<%= userName %>';
		var userEmail = '<%= userEmail %>';
		<%
		}
		%>
	        
        function requestPay() {
        	console.log("userEmail: ", userEmail);
        	
        	if(userEmail == null) {
        		alert('로그인 후 이용해주세요.');
        	}
        	
            IMP.request_pay({
            	pg: "kakaopay",
                pay_method: "card",
                merchant_uid: generateMerchantUID(),   // 주문번호
                name: "도토리 구매",
                amount: 100,                         // 숫자 타입
                buyer_email: userEmail,
                buyer_name: userName,
                buyer_tel: userPhone,
            }, function (rsp) { // callback
            	console.log(rsp);
                var imp_uid = rsp.imp_uid;
                console.log("ajax 호출 전");
                $.ajax({
                	   type: 'POST',
                	   url: '/verify/' + rsp.imp_uid,
                	}).done(function(data) {
                		console.log("ajax 성공 콜백 내부");
                	   if(rsp.paid_amount === data.paid_amount){
                	      alert("결제 성공");
                	      btnPurchase();
                	   } else {
                	      alert("결제 실패");
                	   }
                	});
            });
        }

        function generateMerchantUID() {
            // 실제 상황에서는 더 복잡한 로직이 필요할 수 있습니다.
            return "ORD" + new Date().getTime();
        }

	var selectedProduct;
	
	  document.getElementById("cancel-button").addEventListener("click", function() {
	    window.close();
	  });
	  
	/* ========================================================================================================== */
	 window.onload = function() {
		var dotoriImageUrl;
	  	var productCount;
	  	var productOriginalPrice;
	  	var productDiscount;
	  	var productPrice;
	  	
	
	    // 현재 페이지의 URL을 가져옵니다.
	    var currentUrl = window.location.href;
	
	    // URL에서 쿼리 문자열을 파싱합니다.
	    var urlParams = new URLSearchParams(window.location.search);
	
	    // 'selectedProduct' 파라미터의 값을 가져옵니다.
		selectedProduct = urlParams.get('selectedProduct');
	
	    dotoriImageUrl = "/resources/images/store/dotoriBuy"+selectedProduct+".png"
	    document.getElementById("buyDotoriImage").src=dotoriImageUrl
	    producntCount = selectedProduct;
	    
	    if(selectedProduct == 10){
	    	productOriginalPrice = "1,100";
	    	productDiscount = "0%";
	    	productPrice = "1,100";
	    }
	    else if(selectedProduct == 30){
	    	productOriginalPrice = "3,300";
	    	productDiscount = "0%";
	    	productPrice = "3,300";
	    }
	    else if(selectedProduct == 50){
	    	productOriginalPrice = "5,500";
	    	productDiscount = "5%";
	    	productPrice = "5,200";
	    }
	    else if(selectedProduct == 100){
	    	productOriginalPrice = "11,000";
	    	productDiscount = "9%";
	    	productPrice = "9,900";
	    }
	    else if(selectedProduct == 300){
	    	productOriginalPrice = "33,000";
	    	productDiscount = "12%";
	    	productPrice = "29,000";
	    }
	    
	    document.getElementById("buyDotoriCount").textContent = selectedProduct;
	    document.getElementById("buyDotoriOriginalPrice").textContent = productOriginalPrice;
	    document.getElementById("buyDotoriDiscount").textContent = productDiscount;
	    document.getElementById("buyDotoriPrice").textContent = productPrice;
	
	};
	
	function btnPurchase(){
		
		var content = selectedProduct;
		document.getElementById("content").value = content;
		var method = document.getElementById("mySelect").value;
		document.getElementById("method").value = method;
		var price = document.getElementById("buyDotoriPrice").textContent;
		document.getElementById("price").value = price;
		document.getElementById("frmPurchase").submit();
	}
		
		

</script>
</body>
</html>