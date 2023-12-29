function loadTabContent(tabName) {
    $.ajax({
        url: tabName,
        type: "GET",
        dataType: "html",
        success: function (data) {
            $('#test').empty();
            var htmlToAdd = '';
            if(tabName === '/mnHome/diaryView'){
                htmlToAdd += '<link href="/resources/css/minihome/diary.css" rel="stylesheet">';
                htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/jquery-ui(1.13.2).css">';
                htmlToAdd += '<script src="https://kit.fontawesome.com/91b557f547.js" crossorigin="anonymous"></script>';
                htmlToAdd += '<script src="https://code.jquery.com/jquery-3.6.0.js"></script>';
                htmlToAdd += '<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>';                
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>';
                htmlToAdd += '<script src="../../../../resources/js/datePicker.js"></script>';

            }else if(tabName === '/mnHome/albumView'){
                htmlToAdd += '<link class="album" href="/resources/css/minihome/album.css" rel="stylesheet">';
                htmlToAdd += '<script src="https://code.jquery.com/jquery-3.6.0.js"></script>';
            }else if(tabName === '/mnHome/boardView'){
                htmlToAdd += '<link class="board" href="/resources/css/minihome/board.css" rel="stylesheet">';
                htmlToAdd += '<link class="board" href="/resources/css/minihome/album.css" rel="stylesheet">';
                htmlToAdd += '<script src="https://code.jquery.com/jquery-3.6.0.js"></script>';
            }else if(tabName === '/mnHome/visitView'){
                htmlToAdd += '<link href="/resources/css/minihome/visit.css" rel="stylesheet">';
                htmlToAdd += '<script src="https://code.jquery.com/jquery-3.6.0.js"></script>';
            }else if(tabName === '/mnHome/settingView'){
                htmlToAdd += '<link href="/resources/css/minihome/setting.css" rel="stylesheet">';
                htmlToAdd += '<script src="https://code.jquery.com/jquery-3.6.0.js"></script>';
            }
            
            // Append all the HTML at once.
            $('#test').html(htmlToAdd);
            
            $(".bookcover").html($(data).find(".bookcover").html());
        },
        error: function (error) {
            console.log("Error loading tab: " + error);
        }
    });
}

$(document).on("click", ".menu-content", function (event) {
    event.preventDefault();
    tabName = $(this).data("tab");
    loadTabContent(tabName); 
});

$(document).on("click", ".btnDiaryWrite", function (event) {
   event.preventDefault();
   tabName = $(this).data("diaryWrite");
   loadTabContent(tabName); 
});


