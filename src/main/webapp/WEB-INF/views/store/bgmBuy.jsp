<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HelloWorld</title>
	<link href="/resources/css/index/main.css" rel="stylesheet">
	<link href="/resources/css/index/store.css" rel="stylesheet">
	<link href="/resources/css/index/bgm.css" rel="stylesheet">
	<link rel="stylesheet" href="../../../../resources/css/minihome/fonts.css" />
	<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<div class="bgmBuy-frame">
		<div class="bgmBuy-title-group">
			<div class="bgmBuy-title font-kyobohand">
				BGM 구매
			</div>
			<div class="bgmBuy-carImg">
				<img alt="쇼핑카트 이미지" src="/resources/images/default/cart.png">
			</div>
		</div>
		<div class="bgmBuy-list-cnt font-kyobohand">
			<span class="bgmBuy-list-cnt-left">구매 곡 수 :</span> 
			<span class="bgmBuy-list-cnt-right">
			    <c:set var="itemCount" value="0" />
			    <c:forEach items="${selectedData}" var="bgmItem">
			        <c:set var="itemCount" value="${itemCount + 1}" />
			    </c:forEach>
			    ${itemCount}
			</span>
		</div>
		<div class="bgmBuy-list-group">
		    <table class="bgmBuy-list-table">
		        <thead>
		            <tr>
		                <th class="bgmBuy-data-title">제목</th>
		                <th class="bgmBuy-data-artist">아티스트</th>
		                <th class="bgmBuy-data-price">가격</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach items="${selectedData}" var="bgmItem">
		                <tr>
		                    <td>${bgmItem.title}</td>
		                    <td>${bgmItem.artist}</td>
		                    <td>${bgmItem.price}</td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		</div>
		<div class="bgmBuy-total font-kyobohand">
			<span class="bgmBuy-total-left">결제 예정 도토리 수 :</span>
			<c:set var="totalPrice" value="0" />
			<c:forEach items="${selectedData}" var="bgmItem">
			    <c:set var="totalPrice" value="${totalPrice + bgmItem.price}" />
			</c:forEach>
			<span class="bgmBuy-total-right">${totalPrice}</span>
		</div>
		<div class="bgmBuy-btn-group">
		    <div class="bgmBuy-btn-n">
		        <input type="button" value="취소" onclick="cancelBgmBuy()">
		    </div>
		    <div class="bgmBuy-btn-y">
		        <input type="button" value="구매" onclick="okBuyBgm()">
		    </div>
		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var selected = [];
    var userNickname = '${sessionScope.userId.userNickname}';
    function openNewWindowBgmBuy() {
        var windowSettings = 'width=800, height=600, scrollbars=no, resizable=no, toolbar=no, menubar=no, left=100, top=50';
        var selectedData = JSON.stringify(selected);
        window.open('/store/bgmBuy?selectedData=' + encodeURIComponent(selectedData), '_blank', windowSettings);
    }

    function cancelBgmBuy() {
        $('.bgm-list.bgm-grid input[type="checkbox"]:checked').each(function () {
            var indexToRemove = $(this).closest('.bgm-list.bgm-grid').index();
            selected.splice(indexToRemove, 1);
        });

        renderSelectedItems();
        window.close();
        
        if (window.opener && !window.opener.closed) {
            window.opener.reloadParentWindow();
        }
    }

    function renderSelectedItems() {
        var resultHtml = '';

        $.each(selected, function (i, item) {
            resultHtml += '<div class="bgm-list bgm-grid" id="ajaxTable">';
            resultHtml += '<div><input type="checkbox" id="checkbox' + i + '"></div>';
            resultHtml += '<div>' + (i + 1) + '</div>';
            resultHtml += '<div>' + item.title + '</div>';
            resultHtml += '<div>' + item.artist + '</div>';
            resultHtml += '<div>' + item.runningTime + '</div>';
            resultHtml += '<div>' + item.bgmPrice + '</div>';
            resultHtml += '</div>';
        });

        $('#test').html(resultHtml);
    }

    function okBuyBgm() {
        var form = document.createElement('form');
        form.method = 'POST';
        form.action = '/store/bgmBuyOk';

        var inputUserNickname = document.createElement('input');
        inputUserNickname.type = 'hidden';
        inputUserNickname.name = 'userNickname';
        inputUserNickname.value = userNickname;
        form.appendChild(inputUserNickname);
        
        var inputBgmList = document.createElement('input');
        inputBgmList.type = 'hidden';
        inputBgmList.name = 'bgmList';
        inputBgmList.value = JSON.stringify(selected);
        form.appendChild(inputBgmList);

        selected.forEach(function(item, index) {
            var inputTitle = document.createElement('input');
            inputTitle.type = 'hidden';
            inputTitle.name = 'bgmList[' + index + '].title';
            inputTitle.value = item.title;
            form.appendChild(inputTitle);

            var inputArtist = document.createElement('input');
            inputArtist.type = 'hidden';
            inputArtist.name = 'bgmList[' + index + '].artist';
            inputArtist.value = item.artist;
            form.appendChild(inputArtist);

            var inputPrice = document.createElement('input');
            inputPrice.type = 'hidden';
            inputPrice.name = 'bgmList[' + index + '].price';
            inputPrice.value = item.bgmPrice;
            form.appendChild(inputPrice);
        });

        document.body.appendChild(form);
        form.submit();
    }
</script>
	
</body>
</html>