function addDiary() {
    let userNickname = $("#hiddenUserNickname").val();
    let title = $("#diaryTitle").val();

    // SmartEditor의 내용을 갱신
    oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  

    // txtContent의 값을 가져와서 개행 문자를 제거
    let content = document.getElementById("txtContent").value.replace("\r\n", "");
    console.log(content);
    
    let jsonData = {
        "content" : content,
        "userNickname" : userNickname,
        "title" : title
    };
    console.log (jsonData);
    
    $.ajax({
        method: 'POST',
        url: "/mnHome/diaryAdd",
        contentType: 'application/json',
        data: JSON.stringify(jsonData)
    }).done(function(json) {
        if(json.result === "Success"){
        	 alert("성공메세지");
        } else if(json.result === "false"){
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
