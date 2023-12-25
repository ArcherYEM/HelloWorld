<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HelloWorld</title>
		<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
		<link  href="/resources/css/index/main.css" rel="stylesheet">
	</head>
	
	<body>
	<div class="index-frame">
		<div style="display:flex; flex-direction: row; align-items: center;">
			<a href="<c:url value='/'/>" style="width:20%"><img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>"></a>
			<h5 class="right">내 도토리: 1234개</h5>
			<ul class="right">
				<li ><a href="<c:url value='/store/minimiView'/>">상점</a></li>
				<li><a href="<c:url value='/notice/noticeView'/>">공지사항</a></li>
				<li><a href="<c:url value="/helloworld/minihome/main" />">내 미니홈피</a></li>
				<li><a href="<c:url value="/" />">로그아웃</a></li>
			</ul>
			
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
	                <img src="<c:url value="/resources/images/store/dotoriBuy10.png" />" width="225">
	                <div class="product-name">
	                   	&#8361; 1,100
	                </div>
	            </a>
				
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/store/dotoriBuy30.png" />" width="225">
	                <div class="product-name">
	                   	&#8361; 3,300
	                </div>
	                
	            </a>
				
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/store/dotoriBuy50.png" />" width="225">
	                <div class="product-name">
	                   	&#8361; 5,500
	                </div>
	                
	            </a>
				
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/store/dotoriBuy100.png" />" width="225">
	                <div class="product-name">
	                   	&#8361; 9,900
	                </div>
	                
	            </a>
				
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/store/dotoriBuy300.png" />" width="225">
	                <div class="product-name">
	                   	&#8361; 26.400
	                </div>
	                
	            </a>
			</div>
		</div>
	</div>
	</body>
</html>