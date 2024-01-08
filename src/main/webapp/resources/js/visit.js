function btnPage(page) {
	alert(page);
    var userNickname = $('#hiddenUserNickname').val();

    var url = "/mnHome/visitView/" + userNickname + "?page=" + page;

    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            // 성공 시 페이지의 내용을 업데이트합니다.
            // 'response'는 서버로부터 받은 새로운 페이지 내용입니다.
            // 여기서는 예시로 '#content'라는 ID를 가진 요소에 내용을 삽입합니다.
            $('#content').html(response);

            // 페이지 이동 후 추가적으로 필요한 스크립트나 UI 업데이트를 수행할 수 있습니다.
        },
        error: function(error) {
            // 에러 처리
            console.log('Error:', error);
        }
    });
}

function btnPage(){
	alert('hi');
}
	
function insertComment() {
    let userNickname = $("#userNickname").val();
    let targetNickname = $("#targetNickname").val();

    if(userNickname === targetNickname){
        alert("자신의 방명록에는 글을 작성할 수 없습니다.");
        return;
    }

    let commentValue = $('#visit-comment-insert').val();

    let jsonData = {
        "content" : commentValue,
        "userNickname" : userNickname,
        "targetNickname" : targetNickname
    };

    $.ajax({
        method: 'POST',
        url: "/mnHome/visitComment",
        contentType: 'application/json',
        data: JSON.stringify(jsonData)
    }).done(function(json) {
        if(json.result === "Success"){
            $('#visit-comment-insert').val('');
            $('#menu-visit').trigger('click');
        } else if(json.result === "false"){
            alert("댓글 작성에 실패했습니다. 다시 시도해주세요.");
        }
    });
}

function btnModify(clickedElement) {
    var parentDiv = clickedElement.closest('div[id^="visit-"]');
    var inputField = parentDiv.querySelector('.visit-view-inner');

    inputField.readOnly = false;
    inputField.focus();
    
    var originalContent = inputField.getAttribute('data-original-content');

    clickedElement.innerText = '확인';
    clickedElement.onclick = function() {
        btnConfirm(this, originalContent);
    };
}

function btnConfirm(clickedElement, originalContent) {
    var parentDiv = clickedElement.closest('div[id^="visit-"]');
    var inputField = parentDiv.querySelector('.visit-view-inner');
    var newContent = inputField.value;
    
    let jsonData = {
        "originalContent": originalContent,
        "newContent": newContent,
        "userNickname": parentDiv.getAttribute('data-userNickname'),
        "targetNickname": $("#targetNickname").val()
    };
    
    $.ajax({
        method: 'POST',
        url: "/mnHome/visitCommentUpdate",
        contentType: 'application/json',
        data: JSON.stringify(jsonData)
    }).done(function (json) {
        if (json.result == "Success") {
            alert("변경되었습니다.");

            inputField.setAttribute('data-original-content', newContent);
            
            inputField.readOnly = true;
            clickedElement.innerText = '수정';
            clickedElement.onclick = function() {
                btnModify(this);
            };
        } else {
            alert("변경에 실패했습니다. 다시 시도해주세요.");
            inputField.value = originalContent;
        }
    });
}

function btnDelete(clickedElement) {
	var parentDiv = clickedElement.closest('div[id^="visit-"]');
    var inputField = parentDiv.querySelector('.visit-view-inner');
    var currentContent = inputField.value;
    var userNickname = parentDiv.getAttribute('data-userNickname');
    let targetNickname = $("#targetNickname").val();

    if (!confirm("이 게시물을 삭제하시겠습니까?")) {
        return;
    }
    
    let jsonData = {
    		"content": currentContent,
    		"userNickname": userNickname,
    		"targetNickname": targetNickname
    };
    
    $.ajax({
        method: 'POST',
        url: "/mnHome/visitCommentDelete",
        contentType: 'application/json',
        data: JSON.stringify(jsonData)
    }).done(function (json) {
        if (json.result == "Success") {
            alert("게시물이 성공적으로 삭제되었습니다.");

            parentDiv.remove();
        } else {
            alert("게시물 삭제에 실패했습니다. 다시 시도해주세요.");
        }
    });
}

function countBytes(str) {
    var byteLength = 0;
    for (var i = 0; i < str.length; i++) {
        var charCode = str.charCodeAt(i);
        if (charCode < 0x0080) {
            byteLength += 1; // 1바이트 문자
        } else if (charCode < 0x0800) {
            byteLength += 2; // 2바이트 문자
        } else {
            byteLength += 3; // 3바이트 문자 (한글 포함)
        }
    }
    return byteLength;
}

function countCharacters() {
    var textInput = document.getElementById('visit-comment-insert').value;
    var byteCount = countBytes(textInput);
    
    // 입력 가능한 최대 바이트 수
    var maxBytes = 5000; // VARCHAR(5000)에 해당

    // 바이트 수를 초과하지 않도록 제한
    while (byteCount > maxBytes) {
        // 바이트 수가 최대치를 초과하면 마지막 문자 제거
        textInput = textInput.slice(0, -1);
        byteCount = countBytes(textInput);
    }
    // 수정된 텍스트를 다시 설정
    document.getElementById('visit-comment-insert').value = textInput;
    
    // 현재 바이트 수를 표시
    document.getElementById('char-count').innerText = byteCount + '/' + maxBytes;
}
