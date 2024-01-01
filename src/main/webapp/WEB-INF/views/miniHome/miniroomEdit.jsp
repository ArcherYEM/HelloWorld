<!-- views/miniHome/main -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizeable:no">
<head>
<meta charset="UTF-8">
<title>미니홈피</title>
<link rel="stylesheet" href="../../../../resources/css/minihome/fonts.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/miniroomEdit.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<div class="mnr-frame">
		<div class="section-over">
			<div class="section1">
				<div class="miniroom-title">
					미니룸 배경			    	
				</div>
	        	<div class="div-canvas" id="div-canvas"></div>
	    	</div>
	    <div class="section2">
			<div class="background-title">
	   	  		배경 목록
	    	</div>
	   		<div class="mnr-bg">
		        <img src="../../../../resources/images/miniroom/aquariumBg.png"/>
		        <img src="../../../../resources/images/miniroom/cursedtempleBg.png"/> 
		        <img src="../../../../resources/images/miniroom/ludibriumBg.png"/> 
		        <img src="../../../../resources/images/miniroom/orbisBg.png"/>
	    	</div>
		</div>
		</div>
		<div class="section-under">
			<div class="section3">
				<div class="minimi-title">
					미니미				
				</div>
				<c:forEach var="item" items="${minimi}" varStatus="status">
				    <c:if test="${status.count % 7 == 1}">
				        <div class="minimiImg">
				    </c:if>
				    
				    <img src="../../../../${item.contentPath}">
				
				    <c:if test="${status.count % 7 == 0 || status.last}">
				        </div>
				    </c:if>
				</c:forEach>
			</div>
			<div class="button-section">
			    <form id="minimiForm" action="/mnHome/miniroomSave" method="post">
			        <input type="button" class="btn-confirm" value="적용" onclick="confirmEdit()">
			        <input type="button" class="btn-cancel" value="취소" onclick="cancelEdit()">
			    </form>
			</div>
		</div>
	<script src="../../../../resources/js/miniroomEditor.js"></script> 
	<script>
		function cancelEdit(){
			window.close();
		}	
	
		function confirmEdit() {
		    var form = document.getElementById('minimiForm'); // 폼 요소 선택

		 	// 현재 캔버스의 배경 이미지 정보를 가져옵니다.
		    var backgroundStyle = divCanvas.style.backgroundImage;
		    var src = backgroundStyle.slice(5, -2); // "url('...')" 형식에서 URL 추출

		    // 파일 이름 추출 (경로와 확장자 제거)
		    var name = src.split('/').pop().split('.')[0];

		    // 배경 이미지 이름의 hidden 입력 필드 생성 및 설정
		    var inputName = document.createElement('input');
		    inputName.type = 'hidden';
		    inputName.name = 'backgroundName';
		    inputName.value = name;
		    form.appendChild(inputName);

		    // 캔버스에 있는 모든 미니미 컨테이너를 찾아서 각각의 정보를 hidden 입력 필드로 추가합니다.
		    document.querySelectorAll('.minimiContainer').forEach(function(container, index) {
		        var img = container.querySelector('.minimi');
		        var left = container.style.left; // 컨테이너에서 left 값 추출
		        var top = container.style.top; // 컨테이너에서 top 값 추출
		        var src = img.src;
		        var name = src.split('/').pop().split('.')[0]; // 파일 이름 추출

		        // 미니미 이름(hidden) 입력 필드 생성 및 설정
		        var inputName = document.createElement('input');
		        inputName.type = 'hidden';
		        inputName.name = 'minimiName' + index;
		        inputName.value = name;
		        form.appendChild(inputName);

		        // 미니미 left(hidden) 입력 필드 생성 및 설정
		        var inputLeft = document.createElement('input');
		        inputLeft.type = 'hidden';
		        inputLeft.name = 'minimiLeft' + index;
		        inputLeft.value = left;
		        form.appendChild(inputLeft);

		        // 미니미 top(hidden) 입력 필드 생성 및 설정
		        var inputTop = document.createElement('input');
		        inputTop.type = 'hidden';
		        inputTop.name = 'minimiTop' + index;
		        inputTop.value = top;
		        form.appendChild(inputTop);
		    });

		    // 폼을 서버로 전송합니다.
		    form.submit();
		}

		
	</script>
</body>
</html>
