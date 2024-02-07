function cancelEdit(){
	window.close();
}	

function confirmEdit() {
    var form = document.getElementById('minimiForm'); // 폼 요소 선택

 	// 현재 캔버스의 배경 이미지 정보를 가져옵니다.
    var backgroundStyle = divCanvas.style.backgroundImage;
    if (!backgroundStyle || backgroundStyle === 'none') {
        // 배경 이미지가 선택되지 않았다면 경고를 표시합니다.
        alert('배경을 선택해 주세요.');
        return; // 함수를 여기서 종료하여 폼 제출을 방지합니다.
    }
    
    var src = backgroundStyle.slice(5, -2); // "url('...')" 형식에서 URL 추출

    // 파일 이름 추출 (경로와 확장자 제거)
    var name = src.split('/').pop().split('.')[0];

    // 배경 이미지 이름의 hidden 입력 필드 생성 및 설정
    var inputName = document.createElement('input');
    inputName.type = 'hidden';
    inputName.name = 'backgroundName';
    inputName.value = name;
    form.appendChild(inputName);

    // 캔버스에 있는 모든 미니미 컨테이너를 찾아서 각각의 정보를 hidden 입력 필드로 추가합니다.
    document.querySelectorAll('.minimiContainer').forEach(function(container, index) {
        var img = container.querySelector('.minimi');
        var left = container.style.left; // 컨테이너에서 left 값 추출
        var top = container.style.top; // 컨테이너에서 top 값 추출
        var src = img.src;
        var name = src.split('/').pop().split('.')[0]; // 파일 이름 추출

        // 미니미 이름(hidden) 입력 필드 생성 및 설정
        var inputName = document.createElement('input');
        inputName.type = 'hidden';
        inputName.name = 'minimiName' + index;
        inputName.value = name;
        form.appendChild(inputName);

        // 미니미 left(hidden) 입력 필드 생성 및 설정
        var inputLeft = document.createElement('input');
        inputLeft.type = 'hidden';
        inputLeft.name = 'minimiLeft' + index;
        inputLeft.value = left;
        form.appendChild(inputLeft);

        // 미니미 top(hidden) 입력 필드 생성 및 설정
        var inputTop = document.createElement('input');
        inputTop.type = 'hidden';
        inputTop.name = 'minimiTop' + index;
        inputTop.value = top;
        form.appendChild(inputTop);
    });

    // 폼을 서버로 전송합니다.
    form.submit();
}

var divCanvas = document.getElementById('div-canvas');
var draggingImg = null;
var offsetX, offsetY;

document.addEventListener('DOMContentLoaded', function() {
    // 배경 변경 스크립트
    document.querySelectorAll('.section2 img').forEach(function(img){
        img.addEventListener('click', function(){
            divCanvas.style.background = `url(${img.getAttribute('src')}) no-repeat center / 100% 100%`;
        });
    });

    // 미니미 및 버튼 추가 스크립트
    document.querySelectorAll('.section3 img').forEach(function(img){
        img.addEventListener('click', function(){
            createMinimi(img.getAttribute('src'));
        });
    });
});

// 미니미 및 버튼 생성 함수
//미니미 및 버튼 생성 함수
function createMinimi(imgSrc) {
    var existingMinimis = divCanvas.querySelectorAll('.minimiContainer').length;

    // 미니미가 5개 이상이면 경고를 표시하고 함수를 종료합니다.
    if (existingMinimis >= 5) {
        alert('미니미는 최대 5개까지만 추가할 수 있습니다.');
        return;
    }

    var minimiContainer = document.createElement('div');
    minimiContainer.className = "minimiContainer";
    minimiContainer.style.cssText = "width:100px; height:100px;";

    var newImg = document.createElement('img');
    newImg.className = "minimi";
    newImg.style.cssText = "width:100px; height:100px;";
    newImg.src = imgSrc;

    var btnContainer = createButtonContainer();
    minimiContainer.append(btnContainer, newImg);
    divCanvas.appendChild(minimiContainer);
    
    addDragEvent(minimiContainer);
    addButtonEvent(minimiContainer);
}


// 버튼 컨테이너 및 버튼 생성 함수
function createButtonContainer() {
    var btnContainer = document.createElement('div');
    btnContainer.className = "btnContainer";
    btnContainer.style.cssText = "width:100px; height:20px;";

    /*var plusButton = createButton('minimiBtnPlus', '+');
    var minusButton = createButton('minimiBtnMinus', '-');*/
    var deleteButton = createButton('minimiBtnDelete', 'X');
    
    btnContainer.append(/*plusButton, minusButton,*/ deleteButton);
    return btnContainer;
}

function createButton(className, text) {
    var button = document.createElement('button');
    button.className = className;
    button.style.cssText = "width:20px; height:20px;";
    button.textContent = text;
    return button;
}

// 미니미 드래그 스크립트
function addDragEvent(img) {
	img.addEventListener('mousedown', function(e) {
        e.preventDefault();
        draggingImg = img;
        var rect = img.getBoundingClientRect();
        offsetX = e.clientX - rect.left;
        offsetY = e.clientY - rect.top - img.querySelector('.btnContainer').offsetHeight;
        img.style.position = 'absolute';
    });
}

document.addEventListener('mousemove', function(e) {
    if (draggingImg) {
        var newX = e.clientX - offsetX - divCanvas.offsetLeft;
        var newY = e.clientY - offsetY - divCanvas.offsetTop;
        newX = Math.max(0, Math.min(newX, divCanvas.offsetWidth - draggingImg.offsetWidth));
        newY = Math.max(0, Math.min(newY, divCanvas.offsetHeight - draggingImg.offsetHeight));
        draggingImg.style.left = newX + 'px';
        draggingImg.style.top = newY + 'px';
    }
});

document.addEventListener('mouseup', function() {
    draggingImg = null;
});

// 버튼 기능 구현
function addButtonEvent(container) {
    var img = container.querySelector('.minimi');
    /*
    container.querySelector('.minimiBtnPlus').addEventListener('click', function() {
        updateImageSize(img, 10);
    });
    container.querySelector('.minimiBtnMinus').addEventListener('click', function() {
        updateImageSize(img, -10);
    });
    */
    container.querySelector('.minimiBtnDelete').addEventListener('click', function() {
        container.remove();
    });
}

// 이미지 크기 업데이트 함수
/*
function updateImageSize(img, change) {
	var currentWidth = parseInt(img.style.width, 10);
    var currentHeight = parseInt(img.style.height, 10);
    var rect = img.getBoundingClientRect();
    
    // 새로운 크기 계산
    var newWidth = currentWidth + change;
    var newHeight = currentHeight + change;

    // 캔버스의 경계와 이미지의 현재 위치를 고려하여 최대 크기 제한
    var maxWidth = divCanvas.offsetWidth - (rect.left - divCanvas.offsetLeft);
    var maxHeight = divCanvas.offsetHeight - (rect.top - divCanvas.offsetTop);

    // 최대 크기를 넘지 않도록 조정
    if(newWidth > maxWidth) {
        newWidth = maxWidth;
    }
    if(newHeight > maxHeight) {
        newHeight = maxHeight;
    }

    // 최소 크기 조건도 고려
    if (newWidth >= 50 && newHeight >= 50) {
        img.style.width = newWidth + 'px';
        img.style.height = newHeight + 'px';
    }
}
*/