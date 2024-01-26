<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--             우측 메뉴탭 -->
               <div class="menu-container">
               
					<div id="tabHome" class="menu-content" data-tab="<c:url value='/mnHome/mainView/${userNickname }'/>"
						style=" background-color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">red</c:when>
									<c:when test="${menuContentPath == 'yellow' }">yellow</c:when>
									<c:when test="${menuContentPath == 'black' }">black</c:when>
									<c:when test="${menuContentPath == '파랑' }">blue</c:when>
									<c:when test="${menuContentPath == 'purple' }">purple</c:when>
									<c:when test="${menuContentPath == 'white' }">white</c:when>
									<c:when test="${menuContentPath == 'green' }">green</c:when>
									<c:when test="${menuContentPath == 'lime' }">lime</c:when>
									<c:when test="${menuContentPath == 'grey' }">grey</c:when>
									<c:when test="${menuContentPath == 'navy' }">navy</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'yellow' }">navy</c:when>
									<c:when test="${menuContentPath == 'black' }">white</c:when>
									<c:when test="${menuContentPath == 'blue' }">orange</c:when>
									<c:when test="${menuContentPath == 'purple' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'white' }">black</c:when>
									<c:when test="${menuContentPath == 'green' }">red</c:when>
									<c:when test="${menuContentPath == 'lime' }">pink</c:when>
									<c:when test="${menuContentPath == 'grey' }">brown</c:when>
									<c:when test="${menuContentPath == 'navy' }">yellow</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						홈
					</span>
					</div>
					<div id="tabDiary" class="menu-content" data-tab="<c:url value='/mnHome/diaryView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">red</c:when>
									<c:when test="${menuContentPath == 'yellow' }">yellow</c:when>
									<c:when test="${menuContentPath == 'black' }">black</c:when>
									<c:when test="${menuContentPath == 'blue' }">blue</c:when>
									<c:when test="${menuContentPath == 'purple' }">purple</c:when>
									<c:when test="${menuContentPath == 'white' }">white</c:when>
									<c:when test="${menuContentPath == 'green' }">green</c:when>
									<c:when test="${menuContentPath == 'lime' }">lime</c:when>
									<c:when test="${menuContentPath == 'grey' }">grey</c:when>
									<c:when test="${menuContentPath == 'navy' }">navy</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'yellow' }">navy</c:when>
									<c:when test="${menuContentPath == 'black' }">white</c:when>
									<c:when test="${menuContentPath == 'blue' }">orange</c:when>
									<c:when test="${menuContentPath == 'purple' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'white' }">black</c:when>
									<c:when test="${menuContentPath == 'green' }">red</c:when>
									<c:when test="${menuContentPath == 'lime' }">pink</c:when>
									<c:when test="${menuContentPath == 'grey' }">brown</c:when>
									<c:when test="${menuContentPath == 'navy' }">yellow</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						다이어리
					</span>
					</div>
					<div id="tabAlbum" class="menu-content" data-tab="<c:url value='/mnHome/albumView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">red</c:when>
									<c:when test="${menuContentPath == 'yellow' }">yellow</c:when>
									<c:when test="${menuContentPath == 'black' }">black</c:when>
									<c:when test="${menuContentPath == 'blue' }">blue</c:when>
									<c:when test="${menuContentPath == 'purple' }">purple</c:when>
									<c:when test="${menuContentPath == 'white' }">white</c:when>
									<c:when test="${menuContentPath == 'green' }">green</c:when>
									<c:when test="${menuContentPath == 'lime' }">lime</c:when>
									<c:when test="${menuContentPath == 'grey' }">grey</c:when>
									<c:when test="${menuContentPath == 'navy' }">navy</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'yellow' }">navy</c:when>
									<c:when test="${menuContentPath == 'black' }">white</c:when>
									<c:when test="${menuContentPath == 'blue' }">orange</c:when>
									<c:when test="${menuContentPath == 'purple' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'white' }">black</c:when>
									<c:when test="${menuContentPath == 'green' }">red</c:when>
									<c:when test="${menuContentPath == 'lime' }">pink</c:when>
									<c:when test="${menuContentPath == 'grey' }">brown</c:when>
									<c:when test="${menuContentPath == 'navy' }">yellow</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						사진첩
					</span>
					</div>
					<div id="tabBoard" class="menu-content" data-tab="<c:url value='/mnHome/boardView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">red</c:when>
									<c:when test="${menuContentPath == 'yellow' }">yellow</c:when>
									<c:when test="${menuContentPath == 'black' }">black</c:when>
									<c:when test="${menuContentPath == 'blue' }">blue</c:when>
									<c:when test="${menuContentPath == 'purple' }">purple</c:when>
									<c:when test="${menuContentPath == 'white' }">white</c:when>
									<c:when test="${menuContentPath == 'green' }">green</c:when>
									<c:when test="${menuContentPath == 'lime' }">lime</c:when>
									<c:when test="${menuContentPath == 'grey' }">grey</c:when>
									<c:when test="${menuContentPath == 'navy' }">navy</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'yellow' }">navy</c:when>
									<c:when test="${menuContentPath == 'black' }">white</c:when>
									<c:when test="${menuContentPath == 'blue' }">orange</c:when>
									<c:when test="${menuContentPath == 'purple' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'white' }">black</c:when>
									<c:when test="${menuContentPath == 'green' }">red</c:when>
									<c:when test="${menuContentPath == 'lime' }">pink</c:when>
									<c:when test="${menuContentPath == 'grey' }">brown</c:when>
									<c:when test="${menuContentPath == 'navy' }">yellow</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						게시판
					</span>
					</div>
					<div id="tabVisit" class="menu-content" data-tab="<c:url value='/mnHome/visitView/${userNickname }'/>"
					style=" background-color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">red</c:when>
									<c:when test="${menuContentPath == 'yellow' }">yellow</c:when>
									<c:when test="${menuContentPath == 'black' }">black</c:when>
									<c:when test="${menuContentPath == 'blue' }">blue</c:when>
									<c:when test="${menuContentPath == 'purple' }">purple</c:when>
									<c:when test="${menuContentPath == 'white' }">white</c:when>
									<c:when test="${menuContentPath == 'green' }">green</c:when>
									<c:when test="${menuContentPath == 'lime' }">lime</c:when>
									<c:when test="${menuContentPath == 'grey' }">grey</c:when>
									<c:when test="${menuContentPath == 'navy' }">navy</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
						<span class="menu-content-span"
						style=" color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'yellow' }">navy</c:when>
									<c:when test="${menuContentPath == 'black' }">white</c:when>
									<c:when test="${menuContentPath == 'blue' }">orange</c:when>
									<c:when test="${menuContentPath == 'purple' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'white' }">black</c:when>
									<c:when test="${menuContentPath == 'green' }">red</c:when>
									<c:when test="${menuContentPath == 'lime' }">pink</c:when>
									<c:when test="${menuContentPath == 'grey' }">brown</c:when>
									<c:when test="${menuContentPath == 'navy' }">yellow</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						방명록
					</span>
					</div>
					<c:if test="${sessionScope.userId.userNickname eq userNickname }">
						<div id="tabSetting"class="menu-content" data-tab="<c:url value='/mnHome/settingView/${userNickname }'/>"
						style=" background-color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">red</c:when>
									<c:when test="${menuContentPath == 'yellow' }">yellow</c:when>
									<c:when test="${menuContentPath == 'black' }">black</c:when>
									<c:when test="${menuContentPath == 'blue' }">blue</c:when>
									<c:when test="${menuContentPath == 'purple' }">purple</c:when>
									<c:when test="${menuContentPath == 'white' }">white</c:when>
									<c:when test="${menuContentPath == 'green' }">green</c:when>
									<c:when test="${menuContentPath == 'lime' }">lime</c:when>
									<c:when test="${menuContentPath == 'grey' }">grey</c:when>
									<c:when test="${menuContentPath == 'navy' }">navy</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">rgb(42, 140, 168)</c:when>
								</c:choose>
					">
							<span class="menu-content-span"
							style=" color: 
								<c:choose>
									<c:when test="${menuContentPath == 'red' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'yellow' }">navy</c:when>
									<c:when test="${menuContentPath == 'black' }">white</c:when>
									<c:when test="${menuContentPath == 'blue' }">orange</c:when>
									<c:when test="${menuContentPath == 'purple' }">lightgreen</c:when>
									<c:when test="${menuContentPath == 'white' }">black</c:when>
									<c:when test="${menuContentPath == 'green' }">red</c:when>
									<c:when test="${menuContentPath == 'lime' }">pink</c:when>
									<c:when test="${menuContentPath == 'grey' }">brown</c:when>
									<c:when test="${menuContentPath == 'navy' }">yellow</c:when>
									<c:when test="${menuContentPath == 'rgb(42, 140, 168)' }">white</c:when>
								</c:choose>
					">
						관리
					</span>
						</div>      
					</c:if>
                  
               </div>