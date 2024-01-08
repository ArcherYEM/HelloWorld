
$(document).ready(function() {
// 		전체선택 기능
		var checkboxAll=document.getElementById('checkbox-all');
	
		function selectAll() {
		  var checkboxes = document.querySelectorAll('.td-checkbox input[type="checkbox"]');
		  var allChecked = checkboxAll.checked;

		  checkboxes.forEach(function(checkbox) {
		    checkbox.checked = allChecked;
		  });
		}
		
		var titles = document.getElementsByClassName('td-title');
});


// 상단 미니홈피 타이틀 
$('#btn-title-edit').on('click', function(){
	document.getElementById('divHomeTitle').style.display = 'none';
	document.getElementById('newTitle').type = 'text';
	document.getElementById('btn-title-edit').type = 'hidden';
	document.getElementById('btn-title-save').type = 'button';
});

$('#btn-title-save').on('click', function(){
	let newTitle = document.getElementById('newTitle').value;
	let userNickname = document.getElementById('hiddenUserNickname').value;
	
	let jsonData = { 
				"title" : newTitle 
				,"userNickname" : userNickname
				};
				
	console.log(newTitle, userNickname);
	
	$.ajax({
		url: "/mnHome/titleUpdate"
		,type: "POST"
		, dataType : "json"
		, data: JSON.stringify(jsonData)
		, contentType: "application/json"
		, success : function(data){
		
			document.getElementById('divHomeTitle').innerText = newTitle;
			document.getElementById('newTitle').value = newTitle;
		
		}, error : function(error){
			console.log("Error loading tab: " + error);
			alert('잠시 후 다시 시도해주세요.');
			document.getElementById('newTitle').value = document.getElementById('divHomeTitle').value;
		}
	});
	
	document.getElementById('divHomeTitle').style.display = 'block';
	document.getElementById('newTitle').type = 'hidden';
	document.getElementById('btn-title-edit').type = 'button';
	document.getElementById('btn-title-save').type = 'hidden';
	
});
