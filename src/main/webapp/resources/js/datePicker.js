	function already(){
		alert("오늘은 이미 작성한 다이어리가 존재합니다.");
		return;
	}

	$(document).ready(function() {
	
	let userNickname = document.getElementById("hiddenUserNickname").value;
	let VisitorNickname = document.getElementById("hiddenVisitorNickname").value;

    $.datepicker.setDefaults({
        dateFormat: 'yymmdd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
    
    
    $("#datepicker2").datepicker();
    
    $('#datepicker').datepicker({
        onSelect: function(dateText, inst) {
            let formattedDate = dateText.slice(0, 4) + '-' + dateText.slice(4, 6) + '-' + dateText.slice(6, 8);

            let jsonData = {
                "date": formattedDate,
                "userNickname": userNickname
            };

            $.ajax({
                method: 'POST',
                url: '/mnHome/diaryTest',
                contentType: 'application/json',
                data: JSON.stringify(jsonData)
            }).done(function(json){
            
                if (!json || json.title === undefined || (json.openScope == 0 && userNickname != VisitorNickname)) {
                    document.getElementById('diaryTitle').textContent = "다이어리를 작성해주세요";
                    document.getElementById('cmtInputContainer').style.display = "none";
                    if(userNickname == VisitorNickname){
                    	document.getElementById('diary-public').style.display = "none";
                    }
                } else if(json.openScope == 1 || (userNickname == VisitorNickname)) {
                    document.getElementById('diaryTitle').textContent = json.title;
                    document.getElementById('cmtInputContainer').style.display = "block";
                    if(userNickname == VisitorNickname){
                    	document.getElementById('diary-public').style.display = "flex";
                    }
                }
                if(json.openScope == 1){
                	changePublic("1");
                }else{
                	changePublic("0");
                }

                if (!json || json.formatted_update_date === undefined || (json.openScope == 0 && userNickname != VisitorNickname)) {
                    document.getElementById('diaryDate').textContent = "";
                } else if(json.openScope == 1 || (userNickname == VisitorNickname)){
                    document.getElementById('diaryDate').textContent = json.formatted_update_date;
                }

                if (!json || json.content === undefined || (json.openScope == 0 && userNickname != VisitorNickname)) {
                    document.getElementById('diaryContent').innerHTML = "매일매일 일촌들과 일상을 공유해보아요!";
                } else if(json.openScope == 1 || (userNickname == VisitorNickname)) {
                    document.getElementById('diaryContent').innerHTML = json.content;
                }
                
                if (!json || json.seq === undefined || (json.openScope == 0 && userNickname != VisitorNickname)) {
                    document.getElementById('cmtSeq').value = "";
                    document.getElementById('diaryCmtContainer').innerHTML = "";
                } else if(json.openScope == 1 || (userNickname == VisitorNickname)) {
                    document.getElementById('cmtSeq').value = json.seq;
                    let seq = Number(json.seq);
                    getCmt(seq);
                }
                
                
            });

        }
    });
    
    // 처음 다이어리 탭 눌렀을 때 처리 
    let noContent = document.getElementById('cmtSeq').value;
    let openScope = document.getElementById('openScope').value;
    if(noContent=="" || (openScope == 0 && userNickname != VisitorNickname)){
    	document.getElementById('cmtInputContainer').style.display = "none";
    	document.getElementById('diary-public').style.display = "none";
    }
});

function deleteDiary(){
	let seq = $("#cmtSeq").val();
	
	let jsonData = {
		"seq" : seq
	};
	
	if(confirm('정말 삭제하시겠습니까?')){
		$.ajax({
        method: 'POST',
        url: "/mnHome/diaryDelete",
        contentType: 'application/json',
        data: JSON.stringify(jsonData)
	    }).done(function(json) {
	        if(json.resultCode === '1' ){
	        	 alert("삭제되었습니다.");
	        	 document.getElementById("tabDiary").click();
	        } else if(json.resultCode === "0"){
	            alert("잠시 후 다시 시도해주세요.");
	        }
   		});
	}
	
}

function changePublic(option){
	 var selectElement = document.getElementById("select-scope");
	 
	 var options = selectElement.options;
	 
	 for (var i = 0; i < options.length; i++) {
        if (options[i].value === option) {
            options[i].selected = true; // 선택 상태로 변경
        } else {
            options[i].selected = false; // 선택 해제
        }
    }
}
