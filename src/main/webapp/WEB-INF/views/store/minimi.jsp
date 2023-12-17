<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상점</title>
		<link  href="/resources/css/main.css" rel="stylesheet">
	</head>
	
	<body>
		<div style="display:flex; flex-direction: row;">
			<div>
				<img id="loginLogo" src="<c:url value="/resources/images/helloworldIconFull.png"/>">
			</div>
			<div>
				<h5>내 도토리: 1234개</h5>
				<a href="<c:url value="/helloworld/minihome/main" />">내 미니홈피</a>
				<a href="<c:url value="/" />">로그아웃</a>
			</div>
		</div>
		
		<div id="divHiUser">
			<a class='storeAtag' href="">미니미</a>
			<a class='storeAtag' href="">스킨</a>
			<a class='storeAtag' href="">메뉴</a>
			<a class='storeAtag' href="">도토리</a>
			<a class='storeAtag' href="">bgm</a>
		</div>
		
		<div class="products">
			<h3>미니미 상품 목록입니다.</h3>
			<div class="product_list">
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/slimeIcon.gif" />" width="225">
	                <div class="product-name">
	                   	슬라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/orangeMushroomIcon.gif" />" width="225">
	                <div class="product-name">
	                   	슬라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/balokIcon.gif" />" width="225">
	                <div class="product-name">
	                   	슬라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/grupinIcon.gif" />" width="225">
	                <div class="product-name">
	                   	슬라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/duckyFamilyIcon.gif" />" width="225">
	                <div class="product-name">
	                   	슬라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/horangIcon.gif" />" width="225">
	                <div class="product-name">
	                   	슬라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/starPixieIcon.gif" />" width="225">
	                <div class="product-name">
	                   	슬라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/greiIcon.gif" />" width="225">
	                <div class="product-name">
	                   	슬라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/stonGolemIcon.gif" />" width="225">
	                <div class="product-name">
	                   	슬라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/scubaPepeIcon.gif" />" width="225">
	                <div class="product-name">
	                   	슬라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
		
			</div>
		</div>
	</body>
</html>