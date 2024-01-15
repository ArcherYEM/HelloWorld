

		
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


		
		// 여러파일 업로드
		function multiFiles(input) {
			  var previewContainer = document.getElementById('preview-container');

			  if (input && input.length) {
			    for (var i = 0; i < input.length; i++) {
			      (function(file) {
			        var reader = new FileReader();
			        reader.onload = function(e) {
			       	  var newDiv = document.createElement("div");
					      newDiv.className = "image-container";
					      newDiv.style.position = "relative";
			          var newDiv2 = document.createElement("div");
			          newDiv2.className = "name-container";
								
			          // 파일이미지
			          var newImg = document.createElement("img");
			          newImg.src = e.target.result;
			          newImg.style.width = "50%"; // 이미지 크기 설정
			          newImg.style.height = "auto";
			          newImg.style.marginBottom = "20px";

			          // 파일 이름을 표시하는 텍스트 노드 생성
			          var imageName = document.createTextNode(file.name);
			          
			          // 취소버튼
			          var newBtn = document.createElement("button");
			          newBtn.className="removeBtn";
			          newBtn.style.position = "absolute";
			          newBtn.style.top = "0";
			          newBtn.style.right = "0";
			         newBtn.onclick = function() {
					    if (confirm("선택된 사진을 삭제하시겠습니까?") == true) {
					        previewContainer.removeChild(newDiv);
					
					        // 파일 인풋에서 해당 파일을 제외하고 다시 설정
					        var fileInput = document.querySelector('.fileUpload');
					        var updatedFiles = Array.from(fileInput.files).filter(function (f) {
					            return f !== file;
					        });
					        
					        // 새로운 FileList 생성
					        var newFileList = new DataTransfer();
					        updatedFiles.forEach(function (file) {
					            newFileList.items.add(file);
					        });
								
					         fileInput.files = newFileList.files;
					    } else {
					        return false;
					    }
					};
		          	  
		          // div 안에 img와 텍스트 노드 추가
		          newDiv.appendChild(newDiv2);
		          newDiv.appendChild(newBtn);
		          newDiv2.appendChild(imageName); 
		          newDiv.appendChild(newImg);

		          // 생성한 div를 preview-container에 추가
		          previewContainer.appendChild(newDiv);
		        };

		        reader.readAsDataURL(file); // 파일 읽기 시작
		      })(input[i]);
		    }
		  }
		}
		
function writeBoard() {
    let userNickname = $("#hiddenUserNickname").val();
    let title = $(".board-title").val();

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
    console.log(jsonData);
    
    $.ajax({
        method: 'POST',
        url: "/mnHome/boardWrite",
        contentType: 'application/json',
        data: JSON.stringify(jsonData)
    }).done(function(json) {
        if(json.resultCode === '1' ){
        	 alert("저장되었습니다.");
        	 console.log(json);
        	 document.getElementById("btnBoardView").click();
        } else if(json.resultCode === "0"){
            alert("잠시 후 다시 시도해주세요.");
        }
    });
    
}
		