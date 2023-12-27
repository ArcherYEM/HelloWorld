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
	<link href="/resources/css/index/bgm.css" rel="stylesheet">
	<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
</head>

<body>
	<div class="index-frame">
		<div style="display: flex; flex-direction: row; align-items: center;">
			<a href="<c:url value='/'/>" style="width: 20%"><img id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>"></a>
			<h5 class="right">내 도토리: 1234개</h5>
			<ul class="right">
				<li><a href="<c:url value='/store/minimiView'/>">상점</a></li>
				<li><a href="<c:url value='/notice/noticeView'/>">공지사항</a></li>
				<li><a href="<c:url value="/helloworld/minihome/main" />">내 미니홈피</a></li>
				<li><a href="<c:url value="/" />">로그아웃</a></li>
			</ul>
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
				<input type="text" class="bgm-search-input" placeholder="제목 혹은 가수명을 입력하세요" maxlength="18">
				<button class="bgm-search-btn"></button> <!-- 돋보기 아이콘 css 처리 -->
			</div>
			
			<div class="bgm-list-group bgm-grid">
				<div><input type="checkbox"></div>
				<div>순번</div>
				<div>제목</div>
				<div>아티스트</div>
				<div>재생시간</div>
				<div>금액</div>
			</div>
			<div class="bgm-list bgm-grid">
				<div><input type="checkbox"></div>
				<div>1</div>
				<div>Super Star</div>
				<div>쥬얼리</div>
				<div>03:18</div>
				<div>10</div>
			</div>
			<div class="bgm-list bgm-grid">
				<div><input type="checkbox"></div>
				<div>2</div>
				<div>죽을만큼 아파서</div>
				<div>mc몽</div>
				<div>03:38</div>
				<div>10</div>
			</div>
			<div class="bgm-list bgm-grid">
				<div><input type="checkbox"></div>
				<div>3</div>
				<div>거짓말</div>
				<div>빅뱅</div>
				<div>03:58</div>
				<div>10</div>
			</div>
			<div class="bgm-list bgm-grid">
				<div><input type="checkbox"></div>
				<div>4</div>
				<div>Tell me</div>
				<div>원더걸스</div>
				<div>04:10</div>
				<div>10</div>
			</div>
			<div class="bgm-list bgm-grid">
				<div><input type="checkbox"></div>
				<div>5</div>
				<div>Gee</div>
				<div>소녀시대</div>
				<div>03:11</div>
				<div>10</div>
			</div>
			<div class="bgm-list bgm-grid">
				<div><input type="checkbox"></div>
				<div>6</div>
				<div>U</div>
				<div>슈퍼주니어</div>
				<div>04:11</div>
				<div>10</div>
			</div>
			<div class="bgm-list bgm-grid">
				<div><input type="checkbox"></div>
				<div>7</div>
				<div>슬픈다짐</div>
				<div>다빈치</div>
				<div>03:17</div>
				<div>10</div>
			</div>
			
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


</body>
</html>