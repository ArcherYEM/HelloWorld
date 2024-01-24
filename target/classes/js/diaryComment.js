function addCmt(){
	let userNickname = $(".cmtWriter").val();
	let seq = $("#cmtSeq").val();
	let content = $(".comment-content-write").val();
	
	let jsonData = {
		"diarySeq" : seq
		, "userNickname" : userNickname
		, "content" : content
	};
	
	$.ajax({
			url: "/mnHome/diaryAddCMT"
			,type: "POST"
			, dataType : "json"
			, data: JSON.stringify(jsonData)
			, contentType: "application/json"
			, success : function(data){
				if(data.resultCode == "1"){
					alert('작성 완료');
					$(".comment-content-write").val("");
					getCmt(Number(seq));
				}else{
					alert('작성 실패');
				}
				
			}, error : function(error){
				console.log("Error: " + error);
				alert('잠시 후 다시 시도해주세요.');
			}
		});
}


function getCmt(seq){
	seq = Number(seq);
	let jsonData = {
		"seq" : seq
	};
	
	$.ajax({
			url: "/mnHome/getDiaryCmt"
			,type: "POST"
			, dataType : "json"
			, data: JSON.stringify(jsonData)
			, contentType: "application/json"
			
		}).done(function(json){
			if (!json || json.cmt === undefined) {
                    document.getElementById('diaryCmtContainer').innerHTML = "";
                } else {
                	var container = document.getElementById("diaryCmtContainer");
                	container.innerHTML="";
                	for(let i=0; i<json.cmt.length; i++){
                		let comment = json.cmt[i];
                		// 새로운 board-comment 태그 생성
				        var commentElement = document.createElement("div");
				        commentElement.className = "board-comment";
				
				        // 내부 요소 추가
				        commentElement.innerHTML = `
				            <span class="board-comment-writer">${comment.userNickname}</span>
				            <span class="board-comment-content">${comment.content}</span>
				            <span class="board-comment-date">${comment.cmtDate}</span>
				        `;
				
				        // container에 새로 생성한 태그 추가
				        container.appendChild(commentElement);
                	}
                    //document.getElementById('diaryCmtContainer').innerHTML = json.content;
                    
                }
		});
}

function modifyDiary(){
    let seq = $("#cmtSeq").val();
    let userNickname = document.getElementById("hiddenUserNickname").value;
    
    console.log(userNickname);
   	url = '/mnHome/diaryModifyView/';
   	
    let tabName = url.concat(userNickname,'/',seq);
    console.log(tabName);
	loadTabContent(tabName); 
    
}
