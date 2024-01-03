<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizable:no">
<head>
    <meta charset="UTF-8">
    <title>미니미 설정</title>
    <link rel="stylesheet" href="../../../../resources/css/minihome/minimiChange.css" />
    <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	
	<div class="mnm-frame">
	
		<form id="mnmForm" action="/mnHome/mnhMinimiChangeAction" method="POST">
		    <div class="mnm-change">
		        <c:forEach items="${userStorageList}" var="userStorage">
		            <div class="mnm-change-group">
		                <img src="<c:url value="${userStorage.contentPath}"/>" class="mnm-change-img"/>
		                <p class="mnm-change-p">${userStorage.productName}</p>
		                <input type="checkbox" class="mnm-ckbox" name="selectedUserStorage" value="${userStorage.productName}" />
		            </div>
		        </c:forEach>
		    </div>
		    
		    <div class="mnm-change-btn-group">
		        <input type="button" class="mnm-change-btn-cancle" id="cancel" value="취소" />
		        <input type="submit" class="mnm-change-btn-choice" id="choice" value="적용" />
		    </div>
		</form>
		
	</div>
	
	<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
	<script>
		// 창닫기
		document.getElementById("cancel").addEventListener("click", function() {
		    window.close();
		});
	</script>
	<script>
	    // mnm-change-group 요소에 대한 클릭 이벤트 리스너 추가
	    var mnmChangeGroups = document.querySelectorAll(".mnm-change-group");
	
	    mnmChangeGroups.forEach(function(group) {
	        group.addEventListener("click", function() {
	            // 현재 클릭한 요소의 체크박스와 border 가져오기
	            var checkbox = group.querySelector("input[type='checkbox']");
	            var currentBorder = group.style.border;
	
	            // 다른 모든 요소의 체크박스 해제 및 border 초기화
	            mnmChangeGroups.forEach(function(otherGroup) {
	                if (otherGroup !== group) {
	                    var otherCheckbox = otherGroup.querySelector("input[type='checkbox']");
	                    otherCheckbox.checked = false;
	                    otherGroup.style.border = "2px solid orange"; // 다른 요소들의 border 설정
	                    otherGroup.style.borderRadius = "5px"; // 다른 요소들의 border-radius 설정
	                }
	            });
	
	            // 현재 클릭한 요소의 체크박스 상태 토글 및 border 설정
	            checkbox.checked = !checkbox.checked;
	            group.style.border = checkbox.checked ? "2px solid red" : "2px solid orange";
	            group.style.borderRadius = checkbox.checked ? "5px" : "5px";
	        });
	    });
	</script>
	<script>
		document.getElementById("choice").addEventListener("click", function(event) {
		    // 선택한 상품 목록을 폼 필드에 추가
		    var selectedProducts = [];
		    var checkboxes = document.querySelectorAll(".mnm-ckbox");
		    checkboxes.forEach(function(checkbox) {
		        if (checkbox.checked) {
		            selectedProducts.push(checkbox.value);
		        }
		    });
		    
		    // 선택한 상품 목록을 숨겨진 필드(hidden field)에 설정
		    var selectedProductsInput = document.createElement("input");
		    selectedProductsInput.type = "hidden";
		    selectedProductsInput.name = "selectedProducts";
		    selectedProductsInput.value = selectedProducts.join(",");
		    
		    // 폼에 숨겨진 필드 추가
		    var mnmForm = document.getElementById("mnmForm");
		    mnmForm.appendChild(selectedProductsInput);
		    
		    // 폼을 서버로 제출
		    mnmForm.submit();
		    
		    // 기본 동작 중단 (페이지 이동 방지)
		    event.preventDefault();
		});
	</script>

</body>
</html>
