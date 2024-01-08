
		
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
	            const productName = $(this).data('product-name');
	            const productPrice = $(this).data('product-price');
				
	            console.log(productCate);
	            addToCart(productCate, productName, productPrice);
	        });
	        
	        $('.product').on('click', function () {
	            const productCate = $(this).data('product-cate');
	            const productName = $(this).data('product-name');
	            const productPrice = $(this).data('product-price');
				
	            console.log(productCate);
	            addToCart(productCate, productName, productPrice);
	        });
	
	        function addToCart(cate, name, price) {
	            $.ajax({
	                type: 'POST',
	                url: "/store/addToCart",
	                contentType: 'application/json',
	                data: JSON.stringify({ cate: cate, name: name, price: price }),
	                success: function () {
	                    loadCart(); // 장바구니에 상품 추가 후 다시 로드
	                },
	                error: function () {
	                    console.error('Ajax request failed');
	                }
	            });
	        }
	        
	    });