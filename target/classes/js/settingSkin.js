// 클릭된 요소의 스타일을 변경하는 함수
function logClick() {
    console.log('클릭');

    // 모든 스킨 아이템을 가져옴
    var skinItems = document.querySelectorAll('.skin-item-color');

    // 모든 스킨 아이템의 스타일 변경
    for (var i = 0; i < skinItems.length; i++) {
        skinItems[i].style.border = '5px solid black';
        skinItems[i].style.borderRadius = '5px';
    }

    // 클릭된 요소의 스타일 변경
    var clickedItem = event.currentTarget;
    clickedItem.style.border = '5px solid orange';
    clickedItem.style.borderRadius = '5px';
    
 // 클릭된 요소에서 데이터 추출
    var userNickname = clickedItem.getAttribute('data-user-nickname');
    var category = clickedItem.getAttribute('data-category');
    var productName = clickedItem.getAttribute('data-product-name');

    // 값을 콘솔에 출력
    console.log('사용자 닉네임:', userNickname);
    console.log('카테고리:', category);
    console.log('상품 이름:', productName);
    
    document.getElementById('selectedProductName').value = productName;
    alert(document.getElementById('selectedProductName').value);
    document.getElementById('selectedCategory').value = category;
    document.getElementById('nickname').value = userNickname;
}



