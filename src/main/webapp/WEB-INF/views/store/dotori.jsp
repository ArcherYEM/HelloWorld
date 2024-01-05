<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HelloWorld</title>
		<link  href="/resources/css/index/main.css" rel="stylesheet">
		<link  href="/resources/css/index/store.css" rel="stylesheet">
		<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
	</head>
	
	<body>
	<div class="index-frame">
		<div class="divIndexMenu index-header">
	      <div class="index-header-left">
	         <a class="logoATag" href="<c:url value='/'/>">
	           <img class="index-header-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
	         </a>
	       </div>
				<h5 id="userDotori" class="right">내 도토리 : <span id="userDotoriCnt">${dotori}</span> 개</h5>
	       <div class="index-header-right">
	            <a href="<c:url value='/store/minimiView'/>" class="index-a-store">상점</a>
	            <a href="<c:url value='/notice/noticeView'/>" class="index-a-notice">공지사항</a>
	            <a href="<c:url value="/helloworld/minihome/main" />" class="index-a-mnh">내 미니홈피</a>
				<a href="<c:url value="/" />" class="index-a-logout">로그아웃</a>
	       </div>
      </div>
		
		<div id="divHiUser">
			<a class="storeAtag" href="/store/minimiView">미니미</a>
			<a class="storeAtag" href="/store/skinView">스킨</a>
			<a class="storeAtag" href="/store/menuView">메뉴</a>
			<a class="storeAtag present" href="/store/dotoriView">도토리</a>
			<a class="storeAtag" href="/store/bgmView">bgm</a>
		</div>
		
		<div class="products">
			<h3>도토리 상품 목록입니다.</h3>
			<div class="product_list">
				<a href="#" class="product">
					<input type="radio" name="productSelect" class="product-radio" value=10 checked="checked" />				
	                <img src="<c:url value="/resources/images/store/dotoriBuy10.png" />">
	                <div class="product-name">
	                   	&#8361; 1,100
	                </div>
	            </a>
				
				<a href="#" class="product">
					<input type="radio" name="productSelect" value=30 class="product-radio" />
	                <img src="<c:url value="/resources/images/store/dotoriBuy30.png" />">
	                <div class="product-name">
	                   	&#8361; 3,300
	                </div>	                
	            </a>
				
				<a href="#" class="product">
	                <input type="radio" name="productSelect" value=50 class="product-radio" />
	                <img src="<c:url value="/resources/images/store/dotoriBuy50.png" />">
	                <div class="product-name">
	                   	&#8361; 5,200
	                </div>	                
	            </a>
				
				<a href="#" class="product">
	                <input type="radio" name="productSelect" value=100 class="product-radio" />
	                <img src="<c:url value="/resources/images/store/dotoriBuy100.png" />">
	                <div class="product-name">
	                   	&#8361; 9,900
	                </div>	                
	            </a>
				
				<a href="#" class="product">
	                <input type="radio" name="productSelect" value=300 class="product-radio" />
	                <img src="<c:url value="/resources/images/store/dotoriBuy300.png" />">
	                <div class="product-name">
	                   	&#8361; 29,000
	                </div>	                
	            </a>
			</div>
			<button id="btnOrder" onclick='orderOpen()'>구입</button>
		</div>
	</div>
	
	<script>
	window.onload = function() {
		
        let userDotoriElement = document.getElementById('userDotori');
        let userDotoriCnt = '<c:out value="${dotori}" />' || '';

        if (userDotoriCnt.trim() !== '') {
            userDotoriElement.style.display = 'block';
        } else {
            userDotoriElement.style.display = 'none';
        }
/* ========================================================================================================== */
        const products = document.querySelectorAll('.product');
        products.forEach(function(product) {
            product.addEventListener('click', function(event) {
                event.preventDefault(); // 기본 앵커 동작 방지

                // 다른 모든 .product 객체들의 테두리 스타일을 초기화
                products.forEach(p => {
                    p.style.border = ""; // 테두리 스타일 초기화
                    p.querySelector('.product-radio').checked = false; // 라디오 버튼 선택 해제
                });

                // 클릭된 객체에만 테두리 스타일 적용
                this.style.border = "2px solid red";

                // 클릭된 객체의 라디오 버튼을 선택
                this.querySelector('.product-radio').checked = true;
            });
        });
    };
    
    function orderOpen() {
        // 같은 이름을 가진 모든 라디오 버튼을 가져옵니다.
        var radioButtons = document.querySelectorAll('input[name="productSelect"]');

        // 선택된 라디오 버튼을 찾습니다.
        var selectedButton = Array.from(radioButtons).find(radio => radio.checked);

        // 선택된 라디오 버튼의 값을 확인합니다.
        if (selectedButton) {
            // 선택된 라디오 버튼의 값(여기서는 상품의 고유 식별자나 이름일 수 있음)을 쿼리 문자열로 포함하여 URL을 구성합니다.
            var orderUrl = "/store/orderView?selectedProduct=" + encodeURIComponent(selectedButton.value);
            
            // 구성된 URL과 함께 새 창을 엽니다.
            window.open(orderUrl, '_blank', 'width=500,height=500');
        } else {
            // 선택된 라디오 버튼이 없다면 사용자에게 알립니다.
            alert("상품을 선택해주세요.");
        }
    }
	</script>
	</body>
</html>