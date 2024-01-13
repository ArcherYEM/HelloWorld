function btnComment(){
	var content = document.getElementById('inputComment').value;
	var boardSeq = document.getElementById('boardSeq').value;
	var userNickname = document.getElementById('userNickname').value;

	let jsonData = {
		"boardSeq" : boardSeq,
		"userNickname" : userNickname,
		"content" : content
	};
	
	$.ajax({
		method: 'POST',
		url: '/mnHome/addComment',
		contentType: 'application/json',
		data: JSON.stringify(jsonData)		
	}).done(function(json) {
		if(json.length==0){
			alert("댓글 작성에 실패했습니다.");
		}else{
			var newCommentInfo=json[0];
			var newCommentUserNickname=newCommentInfo.userNickname;
			var newCommentUpdateDate=newCommentInfo.update_date_format;
			var newCommentContent=newCommentInfo.content;
			var commentContainer = document.getElementById("board-comment-container");

			var commentDiv = document.createElement("div");
			commentDiv.className = "board-comment";

			var commentInfoDiv = document.createElement("div");
			commentInfoDiv.className = "comment-info";

			var writerSpan = document.createElement("span");
			writerSpan.className = "board-comment-writer";
			writerSpan.textContent = newCommentUserNickname;

			var contentSpan = document.createElement("span");
			contentSpan.className = "board-comment-content";
			contentSpan.textContent = newCommentContent;

			var dateSpan = document.createElement("span");
			dateSpan.className = "board-comment-date";
			dateSpan.textContent = newCommentUpdateDate;

			commentInfoDiv.appendChild(writerSpan);
			commentInfoDiv.appendChild(contentSpan);
			commentInfoDiv.appendChild(dateSpan);

			commentDiv.appendChild(commentInfoDiv);

			var actionsDiv = document.createElement("div");
			actionsDiv.className = "board-comment-actions";

			var deleteSpan = document.createElement("span");
			deleteSpan.className = "board-comment-delete";
			deleteSpan.textContent = "삭제";

			actionsDiv.appendChild(deleteSpan);

			commentDiv.appendChild(actionsDiv);

			commentContainer.prepend(commentDiv);


			var firstComment = commentContainer.firstChild;
			if (firstComment) {
			    commentContainer.insertBefore(commentDiv, firstComment);
			} else {
			    commentContainer.appendChild(commentDiv);
			}
			
			
			document.getElementById('inputComment').value="";	
			alert("댓글이 성공적으로 등록되었습니다.");	
		}
				
	})
}


function btnCommentDelete(event){
	 var commentDiv = event.target.closest('.board-comment');

	 var boardSeqValue = commentDiv.querySelector('input[type="hidden"]').value;
	 
	 var userResponse = confirm("정말로 댓글을 삭제하시겠습니까?");
	 if (userResponse) {
			 $.ajax({
				 method: 'POST',
				 url: '/mnHome/deleteComment',
				 contentType: 'application/x-www-form-urlencoded',
				 data: { seq: boardSeqValue }
			 }).done(function(json){
				 if(json==1){
					 alert("댓글이 정상적으로 삭제되었습니다.");
					 commentDiv.remove();
				 }else{
					 alert("오류가 발생했습니다.");
				 }
			 });
	    } else {
	        return;
	    }
}

$(document).ready(function() {
// 		전체선택 기능
    $(document).on('change', '#checkbox-all', function() {
       
        var checkboxAll = document.getElementById('checkbox-all');
        
        var checkboxes = document.querySelectorAll('.td-checkbox input[type="checkbox"]');
        var allChecked = checkboxAll.checked;

       // console.log('All checked:', allChecked);

        checkboxes.forEach(function(checkbox) {
            checkbox.checked = allChecked;
        });
    });
    
    
    
    $('#btnBoardDelete').on('click', function(){
		var delList = new Array();
		
		if($('.boardCheck[name=boardDel]:checked').length==0){
			alert('삭제할 글을 선택해주세요');
		}else{
			$('.boardCheck[name=boardDel]:checked').each(function() {
				delList.push(this.value);
			});
			
			$.ajax({
				url: "/mnHome/boardDelete"
				,type: "POST"
				, dataType : "json"
				, data: JSON.stringify(delList)
				, contentType: "application/json"
				, success : function(data){
				
					alert("삭제되었습니다.");
				
				}, error : function(error){
					console.log("Error: " + error);
					alert('잠시 후 다시 시도해주세요.');
				}
			});
		}
		
	});


});


// 상단 미니홈피 타이틀 
$('#btn-title-edit').on('click', function(){
	document.getElementById('divHomeTitle').style.display = 'none';
	document.getElementById('newTitle').type = 'text';
	document.getElementById('btn-title-edit').type = 'hidden';
	document.getElementById('btn-title-save').type = 'button';
});

$('#btn-title-save').on('click', function(){
	let newTitle = document.getElementById('newTitle').value;
	let userNickname = document.getElementById('hiddenUserNickname').value;
	
	let jsonData = { 
				"title" : newTitle 
				,"userNickname" : userNickname
				};
				
	console.log(newTitle, userNickname);
	
	$.ajax({
		url: "/mnHome/titleUpdate"
		,type: "POST"
		, dataType : "json"
		, data: JSON.stringify(jsonData)
		, contentType: "application/json"
		, success : function(data){
		
			document.getElementById('divHomeTitle').innerText = newTitle;
			document.getElementById('newTitle').value = newTitle;
		
		}, error : function(error){
			console.log("Error loading tab: " + error);
			alert('잠시 후 다시 시도해주세요.');
			document.getElementById('newTitle').value = document.getElementById('divHomeTitle').value;
		}
	});
	
	document.getElementById('divHomeTitle').style.display = 'block';
	document.getElementById('newTitle').type = 'hidden';
	document.getElementById('btn-title-edit').type = 'button';
	document.getElementById('btn-title-save').type = 'hidden';
	
});



