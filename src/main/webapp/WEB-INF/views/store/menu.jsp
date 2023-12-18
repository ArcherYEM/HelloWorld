<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Hello World</title>
		<link  href="/resources/css/main.css" rel="stylesheet">
		<link  href="/resources/css/store.css" rel="stylesheet">
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
			<a class='storeAtag' href="/store/minimiView">미니미</a>
			<a class='storeAtag' href="/store/skinView">스킨</a>
			<a class='storeAtag' href="/store/menuView">메뉴</a>
			<a class='storeAtag' href="/store/dotoriView">도토리</a>
			<a class='storeAtag' href="/store/bgmView">bgm</a>
		</div>
		
		<div class="products">
			<h3>메뉴 상품 목록입니다.</h3>
			<div class="product_list">
				<a href="#" class="product">
	                <div class="divProduct" style="background-color: black;">
	                	<h5> </h5>
	 		        </div>
	                <div class="product-name">
	                   	검정
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <div class="divProduct" style="background-color: red;">
	                	<h5> </h5>
	 		        </div>
	                <div class="product-name">
	                   	빨강
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <div class="divProduct" style="background-color: yellow;">
	                	<h5> </h5>
	 		        </div>
	                <div class="product-name">
	                   	노랑
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <div class="divProduct" style="background-color: green;">
	                	<h5> </h5>
	 		        </div>
	                <div class="product-name">
	                   	초록
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <div class="divProduct" style="background-color: grey;">
	                	<h5> </h5>
	 		        </div>
	                <div class="product-name">
	                   	회색
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <div class="divProduct" style="background-color: lime;;">
	                	<h5> </h5>
	 		        </div>
	                <div class="product-name">
	                   	라임
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <div class="divProduct" style="background-color: white;;">
	                	<h5> </h5>
	 		        </div>
	                <div class="product-name">
	                   	하양
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <div class="divProduct" style="background-color: purple;;">
	                	<h5> </h5>
	 		        </div>
	                <div class="product-name">
	                   	보라
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <div class="divProduct" style="background-color: blue;;">
	                	<h5> </h5>
	 		        </div>
	                <div class="product-name">
	                   	파랑
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <div class="divProduct" style="background-color: navy;;">
	                	<h5> </h5>
	 		        </div>
	                <div class="product-name">
	                   	네이비
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				
		
			</div>
		</div>
	</body>
</html>