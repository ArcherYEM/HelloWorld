function addDiary() {
    let userNickname = $("#hiddenUserNickname").val();
    let title = $("#diaryTitle").val();

    // SmartEditor의 내용을 갱신.
    oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  

    // txtContent의 값을 가져와서 개행 문자를 제거
    let content = document.getElementById("txtContent").value.replace("\r\n", "");
    
    if((title == null || title.trim() === '') || /^\s*$/.test(title)) {
    	alert('제목을 입력하여 주세요.');
    	$("#diaryTitle").val('');
    	$("#diaryTitle").focus();
    	return;
    } 
    
    if(content== '<p>&nbsp;</p>') {
    	alert('내용을 입력하여 주세요.');
    	$("#diaryTitle").focus();
    	return;
    }
    
    let jsonData = {
        "content" : content,
        "userNickname" : userNickname,
        "title" : title
    };
    
    $.ajax({
        method: 'POST',
        url: "/mnHome/diaryAdd",
        contentType: 'application/json',
        data: JSON.stringify(jsonData)
    }).done(function(json) {
        if(json.resultCode === '1' ){
        	 alert("성공메세지");
        	 document.getElementById("btnBoardView").click();
        } else if(json.resultCode === "0"){
            alert("다이어리 작성에 실패했습니다. 다시 시도해주세요.");
        }
    });
    
}

// 페이지 로드 시 SmartEditor 초기화
var oEditors = [];

$(document).ready(function() {
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "txtContent",
        sSkinURI: "../../../../resources/smarteditor2/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
    });
});

$(document).ready(function() {
	let test1=document.getElementById('diaryTitle').textContent;
	if(test1 == ""){
		document.getElementById('diaryTitle').textContent="다이어리를 작성해주세요";
	}
	let test2=document.getElementById('diaryContent').innerHTML;
	if(test2 == ""){
		document.getElementById('diaryContent').innerHTML="매일매일 일촌들과 일상을 공유해보아요!";
	}

});
