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
		<link  href="/resources/css/main.css" rel="stylesheet">
		<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
	</head>
	
	<body>
		<div style="display:flex; flex-direction: row; align-items: center;">
			<a href="<c:url value='/'/>"  style="width:20%"><img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>"></a>
			<h5 class="right">내 도토리: 1234개</h5>
			<ul class="right">
				<li ><a href="<c:url value='/store/minimiView'/>">상점</a></li>
				<li><a href="<c:url value='/notice/noticeView'/>">공지사항</a></li>
				<li><a href="<c:url value="/helloworld/minihome/main" />">내 미니홈피</a></li>
				<li><a href="<c:url value="/" />">로그아웃</a></li>
			</ul>
			
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
			<div class="productList">
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
	                   	주황버섯
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/balokIcon.gif" />" width="225">
	                <div class="product-name">
	                   	발록
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/grupinIcon.gif" />" width="225">
	                <div class="product-name">
	                   	그류핀
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/duckyFamilyIcon.gif" />" width="225">
	                <div class="product-name">
	                   	덕패밀리
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/horangIcon.gif" />" width="225">
	                <div class="product-name">
	                   	호랑이
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/starPixieIcon.gif" />" width="225">
	                <div class="product-name">
	                   	스타픽시
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/greiIcon.gif" />" width="225">
	                <div class="product-name">
	                   	그레이
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/stonGolemIcon.gif" />" width="225">
	                <div class="product-name">
	                   	스톤골렘
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
				<a href="#" class="product">
	                <img src="<c:url value="/resources/images/icon/minimi/scubaPepeIcon.gif" />" width="225">
	                <div class="product-name">
	                   	스쿠버페페
	                </div>
	                <div class="product-price">
	                  	도토리10개
	                </div>
	            </a>
		
			</div>
		</div>
	</body>
</html>