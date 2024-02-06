
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
		        $.ajax({
		           method: 'POST',
		           url: "/mnHome/searchFriends",
		           dataType : "json",
		           contentType: 'application/json',
		           data: JSON.stringify(jsonData)
		        }).done(function (json) {
		           if (json.resultCode === '1') {
		           		//검색 결과 
		           		let result = json.userName + '(' + json.userEmail + ')' ;
		           		
			        	// 친구 미니홈피 주소 태그 
			        	let homeLink = document.createElement("a");
			        	homeLink.href = "/mnHome/mainView/" + userNickname;
			        	homeLink.innerText= "방문하기";
			        	
			        	//popup tag
			        	let popup = document.createElement("div");
			        	popup.setAttribute("class", "popuptext");
			        	popup.setAttribute("id", "myPopup");
			        	
			        
			        	// 미니홈 아이콘 태그 
			        	let homeImage = document.createElement("img");
			        	homeImage.src = "../../../../resources/images/minihome/homeIcon.png";
			        	homeImage.setAttribute("class", "friend-home-Img");
			        	homeImage.setAttribute("id", "friend-home-popup");
			        	//homeImage.addEventListener("click", popupFunction);
			        	
			        	//결과 text담을 div 
			        	let resultContainer = document.createElement("div");
			        	resultContainer.setAttribute("class", "popup");
			        	resultContainer.setAttribute("id", "resultContainer");
			        	resultContainer.addEventListener("click", popupFunction);
			        	
			        	//결과값 출력 div 
			            let searchResult = document.getElementById('searchResult');
						searchResult.innerHTML = ''; //값 초기화
						
						//tag 주입 
						 resultContainer.appendChild(homeImage);
						 resultContainer.appendChild(document.createTextNode(result));
						 
						 popup.appendChild(homeLink);
			           	 searchResult.appendChild(popup);
			           	 searchResult.appendChild(resultContainer);
			           	 
			        	 // 텍스트 추가
						// searchResult.appendChild(document.createTextNode(json.userName + '(' + json.userEmail + ')'));
		        	   
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



	
$(document).on('click', '.accept', function() {
	if(confirm("일촌신청을 수락하시겠습니까?")){
		let fSeq = $(this).data('seq');
		
		let jsonData = { 
						"seq" : fSeq 
						,"fStatus" : 1
						};
	
			$.ajax({
			url: "/mnHome/acceptFriends"
			,type: "POST"
			, dataType : "json"
			, data: JSON.stringify(jsonData)
			, contentType: "application/json"
			, success : function(data){
				alert("일촌신청을 수락했습니다.");
				document.getElementById("spanSettingFriends").click();
			}, error : function(error){
				console.log("Error : " + error);
				alert('잠시 후 다시 시도해주세요.');
			}
			});
		}
		
});

$(document).on('click', '.reject', function() {
	if(confirm("일촌신청을 거절하시겠습니까?")){
		let fSeq = $(this).data('seq');
		
		let jsonData = { 
						"seq" : fSeq 
						,"fStatus" : -1
						};
	
			$.ajax({
			url: "/mnHome/rejectFriends"
			,type: "POST"
			, dataType : "json"
			, data: JSON.stringify(jsonData)
			, contentType: "application/json"
			, success : function(data){
				alert("일촌신청을 거절했습니다.");
				document.getElementById("spanSettingFriends").click();
			}, error : function(error){
				console.log("Error : " + error);
				alert('잠시 후 다시 시도해주세요.');
			}
			});
		}
		
});

$(document).on('click', 'input.cancle', function() {
	if(confirm("일촌신청을 취소하시겠습니까?")){
		let fSeq = $(this).data('seq');
		
		let jsonData = { 
						"seq" : fSeq 
						,"del" : 'Y'
						};
	
			$.ajax({
			url: "/mnHome/cancleFriends"
			,type: "POST"
			, dataType : "json"
			, data: JSON.stringify(jsonData)
			, contentType: "application/json"
			, success : function(data){
				alert("일촌신청을 취소했습니다.");
				document.getElementById("spanSettingFriends").click();
			}, error : function(error){
				console.log("Error : " + error);
				alert('잠시 후 다시 시도해주세요.');
			}
			});
		return;
	}
		
});

$(document).on('click', '#searchBf', function() {
	
	let name = document.getElementById('searchBfName').value;
	let userNickname = document.getElementById('hiddenUserNickname').value;
	let url = "/mnHome/settingFriends/" + userNickname + "/" + name;
	loadTabContent(url);
	
});
	
	
	
// When the user clicks on div, open the popup
function popupFunction() {
	 var popup = document.getElementById("myPopup");
	 popup.classList.toggle("show");
}
	
// Close the popup when clicking outside of it
$(document).on('click', function(event) {
  var popup = document.getElementById("myPopup");
  var popupContainer = document.querySelector('.popup');
  if (!popupContainer.contains(event.target)) {
    popup.classList.remove("show");
  }
});

	

