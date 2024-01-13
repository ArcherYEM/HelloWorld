function addCmt(seq){
<<<<<<< HEAD
	let userNickname = $("#cmtWriter").val();
	let content = $("#cmtContent").val();
	
=======
	let userNickname = $(".cmtWriter").val();
	let tempId = 'cmtContent' + seq;
	let content = $("#" + tempId).val();
		
	console.log(userNickname + content);
>>>>>>> f871cbf8c1afd72efdfb8b3cc99f933abc5210dc
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
<<<<<<< HEAD
=======
					document.getElementById("godiary").click();
>>>>>>> f871cbf8c1afd72efdfb8b3cc99f933abc5210dc
				}else{
					alert('작성 실패');
				}
				
			}, error : function(error){
				console.log("Error: " + error);
				alert('잠시 후 다시 시도해주세요.');
			}
		});
}