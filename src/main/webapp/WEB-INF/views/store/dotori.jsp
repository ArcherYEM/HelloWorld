<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>헬로월드</title>
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
	       <div class="index-header-right">
				<h5 class="right" id="userDotori"><img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"><span id="userDotoriCnt">${dotori}</span>개</h5>
	            <a href="<c:url value='/store/minimiView'/>" class="index-a-store press-btn">상점</a>
	            <a href="<c:url value='/notice/noticeView'/>" class="index-a-notice">공지사항</a>
	            <a href="<c:url value='/index/mapView'/>" class="index-a-map">찾아오는 길</a>
	            <c:if test="${sessionScope.userId ne null }">
	            	<a id="storeLoginLogout" href="<c:url value="/index/member/logout" />" class="index-a-logout">로그아웃</a>
	            </c:if>
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
	 <jsp:include page="/WEB-INF/views/index/footer.jsp"></jsp:include>
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
		let userDotoriElement = document.getElementById('userDotori');
        //let storeLoginMyhome = document.getElementById('storeLoginMyhome');
        let storeLoginLogout = document.getElementById('storeLoginLogout');
        let userDotoriCnt = '<c:out value="${dotori}" />' || '';

        if (userDotoriCnt.trim() !== '') {
            userDotoriElement.style.display = 'block';
            //storeLoginMyhome.style.display = 'block';
            storeLoginLogout.style.display = 'block';
        } else {
            userDotoriElement.style.display = 'none';
            //storeLoginMyhome.style.display = 'none';
            storeLoginLogout.style.display = 'none';
        }
        const products = document.querySelectorAll('.product');
        products.forEach(function(product) {
            product.addEventListener('click', function(event) {
                event.preventDefault(); // 기본 앵커 동작 방지
                products.forEach(function(p) {
                    p.style.border = ""; // 테두리 스타일 초기화
                    p.querySelector('.product-radio').checked = false; // 라디오 버튼 선택 해제
                });

                this.style.border = "2px solid red";
                this.querySelector('.product-radio').checked = true;
            });
        });
    };
    
    function orderOpen() {
        var radioButtons = document.querySelectorAll('input[name="productSelect"]');
        var selectedButton = Array.from(radioButtons).find(function(radio) {
            return radio.checked;
        });
        if (selectedButton) {
            var orderUrl = "/store/orderView?selectedProduct=" + encodeURIComponent(selectedButton.value);
            window.open(orderUrl, '_blank', 'width=900,height=800');
        } else {
            alert("상품을 선택해주세요.");
        }
    }
	</script>
	</body>
</html>