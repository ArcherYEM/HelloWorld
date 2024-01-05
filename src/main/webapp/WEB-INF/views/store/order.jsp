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
    <link rel="stylesheet" href="../../../../resources/css/index/bgm.css" />
    <link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
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
	  					<option value="giftCard">문화상품권</option>
	  					<option value="mobilePone">휴대폰</option>
	  					<option value="kakakoPay">카카오페이</option>
	  					<option value="creditCard">신용/체크카드</option>
	  					<option value="accountDeposit">무통장 입금</option>
	  				</select>
	  			</div>
	  		</div>
	  	</div>
	  </div>
	  <div class="store-edit-btn">
	 		<input type="submit" value="구매" id="btnUpload" onclick="btnPurchase()" class="btn">
	 		<input type="button" value="취소" id="cancel-button" class="btn">
	  </div>
	</div>	
</div>

<form id="frmPurchase" action="<c:url value='/store/dotoriBuy'/>" method="post">
	<input type="hidden" name="content" id="content" value="">
</form>

<script>
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
    
    console.log(buyDotoriOriginalPrice);
    console.log(buyDotoriDiscount);
    console.log(buyDotoriPrice);
    
    document.getElementById("buyDotoriCount").textContent = selectedProduct;
    document.getElementById("buyDotoriOriginalPrice").textContent = productOriginalPrice;
    document.getElementById("buyDotoriDiscount").textContent = productDiscount;
    document.getElementById("buyDotoriPrice").textContent = productPrice;

};

function btnPurchase(){
	var content = selectedProduct;
	document.getElementById("content").value = content;

	
	document.getElementById("frmPurchase").submit();
}
	
	

</script>
</body>
</html>
