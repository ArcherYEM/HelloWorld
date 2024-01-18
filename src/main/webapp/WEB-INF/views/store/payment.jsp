<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp85702711"); 
        
        function requestPay() {
            IMP.request_pay({
            	pg: "kakaopay",
                pay_method: "card",
                merchant_uid: "ORD20180131-0000011",   // 주문번호
                name: "미니미 이진우",
                amount: 64900,                         // 숫자 타입
                buyer_email: "gildong@gmail.com",
                buyer_name: "이진우",
                buyer_tel: "010-4242-4242",
                buyer_addr: "서울특별시 강남구 신사동",
                buyer_postcode: "01181"
            }, function (rsp) { // callback
            	console.log(rsp);
                var imp_uid = rsp.imp_uid;
                $.ajax({
                	   type: 'POST',
                	   url: '/verify/' + rsp.imp_uid,
                	}).done(function(data) {
                	   if(rsp.paid_amount === data.paid_amount){
                	      alert("결제 성공");
                	   } else {
                	      alert("결제 실패");
                	   }
                	});
            });
        }
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
    <button onclick="requestPay()">결제하기</button> <!-- 결제하기 버튼 생성 -->
</body>
</html>