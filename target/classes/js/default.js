// 화면 사이즈 조절 방지
var resizeTimeout;

window.onresize = function() {
  clearTimeout(resizeTimeout);
  resizeTimeout = setTimeout(function() {
    window.resizeTo(1200, 720);
  }, 100);
};

// 상단 미니홈피 타이틀 

$(document).on('click', '#btn-title-edit', function() {
    document.getElementById('divHomeTitle').style.display = 'none';
	document.getElementById('newTitle').type = 'text';
	document.getElementById('btn-title-edit').type = 'hidden';
	document.getElementById('btn-title-save').type = 'button';
});

$(document).on('click', '#btn-title-save', function() {
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
// 상단 타이틀 끝 

//일촌신청 

// When the user clicks on div, open the popup
function popupFunction() {
	var popup = document.getElementById("myPopup");
	popup.classList.toggle("show");
}

function requestFriendship(userNickname){
	if(confirm(userNickname + "님께 일촌신청을 보내겠습니까?")){
		let requestUser = document.getElementById('requestUser').value;
		let responseUser = document.getElementById('responseUser').value;

		let jsonData = { 
						"requestUser" : requestUser 
						,"responseUser" : responseUser
						};
	
			$.ajax({
			url: "/mnHome/friendRequest"
			,type: "POST"
			, dataType : "json"
			, data: JSON.stringify(jsonData)
			, contentType: "application/json"
			, success : function(data){
				console.log(data.msg);
				if(data.code == "1"){
					alert("일촌신청을 보냈습니다.");
				}else if(data.code =="-1"){
					alert("이미 신청 내역이 있습니다.");
				}
			
			}, error : function(error){
				console.log("Error loading tab: " + error);
				alert('잠시 후 다시 시도해주세요.');
			}
			});
	}
}

// 오디오 관련 스크립트
document.addEventListener('DOMContentLoaded', function() {
	var playlist = [
		{url:'../../../../resources/sounds/OneDrink.mp3', title: '소주 한 잔'} ,
		{url:'../../../../resources/sounds/IBelieve.mp3', title: 'I Believe'} ,
		{url:'../../../../resources/sounds/Confession.mp3', title: '고백'}
    ];
    var currentTrack = 0;
    var audioElement = document.getElementById('audioElement');
    var audioPlay = document.getElementById('audioPlay');
    var audioPause = document.getElementById('audioPause');
    var audioPrev = document.getElementById('audioPrev');
    var audioNext = document.getElementById('audioNext');
    var audioVolumeControl = document.getElementById('audioVolumeControl');
    var audioVolumeBtn = document.getElementById('audioVolumeBtn');
    var muted=false;
    var volume= audioElement.volume;
    var songTitle = document.getElementById('songTitle');
	var audioPlayingImg = document.getElementById('audioPlayingImg');
	audioPlayingImg.classList.add('rotating');			
    
	//이전,다음,재생,일시정지 버튼 작동			
	audioPrev.addEventListener('click', function() {
        loadTrack(--currentTrack);
        audioElement.play();
        songTitle.style.animationPlayState = 'running';
        audioPlayingImg.classList.add('rotating');
        audioPlay.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPlayPress.png';
        audioPause.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPause.png';
    });

    audioNext.addEventListener('click', function() {
        loadTrack(++currentTrack);
        audioElement.play();
        songTitle.style.animationPlayState = 'running';
        audioPlayingImg.classList.add('rotating');
        audioPlay.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPlayPress.png';
        audioPause.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPause.png';
    });

    audioPlay.addEventListener('click', function() {
        audioElement.play();
        songTitle.style.animationPlayState = 'running';
        audioPlayingImg.classList.add('rotating');
        this.classList.add('active');		        
        this.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPlayPress.png';
        audioPause.classList.remove('active');
        audioPause.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPause.png';
    });

    audioPause.addEventListener('click', function() {
        audioElement.pause();
        songTitle.style.animationPlayState = 'paused';
        audioPlayingImg.classList.remove('rotating');
        this.classList.add('active');
        this.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPausePress.png';
        audioPlay.classList.remove('active');
        audioPlay.querySelector('img').src = '../../../../resources/images/audioPlayer/audioPlay.png';
    });
    
    //음소거, 볼륨 조절
    audioVolumeBtn.addEventListener('click', function(){
    	if (!muted) {
            volume = audioElement.volume;
            audioElement.volume = 0;
            this.querySelector('img').src = '../../../../resources/images/audioPlayer/audioVolumeMute.png';
            muted = true;
        } else {
            audioElement.volume = volume;
            this.querySelector('img').src = '../../../../resources/images/audioPlayer/audioVolume.png';
            muted = false;
        }		    	
    });
    
    audioVolumeControl.addEventListener('input', function() {
        audioElement.volume = this.value / 100;
        if(muted==true){
        	audioVolumeBtn.querySelector('img').src = '../../../../resources/images/audioPlayer/audioVolume.png';
        	muted=false;
        }
    });			
	
    function loadTrack(trackNumber) {
        if (trackNumber < 0) {
            trackNumber = playlist.length - 1;
        } else if (trackNumber >= playlist.length) {
            trackNumber = 0;
        }

        currentTrack = trackNumber;
        audioElement.src = playlist[currentTrack];
        audioElement.load();
        
        var track = playlist[currentTrack];
        audioElement.src = track.url;
		songTitle.textContent = track.title;
    }

    function loadTrack(trackNumber) {
    	if (trackNumber < 0) { 
            trackNumber = playlist.length - 1;
        } else if (trackNumber >= playlist.length) {
            trackNumber = 0;
        }

        currentTrack = trackNumber;
        var track = playlist[currentTrack];
        audioElement.src = track.url;
        songTitle.textContent = track.title;
        audioElement.load();
        audioElement.play();
    }

    loadTrack(currentTrack);
    
    audioElement.addEventListener('ended', function() {
        loadTrack(++currentTrack);
    });
});

//파도타기
function redirectToMainView() {
    var selectElement = document.getElementById("friendSelect");
    var selectedValue = selectElement.options[selectElement.selectedIndex].value;
    if (selectedValue) {
        var url = "/mnHome/mainView/" + selectedValue;
        window.location.href = url;
    }
}

// 미니홈피 새창열기

