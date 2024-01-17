<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>헬로월드</title>
	    <link href="/resources/css/index/main.css" rel="stylesheet">
	    <link href="/resources/css/index/storeMMS.css" rel="stylesheet">
	    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
	    <script src="../../../../resources/js/jquery-3.7.1.min.js"></script>
	    <script src="<c:url value="/resources/js/storeCart.js" />"></script>
	</head>
	
	<body>
	<div class="index-frame">
	    <div class="divIndexMenu index-header">
	        <div class="index-header-left">
	            <a class="logoATag" href="<c:url value='/'/>">
	                <img class="index-header-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
	            </a>
	        </div>
	        <div class="index-header-right">
	        	<h5 class="right" id="userDotori"><img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"><span id="userDotoriCnt">${dotori}</span>개</h5>
	            <a href="<c:url value='/store/minimiView'/>" class="index-a-store">상점</a>
	            <a href="<c:url value='/notice/noticeView'/>" class="index-a-notice">공지사항</a>
	            <a id="linkMnh" href="#" 
	            	class="index-a-mnh" onclick="openMiniHomepage()">내 미니홈피
	            </a>
	            <a id="storeLoginLogout" href="<c:url value="/index/member/logout" />" class="index-a-logout" id="linkLogout">로그아웃</a>
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
	        <div class="product-title">
	        	미니미 상품 목록
	        </div>
	        <div class="content-container">
		        <!-- minimi select -->
		        <div class="productList">
				    <c:forEach var="minimi" items="${minimi}" varStatus="seq">
				        <div class="product" data-product-cate="미니미" data-product-table-cate="minimi" data-product-contentPath="${minimi.contentPath}"
						     data-product-name="${minimi.productName}" data-product-price="${minimi.productPrice}">
						    <div class="image-container">
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
				    <div class="cart-list-over">
				        <table id="cart-list">
				            <thead>
				                <tr>
				                    <th>카테고리</th>
				                    <th>상품명</th>
				                    <th>가격</th>
				                </tr>
				            </thead>
				            <tbody></tbody>
				        </table>
				    </div>
				  <div class="cart-list-under">
					  <input type="button" class="btnCart" id="btnCartClear" value="비우기">
					  <input type="button" class="btnCart" id="btnCartBuy" value="구매" onclick="buyCart()">
				  </div>
				</div>
			</div>
	        <!-- paging -->
	        <div class="minimi-paging">
	            <c:forEach var="page" begin="1" end="${totalPage}">
	                <span class="spanPage" data-page="${page}" onclick="loadPage(${page})">
					    【${page}】
					</span>
	            </c:forEach>
	        </div>
	        <form id="frm1" action="/store/minimiView" method="GET">
			    <input type="hidden" id="page" name="page" value="1">
			</form>
	    </div>
	</div>
	<script>
	function openMiniHomepage() {
	    // URL 정의
	    var url = "<c:url value='/mnHome/mainView/${sessionScope.userId.userNickname }' />";

	    // 크기 정의
	    var width = 1200;
	    var height = 720;

	    // 화면 중앙에 새 창을 위치시키기 위해 위치 계산
	    var left = (window.innerWidth - width) / 2;
	    var top = (window.innerHeight - height) / 2;

	    // 새 창 열기
	    var newWindow = window.open(url, 'MiniHomepage', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);

	    // 새 창이 열린 후, 현재 창을 그대로 유지하기 위해 기본 링크 동작 방지
	    if (newWindow) {
	        newWindow.focus(); // 새 창을 포커스합니다.
	    }
	    return false;
	}
	
// 	부모창 리로드 명령
	function reloadParentWindow() {
		location.href = "<c:url value="/index/member/logout" />"
	    location.reload();
	}
	</script>
	<script>
		window.onload = function() {
			var currentPage = getParameterByName('page');
	        var pageLinks = document.querySelectorAll('.spanPage');
	        
	        for (var i = 0; i < pageLinks.length; i++) {
	            var pageLink = pageLinks[i];
	            var pageNumber = pageLink.getAttribute('data-page');

	            if (pageNumber === currentPage) {
	                pageLink.style.color = 'blue';
	                pageLink.style.fontWeight = 'bold';
	            }
	        }
	        
	        if (currentPage === null) {
	            var firstPageLink = document.querySelector('.spanPage[data-page="1"]');
	            if (firstPageLink) {
	                firstPageLink.style.color = 'blue';
	            }
	        }
		
	        let userDotoriElement = document.getElementById('userDotori');
	        let storeLoginMyhome = document.getElementById('storeLoginMyhome');
	        let storeLoginLogout = document.getElementById('storeLoginLogout');
	        let userDotoriCnt = '<c:out value="${dotori}" />' || '';
	
	        if (userDotoriCnt.trim() !== '') {
	            userDotoriElement.style.display = 'block';
	            storeLoginLogout.style.display = 'block';
	        } else {
	            userDotoriElement.style.display = 'none';
	            storeLoginMyhome.style.display = 'none';
	            storeLoginLogout.style.display = 'none';
	        }
	        
	        function getParameterByName(name, url) {
	            if (!url) {
	                url = window.location.href;
	            }
	            name = name.replace(/[\[\]]/g, '\\$&');
	            var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
	                results = regex.exec(url);
	            if (!results) return null;
	            if (!results[2]) return '';
	            return decodeURIComponent(results[2].replace(/\+/g, ' '));
	        }
	        
		}
		showUserInfo();
		function showUserInfo() {
		    let userEmail = '<c:out value="${sessionScope.userId.userEmail}" />';
		    let linkMnh = document.getElementById('linkMnh');
		    let linkLogout = document.getElementById('linkLogout');
		    let userDotoriElement = document.getElementById('userDotori');
		    let userDotoriCnt = '${dotori}';
		    let helloMessage = document.getElementById('helloMessage');
		    let divHome = document.getElementById('divHome');
		    let divLogin = document.getElementById('divLogin');
		    console.log('userEmail : ' + userEmail);

		    // userEmail이 빈 문자열인 경우
		    if (userEmail === '') {
		        divHome.style.display = 'none';
		    } else {
		        divHome.style.display = 'block';
		    }

		    if (userEmail !== '') {
		       linkMnh.style.display = 'block';
		       linkLogout.style.display = 'block';
		       divLogin.style.display = 'block';
		       document.getElementById('indexDotoriImg').style.display = 'inline-block';
		    } else {
		        linkMnh.style.display = 'none';
		        linkLogout.style.display = 'none';
		        divLogin.style.display = 'none';
		        document.getElementById('indexDotoriImg').style.display = 'none';
		    }

		    if (userDotoriElement) {
		       if (userDotoriCnt.trim() !== '' && userDotoriCnt !== 'null') {
		           userDotoriElement.innerHTML = '<img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"> ' + userDotoriCnt + ' 개';
		           userDotoriElement.style.display = 'block';
		       } else {
		           userDotoriElement.innerHTML = '<img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"> 0 개';
		           userDotoriElement.style.display = 'none';
		       }
		    }
		}
		document.getElementById('btnCartClear').addEventListener('click',function() {
			clearCart();
		});
	</script>
	<script>
	document.querySelectorAll('.image-container').forEach(function(container) {
	    container.querySelector('.store-minimi-img').addEventListener('click', function() {
	        enlargeAndFadeOut(this);
	    });
	});
	function enlargeAndFadeOut(image) {
	    image.style.transform = 'scale(1.5)';
	    image.style.opacity = '0';

	    image.style.transition = 'transform 0.5s ease, opacity 0.5s ease';

	    image.addEventListener('transitionend', function() {
	        image.style.transform = 'scale(1)';
	        image.style.opacity = '1';
	        image.style.transition = 'none';
	    });
	}
	</script>
	</body>
</html>
