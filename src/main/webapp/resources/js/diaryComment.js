function addCmt(seq){
	let userNickname = $(".cmtWriter").val();
	let tempId = 'cmtContent' + seq;
	let content = $("#" + tempId).val();
		
	console.log(userNickname + content);
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
				}else{
					alert('작성 실패');
				}
				
			}, error : function(error){
				console.log("Error: " + error);
				alert('잠시 후 다시 시도해주세요.');
			}
		});
}