
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
		        	console.log(json);
		        	let homeImage = document.createElement("img");
		        	homeImage.src = "../../../../resources/images/minihome/homeIcon.png";
		        	homeImage.setAttribute("class", "friend-home-Img");
		        	
		           let searchResult = document.getElementById('searchResult');

		           if (json.resultCode === '1') {
		        	   searchResult.innerText =json.userName;
		        	   searchResult.appendChild(homeImage);
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

