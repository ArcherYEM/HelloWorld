function loadTabContent(tabName) {
    $.ajax({
        url: tabName,
        type: "GET",
        dataType: "html",
        success: function (data) {
         
           $('#testUnder').empty();
            $('#test').empty();
            var under='';
            var htmlToAdd = '';
            if(tabName === '/mnHome/diaryView' || tabName.indexOf('/mnHome/diaryView') != -1){
                htmlToAdd += '<link href="/resources/css/minihome/diary.css" rel="stylesheet">';
                htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/jquery-ui(1.13.2).css">';
                htmlToAdd += '<script src="https://kit.fontawesome.com/91b557f547.js" crossorigin="anonymous"></script>';
                htmlToAdd += '<script src="../../../../resources/js/datePicker.js"></script>';
                htmlToAdd += '<script src="../../../../resources/js/diaryComment.js"></script>';
            
            }else if(tabName === '/mnHome/diaryWriteView' || tabName.indexOf('/mnHome/diaryWriteView') != -1){
            	htmlToAdd += '<script src="../../../../resources/js/datePicker.js"></script>';
                htmlToAdd += '<link href="/resources/css/minihome/diary.css" rel="stylesheet">';
                htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/jquery-ui(1.13.2).css">';
                htmlToAdd += '<script src="https://kit.fontawesome.com/91b557f547.js" crossorigin="anonymous"></script>';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>';
                under += '<script src="../../../../resources/js/diary.js"></script>';
            
            }else if(tabName === '/mnHome/diaryModifyView' || tabName.indexOf('/mnHome/diaryModifyView') != -1){
            	htmlToAdd += '<script src="../../../../resources/js/datePicker.js"></script>';
                htmlToAdd += '<link href="/resources/css/minihome/diary.css" rel="stylesheet">';
                htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/jquery-ui(1.13.2).css">';
                htmlToAdd += '<script src="https://kit.fontawesome.com/91b557f547.js" crossorigin="anonymous"></script>';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>';
                under += '<script src="../../../../resources/js/diary.js"></script>';
            
            }else if(tabName === '/mnHome/albumView' || tabName.indexOf('/mnHome/albumView') != -1){
                htmlToAdd += '<link class="album" href="/resources/css/minihome/album.css" rel="stylesheet">';
            
            }else if(tabName === '/mnHome/albumWriteView' || tabName.indexOf('/mnHome/albumWriteView') != -1){
                htmlToAdd += '<link class="album" href="/resources/css/minihome/album.css" rel="stylesheet">';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/js/album.js"></script>';
            
            }else if(tabName === '/mnHome/albumDetailView' || tabName.indexOf('/mnHome/albumDetailView') != -1){
            	htmlToAdd += '<link class="album" href="/resources/css/minihome/album.css" rel="stylesheet">';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/js/album.js"></script>';
           
            }else if(tabName === '/mnHome/boardView' || tabName.indexOf('/mnHome/boardView') != -1){
                htmlToAdd += '<link class="board" href="/resources/css/minihome/board.css" rel="stylesheet">';
                htmlToAdd += '<link class="board" href="/resources/css/minihome/album.css" rel="stylesheet">';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/js/board.js"></script>';
            
            }else if(tabName === '/mnHome/boardWriteView' || tabName.indexOf('/mnHome/boardWriteView') != -1){
                htmlToAdd += '<link class="board" href="/resources/css/minihome/board.css" rel="stylesheet">';
                htmlToAdd += '<link class="board" href="/resources/css/minihome/album.css" rel="stylesheet">';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>';
//              htmlToAdd += '<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>';
                under += '<script type="text/javascript" src="../../../../resources/js/boardWrite.js"></script>';
                
            }else if(tabName === '/mnHome/boardModifyView' || tabName.indexOf('/mnHome/boardModifyView') != -1){
            	htmlToAdd += '<link class="board" href="/resources/css/minihome/board.css" rel="stylesheet">';
            	htmlToAdd += '<link class="board" href="/resources/css/minihome/album.css" rel="stylesheet">';
            	htmlToAdd += '<script type="text/javascript" src="../../../../resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>';
//              htmlToAdd += '<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>';
            	under += '<script type="text/javascript" src="../../../../resources/js/boardWrite.js"></script>';
            	
           }else if(tabName === '/mnHome/boardDetail' || tabName.indexOf('/mnHome/boardDetail') != -1){
                htmlToAdd += '<link class="board" href="/resources/css/minihome/board.css" rel="stylesheet">';
                htmlToAdd += '<link class="board" href="/resources/css/minihome/album.css" rel="stylesheet">';
//                htmlToAdd += '<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>';

            }else if(tabName === '/mnHome/visitView' || tabName.indexOf('/mnHome/visitView') != -1){
                htmlToAdd += '<link href="/resources/css/minihome/visit.css" rel="stylesheet">';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/js/visit.js"></script>';
           
            }else if(tabName === '/mnHome/settingView' || tabName.indexOf('/mnHome/settingView') != -1){
            	htmlToAdd += '<script type="text/javascript" src="../../../../resources/js/setting.js"></script>';
            	htmlToAdd += '<link href="/resources/css/minihome/setting.css" rel="stylesheet">';
           
            }else if(tabName === '/mnHome/settingFriends' || tabName.indexOf('/mnHome/settingFriends') != -1){
                htmlToAdd += '<link href="/resources/css/minihome/setting.css" rel="stylesheet">';
                htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/settingFriends.css" />';
                htmlToAdd += '<script type="text/javascript" src="../../../../resources/js/searchFriends.js"></script>';
           
            }else if(tabName === '/mnHome/settingBgm' || tabName.indexOf('/mnHome/settingBgm') != -1){
                htmlToAdd += '<link href="/resources/css/minihome/setting.css" rel="stylesheet">';
          
            }else if(tabName === '/mnHome/settingMenu'|| tabName.indexOf('/mnHome/settingMenu') != -1){
              htmlToAdd += '<link href="/resources/css/minihome/setting.css" rel="stylesheet">';
              htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/settingMenu.css" />';
              htmlToAdd += '<script type="text/javascript" src="../../../../resources/js/settingMenu.js"></script>';
         
           }else if(tabName === '/mnHome/settingSkin'|| tabName.indexOf('/mnHome/settingSkin') != -1){
              htmlToAdd += '<link href="/resources/css/minihome/setting.css" rel="stylesheet">';
              htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/settingSkin.css" />';
              htmlToAdd += '<script type="text/javascript" src="../../../../resources/js/settingSkin.js"></script>';
         
           }else if(tabName === '/mnHome/settingDotoriUse'|| tabName.indexOf('/mnHome/settingDotoriUse') != -1){
              htmlToAdd += '<link href="/resources/css/minihome/setting.css" rel="stylesheet">';
              htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/settingDotori.css" />';
         
           }else if(tabName === '/mnHome/settingDotoriCharge'|| tabName.indexOf('/mnHome/settingDotoriCharge') != -1){
              htmlToAdd += '<link href="/resources/css/minihome/setting.css" rel="stylesheet">';
              htmlToAdd += '<link rel="stylesheet" href="../../../../resources/css/minihome/settingDotori.css" />';
           
           }else if(tabName === '/mnHome/mainView'|| tabName.indexOf('/mnHome/mainView') != -1){
           }else if(tabName === '/miniHome/test'|| tabName.indexOf('/miniHome/test') != -1){
           }
            
            // Append all the HTML at once.
            $('#test').html(htmlToAdd);
            $('#testUnder').html(under);
            
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
   loadTabContent(tabName); 
});

$(document).on("click", ".btnAlbumWrite", function (event) {
   event.preventDefault();
   tabName = $(this).data("albumwrite");
   loadTabContent(tabName); 
});

$(document).on("click", ".btnBoardWrite", function (event) {
   event.preventDefault();
   tabName = $(this).data("boardwrite");
   loadTabContent(tabName); 
});

$(document).on("click", ".btn-boardlist", function (event) {
   event.preventDefault();
   tabName = $(this).data("boardview");
   loadTabContent(tabName); 
});

$(document).on("click", ".td-title", function (event) {
   event.preventDefault();
   tabName = $(this).data("boarddetail");
   loadTabContent(tabName); 
});

$(document).on("click", ".news-title", function (event) {
	event.preventDefault();
	tabName = $(this).data("url");
	loadTabContent(tabName); 
});

$(document).on("click", ".btn-diarylist", function (event) {
   event.preventDefault();
   tabName = $(this).data("diaryview");
   loadTabContent(tabName); 
});


$(document).on("click", ".album-under-left", function (event) {
   event.preventDefault();
   tabName = $(this).data("albumview");
   loadTabContent(tabName); 
});

$(document).on("click", ".album-container", function (event) {
   event.preventDefault();
   tabName = $(this).data("albumdetail");
   loadTabContent(tabName); 
});

$(document).on("click", "#spanSetting", function (event) {
   event.preventDefault();
   tabName = $(this).data("setting");
   loadTabContent(tabName); 
});

$(document).on("click", "#spanSettingFriends", function (event) {
   event.preventDefault();
   tabName = $(this).data("friends");
   loadTabContent(tabName); 
});

$(document).on("click", "#spanSettingBgm", function (event) {
   event.preventDefault();
   tabName = $(this).data("bgm");
   loadTabContent(tabName); 
});

$(document).on("click", "#spanSettingMenu", function (event) {
   event.preventDefault();
   tabName = $(this).data("menu");
   loadTabContent(tabName); 
});

$(document).on("click", "#spanSettingSkin", function (event) {
   event.preventDefault();
   tabName = $(this).data("skin");
   loadTabContent(tabName); 
});

$(document).on("click", "#spanSettingDotoriU", function (event) {
   event.preventDefault();
   tabName = $(this).data("dotoriu");
   loadTabContent(tabName); 
});

$(document).on("click", "#spanSettingDotoriC", function (event) {
   event.preventDefault();
   tabName = $(this).data("dotoric");
   loadTabContent(tabName); 
});

$(document).on("click", ".board-page", function (event) {
   event.preventDefault();
   tabName = $(this).data("page");
   loadTabContent(tabName); 
});

$(document).on("click", ".visit-page", function (event) {
	event.preventDefault();
	tabName = $(this).data("page");
	loadTabContent(tabName); 
});
$(document).on("click", "#diarymodify", function (event) {
	event.preventDefault();
	tabName = $(this).data("diarymodify");
	let seq = $("#cmtSeq").val();
	url = tabName + '/' + seq;
	loadTabContent(url);
});