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
<link rel="stylesheet" href="../../../../resources/css/minihome/frame.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/audio.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/setting.css" />
<link rel="stylesheet" href="../../../../resources/css/minihome/settingFriends.css" />
<link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
</head>
<body>
	<div class="main-frame">
		<div class="bookcover">
			<div class="bookdot">
				<div class="page">
					<div class="profile-container">
						<div class="header profile-title font-neo">
							TODAY&nbsp;<span class="today-span">${todayCnt }</span>&nbsp;| TOTAL ${totalCnt }
						</div>
						<div class="box profile-box">
							<div class="setting-folder-group">
								<div>
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">개인정보</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-list" id="spanSetting" data-setting="/mnHome/settingView/${userNickname }">개인정보변경</span></a></li>
								  </ul>
								  
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">미니홈피관리</span>
								  <ul class="tree">
								    <li><a><span class="setting-menu-list" id="spanSettingBgm" data-bgm="/mnHome/settingBgm/${userNickname }">BGM설정</span></a></li>
								    <li><a><span class="setting-menu-list" id="spanSettingMenu" data-menu="/mnHome/settingMenu/${userNickname }">메뉴탭설정</span></a></li>
								    <li><a><span class="setting-menu-list" id="spanSettingSkin" data-skin="/mnHome/settingSkin/${userNickname }">스킨설정</span></a></li>
								  </ul>
								 
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">아이템/내역관리</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-list" id="spanSettingDotoriU" data-dotoriU="/mnHome/settingDotoriUse/${userNickname }">도토리 사용내역</span></a></li>
									<li><a><span class="setting-menu-list" id="spanSettingDotoriC" data-dotoriC="/mnHome/settingDotoriCharge/${userNickname }">도토리 구매내역</span></a></li>
								  </ul>
								  
								  <span><img class="setting-menu-dot" src="<c:url value='/resources/images/minihome/menu-dot.png'/>"></span>
								  <span class="setting-menu-title">인맥관리</span>
								  <ul class="tree">
									<li><a><span class="setting-menu-list" id="spanSettingFriends" data-friends="/mnHome/settingFriends/${userNickname }">일촌현황</span></a></li>
								  </ul>
								</div>
							</div>
								<div class="devide-dot">---------------------------------</div>
								<c:if test="${userGender eq 'M'}">
		                        	${userName }&#128102
								</c:if>
								<c:if test="${userGender eq 'F'}">
		                        	${userName }&#128103
								</c:if>
								<div class="profile-dropDown">
									<select id="friendSelect" onchange="redirectToMainView()">
			                           <option value="" disabled selected hidden="">파도타기</option>
									    <c:forEach var="friend" items="${friend}" varStatus="status">
									        <option value="${friend.Name}">${friend.Name}(${friend.userEmail})</option>
									    </c:forEach>
								</select>
								</div>
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
								https://www.helloworld.com/minihome/${userNickname }
							</div>
						</div>
						<div class="box content-box">
						<!-- 시점 -->
						<!-- 
						일촌친구 / 요청대기 / 수락대기
						 -->
						<div class="set-frd-frame">
							<div class="set-frd-search-frame">
									<div class="set-frd-search-title KyoboHand">
										친구찾기
									</div>
									<div class="set-frd-search">
										<input type="text" class="set-frd-search-input" id="searchInput" placeholder="닉네임을 입력하세요" maxlength="18" autofocus>
										<input type="button" id="btnSearchUser" class="set-frd-search-btn" value="찾기" onclick=searchUser()>
									</div>
								<div id="searchResult" class="set-frd-search-place popup">
								  
								</div>
							</div>
							<div class="set-frd-mid">
								<div class="set-frd-mid-btn">
								    <div class="set-frd-mid-bf">
								        <input type="button" class="set-frd-mid-bf-ipt" value="나의일촌" onclick="showFriendType('friend');">
								    </div>
								    <div class="set-frd-mid-request">
								        <input type="button" class="set-frd-mid-req-ipt" value="받은신청" onclick="showFriendType('request');">
								    </div>
								    <div class="set-frd-mid-accept">
								        <input type="button" class="set-frd-act-bf-ipt" value="보낸신청" onclick="showFriendType('accept');">
								    </div>
								    <div class="set-frd-mid-search">
								    	<c:if test="${not empty fName}">
										  <c:set var="searchName" value="${fName}" scope="session" />
										</c:if>
										<c:if test="${empty fName}">
										  <c:set var="searchName" value="" scope="session" />
										</c:if>
										
								    	<input type="text" class="set-frd-mid-input" placeholder="닉네임을 입력하세요" id="searchBfName" value="${searchName}"/>
										<input type="button" value="찾기" id="searchBf">
									</div>
								</div>
							
								<div class="set-frd-mid-bg">
									<div class="set-frd-bf-list">
										<c:if test="${empty bf}">
											 <span>아직 일촌이 없습니다.</span> 
										</c:if>
										<c:if test = "${not empty bf}">										
											<table class="set-frd-bf-table">
												<tr>
													<td>신청번호</td>
													<td>이름</td>
													<td>닉네임</td>
													<td>신청일</td>
													<td></td>
												</tr>
												
												<c:forEach items="${bf}" var="bf" varStatus="loop">
														<c:if test="${bf.userNickname  eq userNickname}">
															<c:set var="bfNickname" value="${bf.friendNickname}" scope="session" />
											            </c:if>
											            <c:if test="${bf.userNickname  ne userNickname}">
											            	<c:set var="bfNickname" value="${bf.userNickname}" scope="session" />
											            </c:if>
											            
													<tr>
														<td>${loop.index + 1}</td>
														
											            <td>${bf.userName}</td>
											             <td>${bfNickname}</td>
											            <td>${bf.createDate}</td>
											            <td>
											            	<input type="button" class="set-frd-bf-tb-input" value="방문하기" onclick="window.location.href='/mnHome/mainView/${bfNickname}'"/>
											            	<input type="button" class="set-frd-bf-tb-input" value="일촌끊기" data-seq="${bf.seq}" id="unfriend"/>
											            </td>
										        	</tr>
												</c:forEach>
										    </table>
										</c:if>
									</div>
									<div class="set-frd-bf-request">
										<c:if test="${empty fRes}">
											 <span>앗! 아직 일촌 신청이 안왔어요.</span> 
										</c:if>
										<c:if test = "${not empty fRes}">
											<table class="set-frd-bf-table">
												<tr>
													<td>신청번호</td>
													<td>이름</td>
													<td>닉네임</td>
													<td>신청일</td>
													<td></td>
												</tr>
												
												 <c:forEach items="${fRes}" var="fRes" varStatus="loop">
												 		<c:if test="${fRes.userNickname  eq userNickname}">
															<c:set var="fResNickname" value="${fRes.friendNickname}" scope="session" />
											            </c:if>
											            <c:if test="${fRes.userNickname  ne userNickname}">
											            	<c:set var="fResNickname" value="${fRes.userNickname}" scope="session" />
											            </c:if>
													<tr>
														<td>${loop.index + 1}</td>
														
											            <td>${fResNickname}</td>
											            <td>${fRes.userName}</td>
											            <td>${fRes.createDate}</td>
											            <td>
											            	<input type="hidden" value="${fRes.seq}" id="fSeq">
											            	<input type="button" class="set-frd-bf-tb-input accept" value="수락" data-seq="${fRes.seq}" />
											            	<input type="button" class="set-frd-bf-tb-input reject" value="거절" data-seq="${fRes.seq}"/>
											            </td>
										        	</tr>
												</c:forEach> 
										    </table>
										</c:if>
									</div> 
									<div class="set-frd-bf-accept">
										<c:if test="${empty fReq}">
											 <span>일촌 신청 목록이 없습니다.</span> 
										</c:if>
										<c:if test = "${not empty fReq}">
											<table class="set-frd-bf-table">
												<tr>
													<td>신청번호</td>
													<td>이름</td>
													<td>닉네임</td>
													<td>신청일</td>
													<td></td>
												</tr>
												<c:forEach items="${fReq}" var="fReq" varStatus="loop">
														<c:if test="${fReq.userNickname  eq userNickname}">
															<c:set var="fReqNickname" value="${fReq.friendNickname}" scope="session" />
											            </c:if>
											            <c:if test="${fReq.userNickname  ne userNickname}">
											            	<c:set var="fReqNickname" value="${fReq.userNickname}" scope="session" />
											            </c:if>
														<tr>
															<td>${loop.index + 1}</td>
															
												            <td>${fReqNickname}</td>
												            <td>${fReq.userName}</td>
												            <td>${fReq.createDate}</td>
												            <td>
												            	<input type="hidden" value="${fReq.seq}" id="fSeq">
												            	<input type="button" class="set-frd-bf-tb-input cancle" data-seq="${fReq.seq}" value="취소" />
												            </td>
											        	</tr>
												</c:forEach>
										        
										    </table>
										</c:if>
									</div>
								</div>
							</div>
						</div>
						<!-- 종점 -->	
						</div>
					</div>
					
					<jsp:include page="/WEB-INF/views/miniHome/menuTab.jsp"></jsp:include>
					
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
