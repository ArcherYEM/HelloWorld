<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>헬로월드</title>
		<link  href="/resources/css/index/main.css" rel="stylesheet">
		<link  href="/resources/css/index/store.css" rel="stylesheet">
		<link  href="/resources/css/index/notice.css" rel="stylesheet">
		<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
	</head>
	<body>
		<div class="index-frame">
			<div class="divIndexMenu index-header">
		      <div class="index-header-left">
		         <a class="logoATag" href="<c:url value='/'/>">
		           <img class="index-header-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
		         </a>
		       </div>
		       <div class="index-header-right">
		            <h5 class="right" id="userDotori"><img id="indexDotoriImg" src="<c:url value="/resources/images/store/storeDotoriIcon.png" />"><span id="userDotoriCnt">${dotori}</span>개</h5>
		            <a href="<c:url value='/store/minimiView'/>" class="index-a-store">상점</a>
		            <a href="<c:url value='/notice/noticeView'/>" class="index-a-notice">공지사항</a>
		            <a id="storeLoginMyhome" href="#" 
		            	class="index-a-mnh" onclick="openMiniHomepage()">내 미니홈피
		            </a>
		            <a id="storeLoginLogout" href="<c:url value="/index/member/logout" />" class="index-a-logout">로그아웃</a>
	        	</div>
	      	</div>
		
			<div class="notice-table-title">
				<table class="notice-tanle">
			    	<colgroup>
				    	<c:if test="${isAdmin eq '1'}">	
				    		<col class="col-choice">
				    	</c:if>
				        <col class="col-number">
				        <col class="col-title">
				        <col class="col-date">
			    	</colgroup>
			   		<tr>
				   		<c:if test="${isAdmin eq '1'}">	
				   			<th>선택</th>
				   		</c:if>
				        <th>번호</th>
				        <th>제목</th>
				        <th>등록일</th>
			    	</tr>
				</table>
			</div>
			<div class="notice-table-title-mid">
				<table class="notice-tanle">
					<colgroup>
						<c:if test="${isAdmin eq '1'}">	
							<col class="col-choice">
						</c:if>
				        <col class="col-number">
				        <col class="col-title">
				        <col class="col-date">
		    		</colgroup>
			    	<c:forEach items="${list}" var="list" varStatus="i">
			    		<tr class="notice-table-tr">
			    			
							<c:if test="${isAdmin eq '1'}">									
								<td>
									<input type="checkbox" class="notice-cbx" form="frm1" name="<c:out value='${i.index}'/>" value="<c:out value='${list.seq}'/>">
								</td>
							</c:if>
							<td>
								<c:out value="${list.seq}"/>
							</td>
							<td class="notice-td-title" data-seq="<c:out value='${list.seq}'/>">
								<c:out value="${list.title}"/>
							</td>
							<td>
								<c:out value="${list.date}"/>
							</td>
						</tr>
			    	</c:forEach>
					
				</table>
			</div>
			<c:if test="${isAdmin eq '1'}">	
				<c:set var="type" value="button"></c:set>
			</c:if>
			<c:if test="${isAdmin eq '0'}">	
				<c:set var="type" value="hidden"></c:set>
			</c:if>
			<div class="btnNoticeGroup">
				<form id="frm1" method="POST" action="/notice/noticeDelete">
					<input type="${type}" class="btn-notice" id="btnDelete" value="삭제">
				</form>
					<input type="${type}" class="btn-notice" id="btnWrite" value="등록">
			</div>
			
			<!-- paging -->
	        <div class="notice-paging" onmousedown="return false;" style="cursor: default;">
	            <c:forEach var="page" begin="1" end="${totalPage}">
	                <span class="spanPage" data-page="${page}">
	                    ${page}
	                </span>
	            </c:forEach>
	            <form id="frm2" action="<c:url value='/notice/noticeView'/>" method="get">
					<input type="hidden" name="page" id="page" />
				</form>
				
	            <form id="frm3" action="<c:url value='/notice/noticeDetail'/>" method="get">
					<input type="hidden" name="detailSeq" id="detailSeq" />
				</form>
	        </div>
	        </div>
			<div class="bottom-fix">
			</div>
		<jsp:include page="/WEB-INF/views/index/footer.jsp"></jsp:include>
		<script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
		<script>
	function openMiniHomepage() {
	    // URL 정의
	    var url = "<c:url value='/mnHome/mainView/${sessionScope.userId.userNickname }' />";

	    // 크기 정의
	    var width = 1200;
	    var height = 720;

	    // 화면 중앙에 새 창을 위치시키기 위해 위치 계산
	    var left = (window.innerWidth - width) / 2;
	    var top = (window.innerHeight - height) / 2;

	    // 새 창 열기
	    var newWindow = window.open(url, 'MiniHomepage', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);

	    // 새 창이 열린 후, 현재 창을 그대로 유지하기 위해 기본 링크 동작 방지
	    if (newWindow) {
	        newWindow.focus(); // 새 창을 포커스합니다.
	    }
	    return false;
	}
	
// 	부모창 리로드 명령
	function reloadParentWindow() {
		location.href = "<c:url value="/index/member/logout" />"
	    location.reload();
	}

	</script>
		<script>
			window.onload = function() {
				var currentPage = getParameterByName('page');
		        var pageLinks = document.querySelectorAll('.spanPage');
		        
		        for (var i = 0; i < pageLinks.length; i++) {
		            var pageLink = pageLinks[i];
		            var pageNumber = pageLink.getAttribute('data-page');

		            if (pageNumber === currentPage) {
		                pageLink.style.color = 'blue';
		                pageLink.style.fontWeight = '700';
		            }
		        }
		        
		        if (currentPage === null) {
		            var firstPageLink = document.querySelector('.spanPage[data-page="1"]');
		            if (firstPageLink) {
		                firstPageLink.style.color = 'orange';
		                firstPageLink.style.fontWeight = '700';
		            }
		        }
				
		        function getParameterByName(name, url) {
		            if (!url) {
		                url = window.location.href;
		            }
		            name = name.replace(/[\[\]]/g, '\\$&');
		            var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
		                results = regex.exec(url);
		            if (!results) return null;
		            if (!results[2]) return '';
		            return decodeURIComponent(results[2].replace(/\+/g, ' '));
		        }
		        
				
		        let userDotoriElement = document.getElementById('userDotori');
		        let storeLoginMyhome = document.getElementById('storeLoginMyhome');
		        let storeLoginLogout = document.getElementById('storeLoginLogout');
		        let btnDelete = document.getElementById('btnDelete');
		        let btnWrite = document.getElementById('btnWrite');
		        let userDotoriCnt = '<c:out value="${dotori}" />' || '';
		
		        if (userDotoriCnt.trim() !== '') {
		            userDotoriElement.style.display = 'block';
		            storeLoginMyhome.style.display = 'block';
		            storeLoginLogout.style.display = 'block';
		            btnDelete.style.display = 'block';
		            btnWrite.style.display = 'block';
		        } else {
		            userDotoriElement.style.display = 'none';
		            storeLoginMyhome.style.display = 'none';
		            storeLoginLogout.style.display = 'none';
		            btnDelete.style.display = 'none';
		            btnWrite.style.display = 'none';
		        }
			}
		
			$(function(){
				let result = '' + '${msg}';
				if(result != ""){
					alert(result);
				}
				
				
				var titles = document.getElementsByClassName('notice-td-title');

				for (var i = 0; i < titles.length; i++) {
				  titles[i].addEventListener('click', function() {
					  
					  /* $('#detailSeq').val($(this).val()); */
					  
					  let url = "/notice/noticeDetail?seq=" + $(this).data('seq');
					  console.log(url);
				      location.href = url; 
				  });
				}
			});
		
			document.getElementById('btnDelete').addEventListener('click', function() {
				if(confirm('정말 삭제하시겠습니까?')){
					document.getElementById('frm1').submit();
				}
			});
			
			
			document.getElementById('btnWrite').addEventListener('click', function() {
				location.href = '/notice/noticeWrite';
			});
			
			$('.spanPage').on('click', function(){
				$('#page').val($(this).data('page'));
				$('#frm2').submit();
			});
		</script>
	</body>
</html>