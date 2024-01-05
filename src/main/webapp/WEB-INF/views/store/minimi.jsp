<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>HelloWorld</title>
	    <link href="/resources/css/index/main.css" rel="stylesheet">
	    <link href="/resources/css/index/storeMMS.css" rel="stylesheet">
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
	        <a class="storeAtag present" href="/store/minimiView">미니미</a>
	        <a class="storeAtag" href="/store/skinView">스킨</a>
	        <a class="storeAtag" href="/store/menuView">메뉴</a>
	        <a class="storeAtag" href="/store/dotoriView">도토리</a>
	        <a class="storeAtag" href="/store/bgmView">bgm</a>
	    </div>
	
	    <div class="products">
	        <h3>미니미 상품 목록입니다.</h3>
	        <div class="content-container">
		        <!-- minimi select -->
		        <div class="productList">
				    <c:forEach var="minimi" items="${minimi}" varStatus="seq">
				        <div class="product" data-product-cate="미니미"
				             data-product-name="${minimi.productName}" data-product-price="${minimi.productPrice}">
				            <div>
				                <img src="<c:url value="${minimi.contentPath}"/>" class="store-minimi-img"/>
				            </div>
				            <div class="product-name">
				                <c:out value="${minimi.productName}"/>
				            </div>
				            <div class="product-price">
				                <c:out value="${minimi.productPrice}"/>
				            </div>
				        </div>
				    </c:forEach>
				</div>
				
				<div class="cart-widget">
				  <h2>장바구니</h2>
				  <ul id="cart-list"></ul>
				</div>
			</div>
	        <!-- paging -->
	        <div class="minimi-paging">
	            <c:forEach var="page" begin="1" end="${totalPage}">
	                <span class="spanPage" data-page="${page}" onclick="loadPage(${page})">
					    [${page}]
					</span>
	            </c:forEach>
	        </div>
	        <form id="frm1" action="/store/minimiView" method="GET">
			    <input type="hidden" id="page" name="page" value="1">
			</form>
	    </div>
	</div>
	
	<script src="../../../../resources/js/jquery-3.7.1.min.js"></script>
	<script>
	
		function loadPage(page) {
	        $('#page').val(page);
	        $('#frm1').submit();
	    }
	
	    $(document).ready(function () {
	        loadCart(); // 페이지 로드 시에 장바구니 데이터 로드
	
	        $('.spanPage').on('click', function(){
	            loadPage($(this).data('page'));
	        });
	
	        $('.product').on('click', function () {
	            const productCate = $(this).data('product-cate');
	            const productName = $(this).data('product-name');
	            const productPrice = $(this).data('product-price');
				
	            console.log(productCate);
	            addToCart(productCate, productName, productPrice);
	        });
	
	        function addToCart(cate, name, price) {
	            $.ajax({
	                type: 'POST',
	                url: "/store/addToCart",
	                contentType: 'application/json',
	                data: JSON.stringify({ cate: cate, name: name, price: price }),
	                success: function () {
	                    loadCart(); // 장바구니에 상품 추가 후 다시 로드
	                },
	                error: function () {
	                    console.error('Ajax request failed');
	                }
	            });
	        }
	
	        function loadCart() {
	            $.ajax({
	                type: 'GET',
	                url: "/store/loadCart",
	                success: function (data) {
	                    // 서버에서 받은 데이터를 처리하여 페이지 갱신
	                    // 예시: 장바구니 리스트 갱신
	                    updateCart(data);
	                },
	                error: function () {
	                    console.error('Ajax request failed');
	                }
	            });
	        }
	
	        function updateCart(cartItems) {
	            const cartList = $('#cart-list');
	            cartList.empty(); // 기존 장바구니 비우기
	
	            // 새로운 장바구니 데이터로 리스트 업데이트
	            cartItems.forEach(function(item) {
	                const cartItem = document.createElement('li');
	                cartItem.textContent =item.cate + ' : ' +  item.name + ' - ₩' + item.price;
	                cartList.append(cartItem);
	            });
	        }
	    });
	</script>
	
	</body>
</html>
