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
      <link  href="/resources/css/index/signUp.css" rel="stylesheet">
      <link rel="icon" href="../../../../resources/images/minihome/favicon.png" type="image/x-icon">
   </head>
   <body>
      <div class="grid-container">
        <div class="grid-item"></div>
        <div class="grid-item content">
        	<div id="divUserInfo">
				<a class="logoATag" href="<c:url value='/'/>">
            		<img class="index-header-logo otherPage-logo" id="loginLogo" src="<c:url value="/resources/images/mainLogo.png"/>">
         		</a>
        	</div>
            <div class="signUp-title no-cursor" onmousedown="return false;">회원가입</div>
            <form class="signUp-frame" id="frmSignUp" method="POST" action="/index/member/signUpConfirm">
               <div class="section">
                  <label for="userName">이름</label>
                  <input type="text" id="userName" name="userName" placeholder="이름" class="widthFull">
               </div>
               <div class="section">
				    <label for="userBirth">생년월일</label>
				    <input type="text" id="userBirth" name="userBirth" placeholder="생년월일 ex)19931013" class="widthFull" oninput="validateNumber(); checkBirthLength()">
				</div>
               <div class="section">
                  <div class="divGender no-cursor" onmousedown="return false;">
                     <label>성별</label>
                     <input type="radio" id="userGenderM" name="userGender" value="M" checked>
                     <label for="userGenderM">남자</label>
                     <input type="radio" id="userGenderF" name="userGender" value="F">
                     <label for="userGenderF">여자</label>
                  </div>
               </div>
               <div class="section no-cursor">
	               <div class="email-group">
		               <div class="email-left">
		                   <label for="userEmail" onmousedown="return false;">이메일주소</label>
		                   <input type="button" class="btn-hover" id="btnEmailDuplcheck" value="중복체크">
		               </div>
	                   <div class="email-right" id="emailFormMessage"></div>
	               </div>
                   <input type="email" id="userEmail" name="userEmail" placeholder="이메일주소" 
                        class="widthFull" onblur="checkEmailForm()">
              </div>
               <div class="section">
                  <label for="userPassword">비밀번호</label>
                  <input type="password" id="userPassword" name="userPassword" placeholder="비밀번호" class="widthFull" oninput="checkPasswordMatch()">
               </div>
               <div class="section">
                  <div class="pw-group">
	                  <div class="pw-left">
	                    <label for="userPassword2">비밀번호 확인  </label>
	                  </div>
	                  <div class="pw-right">
                      	<span id="passwordMatchMessage" class="MatchMessage"></span>
                      </div>
                  </div>
                  <input type="password" id="userPassword2" name="userPassword2" placeholder="비밀번호" class="widthFull" oninput="checkPasswordMatch()">
               </div>
               <div class="section no-cursor">
                  <label for="userNickname" onmousedown="return false;">닉네임</label>
                  <input type="button" class="btn-hover" id="btnNicknameDuplcheck" value="중복체크">
                  <input type="text" id="userNickname" name="userNickname" placeholder="닉네임" class="widthFull">
               </div>
               <div class="section no-cursor">
				    <label for="userPhone" onmousedown="return false;">핸드폰번호</label>
				    <input type="button" class="btn-hover" id="btnPhoneDuplCheck" value="중복체크">
				    <input type="text" id="userPhone" name="userPhone" placeholder="하이푼 ( - ) 을 제외하고 입력해주세요" class="widthFull" oninput="validateNumber()">
				</div>
               <div class="section info-check" onmousedown="return false;" style="cursor: default;">
                  <b>개인정보 수집 및 이용 동의서</b>
                  <p>1. 개인정보 수집 목적</p>
                  <p>   - 수집항목: 이름, 생년월일, 성별, 이메일, 연락처, 아이디, 비밀번호, 닉네임</p>
                  <p>   - 수집목적: 홈페이지 서비스 제공 및 관리, 연락 및 안내, 서비스 개선 및 맞춤화</p>
                  <p>2. 개인정보의 수집 및 이용 동의</p>
                  <p>   본인은 주식회사 [회사명] (이하 "회사"라 함)가 제공하는 홈페이지 [helloworld]를</p>
                  <p>   이용하기 위해 위와 같이 개인정보를 제공합니다.</p>
                  <p>3. 개인정보의 보유 및 이용 기간</p>
                  <p>   개인정보는 회원 탈퇴 시까지 보유 및 이용됩니다.</p>
                  <p>   탈퇴 시에는 개인정보가 정해진 기한 없이 일괄적으로 파기될 것입니다.</p>
                  <p>4. 동의 철회 및 개인정보 파기</p>
                  <p>   회원은 언제든지 개인정보 수집 및 이용에 대한 동의를 철회할 수 있으며,</p>
                  <p>   이 경우 회사는 해당 개인정보를 즉시 파기합니다.</p>
                  <p>5. 기타</p>
                  <p>   본 동의서는 [홈페이지명] 이용 시 필수적으로 동의해야 하는 내용으로,</p>
                  <p>   동의하지 않을 경우 [홈페이지명]의 일부 서비스 이용이 제한될 수 있습니다.</p>
                  <p>   본 동의서에 동의하신다면,</p>
                  <p>   아래의 정보를 확인 후 [동의] 버튼을 클릭하여 동의를 완료해주세요.</p>
                  <p>   ※ 동의를 철회하실 수 있으며,동의 철회 시에는 서비스 이용이 제한될 수 있습니다.</p>
               </div>
               <div class="section no-cursor" onmousedown="return false;">
                  <div class="confirm-group">
                      <input type="radio" id="confirm" name="confirm" value="confirm" checked>
                      <label for="confirm">동의</label>
                      <input type="radio" id="noConfirm" name="confirm" value="noConfirm">
                      <label for="noConfirm">비동의</label>
                  </div>
               </div>
               <div class="join-ok">
                  <input type="button" id="btnSignUp" class="btn-hover" value="회원가입">
               </div>
            </form>
           </div>
        <div class="grid-item"></div>  
        </div>
   <script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
   <script>
   // section 구역 클릭시 label 값 style 적용
   document.addEventListener("DOMContentLoaded", function() {
       var sectionDivs = document.querySelectorAll('.section');

       sectionDivs.forEach(function(sectionDiv) {
           sectionDiv.addEventListener("click", function() {
               var labelElement = sectionDiv.querySelector('label');

               if (labelElement) {
                   labelElement.style.fontWeight = "bold";
                   labelElement.style.color = "orange";
               }
           });
       });
       //원복
       document.addEventListener("click", function(event) {
           var sectionDivs = document.querySelectorAll('.section');
           sectionDivs.forEach(function(sectionDiv) {
               if (sectionDiv.contains(event.target)) {
                   return;
               }

               var labelElement = sectionDiv.querySelector('label');
               if (labelElement) {
                   labelElement.style.fontWeight = "normal";
                   labelElement.style.color = "black";
               }
           });
       });
   });
   </script>
   <script>
      document.getElementById('btnSignUp').addEventListener('click', function() {
         var confirmation = document.querySelector('input[name="confirm"]:checked');
           if(!checkBirth()){
        	   alert('올바른 생년월일을 입력해주세요.');
        	   return;
           }
           if (confirmation && confirmation.value === "noConfirm") {
               alert("개인정보수집 약관에 동의하지 않았습니다.");
               return;
           }   
         
         document.getElementById('frmSignUp').submit();
      });                  
      document.getElementById('btnEmailDuplcheck').addEventListener('click', function () {
         let userEmail = document.getElementById('userEmail').value;
         let hasWhiteSpace = /\s/.test(userEmail);
         if (hasWhiteSpace) {
         	alert("이메일은 공백을 포함할 수 없습니다.");
         	return;
         }else if(userEmail == ""){
        	 alert("이메일을 입력해주세요.");
             return;
         }
         
         let jsonData = {
                  "userEmail": userEmail,
               };
               $.ajax({
                  method: 'POST',
                  url: "<c:url value='/index/member/emailCheck' />",
                  contentType: 'application/json',
                  data: JSON.stringify(jsonData)
               }).done(function (json) {

                  if (json.resultCode === '1') {
                     alert('사용 가능한 이메일 입니다.');
                  } else {
                     alert('이미 사용 중인 이메일 입니다.');
                  }
               });
      });
      
//       닉네임체크
      document.getElementById('btnNicknameDuplcheck').addEventListener('click', function () {
         let userNickname = document.getElementById('userNickname').value;
         let hasWhiteSpace = /\s/.test(userNickname);
         if (hasWhiteSpace) {
         	alert("닉네임은 공백을 포함할 수 없습니다.");
         	return;
         }else if(userNickname == ""){
        	 alert("닉네임을 입력해주세요.");
             return;
         }else if (userNickname.length < 2) {
             alert("닉네임은 2글자 이상이어야 합니다.");
             return;
         }
         
         let jsonData = {
                  "userNickname": userNickname,
               };
               $.ajax({
                  method: 'POST',
                  url: "<c:url value='/index/member/nicknameCheck' />",
                  contentType: 'application/json',
                  data: JSON.stringify(jsonData)
               }).done(function (json) {

                  if (json.resultCode === '1') {
                     alert('사용 가능한 닉네임 입니다.');
                  } else {
                     alert('이미 사용 중인 닉네임 입니다.');
                  }
               });
      });
      
      document.getElementById('btnPhoneDuplCheck').addEventListener('click', function () {
    	    let userPhone = document.getElementById('userPhone').value;
    	    
    	    // 형식 및 길이 검사
    	    if (!validatePhone(userPhone)) {
    	        return;
    	    }

    	    // 중복 확인
    	    let jsonData = {
    	        "userPhone": userPhone,
    	    };

    	    $.ajax({
    	        method: 'POST',
    	        url: "<c:url value='/index/member/phoneCheck' />",
    	        contentType: 'application/json',
    	        data: JSON.stringify(jsonData)
    	    }).done(function (json) {
    	        if (json.resultCode === '1') {
    	            alert('사용 가능한 전화번호 입니다.');
    	        } else {
    	            alert('이미 사용 중인 전화번호 입니다.');
    	            $('#userPhone').val(userPhone.slice(0, 3));
    	        }
    	    });
    	});

    	// 핸드폰 번호 형식 및 길이 검사 함수
    	function validatePhone(userPhone) {
    	    if (userPhone.length < 11 || userPhone.length > 11) {
    	        alert('입력하신 핸드폰 번호를 확인해주세요.');
    	        $('#userPhone').val(userPhone.slice(0, 11));
    	        return false;
    	    }

    	    if (userPhone.length >= 3 && userPhone.slice(0, 3) !== "010") {
    	        alert('전화번호는 "010"으로 시작해야 합니다.');
    	        $('#userPhone').val('');
    	        return false;
    	    }

    	    return true;
    	}

      // 비밀번호 일치 여부 확인
       function checkPasswordMatch() {
          var password = document.getElementById('userPassword').value;
          var confirmPassword = document.getElementById('userPassword2').value;
          var passwordMatchMessage = document.getElementById('passwordMatchMessage');
      
          if (password === confirmPassword) {
              passwordMatchMessage.innerHTML = '<span style="color: #14ad14; font-weight: bold; font-size: 10px;">비밀번호가 일치합니다.</span>';
              document.getElementById('btnSignUp').disabled = false;
          } else {
              passwordMatchMessage.innerHTML = '<span style="color: red; font-weight: bold; font-size: 10px;">비밀번호가 일치하지 않습니다.</span>';
              document.getElementById('btnSignUp').disabled = true;
          }
      }
      
     function checkBirthLength() {
        let userBirth = $('#userBirth').val();
        
        if (userBirth.length > 8) {
           alert ('생년월일은 8자리를 초과할 수 없습니다.');
           
           $('#userBirth').val(userBirth.slice(0, 8));
        };
     };
     
     function checkBirth(){
    	 let userBirth = $('#userBirth').val();
         const year = parseInt(userBirth.substring(0, 4), 10);
         const month = parseInt(userBirth.substring(4, 6), 10);
         const day = parseInt(userBirth.substring(6, 8), 10);

         const dobDate = new Date(year, month - 1, day);

         if (
             dobDate.getFullYear() !== year ||
             dobDate.getMonth() !== month - 1 ||
             dobDate.getDate() !== day
         ) {
         	$('#userBirth').val(userBirth.slice(0, 0));
             return false;
         }else{
        	 return true;
         }
     }
     
     function validateNumber() {
         var userBirthInput = document.getElementById('userBirth');
         var userPhoneInput = document.getElementById('userPhone');

         userBirthInput.value = userBirthInput.value.replace(/[^0-9]/g, '');
         userPhoneInput.value = userPhoneInput.value.replace(/[^0-9]/g, '');
      }
      
     function checkEmailForm() {
          var emailInput = document.getElementById('userEmail');
          var emailFormMessage = document.getElementById('emailFormMessage');

          var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

          if (!emailRegex.test(emailInput.value)) {
             emailFormMessage.innerHTML = '<span style="color: red; font-weight: bold; font-size: 10px;">올바른 이메일 주소를 입력하세요.</span>';
          } else {
             emailFormMessage.innerHTML = '';
          }
      }
   </script>
   </body>
</html>