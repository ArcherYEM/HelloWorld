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

