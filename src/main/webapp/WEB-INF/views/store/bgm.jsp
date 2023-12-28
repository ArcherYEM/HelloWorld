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
	<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
</head>

<body>
	<div class="index-frame">
		<div class="divIndexMenu index-header">
	      <div class="index-header-left">
	         <a class="logoATag" href="<c:url value='/'/>">
	           <img class="index-header-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
	         </a>
	       </div>
				<h5 class="right">내 도토리: 1234개</h5>
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
			<a class="storeAtag" href="/store/dotoriView">도토리</a>
			<a class="storeAtag present" href="/store/bgmView">bgm</a>
		</div>
	
	
		<div class="bgm-frame">
		
			<div class="bgm-search-group">
				<input type="text" class="bgm-search-input" id="searchInput" onkeyup="searchFunction()" placeholder="제목 혹은 가수명을 입력하세요" maxlength="18">
				<button class="bgm-search-btn" onclick="searchFunction();"></button> <!-- 돋보기 아이콘 css 처리 -->
			</div>
			
			<div class="bgm-list-group bgm-grid">
				<div><input type="checkbox"></div>
				<div>순번</div>
				<div>제목</div>
				<div>아티스트</div>
				<div>재생시간</div>
				<div>금액</div>
			</div>
			
			<c:forEach var="bgm" items="${bgmInfo}">
				<div class="bgm-list bgm-grid" id="ajaxTable">
					<div><input type="checkbox"></div>
					<div><c:out value="${bgm.seq }"/></div>
					<div><c:out value="${bgm.title }"/></div>
					<div><c:out value="${bgm.artist }"/></div>
					<div><c:out value="${bgm.runningTime }"/></div>
					<div><c:out value="${bgm.bgmPrice }"/></div>
				</div>
			</c:forEach>
			
			
			<div class="bgm-buy">
				<input type="button" value="구매">
			</div>
			
		</div>
	
	</div>
	<div class="bottom-fix">
		<hr>
		<h1>team core</h1>
	</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
// 검색창 글자수 제한기능
    $(document).ready(function() {
        $(".bgm-search-input").on("input", function() {
            var maxLength = 18;
            if ($(this).val().length > maxLength) {
                $(this).val($(this).val().substring(0, maxLength));
                alert("입력 글자수를 초과하였습니다.");
            }
        });
    });
</script>

<script>
// 전체선택 기능
    $(document).ready(function() {
        var $selectAllCheckbox = $(".bgm-list-group input[type='checkbox']");
        var $listCheckboxes = $(".bgm-list input[type='checkbox']");
        
        $selectAllCheckbox.on("change", function() {
            var isChecked = $(this).prop("checked");
            
            $listCheckboxes.prop("checked", isChecked);
        });
    });
</script>

<script>
// 리스트 div 단위 체크박스 선택/해제기능
    $(document).ready(function() {
        $(".bgm-list").on("click", function(e) {
            if ($(e.target).is(":checkbox")) {
                return;
            }
            
            var $checkbox = $(this).find("input[type='checkbox']");
            $checkbox.prop("checked", !$checkbox.prop("checked"));
        });
    });
</script>
<script>

</script>


</body>
</html>