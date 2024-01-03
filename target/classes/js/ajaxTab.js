function loadTabContent(tabName) {
    $.ajax({
        url: tabName,
        type: "GET",
        dataType: "html",
        success: function (data) {
			// head 요소에 새로운 meta 태그 추가
			//var newScriptTag = document.createElement('script');
			
			
            $('#test').empty();
            var htmlToAdd = '';
            if(tabName === '/mnHome/diaryView'){
                htmlToAdd += '<link href="/resources/css/minihome/diary.css" rel="stylesheet">';
                htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/jquery-ui(1.13.2).css">';
                htmlToAdd += '<script src="https://kit.fontawesome.com/91b557f547.js" crossorigin="anonymous"></script>';
                htmlToAdd += '<script src="../../../../resources/js/datePicker.js"></script>';
            }else if(tabName === '/mnHome/diaryWriteView'){
            	htmlToAdd += '<link href="/resources/css/minihome/diary.css" rel="stylesheet">';
                htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/jquery-ui(1.13.2).css">';
                htmlToAdd += '<script src="https://kit.fontawesome.com/91b557f547.js" crossorigin="anonymous"></script>';
                htmlToAdd += '<script src="../../../../resources/js/smartEditor.js"></script>';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>';
                htmlToAdd += '<script src="../../../../resources/js/datePicker.js"></script>';
            }else if(tabName === '/mnHome/albumView'){
                htmlToAdd += '<link class="album" href="/resources/css/minihome/album.css" rel="stylesheet">';
            }else if(tabName === '/mnHome/albumWriteView'){
                htmlToAdd += '<link class="album" href="/resources/css/minihome/album.css" rel="stylesheet">';
            }else if(tabName === '/mnHome/boardView'){
                htmlToAdd += '<link class="board" href="/resources/css/minihome/board.css" rel="stylesheet">';
                htmlToAdd += '<link class="board" href="/resources/css/minihome/album.css" rel="stylesheet">';
                htmlToAdd += '<script src="../../../../resources/js/board.js"></script>';
            }else if(tabName === '/mnHome/boardWriteView'){
                htmlToAdd += '<link class="board" href="/resources/css/minihome/board.css" rel="stylesheet">';
                htmlToAdd += '<link class="board" href="/resources/css/minihome/album.css" rel="stylesheet">';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>';
                htmlToAdd += '<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/js/boardWrite.js"></script>';
           
           	//newScriptTag.src = '../../../../resources/js/boardWrite.js';
			//newScriptTag.content = '새로운 메타 태그입니다.';
			//document.head.appendChild(newScriptTag);
           
           
           
            }else if(tabName === '/mnHome/visitView'){
                htmlToAdd += '<link href="/resources/css/minihome/visit.css" rel="stylesheet">';
            }else if(tabName === '/mnHome/settingView'){
                htmlToAdd += '<link href="/resources/css/minihome/setting.css" rel="stylesheet">';
            }else if(tabName === '/mnHome/settingFriends'){
                htmlToAdd += '<link href="/resources/css/minihome/setting.css" rel="stylesheet">';
                htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/settingFriends.css" />';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/js/searchFriends.js"></script>';
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
   tabName = $(this).data("diarywrite");
   console.log('TabName:', tabName);
   loadTabContent(tabName); 
});

$(document).on("click", ".btnAlbumWrite", function (event) {
	event.preventDefault();
	tabName = $(this).data("albumwrite");
	console.log('TabName:', tabName);
	loadTabContent(tabName); 
});

$(document).on("click", ".btnBoardWrite", function (event) {
	event.preventDefault();
	tabName = $(this).data("boardwrite");
	console.log('TabName:', tabName);
	loadTabContent(tabName); 
});

$(document).on("click", ".btn-boardlist", function (event) {
	event.preventDefault();
	tabName = $(this).data("boardview");
	console.log('TabName:', tabName);
	loadTabContent(tabName); 
});

$(document).on("click", ".btn-diarylist", function (event) {
	event.preventDefault();
	tabName = $(this).data("diaryview");
	console.log('TabName:', tabName);
	loadTabContent(tabName); 
});

$(document).on("click", ".album-under-left", function (event) {
	event.preventDefault();
	tabName = $(this).data("albumview");
	console.log('TabName:', tabName);
	loadTabContent(tabName); 
});

$(document).on("click", ".setting-menu-title", function (event) {
	event.preventDefault();
	tabName = $(this).data("friends");
	console.log('TabName:', tabName);
	loadTabContent(tabName); 
});






