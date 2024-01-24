function btnPage(page) {
    var targetNickname = $('#targetNickname').val();
    var url = "/mnHome/visitView/" + targetNickname + "?page=" + page;

    $.ajax({
        url: url,
        type: 'GET',
        success: function(response) {
            // 전체 HTML 문서를 서버의 응답으로 교체
            document.documentElement.innerHTML = response;
            
            loadStyles(tabName);

        },
        error: function(error) {
            // 에러 처리
            console.log('Error:', error);
        }
    });
}

function loadStyles(tabName) {
	  // 해당 탭에 필요한 CSS 파일을 동적으로 로드
	  var link = document.createElement('link');
	  link.rel = 'stylesheet';
	  link.type = 'text/css';
	  link.href = 'setting.css'; // 각 탭별로 다른 CSS 파일로 설정
	  document.head.appendChild(link);
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
            document.getElementById("tabVisit").click();
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
    // textarea의 내용을 가져옴
    var textarea = document.getElementById('visit-comment-insert');
    var text = textarea.value;

    // 입력 가능한 최대 바이트 수
    var maxBytes = 5000; // VARCHAR(5000)에 해당

    // 바이트 수를 초과하지 않도록 제한
    if (countBytes(text) > maxBytes) {
        // 현재 입력값이 최대 바이트를 초과하면 처리하지 않음
        return;
    }

    // 엔터 키 처리: 개행 문자(\n)를 <br>로 변환
    var formattedText = text.replace(/\n/g, "<br>");

    // contenteditable 속성이 부여된 div에 해당 내용을 설정
    var contentEditableDiv = document.getElementById('visit-comment-insert');
    contentEditableDiv.innerHTML = formattedText;

    // 현재 바이트 수를 표시
    document.getElementById('char-count').innerText = countBytes(text) + '/' + maxBytes;
}

// input 이벤트에 countCharacters 함수를 연결
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('visit-comment-insert').addEventListener('input', countCharacters);
});
