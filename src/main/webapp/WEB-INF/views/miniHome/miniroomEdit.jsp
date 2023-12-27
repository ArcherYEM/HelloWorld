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
<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
</head>
<body>
  <div class="mnr-frame">
    <div class="section-over">
	    <div class="section1">
      	미니룸 배경
        	<div class="div-canvas" id="div-canvas"></div>
	    </div>
	    <div class="section2">
	   	  배경 목록
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
     	     미니미
     	     <div>
   	     		<img src="../../../../resources/images/icon/minimi/balokIcon.gif">     	     	
   	     		<img src="../../../../resources/images/icon/minimi/blueMushroomIcon.gif">    	     	
   	     		<img src="../../../../resources/images/icon/minimi/bunnyIcon.gif">     	     	
   	     		<img src="../../../../resources/images/icon/minimi/fairyIcon.gif">
     	     </div>
     	     <div>
     	     
     	     </div>
      </div>
    </div>
  </div>
  
  <script>
	var divCanvas = document.getElementById('div-canvas');
	var draggingImg = null;
  
	document.addEventListener('DOMContentLoaded', function() {
		// 배경 변경 스크립트 //
  		var section2 = document.querySelectorAll('.section2');
  		section2.forEach(function(div){
  			var images = div.querySelectorAll('img');
  			images.forEach(function(img){
  				img.addEventListener('click',function(){
  					var imgSrc = img.getAttribute('src');
  					divCanvas.style.backgroundImage = 'url(' + imgSrc + ')';
  					divCanvas.style.backgroundSize = '100% 100%';
  					divCanvas.style.backgroundRepeat = 'no-repeat';
  					divCanvas.style.backgroundPosition = 'center';
  				});
  			});
  		});
  		// 미니미 추가 스크립트 //
  		var section3 = document.querySelectorAll('.section3');
  		section3.forEach(function(div){
  			var images = div.querySelectorAll('img');
  			images.forEach(function(img){
  				img.addEventListener('click',function(){
  					var minimiContainer = document.createElement('div');
  					minimiContainer.style.width="100px";
  					minimiContainer.style.height="120px";					
  					
  					var minimiBtnContainer = document.createElement('div');
  					minimiBtnContainer.style.width="100px";
  					minimiBtnContainer.style.height="20px";
  					
  					var minimiBtnPlus = document.createElement('button');
  					minimiBtnPlus.style.width="20px";
  					minimiBtnPlus.style.height="20px";
  					minimiBtnPlus.className="minimiBtnPlus";
  					
  					var minimiBtnMinus = document.createElement('button');
  					minimiBtnMinus.style.width="20px";
  					minimiBtnMinus.style.height="20px";
  					minimiBtnMinus.className="minimiBtnMinus";
  					
  					var minimiBtnDelete = document.createElement('button');
  					minimiBtnDelete.style.width="20px";
  					minimiBtnDelete.style.height="20px";
  					minimiBtnDelete.className="minimiBtnDelete";
  					
  					var imgSrc = img.getAttribute('src');
  		            var newImg = document.createElement('img');
  		          	newImg.className="minimi";
  		            newImg.style.width="100px";
  		          	newImg.style.height="100px";
  		            newImg.src = imgSrc;

  		            divCanvas.appendChild(minimiContainer);
  					minimiContainer.appendChild(minimiBtnContainer);
  					minimiBtnContainer.appendChild(minimiBtnPlus);
  					minimiBtnContainer.appendChild(minimiBtnMinus);
  					minimiBtnContainer.appendChild(minimiBtnDelete);
  		            minimiContainer.appendChild(newImg);
  		            
  		            addDragEvent(minimiContainer);
  		          	addButtonEvent(minimiContainer);

  				});
  			});
  		});
		// 미니미 드래그 스크립트//
  		function addDragEvent(img) {
  		    img.addEventListener('mousedown', function(e) {
  		        draggingImg = img;
  		        offsetX = e.clientX - img.getBoundingClientRect().left;
  		        offsetY = e.clientY - img.getBoundingClientRect().top;
  		        img.style.position = 'absolute';
  		    });
  		}

  		document.addEventListener('mousemove', function(e) {
  		    if (draggingImg) {
  		        draggingImg.style.left = (e.clientX - offsetX) + 'px';
  		        draggingImg.style.top = (e.clientY - offsetY) + 'px';
  		    }
  		});

  		document.addEventListener('mouseup', function() {
  		    draggingImg = null;
  		});
 		
		// 버튼 기능 구현//
		function addButtonEvent(img) {
		    var plusButton = img.querySelector('.minimiBtnPlus');
		    var minusButton = img.querySelector('.minimiBtnMinus');
		    var deleteButton = img.querySelector('.minimiBtnDelete');
				
		    plusButton.addEventListener('click', function() {
		        
		    	img.style.width += 10;
		        console.log(img.style.width);
		    });
		
		    minusButton.addEventListener('click', function() {
		        // 이미지 크기를 줄이는 로직 추가
		        if (currentWidth > sizeIncrement) {
		            currentWidth -= sizeIncrement;
		            img.style.width = currentWidth + 'px';
		        }
		    });
		
		    deleteButton.addEventListener('click', function() {
		        // 이미지 삭제
		        img.remove();
		    });
		}
	
	});



</script>
  
</body>
</html>
