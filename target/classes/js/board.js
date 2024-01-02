
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

		for (var i = 0; i < titles.length; i++) {
		  titles[i].addEventListener('click', function() {
		    location.href = '/miniHome/boardDetail';
		  });
		}
		
});