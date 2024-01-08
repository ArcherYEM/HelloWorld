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
<link rel="stylesheet" href="../../../../resources/css/minihome/frame.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/diary.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/jquery-ui(1.13.2).css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- date picker  -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- date picker  -->
</head>
<body>
<div class="main-frame">
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
				<div class="profile-container">
					<div class="header profile-title font-neo">
						TODAY&nbsp;<span class="today-span">404</span>&nbsp;| TOTAL 500
					</div>
					<div class="box profile-box">
						<div class="profile-image">
							<div id="datepicker" style="width:80%"></div>
						</div>
						<div class="profile-dot">---------------------------------</div>
						
					</div>
				</div>
				<div class="content-container">
					<div class="header content-title">
							 <div id="divHomeTitle" class="content-title-name">${title }</div>
							 <input id="newTitle" class="content-title-name"  type="hidden" value="${title }">
							 <input id="hiddenUserNickname" type="hidden" value="${userNickname }">
							 <c:if test="${sessionScope.userId.userNickname eq userNickname }">
								<div>
									<input type="button" id="btn-title-edit" class="btn-edit" value="수정">
									<input type="hidden" id="btn-title-save"class="btn-edit" value="저장">
								</div>
							 </c:if>
							<div class="content-title-url">
								https://www.helloworld.com/minihome/leejubin</div>
						</div>
					<div class="box content-box">
						<div class="board-overflow">
							<div class="board-title-container">
								<input type="text" placeholder="제목을 입력하세요" class="board-title" maxlength="30" id="diaryTitle">
							</div>
							<div class="board-write-container">
								<span class="board-writer">  ${userName }(작성자)</span>
							</div>
 							<!--인라인 스타일 외 적용불가하여 불가피하게 인라인css 적용 -->
							<textarea name="content" id="txtContent" rows="10" cols="100" form="frmDiary" style="width:500px; height:180px; min-width:500px; display:none;"></textarea>
							<div class="btn-container">
								<div class="btn-left">
									<input class="btn-diarylist" type="button" id="btnBoardView" data-diaryView="<c:url value='/mnHome/diaryView/${userNickname}'/>" value="목록">
								</div>
								<form>
									<div class="btn-right">
										<input class="btn-write" type="button" id="btnBoardWrite" value="글쓰기">
									</div>
								</form>
								<form id="frmDiary" method="POST" action="/mnHome/diaryAdd">
									<input type="hidden" type="text" name="title" id="diaryHiddenTitle">
									<input type="hidden" type="text" name="content" id="diaryHiddenContent">
									<input type="hidden" type="text" name="userNickname" id="diaryHiddenUserNickname" value="<c:out value='${userNickname }'/>">
								</form>
							</div>
							<div id="preview-container"></div>
						</div>
						
					</div>
				</div>
				
				<div class="menu-container">
				    <div class="menu-content" data-tab="<c:url value='/mnHome/mainView/${userNickname }'/>">
				        <a href="#">홈</a>
				    </div>
				    <div class="menu-content" data-tab="<c:url value='/mnHome/diaryView/${userNickname }'/>">
				        <a href="#">다이어리</a>
				    </div>
				    <div class="menu-content" data-tab="<c:url value='/mnHome/albumView/${userNickname }'/>">
				        <a href="#">사진첩</a>
				    </div>
				    <div class="menu-content" data-tab="<c:url value='/mnHome/boardView/${userNickname }'/>">
				        <a href="#">게시판</a>
				    </div>
				    <div class="menu-content" data-tab="<c:url value='/mnHome/visitView/${userNickname }'/>">
				        <a href="#">방명록</a>
				    </div>
				    <c:if test="${sessionScope.userId.userNickname eq userNickname }">
					    <div class="menu-content" data-tab="<c:url value='/mnHome/settingView/${userNickname }'/>">
					        <a href="#">관리</a>
					    </div>		
					</c:if>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script>
	document.getElementById('btnBoardWrite').addEventListener('click', function() {
		console.log("버튼 클릭됨");
		document.getElementById('diaryHiddenTitle').value = document.getElementById('diaryTitle').value;
		
		console.log(document.getElementById('diaryUserNickname').value);
		oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  
   		
   		let content = document.getElementById("txtContent").value.replace("\r\n","");
   		
   		document.getElementById('diaryHiddenContent').value = content;
   		
		document.getElementById('frmDiary').submit();
	});
	
	var oEditors=[];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "txtContent",
		sSkinURI : "../../../../resources/smarteditor2/SmartEditor2Skin.html",
		fCreator : "createSEditor2"
	});
</script>

</body>
</html>