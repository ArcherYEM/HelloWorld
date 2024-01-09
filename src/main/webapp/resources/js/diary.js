function addDiary() {
    let userNickname = $("#hiddenUserNickname").val();
    let title = $("#diaryTitle").val();

    // SmartEditor의 내용을 갱신
    oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);  

    // txtContent의 값을 가져와서 개행 문자를 제거
    let content = document.getElementById("txtContent").value.replace("\r\n", "");
    
    console.log(content);
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
