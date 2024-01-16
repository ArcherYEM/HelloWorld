	function already(){
		alert("오늘은 이미 작성한 다이어리가 존재합니다.");
		return;
	}

	$(document).ready(function() {
	
	let userNickname = document.getElementById("hiddenUserNickname").value;

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
                if (!json || json.title === undefined) {
                    document.getElementById('diaryTitle').textContent = "다이어리를 작성해주세요";
                    document.getElementById('cmtInputContainer').style.display = "none";
                    
                } else {
                    document.getElementById('diaryTitle').textContent = json.title;
                    document.getElementById('cmtInputContainer').style.display = "block";
                }

                if (!json || json.formatted_update_date === undefined) {
                    document.getElementById('diaryDate').textContent = "";
                } else {
                    document.getElementById('diaryDate').textContent = json.formatted_update_date;
                }

                if (!json || json.content === undefined) {
                    document.getElementById('diaryContent').innerHTML = "매일매일 일촌들과 일상을 공유해보아요!";
                } else {
                    document.getElementById('diaryContent').innerHTML = json.content;
                }
                
                if (!json || json.seq === undefined) {
                    document.getElementById('cmtSeq').value = "";
                    document.getElementById('diaryCmtContainer').innerHTML = "";
                } else {
                    document.getElementById('cmtSeq').value = json.seq;
                    let seq = Number(json.seq);
                    getCmt(seq);
                }
                
                
            });

        }
    });
});

