
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('searchInput').addEventListener('keyup', function (e) {
        if (e.key === 'Enter') {
            searchUser();
        }
    });
});

function searchUser() {
		        let userNickname = document.getElementById('searchInput').value;

		        let jsonData = {
		           "userNickname": userNickname
		        };
				console.log(userNickname);
		        $.ajax({
		           method: 'POST',
		           url: "/mnHome/searchFriends",
		           dataType : "json",
		           contentType: 'application/json',
		           data: JSON.stringify(jsonData)
		        }).done(function (json) {
		           if (json.resultCode === '1') {
			        	// 친구 미니홈피 주소 태그 
			        	let homeLink = document.createElement("a");
			        	homeLink.href = "/mnHome/mainView/" + userNickname;
			        	homeLink.innerText= "방문하기";
			        	
			        
			        	// 미니홈 아이콘 태그 
			        	let homeImage = document.createElement("img");
			        	homeImage.src = "../../../../resources/images/minihome/homeIcon.png";
			        	homeImage.setAttribute("class", "friend-home-Img");
			        	homeImage.setAttribute("id", "friend-home-popup");
			        	homeImage.addEventListener("click", popupFunction);
			        	
			        	//popup tag
			        	let popup = document.createElement("div");
			        	popup.setAttribute("class", "popuptext");
			        	popup.setAttribute("id", "myPopup");
			        	
			        	
			        	//결과값 출력 div 
			            let searchResult = document.getElementById('searchResult');

						
						//tag 주입 
					
						 popup.appendChild(homeLink);
			           	 searchResult.appendChild(popup);
			           	 searchResult.appendChild(homeImage);
			           	 
			        	 // 텍스트 추가
						 searchResult.appendChild(document.createTextNode(json.userName + '(' + json.userEmail + ')'));
		        	   
		           } else {
		        	   searchResult.innerText = '검색결과가 없습니다.';
		           }
		        });
		     }

		// 탭 화면 변경하기
		function showFriendType(type) {
		    var friendDiv = document.querySelector('.set-frd-bf-list');
		    var requestDiv = document.querySelector('.set-frd-bf-request');
		    var acceptDiv = document.querySelector('.set-frd-bf-accept');

		    if (type === 'friend') {
		        friendDiv.style.display = 'block';
		        requestDiv.style.display = 'none';
		        acceptDiv.style.display = 'none';
		    } else if (type === 'request') {
		        friendDiv.style.display = 'none';
		        requestDiv.style.display = 'block';
		        acceptDiv.style.display = 'none';
		    } else if (type === 'accept') {
		        friendDiv.style.display = 'none';
		        requestDiv.style.display = 'none';
		        acceptDiv.style.display = 'block';
		    }
		}

	// 일촌거절 확인
	function confirmUnfriend() {
	    var confirmResult = confirm("정말로 친구분이랑 절교하시겠습니까?");

	    if (confirmResult) {
	        // 사용자가 확인(OK) 버튼을 클릭한 경우, 일촌을 끊는 작업을 수행합니다.
	        // 예를 들어, 서버로 일촌 끊기 요청을 보내거나, 특정 URL로 리다이렉션할 수 있습니다.
	        // 예시: window.location.href = "/unfriendAction"; 
	    } 
	}

	function confirmCancle() {
	    var confirmResult = confirm("일촌신청을 취소할까요?");

	    if (confirmResult) {
	        // 사용자가 확인(OK) 버튼을 클릭한 경우, 일촌을 끊는 작업을 수행합니다.
	        // 예를 들어, 서버로 일촌 끊기 요청을 보내거나, 특정 URL로 리다이렉션할 수 있습니다.
	        // 예시: window.location.href = "/unfriendAction"; 
	    }
	}

	function confirmNope() {
	    var confirmResult = confirm("일촌신청을 거절할까요?");

	    if (confirmResult) {
	        // 사용자가 확인(OK) 버튼을 클릭한 경우, 일촌을 끊는 작업을 수행합니다.
	        // 예를 들어, 서버로 일촌 끊기 요청을 보내거나, 특정 URL로 리다이렉션할 수 있습니다.
	        // 예시: window.location.href = "/unfriendAction"; 
	    }
	}
	
	function accept(userNickname, seq){
		if(confirm(userNickname + "님의 일촌신청을 수락하시겠습니까?")){
		let fSeq = document.getElementById('fSeq').value;
		console.log(fSeq);
		let jsonData = { 
						"requestUser" : requestUser 
						,"responseUser" : responseUser
						};
	
			$.ajax({
			url: "/mnHome/friendRequest"
			,type: "POST"
			, dataType : "json"
			, data: JSON.stringify(jsonData)
			, contentType: "application/json"
			, success : function(data){
				alert("일촌신청을 보냈습니다.");
			
			}, error : function(error){
				console.log("Error loading tab: " + error);
				alert('잠시 후 다시 시도해주세요.');
			}
			});
		}
	}
	
	// When the user clicks on div, open the popup
	function popupFunction() {
	  var popup = document.getElementById("myPopup");
	  popup.classList.toggle("show");
	}

