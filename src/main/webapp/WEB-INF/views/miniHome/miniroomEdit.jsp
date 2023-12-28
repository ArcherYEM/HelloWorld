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
			<div class="minimiImg">
				<img src="../../../../resources/images/icon/minimi/balokIcon.gif">
   	     		<img src="../../../../resources/images/icon/minimi/blueMushroomIcon.gif">    	     	
   	     		<img src="../../../../resources/images/icon/minimi/bunnyIcon.gif">
   	     		<img src="../../../../resources/images/icon/minimi/fairyIcon.gif">
   	     		<img src="../../../../resources/images/icon/minimi/ticktockIcon.gif">
   	     		<img src="../../../../resources/images/icon/minimi/stoneBallIcon.gif">
   	     		<img src="../../../../resources/images/icon/minimi/toyTrojanIcon.gif">
     	     </div>
     	     <div class="minimiImg">
     	     	<img src="../../../../resources/images/icon/minimi/duckyFamilyIcon.gif">
     	     	<img src="../../../../resources/images/icon/minimi/hornGoblinIcon.gif">
     	     	<img src="../../../../resources/images/icon/minimi/juniorDarkYetiIcon.gif">
     	     	<img src="../../../../resources/images/icon/minimi/rupanIcon.gif">
     	     	<img src="../../../../resources/images/icon/minimi/ribbonPigIcon.gif">
     	     	<img src="../../../../resources/images/icon/minimi/grupinIcon.gif">
     	     	<img src="../../../../resources/images/icon/minimi/helicopterIcon.gif">
     	     </div>
			</div>
		</div>
	</div>
	<script src="../../../../resources/js/miniroomEditor.js"></script> 
</body>
</html>
