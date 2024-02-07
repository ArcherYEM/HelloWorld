<<<<<<< HEAD
var userNickname;
var category;
var productName;

// 클릭된 요소의 스타일을 변경하는 함수
function logClick() {

    // 모든 스킨 아이템을 가져옴
    var skinItems = document.querySelectorAll('.skin-item-color');

    // 모든 스킨 아이템의 스타일 변경
    for (var i = 0; i < skinItems.length; i++) {
        skinItems[i].style.border = '2px solid black';
        skinItems[i].style.borderRadius = '5px';
    }

    // 클릭된 요소의 스타일 변경
    var clickedItem = event.currentTarget;
    clickedItem.style.border = '2px solid orange';
    clickedItem.style.borderRadius = '5px';
    
 // 클릭된 요소에서 데이터 추출
    userNickname = clickedItem.getAttribute('data-user-nickname');
    category = clickedItem.getAttribute('data-category');
    productName = clickedItem.getAttribute('data-product-name');
    
    document.getElementById('selectedProductName').value = productName;
    document.getElementById('selectedCategory').value = category;
    document.getElementById('nickname').value = userNickname;
    
}

// ajax 로 데이터 전송
$(document).one("click", ".apply-button", function (event) {
    event.preventDefault();

    // JSON 데이터 생성
    var jsonData = {
        selectedProductName: productName 
    };

    // Ajax 요청 보내기
    $.ajax({
        method: 'POST',
        url: '/mnHome/skinChoice',
        contentType: 'application/json',
        data: JSON.stringify(jsonData),
    }).done(function(json) {
        if(json.resultCode === '1' ){
            alert("선택하신 스킨을 적용하였습니다.");
            document.getElementById("spanSettingSkin").click();
        } else if(json.resultCode === "0"){
            alert("스킨 적용에 실패했습니다. 다시 시도해주세요.");
        }
   });
});

=======
var userNickname;
var category;
var productName;

// 클릭된 요소의 스타일을 변경하는 함수
function logClick() {

    // 모든 스킨 아이템을 가져옴
    var skinItems = document.querySelectorAll('.skin-item-color');

    // 모든 스킨 아이템의 스타일 변경
    for (var i = 0; i < skinItems.length; i++) {
        skinItems[i].style.border = '2px solid black';
        skinItems[i].style.borderRadius = '5px';
    }

    // 클릭된 요소의 스타일 변경
    var clickedItem = event.currentTarget;
    clickedItem.style.border = '2px solid orange';
    clickedItem.style.borderRadius = '5px';
    
 // 클릭된 요소에서 데이터 추출
    userNickname = clickedItem.getAttribute('data-user-nickname');
    category = clickedItem.getAttribute('data-category');
    productName = clickedItem.getAttribute('data-product-name');
    
    document.getElementById('selectedProductName').value = productName;
    document.getElementById('selectedCategory').value = category;
    document.getElementById('nickname').value = userNickname;
    
}

// ajax 로 데이터 전송
$(document).one("click", ".apply-skin-button", function (event) {
    event.preventDefault();

    // JSON 데이터 생성
    var jsonData = {
        selectedProductName: productName 
    };

    // Ajax 요청 보내기
    $.ajax({
        method: 'POST',
        url: '/mnHome/skinChoice',
        contentType: 'application/json',
        data: JSON.stringify(jsonData),
    }).done(function(json) {
        if(json.resultCode === '1' ){
            alert("선택하신 스킨을 적용하였습니다.");
            document.getElementById("spanSettingSkin").click();
        } else if(json.resultCode === "0"){
            alert("스킨 적용에 실패했습니다. 다시 시도해주세요.");
        }
   });
});

>>>>>>> f8aac424026728671a5fbc4597f3416b49d94c7b
