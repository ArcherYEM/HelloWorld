<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>헬로월드</title>
	<link href="/resources/css/index/main.css" rel="stylesheet">
	<link href="/resources/css/index/store.css" rel="stylesheet">
	<link href="/resources/css/index/bgm.css" rel="stylesheet">
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
	            <a id="storeLoginLogout" href="<c:url value="/index/member/logout" />" class="index-a-logout">로그아웃</a>
	        </div>
      	</div>
		<div id="divHiUser">
			<a class="storeAtag" href="/store/minimiView">미니미</a>
			<a class="storeAtag" href="/store/skinView">스킨</a>
			<a class="storeAtag" href="/store/menuView">메뉴</a>
			<a class="storeAtag" href="/store/dotoriView">도토리</a>
			<a class="storeAtag present" href="/store/bgmView">bgm</a>
		</div>
		<div class="bgm-frame">
			<div class="bgm-search-group">
				<input type="text" class="bgm-search-input" id="searchInput" onkeyup="search()"placeholder="제목 혹은 가수명을 입력하세요" maxlength="18" autofocus>
				<button class="bgm-search-btn" id="searchBtn"></button> <!-- 돋보기 아이콘 css 처리 -->
			</div>
			<div class="bgm-list-group bgm-grid">
				<div><input type="checkbox" id="selectAllCheckbox"></div>
				<div>순번</div>
				<div>제목</div>
				<div>아티스트</div>
				<div>재생시간</div>
				<div>금액</div>
			</div>
			<div id="test">
<!-- 				Ajax 로 Bgm List 뿌려주는 공간 -->
			</div>
			<div class="bgm-buy">
				<input type="button" value="구매" onclick="openNewWindowBgmBuy()">
			</div>
		</div>
	</div>
	<div class="bottom-fix">
	</div>
	 <jsp:include page="/WEB-INF/views/index/footer.jsp"></jsp:include>
	<form id="frmSearch" action="<c:url value='/store/bgmView'/>" method="post">
		<input type="hidden" name="content" id="content">	
	</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        let storeLoginMyhome = document.getElementById('storeLoginMyhome');
        let storeLoginLogout = document.getElementById('storeLoginLogout');
        let userDotoriCnt = '<c:out value="${dotori}" />' || '';

        if (userDotoriCnt.trim() !== '') {
            userDotoriElement.style.display = 'block';
            storeLoginMyhome.style.display = 'block';
            storeLoginLogout.style.display = 'block';
        } else {
            userDotoriElement.style.display = 'none';
            storeLoginMyhome.style.display = 'none';
            storeLoginLogout.style.display = 'none';
        }
	}
	function reloadParentWindow() {
	    location.reload();
	}
	
	
	//검색 기능
	function search(){
		$('#content').val($('#searchInput').val());
		$.ajax({
			method:"POST"
			,url: '<c:url value="/store/bgm/searchBgm"/>'
			,data: {content:$('#content').val()}		
		}).done(function( msg ){
			var resultHtml = '';
			if('success'==msg.result){
				if(msg.data.length>0){
	            $.each(msg.data, function(i, item) {
	            	resultHtml += '<div class="bgm-list bgm-grid" id="ajaxTable">';
	                resultHtml += '<div><input type="checkbox" id="checkbox' + i + '"></div>';
	                resultHtml += '<div>' + (i + 1) + '</div>';
	                resultHtml += '<div>' + item.title + '</div>';
	                resultHtml += '<div>' + item.artist + '</div>';
	                resultHtml += '<div>' + item.runningTime + '</div>';
	                resultHtml += '<div>' + item.bgmPrice + '</div>';
	                resultHtml += '</div>';
	                $('#test').html(resultHtml);
	            });
	            
	            $('#selectAllCheckbox').on('change', function () {
	                var isChecked = $(this).prop('checked');
	                for (var i = 0; i < msg.data.length; i++) {
	                    $('#checkbox' + i).prop('checked', isChecked);
	                }
	            });
	            
	            $(document).ready(function() {
	                $('.bgm-list.bgm-grid').on('click', function() {
	                    var checkbox = $(this).find('input[type="checkbox"]');
	                    checkbox.prop('checked', !checkbox.prop('checked'));
	
	                }).find('input[type="checkbox"]').on('click', function(e) {
	                    e.stopPropagation(); // 부모 요소의 클릭 이벤트 전파 막기
	                });
	            });
	
			} else {
				 resultHtml += '<div>';
	             resultHtml += '<div style="text-align:center;">검색 결과가 없습니다.</div>';
	             resultHtml += '</div>';
			}
			$('#test').html(resultHtml);			
			}else if('fail'==msg.result){
				alert('에러');
			}
		});
	}
	
	$('#searchBtn').on('click',function(){
		search();	
	});
	
	$(document).ready(function() {
		search();
	});
	</script>
	<script>
		var selected = [];
		
		function openNewWindowBgmBuy() {
			$('.bgm-list.bgm-grid').each(function() {
			    if ($(this).find('input[type="checkbox"]').prop('checked')) {
			      var title = $(this).find('div:eq(2)').text();
			      var artist = $(this).find('div:eq(3)').text();
			      var price = $(this).find('div:eq(5)').text();
			      
			      var selectedItem = {
			        title: title,
			        artist: artist,
			        price: price
			      };
	
			      selected.push(selectedItem);
			    }
			  });
			var windowSettings = 'width=800, height=600, scrollbars=no, resizable=no, toolbar=no, menubar=no, left=100, top=50';
			var selectedData = JSON.stringify(selected);
			window.open('/store/bgmBuy?selectedData=' + encodeURIComponent(selectedData), '_blank', windowSettings);
		}

</script>

</body>
</html>