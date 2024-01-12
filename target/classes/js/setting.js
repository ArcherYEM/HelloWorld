var isEditMode = false;
var isEditModeN = false;
var isEditModeNum = false;

function changeName() {
    var userNickname = document.getElementById('userNickname').value;
    var userNameArea = document.getElementById('set-UserName');
    var btnFix = document.querySelector('.set-info-name-a');

    if (!isEditMode) {
        var userName = userNameArea.value; // userName을 여기에서 선언
        userNameArea.readOnly = false;
        userNameArea.focus();
        userNameArea.style.border = '1px solid black';
        userNameArea.style.borderRadius = '5px';
        btnFix.textContent = "확인";
        isEditMode = true;
    } else {
        var changedName = userNameArea.value;
        
        for (var i = 0; i < changedName.length; i++) {
            var char = changedName.charAt(i);
            if (char >= '0' && char <= '9') {
                alert("숫자가 포함되어 있습니다.")
                return;
            }
        }
        
        if (changedName) { // 조건문에 {} 사용
            let jsonData = {
                "userNickname" : userNickname,
                "originalName" : userName, // userName 변수 사용
                "changedName" : changedName
            };
            
            $.ajax({
                method: 'POST',
                url: '/mnHome/changeName',
                contentType: 'application/json',
                data: JSON.stringify(jsonData)        	
            }).done(function(json) {
                if (json == 1) {
                    alert("성공적으로 이름을 변경했습니다.")
                } else if(json == 4){
                	alert("기존 이름에서 변경 후 시도해주세요.");
                }else{
                	alert("변경에 실패했습니다.");
                }
            });
        }

        userNameArea.readOnly = true;
        userNameArea.style.border = 'none';
        btnFix.textContent = "수정";
        isEditMode = false;
    }
}


function changeNickname() {
	var userEmail = document.getElementById('userEmail').value;
    var userNicknameArea = document.getElementById('set-UserNickname');
    var btnFix = document.querySelector('.set-info-Nickname-a');
    
    if (!isEditModeN) {
        userNickname = userNicknameArea.value;
        userNicknameArea.readOnly = false;
        userNicknameArea.focus();
        userNicknameArea.style.border = '1px solid black';
        userNicknameArea.style.borderRadius = '5px';
        btnFix.textContent = "확인";
        isEditModeN = true;
    } else {
        var changedNickname = userNicknameArea.value;
        
        if(changedNickname.length > 30){
    		alert("입력 가능한 최대 길이를 초과했습니다.");
    		return;
    	}        
        
        if(changedNickname){       	
        
	        let jsonData = {
	        		"userEmail" : userEmail,
	        		"originalNickname" : userNickname,
	        		"changedNickname" : changedNickname
	        };
	        
	        $.ajax({
	        	method: 'POST',
	        	url: '/mnHome/changeNickname',
	        	contentType: 'application/json',
	            data: JSON.stringify(jsonData)        	
	        }).done(function(json) {
				if(json==1){
					alert("성공적으로 닉네임을 변경했습니다.")
				} else if(json==3){
					alert("이미 사용중인 닉네임입니다.")
					userNicknameArea.value=userNickname;
				}else {
					alert("변경에 실패했습니다. 다시 시도하세요.")
				}
			});
        }

        userNicknameArea.readOnly = true;
        userNicknameArea.style.border = 'none';
        btnFix.textContent = "수정";
        isEditModeN = false;
    }
}
function changeNumber() {
	var userNickname = document.getElementById('userNickname').value;
    var userNumberArea = document.getElementById('set-UserPhone');
    var btnFix = document.querySelector('.set-info-phone-a');
    if (!isEditModeNum) {
        userNumber = userNumberArea.value;
        userNumberArea.readOnly = false;
        userNumberArea.focus();
        userNumberArea.style.border = '1px solid black';
        userNumberArea.style.borderRadius = '5px';
        btnFix.textContent = "확인";
        isEditModeNum = true;
    } else {
        var changedNumber = userNumberArea.value;

        if(changedNumber){       	
        
        	if (!/^[0-9]+$/.test(changedNumber)) {
        		alert("전화번호는 숫자만으로 구성되어야 합니다.")
        		return;
        	}
        	
        	if(changedNumber.length !== 11){
        		alert("11자리가 아닙니다. 다시 한번 확인하세요");
        		return;
        	}
        	
	        let jsonData = {
	        		"userNickname" : userNickname,
	        		"originalNumber" : userNumber,
	        		"changedNumber" : changedNumber
	        };
	        
	        $.ajax({
	        	method: 'POST',
	        	url: '/mnHome/changeNumber',
	        	contentType: 'application/json',
	            data: JSON.stringify(jsonData)        	
	        }).done(function(json) {
				if(json==1){
					alert("성공적으로 전화번호을 변경했습니다.")
				} else if(json==3){
					alert("이미 사용중인 전화번호입니다.")
					userNumberArea.value=userNumber;
				}else {
					alert("변경에 실패했습니다. 다시 시도하세요.")
				}
			});
        }

        userNumberArea.readOnly = true;
        userNumberArea.style.border = 'none';
        btnFix.textContent = "수정";
        isEditModeNum = false;
    }
}