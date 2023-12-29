function loadTabContent(tabName) {
	   
	    $.ajax({
	        url: tabName,
	        type: "GET",
	        dataType: "html",
	        success: function (data) {
	           
	            $(".bookcover").html($(data).find(".bookcover").html());

	        },
	        error: function (error) {
	            console.log("Error loading tab: " + error);
	        }
	    });
	}

	
$(document).on("click", ".menu-content", function (event) {
    var tabName = $(this).data("tab");
    loadTabContent(tabName); 

    event.preventDefault();
});