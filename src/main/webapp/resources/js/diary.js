 // 에디터 초기화 확인
if (oEditors.length === 0) {
        initializeEditor(); // 초기화되지 않았다면 초기화
    }

    oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
    let content = document.getElementById("txtContent").value.replace("\r\n", "");

    document.getElementById('frmDiary').submit();
    
function addDiary() {
    console.log("버튼 클릭됨");
    
    let userNickname = $("#hiddenUserNickname").val();
    let title = $("#diaryTitle").val();
    console.log(userNickname);
    console.log(title);
    console.log(txtContent);
    console.log(content);
    
    document.getElementById('diaryHiddenTitle').value = document.getElementById('diaryTitle').value;

    console.log(document.getElementById('diaryHiddenUserNickname').value);
};

