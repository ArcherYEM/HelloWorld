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
function createMinimi(imgSrc) {
    var minimiContainer = document.createElement('div');
    minimiContainer.className = "minimiContainer";
    minimiContainer.style.cssText = "width:100px; height:120px;";

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
        newY = Math.max(-20, Math.min(newY, divCanvas.offsetHeight - draggingImg.offsetHeight));
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