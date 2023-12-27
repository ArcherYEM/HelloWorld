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
	    	<div class="section1-title">
      		미니룸 배경
      	</div>
      	<div class="section1-canvas">
        	<canvas id="canvas" width="515" height="320"></canvas>
        </div>
	    </div>
	    <div class="section2">
	   	  배경 목록
	   		<div class="mnr-bg">
	        <img src="../../../../resources/images/miniroom/aquariumBg.png" onclick="displayBackground('../../../../resources/images/miniroom/aquariumBg.png')" />
	        <img src="../../../../resources/images/miniroom/cursedtempleBg.png" onclick="displayBackground('../../../../resources/images/miniroom/cursedtempleBg.png')" /> 
	        <img src="../../../../resources/images/miniroom/ludibriumBg.png" onclick="displayBackground('../../../../resources/images/miniroom/ludibriumBg.png')" /> 
	        <img src="../../../../resources/images/miniroom/orbisBg.png" onclick="displayBackground('../../../../resources/images/miniroom/orbisBg.png')" />
	    	</div>
	    </div>
		 </div>
		 <div class="section-under">
      <div class="section3">
     	     미니미
      </div>
    </div>
  </div>
  
  <script>
    function displayBackground(imageSrc) {
      var canvas = document.getElementById('canvas');
      var ctx = canvas.getContext('2d');
      var img = new Image();
      img.src = imageSrc;
      img.onload = function() {
          ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
      };
    }
</script>
  
</body>
</html>
