function addDiary() {
    console.log("버튼 클릭됨");

    let userNickname = $("#hiddenUserNickname").val();
    let title = $("#diaryTitle").val();

    // 에디터가 이미 초기화되었는지 확인
    if (typeof oEditors.getById["txtContent"] !== 'undefined') {
        oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
        let content = oEditors.getById["txtContent"].getIR();
        console.log(userNickname);
        console.log(title);
        console.log(content);

        document.getElementById('diaryHiddenTitle').value = document.getElementById('diaryTitle').value;

        console.log(document.getElementById('diaryHiddenUserNickname').value);
    }
}

//스마트 에디터 초기화 코드 (페이지에서 호출)
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "txtContent",
    sSkinURI: "../../../../resources/smarteditor2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});