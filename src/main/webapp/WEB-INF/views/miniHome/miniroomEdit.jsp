<!-- views/miniHome/miniroomEdit -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="ko" style="resizeable:no">
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<link rel="stylesheet" href="../../../../resources/css/minihome/miniroomEdit.css" />
<link rel="icon" href="./icons8-favorite-32.png" type="image/x-icon">
<link rel="icon" href="../../../../resources/images/icon/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<div class="edit-frame">
		<div class="edit-file">
			<input type="file" id="take-picture" accept="image/*">
			<br>
			<img style="border-radius:50%;width:200px;hegiht:200px" src="/resources/images/no_img.jpg" alt="" id="show-picture">
		</div>
	</div>
	
	<script>
	$(document).ready(function(){
		
		var showPicture = $('#show-picture');
		
		// Set events
		$("#take-picture").bind('change',function (event) {
		    // Get a reference to the taken picture or chosen file
		    var files = event.target.files,
		        file;
		    if (files && files.length > 0) {
		        file = files[0];
		        try {
		            // Get window.URL object
		            var URL = window.URL || window.webkitURL;
		
		            // Create ObjectURL
		            var imgURL = URL.createObjectURL(file);
		            
		            // Set img src to ObjectURL
		            showPicture.attr('src',imgURL);
		
		            // Revoke ObjectURL after imagehas loaded
		            showPicture.load(function() {
		                URL.revokeObjectURL(imgURL);  
		            });
		        }
		        catch (e) {
		            try {
		                // Fallback if createObjectURL is not supported
		                var fileReader = new FileReader();
		                fileReader.onload = function (event) {
		                	showPicture.attr('src',event.target.result);
		                };
		                fileReader.readAsDataURL(file);
		            } catch (e) {
		                // Display error message
		                var error = $("#error");
		                if (error) {
		                    error.html("Neither createObjectURL or FileReader are supported");
		                }
		            }
		        }
		    }
		});
		    
	});
	</script>
	
</body>
</html>