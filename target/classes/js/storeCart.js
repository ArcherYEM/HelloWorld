
		
		function clearCart() {
			$.ajax({
		        type: 'POST',
		        url: "/store/clearCart",
		        contentType: 'application/json',
		        success: function () {
		            scrollToBottom();
		            loadCart(); // 장바구니 비우고 난 후에 장바구니 데이터를 다시 로드
		        },
		        error: function () {
		            console.error('Clear cart failed');
		        }
		    });
		}
		
		function loadCart() {
            $.ajax({
                type: 'GET',
                url: "/store/loadCart",
                success: function (data) {
                    // 서버에서 받은 데이터를 처리하여 페이지 갱신
                    // 예시: 장바구니 리스트 갱신
                    updateCart(data);
                },
                error: function () {
                    console.error('Ajax request failed');
                }
            });
        }

        function updateCart(cartItems) {
        	 const cartTableBody = $('#cart-list tbody');
        	 cartTableBody.empty(); // 기존 장바구니 비우기

            // 새로운 장바구니 데이터로 리스트 업데이트
            cartItems.forEach(function (item) {
            	const imagePath = "/resources/images/store/storeDotoriIcon.png";
            	const row = '<tr><td>' + item.cate + '</td><td>' + item.name + '</td><td><img id="dotoriIcon" src="' + imagePath + '" alt="' + item.name + '">' + item.price + '</td></tr>';
                cartTableBody.append(row);
            });

            scrollToBottom();
        }
		
        function buyCart() {
		    var result = confirm('정말로 구매하시겠습니까?');
		    
		    if (result) {
		        $.ajax({
		            type: 'POST',
		            url: '/store/buyCart',
		            success: function(rsult) {
		            	console.log(result);
		            	if(result == 1) {
		            		alert('상품 구매에 성공하였습니다.');

		            		updateDotoriCount();
		            		clearCart();
		            	} else {
		            		alert('상품 구매에 실패하였습니다. 다시 시도해주세요.');
		            	}
		            },
		            error: function(error) {
		                console.error(error);
		            }
		        });
		    } else {
		        alert('구매가 취소되었습니다.');
		    }
		}
        
        function updateDotoriCount() {
            // 여기에서 서버에서 현재 사용자의 도토리 개수를 가져와서 화면에 업데이트하는 로직을 추가합니다.
            // AJAX 요청을 사용하여 서버에서 도토리 개수를 가져오고, 화면에 업데이트합니다.
            $.ajax({
                type: 'POST',
                url: '/store/updateDotoriCount',
                data: JSON.stringify(),
                success: function (result) {
                	if (result !== undefined) {
                        console.log('도토리 개수 업데이트 성공');
                        $('#userDotoriCnt').text(result);
                    }
                },
                error: function (error) {
                    console.error('도토리 개수 업데이트 실패');
                }
            });
        };
        
		function scrollToBottom() {
		    const cartList = document.querySelector('.cart-list-over');
		    cartList.scrollTop = cartList.scrollHeight;
		}
		
		function loadPage(page) {
	        $('#page').val(page);
	        $('#frm1').submit();
	    }
	
	    $(document).ready(function () {
	        loadCart(); // 페이지 로드 시에 장바구니 데이터 로드
	
	        $('.spanPage').on('click', function(){
	            loadPage($(this).data('page'));
	        });
	        
	        $('.divOneProduct').on('click', function () {
	        	const productCate = $(this).data('product-cate');
	            const productTableCate = $(this).data('product-table-cate');
	            const productContentPath = $(this).data('product-contentpath');
	            const productName = $(this).data('product-name');
	            const productPrice = $(this).data('product-price');
				
	            console.log(productCate, productTableCate, productContentPath, productName, productPrice);
	            addToCart(productCate, productTableCate, productContentPath, productName, productPrice);
	        });
	        
	        $('.product').on('click', function () {
	            const productCate = $(this).data('product-cate');
	            const productTableCate = $(this).data('product-table-cate');
	            const productContentPath = $(this).data('product-contentpath');
	            const productName = $(this).data('product-name');
	            const productPrice = $(this).data('product-price');
				
	            console.log(productCate, productTableCate, productContentPath, productName, productPrice);
	            addToCart(productCate, productTableCate, productContentPath, productName, productPrice);
	        });
	
	        function addToCart(cate, tableCate, contentPath, name, price) {
	            $.ajax({
	                type: 'POST',
	                url: "/store/addToCart",
	                contentType: 'application/json',
	                data: JSON.stringify({ cate: cate, tableCate: tableCate, name: name,
	                					contentPath: contentPath, price: price }),
	                success: function () {
	                    loadCart(); // 장바구니에 상품 추가 후 다시 로드
	                },
	                error: function () {
	                    console.error('Ajax request failed');
	                }
	            });
	        }
	        
	    });