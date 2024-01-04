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
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<div class="mnr-frame">
		<% Boolean loginStatus = (Boolean) request.getAttribute("loginStatus"); %>
		<% if (loginStatus == null || !loginStatus) { %>
			<div class="edit-text">로그인  후 이용해주세요.</div>
		<% } else { %> 
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
					    </c:if>
					</c:forEach>
			        </div>
				</div>
				<div class="button-section">
				    <form id="minimiForm" action="/mnHome/miniroomSave" method="post">
				        <input type="button" class="btn-confirm" value="적용" onclick="confirmEdit()">
				        <input type="button" class="btn-cancel" value="취소" onclick="cancelEdit()">
				    </form>
				</div>	
		<% } %>		
		</div>
	<script src="../../../../resources/js/miniroomEditor.js"></script> 
</body>
</html>
